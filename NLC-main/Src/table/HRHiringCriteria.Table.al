#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193860 "HR Hiring Criteria"
{
    Caption = 'HR Hiring Criteria';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Application Code"; Code[50])
        {
            Caption = 'Application Code';
        }
        field(2; "Hiring Criteria"; Text[100])
        {
            Caption = 'Hiring Criteria';
        }
    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
