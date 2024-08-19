#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193582 "HR Overall Comments"
{
    Caption = 'HR Overall Comments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No series"; Integer)
        {
            AutoIncrement = true;
            Caption = 'No series';
        }
        field(2; "Appraisal Code"; Code[50])
        {
            TableRelation = "HR Appraisal Header"."Appraisal No";
            Caption = 'Appraisal Code';
        }
        field(3; "Supervisor Comments"; Text[250])
        {
            Caption = 'Supervisor Comments';
        }
        field(4; "Appraisee Comments"; Text[250])
        {
            Caption = 'Appraisee Comments';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                rec."Commented By" := UserId;

            end;
        }
        field(5; "Part"; Text[20])
        {
            Caption = 'Part';
        }
        field(6; "Second Supervisor Comments"; Text[250])
        {
            Caption = 'Second Supervisor Comments';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                rec."Commented By" := UserId;

            end;
        }
        field(7; "Commented By"; Text[150])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "No series")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
