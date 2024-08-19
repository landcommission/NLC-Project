#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193543 "PR Vital Setup Info"
{
    Caption = 'PR Vital Setup Info';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Setup Code"; Code[10])
        {
            Description = '[Relief]';
            Caption = 'Setup Code';
        }
        field(2; "Tax Relief"; Decimal)
        {
            Description = '[Relief]';
            Caption = 'Tax Relief';
        }
        field(3; "Insurance Relief"; Decimal)
        {
            Description = '[Relief]';
            Caption = 'Insurance Relief';
        }
        field(4; "Max Relief"; Decimal)
        {
            Description = '[Relief]';
            Caption = 'Max Relief';
        }
        field(5; "Mortgage Relief"; Decimal)
        {
            Description = '[Relief]';
            Caption = 'Mortgage Relief';
        }
        field(6; "Max Pension Contribution"; Decimal)
        {
            Description = '[Pension]';
            Caption = 'Max Pension Contribution';
        }
        field(7; "Tax On Excess Pension"; Decimal)
        {
            Description = '[Pension]';
            Caption = 'Tax On Excess Pension';
        }
        field(8; "Loan Market Rate"; Decimal)
        {
            Description = '[Loans]';
            Caption = 'Loan Market Rate';
        }
        field(9; "Loan Corporate Rate"; Decimal)
        {
            Description = '[Loans]';
            Caption = 'Loan Corporate Rate';
        }
        field(10; "Taxable Pay (Normal)"; Decimal)
        {
            Description = '[Housing]';
            Caption = 'Taxable Pay (Normal)';
        }
        field(11; "Taxable Pay (Agricultural)"; Decimal)
        {
            Description = '[Housing]';
            Caption = 'Taxable Pay (Agricultural)';
        }
        field(12; "NHIF Based on"; Option)
        {
            Description = '[NHIF] - Gross,Basic,Taxable Pay';
            OptionMembers = Gross,Basic,"Taxable Pay";
            Caption = 'NHIF Based on';
        }
        field(13; "NSSF Employee"; Decimal)
        {
            Description = '[NSSF]';
            Caption = 'NSSF Employee';
        }
        field(14; "NSSF Employer Factor"; Decimal)
        {
            Description = '[NSSF]';
            Caption = 'NSSF Employer Factor';
        }
        field(15; "OOI Deduction"; Decimal)
        {
            Description = '[OOI]';
            Caption = 'OOI Deduction';
        }
        field(16; "OOI December"; Decimal)
        {
            Description = '[OOI]';
            Caption = 'OOI December';
        }
        field(17; "Security Day (U)"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Security Day (U)';
        }
        field(18; "Security Night (U)"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Security Night (U)';
        }
        field(19; "Ayah (U)"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Ayah (U)';
        }
        field(20; "Gardener (U)"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Gardener (U)';
        }
        field(21; "Security Day (R)"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Security Day (R)';
        }
        field(22; "Security Night (R)"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Security Night (R)';
        }
        field(23; "Ayah (R)"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Ayah (R)';
        }
        field(24; "Gardener (R)"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Gardener (R)';
        }
        field(25; "Benefit Threshold"; Decimal)
        {
            Description = '[Servant]';
            Caption = 'Benefit Threshold';
        }
        field(26; "NSSF Based on"; Option)
        {
            Description = '[NSSF] - Gross,Basic,Taxable Pay';
            OptionMembers = Gross,Basic,"Taxable Pay";
            Caption = 'NSSF Based on';
        }
        field(27; "Value Posting"; Decimal)
        {
            Caption = 'Value Posting';
        }
        field(28; "Disbled Tax Limit"; Decimal)
        {
            Caption = 'Disbled Tax Limit';
        }
        field(29; "Minimum Relief Amount"; Decimal)
        {
            Caption = 'Minimum Relief Amount';
        }
        field(30; "Secondary Tax Percentage"; Decimal)
        {
            Caption = 'Secondary Tax Percentage';
        }
        field(31; "Prorate Allowances"; Boolean)
        {
            Description = 'Added Wesa for NLC Proration to Start after which day of the month (In their case it was at the 15th of every month)';
            Caption = 'Prorate Allowances';
        }
        field(32; "Prorate Basic Pay"; Boolean)
        {
            Description = 'Added Wesa for NLC Proration to Start after which day of the month (In their case it was at the 15th of every month)';
            Caption = 'Prorate Basic Pay';
        }
        field(33; "Prorate Allowance Start Date"; Integer)
        {
            Description = 'Added Wesa for NLC Proration to Start after which day of the month (In their case it was at the 15th of every month)';
            Caption = 'Prorate Allowance Start Date';
        }
        field(34; "Prorate Basic Pay Start Date"; Integer)
        {
            Description = 'Added Wesa for NLC Proration to Start after which day of the month (In their case it was at the 15th of every month)';
            Caption = 'Prorate Basic Pay Start Date';
        }
        field(35; "NITA Employer Contribution"; Decimal)
        {
            Caption = 'NITA Employer Contribution';
        }
        field(36; "NSSF Employee Percentage"; Decimal)
        {
            Caption = 'NSSF Employee Percentage';
        }
        field(37; "NSSF Employer Percentage"; Decimal)
        {
            Caption = 'NSSF Employer Percentage';
        }
        field(38; "Maximum NSSF Employee"; Decimal)
        {
            Caption = 'Maximum NSSF Employee';
        }
        field(39; "Maximum NSSF Employer"; Decimal)
        {
            Caption = 'Maximum NSSF Employer';
        }
        field(40; "HseLevy Percentage Employee"; Decimal)
        {
            Caption = 'HseLevy Percentage Employee';
        }
        field(41; "HseLevy Percentage Employer"; Decimal)
        {
            Caption = 'HseLevy Percentage Employer';
        }

        field(50109; "Baggage Allowance Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Baggage Allowance Code';
        }
        field(50110; "Transfer Allowance Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Transfer Allowance Code';
        }
        field(50111; "Baggage Allowance Distance"; Decimal)
        {
            Caption = 'Baggage Allowance Distance(KMs)';
        }
        field(50112; "Encrypt Payroll Document"; Decimal)
        {
            Caption = 'Encrypt Payroll Document';
        }

        field(50108; "Hardship Allowance Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Hardship Allowance Code';
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
