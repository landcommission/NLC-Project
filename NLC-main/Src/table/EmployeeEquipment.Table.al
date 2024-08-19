#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193896 "Employee Equipment"
{
    Caption = 'Employee Equipment';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee code"; Code[20])
        {
            Caption = 'Employee code';
        }
        field(2; "Office Equipment/Machine"; Text[100])
        {
            Caption = 'Office Equipment/Machine';
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
    }

    keys
    {
        key(Key1; "Employee code", "Office Equipment/Machine")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
