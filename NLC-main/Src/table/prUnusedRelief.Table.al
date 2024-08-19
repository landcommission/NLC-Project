#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193535 "prUnused Relief"
{
    Caption = 'prUnused Relief';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            Caption = 'Employee Code';
        }
        field(2; "Unused Relief"; Decimal)
        {
            Caption = 'Unused Relief';
        }
        field(3; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(4; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Period Month", "Period Year")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
