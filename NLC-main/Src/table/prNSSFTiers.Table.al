#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193528 "prNSSF Tiers"
{
    Caption = 'prNSSF Tiers';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Tier; Integer)
        {
            Caption = 'Tier';
        }
        field(2; Earnings; Decimal)
        {
            Caption = 'Earnings';
        }
        field(3; "Pensionable Earnings"; Decimal)
        {
            Caption = 'Pensionable Earnings';
        }
        field(4; "Tier 1 earnings"; Decimal)
        {
            Caption = 'Tier 1 earnings';
        }
        field(5; "Tier 1 Employee Deduction"; Decimal)
        {
            Caption = 'Tier 1 Employee Deduction';
        }
        field(6; "Tier 1 Employer Contribution"; Decimal)
        {
            Caption = 'Tier 1 Employer Contribution';
        }
        field(7; "Tier 2 earnings"; Decimal)
        {
            Caption = 'Tier 2 earnings';
        }
        field(8; "Tier 2 Employee Deduction"; Decimal)
        {
            Caption = 'Tier 2 Employee Deduction';
        }
        field(9; "Tier 2 Employer Contribution"; Decimal)
        {
            Caption = 'Tier 2 Employer Contribution';
        }
        field(10; "Lower Limit"; Decimal)
        {
            Caption = 'Lower Limit';
        }
        field(11; "Upper Limit"; Decimal)
        {
            Caption = 'Upper Limit';
        }
    }

    keys
    {
        key(Key1; Tier)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
