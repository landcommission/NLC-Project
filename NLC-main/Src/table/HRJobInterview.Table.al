#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193859 "HR Job Interview"
{
    Caption = 'HR Job Interview';
    DataClassification = CustomerContent;
    fields
    {
        field(2; "Applicant No"; Code[20])
        {
            TableRelation = "HR Shortlisted Applicants"."Job Application No";
            Caption = 'Applicant No';
        }
        field(3; "Interview Code"; Code[80])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Interview Areas"));
            Caption = 'Interview Code';
            trigger OnValidate()
            begin
                HRLookupValues.Reset();
                HRLookupValues.SetRange(HRLookupValues.Code, "Interview Code");
                if HRLookupValues.Find('-') then
                    "Interview Description" := HRLookupValues.Description;
            end;
        }
        field(4; "Interview Description"; Text[250])
        {
            Caption = 'Interview Description';

        }
        field(6; Score; Decimal)
        {
            MaxValue = 5;
            Caption = 'Score';
            trigger OnValidate()
            begin
                Employee.Reset();
                Employee.SetRange(Employee."User ID", UserId);
                if Employee.Find('-') then begin
                    Interviwer := Employee."User ID";
                    "Interviewer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end else
                    Error('UserID: " %1 "has not been mapped to any Employee', UserId);
            end;
        }
        field(8; "Total Score"; Decimal)
        {
            CalcFormula = sum("HR Job Interview".Score where("Applicant No" = field("Applicant No")));
            Editable = false;
            FieldClass = FlowField;
            MaxValue = 19;
            Caption = 'Total Score';
            trigger OnValidate()
            begin
                //Cust.CALCFIELDS("Total Score");
                if cust."Total Score" > 5 then
                    Error('The allowable unaccounted balance of %1 has been exceeded');
            end;
        }
        field(10; Category; Option)
        {
            OptionMembers = "JOB SPECIFIC EVALUATION AREA","EMPLOYEE PERFORMANCE FACTOR";
            Caption = 'Category';
        }
        field(11; "Sub Category"; Code[100])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Checklist Item"));
            Caption = 'Sub Category';
        }
        field(12; Group; Code[80])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Appraisal Sub Category"));
            Caption = 'Group';
        }
        field(14; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(15; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(16; Interviwer; Code[50])
        {
            TableRelation = "HR Employees";
            Caption = 'Interviwer';
        }
        field(17; "Interviewer Name"; Text[100])
        {
            Caption = 'Interviewer Name';
        }
    }

    keys
    {
        key(Key1; "Applicant No", "Line No")
        {
            Clustered = true;
        }
        key(Key2; "Interview Code") { }
    }

    fieldgroups { }

    var
        HRLookupValues: Record "HR Lookup Values";
        TotalScore: Integer;
        Employee: Record "HR Employees";
        cust: Record "HR Job Interview";
}
