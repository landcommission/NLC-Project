#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193593 "HR Knowledge and Skills"
{
    Caption = 'HR Knowledge and Skills';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "Knowledge and Skills"; Text[250])
        {
            Caption = 'Knowledge and Skills';
        }
        field(3; "Applicant No"; Code[50])
        {
            Caption = 'Applicant No';
        }
        field(6; "Date Entered"; Date)
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
