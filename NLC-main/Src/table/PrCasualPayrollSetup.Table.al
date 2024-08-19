#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193567 "PrCasual Payroll Setup"
{
    Caption = 'PrCasual Payroll Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Setup Code"; Code[20])
        {
            Caption = 'Setup Code';
        }
        field(5; "Normal Hours Rate per Hour"; Decimal)
        {
            Caption = 'Normal Hours Rate per Hour';
        }
        field(10; "Overtime Hours Rate per Hour"; Decimal)
        {
            Caption = 'Overtime Hours Rate per Hour';
        }
        field(15; "PHs and Weekends Rate per Hour"; Decimal)
        {
            Caption = 'PHs and Weekends Rate per Hour';
        }
    }

    keys
    {
        key(Key1; "Setup Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
