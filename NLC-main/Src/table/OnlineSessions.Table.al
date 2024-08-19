#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193579 "Online Sessions"
{
    Caption = 'Online Sessions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "User Name"; Code[50])
        {
            Editable = false;
            TableRelation = "Online Users"."User Name";
            Caption = 'User Name';
        }
        field(2; "Session ID"; Text[100])
        {
            Editable = false;
            Caption = 'Session ID';
        }
        field(3; "Login Time"; DateTime)
        {
            Editable = false;
            Caption = 'Login Time';
        }
        field(4; "Logout Time"; DateTime)
        {
            Editable = false;
            Caption = 'Logout Time';
        }
        field(5; "Login Duration"; Decimal)
        {
            Caption = 'Login Duration';
        }
        field(6; IsActive; Boolean)
        {
            BlankNumbers = BlankZero;
            BlankZero = true;
            Caption = 'IsActive';
        }
    }

    keys
    {
        key(Key1; "User Name", "Session ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
