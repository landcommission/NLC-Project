#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 52193495 "HR Asset Transfer Lines"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Asset No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            begin
                if fasset.Get("Asset No.") then begin
                    //    "Asset Bar Code":=fasset."Bar Code";
                    "Asset Description" := fasset.Description;
                    "FA Location" := fasset."FA Location Code";
                    //"Responsible Employee Code" := fasset."Responsible Officer";
                    if HRTAB.Get("Responsible Employee Code") then "Employee Name" := HRTAB."First Name" + ' ' + HRTAB."Last Name";
                    "Asset Serial No" := fasset."Serial No.";
                    "Global Dimension 1 Code" := fasset."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := fasset."Global Dimension 2 Code";
                end;


                //Control: Don't Post Same Asset Twice NOT GL's
                //TransLine.RESET;
                //TransLine.SETRANGE(TransLine."No.","No.");
                //TransLine.SETRANGE(TransLine."Asset No.","Asset No.");
                // IF TransLine.FIND('-') THEN
                // BEGIN
                //ERROR('You Cannot enter two lines for the same Asset');
                //END;
            end;
        }
        field(3; "Asset Bar Code"; Code[50])
        {
        }
        field(4; "Asset Description"; Text[200])
        {
        }
        field(5; "FA Location"; Code[80])
        {
            TableRelation = "Fixed Asset"."Location Code";
        }
        field(6; "Responsible Employee Code"; Code[20])
        {
            TableRelation = "HR Employees"."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                HRTAB.Reset;
                if HRTAB.Get("Responsible Employee Code") then begin
                    "Employee Name" := HRTAB."First Name" + ' ' + HRTAB."Last Name" + ' ' + HRTAB."Middle Name";
                end else begin
                    "Employee Name" := '';
                end;
            end;
        }
        field(7; "Asset Serial No"; Text[50])
        {
        }
        field(8; "Employee Name"; Text[50])
        {
        }
        field(9; "Reason for Issue / Return"; Text[50])
        {
        }
        field(10; "New Responsible Employee Code"; Code[20])
        {
            TableRelation = "HR Employees"."No." where(Status = const(Active));

            trigger OnValidate()
            begin

                HRTAB.Reset;
                if HRTAB.Get("New Responsible Employee Code") then begin
                    "New Employee Name" := HRTAB."First Name" + ' ' + HRTAB."Last Name" + ' ' + HRTAB."Middle Name";
                end else begin
                    "New Employee Name" := '';
                end;
            end;
        }
        field(11; "New Employee Name"; Text[100])
        {
        }
        field(12; "Global Dimension 1 Code"; Code[50])
        {
            Caption = 'Current Project Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            var
                Dimn: Record 349;
            begin
                Dimn.SetRange(Dimn.Code, "Global Dimension 1 Code");
                if Dimn.Find('-') then begin
                    "Dimension 1 Name" := Dimn.Name;
                end;
            end;
        }
        field(13; "New Global Dimension 1 Code"; Code[50])
        {
            Caption = 'New Project Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            var
                Dimn: Record 349;
            begin
                Dimn.SetRange(Dimn.Code, "New Global Dimension 1 Code");
                if Dimn.Find('-') then begin
                    "New  Dimension 1 Name" := Dimn.Name;
                end;
            end;
        }
        field(14; "Global Dimension 2 Code"; Code[50])
        {
            Caption = 'Current Department Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            var
                Dimn: Record 349;
            begin
                Dimn.SetRange(Dimn.Code, "Global Dimension 2 Code");
                if Dimn.Find('-') then begin
                    "Dimension 2 Name" := Dimn.Name;
                end;
            end;
        }
        field(15; "New Global Dimension 2 Code"; Code[50])
        {
            Caption = 'New Department Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            var
                Dimn: Record 349;
            begin
                Dimn.SetRange(Dimn.Code, "New Global Dimension 2 Code");
                if Dimn.Find('-') then begin
                    "New  Dimension 2 Name" := Dimn.Name;
                end;
            end;
        }
        field(16; "Global Dimension 3 Code"; Code[50])
        {
            Caption = 'Current Station Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            var
                Dimn: Record 349;
            begin
                Dimn.SetRange(Dimn.Code, "Global Dimension 3 Code");
                if Dimn.Find('-') then begin
                    "Dimension 3 Name" := Dimn.Name;
                end;
            end;
        }
        field(17; "New Global Dimension 3 Code"; Code[50])
        {
            Caption = 'New Station Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            var
                Dimn: Record 349;
            begin
                Dimn.SetRange(Dimn.Code, "New Global Dimension 3 Code");
                if Dimn.Find('-') then begin
                    "New  Dimension 3 Name" := Dimn.Name;
                end;
            end;
        }
        field(18; "Dimension 1 Name"; Text[100])
        {
            Caption = 'Current Project Name';
        }
        field(19; "New  Dimension 1 Name"; Text[100])
        {
            Caption = 'New Project Name';
        }
        field(20; "Dimension 2 Name"; Text[100])
        {
            Caption = 'Current Department Name';
        }
        field(21; "New  Dimension 2 Name"; Text[100])
        {
            Caption = 'New Department Name';
        }
        field(22; "Dimension 3 Name"; Text[100])
        {
            Caption = 'Current Station Name';
        }
        field(23; "New  Dimension 3 Name"; Text[100])
        {
            Caption = 'New Station Name';
        }
        field(24; "Is Asset Expected Back?"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(25; "Duration of Transfer"; Text[20])
        {
        }
        field(26; "New Asset Location"; Text[50])
        {
            TableRelation = "FA Location";
        }
        field(27; Status; Option)
        {
            CalcFormula = lookup("HR Asset Transfer Header".Status where("No." = field("No.")));
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Approved,Canceled,Posted,Pending Recommendation,Rejected,Issued';
            OptionMembers = Open,"Pending Approval",Approved,Canceled,Posted,"Pending Recommendation",Rejected,Issued;
        }
        field(28; Type; Option)
        {
            CalcFormula = lookup("HR Asset Transfer Header".Type where("No." = field("No.")));
            FieldClass = FlowField;
            OptionCaption = ' ,Issue,Return,Transfer,Exchange,Allocation,Incidence';
            OptionMembers = " ",Issue,Return,Transfer,Exchange,Allocation,Incidence;
        }
        field(29; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(30; Store; Code[10])
        {
            CalcFormula = lookup("HR Asset Transfer Header".Store where("No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                /*
                ReqLines.RESET;
                ReqLines.SETRANGE(ReqLines."Requistion No","No.");
                IF ReqLines.FIND('-') THEN BEGIN
                REPEAT
                  ReqLines."Issuing Store":="Issuing Store";
                UNTIL ReqLines.NEXT=0;
                END;
                  */

            end;
        }
        field(31; Remarks; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "User Status"; Option)
        {
            Caption = 'Acceptance Status';
            DataClassification = ToBeClassified;
            OptionCaption = 'Accept,Reject';
            OptionMembers = Accept,Reject;
        }
        field(33; "Tag No"; Code[60])
        {
            DataClassification = ToBeClassified;
        }
        field(50000; "Allocated Directorate"; Code[50])
        {
            Caption = 'Current Department Code';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Dimn: Record 349;
            begin
                Dimn.SetRange(Dimn.Code, "Global Dimension 2 Code");
                if Dimn.Find('-') then begin
                    "Dimension 2 Name" := Dimn.Name;
                end;
            end;
        }
        field(50001; "Date of Occurence"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Approved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Asset Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Fixed Asset"."No." where("Asset Movement Status" = const(Available));

            trigger OnValidate()
            begin
                if fasset.Get("Asset Code") then begin
                    //    "Asset Bar Code":=fasset."Bar Code";
                    "Asset Description" := fasset.Description;
                    "FA Location" := fasset."FA Location Code";
                    //"Responsible Employee Code" := fasset."Responsible Officer";
                    if HRTAB.Get("Responsible Employee Code") then "Employee Name" := HRTAB."First Name" + ' ' + HRTAB."Last Name";
                    "Asset Serial No" := fasset."Serial No.";
                    "Global Dimension 1 Code" := fasset."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := fasset."Global Dimension 2 Code";
                end;

                //Control: Don't Post Same Asset Twice NOT GL's
                ///TransLine.RESET;
                //TransLine.SETRANGE(TransLine."No.","No.");
                //TransLine.SETRANGE(TransLine."Asset Code","Asset Code");
                //IF TransLine.FIND('-') THEN
                //   BEGIN
                //ERROR('You Cannot enter two lines for the same Asset');
                //END;
            end;
        }
        field(50004; "Incidence Types"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Incidence Types";

            trigger OnValidate()
            begin
                IncidenceTypes.SetRange(IncidenceTypes.Code, "Incidence Types");
                if IncidenceTypes.Find('-') then
                    "Incidence Description" := IncidenceTypes.Description;
                if "Incidence Types" = '' then
                    "Incidence Description" := ''
            end;
        }
        field(50005; "Incidence Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Incidence Types".Description;
        }
        field(50006; "Action to be taken"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Asset Actions";
        }
        field(50007; "Action Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Asset Actions".Description;
        }
        field(50008; "New Dimension 1 Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Reason for Transfer"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        /*
       //Control: Don't Post Same Asset Twice NOT GL's
       TransLine.RESET;
       TransLine.SETRANGE(TransLine."No.","No.");
       TransLine.SETRANGE(TransLine."Asset Code","Asset Code");
        IF TransLine.FIND('-') THEN
            BEGIN
           ERROR('You Cannot enter two lines for the same Asset');
        END;
         */

    end;

    var
        fasset: Record "Fixed Asset";
        HRTAB: Record 52193433;
        PrjctCde: Record 349;
        Dimvalu: Integer;
        TransLine: Record "HR Asset Transfer Lines";
        IncidenceTypes: Record "Incidence Types";
}

