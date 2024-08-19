#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193594 "Applicant Personal Attributes"
{
    Caption = 'Applicant Personal Attributes';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "Personal Attributes"; Text[250])
        {
            Caption = 'Personal Attributes';
        }
        field(3; "Applicant No"; Text[100])
        {
            Caption = 'Applicant No';
        }
        field(4; "Date Entered"; Date)
        {
            Caption = 'Date Entered';
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
