#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193841 "All Stages Per Contract"
{
    Caption = 'All Stages Per Contract';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract No"; Code[10])
        {
            Caption = 'Contract No';
        }
        field(2; "Cycle Code"; Code[10])
        {
            Caption = 'Cycle Code';
        }
        field(3; "Cycle Stage"; Integer)
        {
            Caption = 'Cycle Stage';
        }
        field(4; Description; Time)
        {
            Caption = 'Description';
        }
        field(5; Type; Option)
        {
            OptionCaption = ' ,Vendor,Customer';
            OptionMembers = " ",Vendor,Customer;
            Caption = 'Type';
        }
        field(6; "Contractor No."; Code[10])
        {
            Caption = 'Contractor No.';
        }
        field(7; "Payment Expected"; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
            Caption = 'Payment Expected';
        }
        field(8; "%age of Payment"; Decimal)
        {
            Caption = '%age of Payment';
        }
    }

    keys
    {
        key(Key1; "Contract No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
