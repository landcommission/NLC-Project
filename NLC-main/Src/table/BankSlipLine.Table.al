#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193629 "Bank Slip Line"
{
    Caption = 'Bank Slip Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            Description = 'Stores the reference to the header';
            Caption = 'No';
        }
        field(2; Type; Option)
        {
            Description = 'Stores the type of pay in';
            OptionMembers = " ",Cash,Cheque;
            Caption = 'Type';
            trigger OnValidate()
            begin
                if Type = Type::" " then
                    Error('Type Cannot be Blank')
            end;
        }
        field(3; "Cheque No"; Code[20])
        {
            Description = 'Stores the cheque no.';
            Caption = 'Cheque No';

        }
        field(4; "Drawers Name"; Text[50])
        {
            Description = 'Stores the name of the drawer';
            Caption = 'Drawers Name';
        }
        field(5; "Cheque Date"; Date)
        {
            Description = 'Stores the date of the cheque';
            Caption = 'Cheque Date';

        }
        field(6; Amount; Decimal)
        {
            Description = 'Stores the amount';
            Caption = 'Amount';
        }
        field(7; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(8; "Bank Slip No."; Code[20])
        {
            Description = 'Stores the reference of the bank pay in slip number into the database';
            Caption = 'Bank Slip No.';
        }
        field(9; Select; Boolean)
        {
            Caption = 'Select';
        }
        field(10; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(11; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
        }
        field(12; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
        }
        field(13; "Posted Time"; Time)
        {
            Caption = 'Posted Time';
        }
        field(14; "Posted Machine"; Text[100])
        {
            Caption = 'Posted Machine';
        }
        field(15; Vaulted; Boolean)
        {
            Caption = 'Vaulted';
        }
    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
        key(Key2; Select)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        Header.Reset();
        if Header.Get(No) then
            if (Header."Bank Slip No." <> '') and ("Bank Slip No." = '') then
                "Bank Slip No." := Header."Bank Slip No.";
    end;

    var
        Header: Record "Bank Slip";
}
