#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193825 "Evaluation Parameter Header"
{
    Caption = 'Evaluation Parameter Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Criteria Code"; Code[20])
        {
            Caption = 'Criteria Code';
            trigger OnValidate()
            begin
                if "Criteria Code" <> xRec."Criteria Code" then begin
                    PurchSetup.Get();
                    NoSeriesMgt.TestManual(PurchSetup."Appraisal Parameter No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Criteria Description"; Text[100])
        {
            Caption = 'Criteria Description';
        }
        field(3; "Evaluation  Period"; Code[20])
        {
            TableRelation = "Evaluation Year".Code;
            Caption = 'Evaluation  Period';
            trigger OnValidate()
            begin
                Clear(lastno);

                EvaluationParameterLine.Reset();
                EvaluationParameterLine.SetRange(EvaluationParameterLine.Code, "Criteria Code");
                if EvaluationParameterLine.Find('-') then
                    EvaluationParameterLine.DeleteAll();

                // //*******************************

                // EvaluationParameterLine.RESET;
                //IF  EvaluationParameterLine.FIND('+') THEN
                //lastno:= EvaluationParameterLine."Line No.";
                //IF lastno<>0 THEN lastno:=lastno+100 ELSE lastno:=100;
                // //*****************************

                EvaluationParametersAreas.Reset();
                EvaluationParametersAreas.SetRange(EvaluationParametersAreas."Evaluation Year", "Evaluation  Period");
                if EvaluationParametersAreas.Find('-') then
                    repeat
                        //Populate Lines
                        EvaluationParameterLine.Init();
                        EvaluationParameterLine."Line No." := GetLastEntryNo();
                        EvaluationParameterLine."Line No." := lastno;
                        EvaluationParameterLine.Code := "Criteria Code";
                        EvaluationParameterLine."Vendor No" := EvaluationParametersAreas."Vendor No.";
                        EvaluationParameterLine."Overall Comment" := EvaluationParametersAreas.Description;
                        EvaluationParameterLine."Parameter Code" := EvaluationParametersAreas."Parameter Code";
                        EvaluationParameterLine."Vendor Name" := EvaluationParametersAreas."Vendor Name";
                        EvaluationParameterLine."Evaluation Year" := EvaluationParametersAreas."Evaluation Year";
                        EvaluationParameterLine."Min. Score" := EvaluationParametersAreas."Expected Min.Value";
                        EvaluationParameterLine."Max. Score" := EvaluationParametersAreas."Expected Max.Value";

                        EvaluationParameterLine.Insert();
                    until EvaluationParametersAreas.Next() = 0;

                /*

                 ELSE BEGIN
                    //ERROR('Vendor Evaluation Areas for this vendor have not been setup');
                    EvaluationParameterLine.RESET;
                    EvaluationParameterLine.SETRANGE(EvaluationParameterLine.Code,"Criteria Code");
                    IF EvaluationParameterLine.FIND('-') THEN
                    BEGIN
                    REPEAT
                        //Clear existing data
                        EvaluationParameterLine.DELETEALL;
                    UNTIL EvaluationParameterLine.NEXT =0;

                    END;

                END;*/


                Message('Process Complete');

            end;
        }
        field(4; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'Vendor No.';
            trigger OnValidate()
            begin
                Vend.Reset();
                Vend.SetRange(Vend."No.", "Vendor No.");
                if Vend.Find('-') then
                    "Vendor Name" := Vend.Name;

                EvaluationParameterLine.Reset();
                EvaluationParameterLine.SetRange(EvaluationParameterLine.Code, "Criteria Code");
                if EvaluationParameterLine.Find('-') then
                    //Clear existing data
                    EvaluationParameterLine.DeleteAll();



                EvaluationParametersAreas.Reset();
                EvaluationParametersAreas.SetRange(EvaluationParametersAreas."Vendor No.", "Vendor No.");
                if EvaluationParametersAreas.Find('-') then
                    repeat
                        //Populate Lines
                        EvaluationParameterLine.Init();

                        EvaluationParameterLine."Line No." := GetLastEntryNo();
                        EvaluationParameterLine.Code := "Criteria Code";
                        EvaluationParameterLine."Parameter Code" := EvaluationParametersAreas."Parameter Code";
                        EvaluationParameterLine."Min. Score" := EvaluationParametersAreas."Expected Min.Value";
                        EvaluationParameterLine."Max. Score" := EvaluationParametersAreas."Expected Max.Value";

                        EvaluationParameterLine.Insert();
                    until EvaluationParametersAreas.Next() = 0
                else begin
                    //ERROR('Vendor Evaluation Areas for this vendor have not been setup');
                    EvaluationParameterLine.Reset();
                    EvaluationParameterLine.SetRange(EvaluationParameterLine.Code, "Criteria Code");
                    if EvaluationParameterLine.Find('-') then
                        //Clear existing data
                        EvaluationParameterLine.DeleteAll();

                end;

                Message('Process Complete');
            end;
        }
        field(5; "Total Expected Value"; Decimal)
        {
            Caption = 'Total Expected Value';
        }
        field(6; "Overall Comment"; Text[100])
        {
            Caption = 'Overall Comment';
        }
        field(7; "Total Actuals Value"; Decimal)
        {
            Caption = 'Total Actuals Value';
        }
        field(8; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(50000; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Criteria Code")
        {
            Clustered = true;
        }
        key(Key2; "Evaluation  Period", "Criteria Code") { }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Criteria Code" = '' then begin
            PurchSetup.Get();
            PurchSetup.TestField(PurchSetup."Appraisal Parameter No");
            NoSeriesMgt.InitSeries(PurchSetup."Appraisal Parameter No", xRec."No. Series", 0D, "Criteria Code", "No. Series");
        end;
    end;

    var
        EvaluationParametersAreas: Record "Evaluation Parameters Areas";
        EvaluationParameterLine: Record "Evaluation Parameter Line";
        Vend: Record Vendor;
        lastno: Integer;
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    local procedure GetLastEntryNo() LastLineNum: Integer
    var
        EvaluationParameterLine_2: Record "Evaluation Parameter Line";
    begin
        EvaluationParameterLine_2.Reset();
        if EvaluationParameterLine_2.Find('+') then
            LastLineNum := EvaluationParameterLine_2."Line No." + 1
        else
            LastLineNum := 1000;
    end;
}
