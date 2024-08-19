#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193587 "Applicant Sessions"
{
    Caption = 'Applicant Sessions';
    DataClassification = CustomerContent;
    fields
    {
        field(10; No; Integer)
        {
            AutoIncrement = true;
            Caption = 'No';
        }
        field(20; UserName; Text[30])
        {
            Caption = 'UserName';
        }
        field(30; SessionId; Text[50])
        {
            Caption = 'SessionId';
        }
        field(40; LoginTime; DateTime)
        {
            Caption = 'LoginTime';
        }
        field(41; LogoutTime; DateTime)
        {
            Caption = 'LogoutTime';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
