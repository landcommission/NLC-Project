#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193437 "HR Employee Exit Interviews"
{
    Caption = 'HR Employee Exit Interviews';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Exit Interview No"; Code[20])
        {
            Caption = 'Exit Interview No';
        }
        field(2; "Date Of Interview"; Date)
        {
            Caption = 'Date Of Interview';

        }
        field(3; "Interview Done By"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Interview Done By';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Interview Done By");
                if HREmp.Find('-') then begin
                    IntFullName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    "Interviewer Name" := IntFullName;
                end;
            end;
        }
        field(4; "Re Employ In Future"; Option)
        {
            OptionMembers = " ",Yes,No;
            Caption = 'Re Employ In Future';
        }
        field(5; "Reason For Leaving"; Option)
        {
            //OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Deceased,Termination,"Contract Ended",Abscondment,"Appt. Revoked","Contract Termination",Retrenchment,Other;
            OptionMembers = " ",Resignation,Death,Retirement,Termination,Sickness;
            Caption = 'Reason For Leaving';
        }
        field(6; "Reason For Leaving (Other)"; Text[150])
        {
            Caption = 'Reason For Leaving (Other)';
        }
        field(7; "Date Of Leaving"; Date)
        {
            Caption = 'Date Of Leaving';
        }
        field(10; Comment; Boolean)
        {
            Editable = false;
            FieldClass = Normal;
            Caption = 'Comment';
        }
        field(11; "Employee No."; Code[20])
        {
            TableRelation = "Exit Interview Questionnaire"."Employee No";
            Caption = 'Employee No.';
            trigger OnValidate()
            var
                ExtQuostion: Record "Exit Interview Questionnaire";
                Separation: Record "Employee Separation Header";
            begin
                ExtQuostion.Reset();
                ExtQuostion.SetRange("Employee No", Rec."Employee No.");
                if ExtQuostion.FindFirst() then begin
                    Separation.Reset();
                    Separation.SetRange("Separation No.", ExtQuostion."Seperation No");
                    if Separation.FindFirst() then begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", "Employee No.");
                        if HREmp.Find('-') then begin
                            EmpFullName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                            rec."Employee Name" := EmpFullName;
                            rec.Designation := HREmp."Job Title";
                            rec.Grade := HREmp.Grade;
                            rec."Seperation No" := ExtQuostion."Seperation No";
                            rec."Reason For Leaving" := Separation."Reason for Separation";
                            rec."Responsibility centre" := HREmp."Responsibility Center";
                        end;
                    end;
                end;
            end;
        }
        field(12; "No Series"; Code[10])
        {
            Caption = 'No Series';
        }
        field(13; "Form Submitted"; Boolean)
        {
            Caption = 'Form Submitted';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange("No.", "Employee No.");
                if HREmp.FindFirst() then begin

                    if "Form Submitted" = true then begin
                        HREmp.Status := HREmp.Status::Inactive;
                        HREmp."Date Of Leaving" := "Date Of Leaving";
                        HREmp."Termination Grounds" := "Reason For Leaving";
                        HREmp."Exit Interview Done by" := "Interview Done By";
                        HREmp.Modify();
                    end;
                    if "Form Submitted" = false then begin
                        HREmp.Status := HREmp.Status::Active;
                        HREmp."Date Of Leaving" := 0D;
                        HREmp."Termination Grounds" := HREmp."Termination Grounds"::" ";
                        HREmp."Exit Interview Done by" := '';
                        HREmp.Modify();
                    end;
                end;
            end;
        }
        field(14; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

        }
        field(15; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name';
        }
        field(16; "Interviewer Name"; Text[50])
        {
            Caption = 'Interviewer Name';
        }
        field(17; Designation; Text[30])
        {
            Caption = 'Designation';
        }
        field(18; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(19; "Responsibility centre"; Text[30])
        {
            Caption = 'Responsibility centre';
        }
        field(20; "Other Comments"; Text[250])
        {
            Caption = 'Other Comments';
        }
        field(21; "Seperation No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Clearance Done By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Exit Interview No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Exit Interview No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Exit Interview Nos");
            NoSeriesMgt.InitSeries(HRSetup."Exit Interview Nos", xRec."No Series", 0D, "Exit Interview No", "No Series");
        end;
    end;

    var
        OK: Boolean;
        HREmp: Record "HR Employees";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmpFullName: Text;
        IntFullName: Text;
}
