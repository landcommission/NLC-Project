#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193805 "Tender Plan Header"
{
    Caption = 'Tender Plan Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(3; "Workplan Code"; Code[20])
        {
            TableRelation = "Workplan Entry";
            Caption = 'Workplan Code';
            trigger OnValidate()
            begin
                // IF "Workplan code" = '' THEN BEGIN

                Workplan.Reset();
                if Workplan.Get("Workplan Code") then
                    "Workplan Description" := Workplan."Workplan Code"
                else
                    Message('not found');
                // MODIFY
            end;
        }
        field(11; "Proc. method number"; Code[20])
        {
            TableRelation = "Procurement Methods".Code;
            Caption = 'Proc. method number';
            trigger OnValidate()
            begin
                TendStages.SetRange("Tender No.", No);
                if TendStages.Count < 1 then
                    CreateLines()
                else
                    UpdateLines();
                /*
                ProcStages.SETFILTER("Proc. Method No.","Proc. method number");

                TendStages.INIT;
                PrevStageDate:="Start Date";
                IF ProcStages.FIND('-') THEN REPEAT

                  TendStages."Tender No.":=No;
                  TendStages.Stage:=ProcStages.Stage;
                  TendStages."Planned duration":=ProcStages.Duration;
                  TendStages."Sorting No.":=ProcStages."Sorting No.";
                  TendStages."WorkPlan Code":="Workplan code";
                  TendStages."Planned start date":=PrevStageDate;
                  TendStages."Planned end date":=CALCDATE('+'+FORMAT(TendStages."Planned duration")+'D',TendStages."Planned start date");
                  PrevStageDate:=TendStages."Planned end date";
                  TendStages.INSERT(TRUE);
                UNTIL ProcStages.NEXT=0;
                */

                Procumethod.Reset();
                Procumethod.Get("Proc. method number");

                "Proc. Method Name" := Procumethod.Description;

            end;
        }
        field(12; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(13; "Workplan Description"; Text[250])
        {
            TableRelation = "Workplan Entry"."Workplan Code";
            Caption = 'Workplan Description';
        }
        field(14; "Proc. Method Name"; Text[50])
        {
            Caption = 'Proc. Method Name';
        }
    }

    keys
    {
        key(Key1; No, "Proc. method number")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        ProcStages: Record "Proc. Method Stage Duration";
        TendStages: Record "Tender Plan Lines";
        PrevStageDate: Date;
        Workplan: Record "Workplan Entry";
        Workplandet: Text[250];
        "RECTenderno.s": Record "Tender Plan Header";
        WorkPlanAct: Text[30];
        Procumethod: Record "Procurement Methods";


    procedure UpdateLines()
    begin
        ProcStages.SetFilter("Proc. Method No.", "Proc. method number");

        PrevStageDate := "Start Date";

        TendStages.SetRange("Tender No.", No);

        if ProcStages.Count < 1 then begin
            Message('THE PROCUREMENT STAGES HAVE NOT BEEN PROPERLY SET');
            exit;
        end;

        if xRec."Proc. method number" <> "Proc. method number" then begin
            TendStages.DeleteAll();
            CreateLines();
        end
        else begin

            TendStages.SetCurrentKey("Tender No.", "Sorting No.");
            if TendStages.Find('-') then
                repeat
                    //  TendStages."Tender No.":=No;
                    //  TendStages.Stage:=ProcStages.Stage;
                    //  TendStages."Planned duration":=ProcStages.Duration;
                    //  TendStages."Sorting No.":=ProcStages."Sorting No.";
                    //  TendStages."WorkPlan Code":="Workplan code";
                    TendStages."Planned start date" := PrevStageDate;
                    TendStages."Planned end date" := CalcDate('+' + Format(TendStages."Planned duration") + 'D', TendStages."Planned start date");
                    PrevStageDate := TendStages."Planned end date";
                    TendStages.Description := ProcStages.Description;
                    TendStages.Modify();
                until TendStages.Next() = 0;

        end;
    end;


    procedure CreateLines()
    begin
        ProcStages.SetFilter("Proc. Method No.", "Proc. method number");

        TendStages.Init();
        PrevStageDate := "Start Date";
        if ProcStages.Find('-') then
            repeat

                TendStages."Tender No." := No;
                TendStages.Stage := ProcStages.Stage;
                TendStages."Planned duration" := ProcStages."Duration(Days)";
                TendStages."Sorting No." := ProcStages."Sorting No.";
                TendStages."WorkPlan Code" := "Workplan Code";
                TendStages."Planned start date" := PrevStageDate;
                TendStages."Planned end date" := CalcDate('+' + Format(TendStages."Planned duration") + 'D', TendStages."Planned start date");
                PrevStageDate := TendStages."Planned end date";
                TendStages.Description := ProcStages.Description;
                TendStages.Insert(true);
            until ProcStages.Next() = 0;
    end;
}
