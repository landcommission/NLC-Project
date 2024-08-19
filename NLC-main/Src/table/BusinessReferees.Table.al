#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193818 "Business Referees"
{
    Caption = 'Business Referees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Questionaire No"; Integer)
        {
            Editable = false;
            Caption = 'Questionaire No';
        }
        field(2; "Tender No."; Code[20])
        {
            Caption = 'Tender No.';
        }
        field(3; "PIN No."; Code[20])
        {
            Editable = false;
            Caption = 'PIN No.';
        }
        field(4; "Receipt No."; Code[20])
        {
            Editable = false;
            Caption = 'Receipt No.';
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Line No.';
        }
        field(6; "Name Of Company"; Text[100])
        {
            Caption = 'Name Of Company';
        }
        field(7; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(8; "Telephone No"; Text[50])
        {
            Caption = 'Telephone No';
        }
        field(9; "Contact Person"; Text[100])
        {
            Caption = 'Contact Person';
        }
        field(10; "Contract Value"; Decimal)
        {
            Caption = 'Contract Value';
        }
        field(11; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(12; "To Date"; Date)
        {
            Caption = 'To Date';
        }
    }

    keys
    {
        key(Key1; "Questionaire No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
