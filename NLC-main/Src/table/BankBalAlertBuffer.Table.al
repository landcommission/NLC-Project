#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193643 "Bank Bal. Alert Buffer"
{
    Caption = 'Bank Bal. Alert Buffer';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Teller ID"; Code[20])
        {
            Caption = 'Teller ID';
            trigger OnValidate()
            begin
                User.Reset();
                User.Get("Teller ID");
                "Teller Name" := User."User Name";
            end;
        }
        field(3; "Teller Name"; Text[30])
        {
            Caption = 'Teller Name';
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
        }
        field(5; "Account Name"; Text[30])
        {
            Caption = 'Account Name';
        }
        field(6; "Max. Balance"; Decimal)
        {
            Caption = 'Max. Balance';
        }
        field(7; "Curr. Balance"; Decimal)
        {
            Caption = 'Curr. Balance';
        }
        field(8; "Min. Balance"; Decimal)
        {
            Caption = 'Min. Balance';
        }
        field(9; "Supervisor ID"; Code[20])
        {
            Caption = 'Supervisor ID';
        }
        field(10; "Request Created"; Boolean)
        {
            Caption = 'Request Created';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        User: Record User;
}
