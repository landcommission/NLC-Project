#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193536 "prRates & Ceilings"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "PR Vital Setup Info";
    UsageCategory = Administration;
    Caption = 'prRates & Ceilings';
    layout
    {
        area(Content)
        {
            group("Tax Relief")
            {
                Caption = 'Tax Relief';
                field("Setup Code"; Rec."Setup Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Setup Code field.';
                }
                field(Control20; Rec."Tax Relief")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Relief field.';
                }
                field("Insurance Relief"; Rec."Insurance Relief")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Relief field.';
                }
                field("Max Relief"; Rec."Max Relief")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Relief field.';
                }
                field("Disbled Tax Limit"; Rec."Disbled Tax Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disbled Tax Limit field.';
                }
            }
            group("NSSF Contribution")
            {
                Caption = 'NSSF Contribution';
                field("NSSF Employee"; Rec."NSSF Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF Employee field.';
                }
                field("NSSF Employer Factor"; Rec."NSSF Employer Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF Employer Factor field.';
                }
                field("NSSF Based on"; Rec."NSSF Based on")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF Based on field.';
                }
                field("NSSF Employee Percentage"; Rec."NSSF Employee Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF Employee Percentage field.';
                }
                field("NSSF Employer Percentage"; Rec."NSSF Employer Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF Employer Percentage field.';
                }
                field("Maximum NSSF Employee"; Rec."Maximum NSSF Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum NSSF Employee field.';
                }
                field("Maximum NSSF Employer"; Rec."Maximum NSSF Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum NSSF Employer field.';
                }
            }
            group("NITA Employer Contribution")
            {
                Caption = 'NITA Employer Contribution';
                field(Control31; Rec."NITA Employer Contribution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NITA Employer Contribution field.';
                }
            }
            group(NHIF)
            {
                Caption = 'NHIF';
                field("NHIF Based on"; Rec."NHIF Based on")
                {
                    ApplicationArea = Basic;
                    Caption = 'Select one:';
                    ToolTip = 'Specifies the value of the Select one: field.';
                }
            }
            group(Pension)
            {
                Caption = 'Pension';
                field("Max Pension Contribution"; Rec."Max Pension Contribution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Pension Contribution field.';
                }
                field("Tax On Excess Pension"; Rec."Tax On Excess Pension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax On Excess Pension field.';
                }
            }
            group(Mortgage)
            {
                Caption = 'Mortgage';
                field("Mortgage Relief"; Rec."Mortgage Relief")
                {
                    ApplicationArea = Basic;
                    Caption = 'Less from Taxable Pay';
                    ToolTip = 'Specifies the value of the Less from Taxable Pay field.';
                }
            }
            group("Owner Occupier Interest")
            {
                Caption = 'Owner Occupier Interest';
                field("OOI Deduction"; Rec."OOI Deduction")
                {
                    ApplicationArea = Basic;
                    Caption = 'Max Monthly Contribution';
                    ToolTip = 'Specifies the value of the Max Monthly Contribution field.';
                }
                field("OOI December"; Rec."OOI December")
                {
                    ApplicationArea = Basic;
                    Caption = 'December deduction';
                    ToolTip = 'Specifies the value of the December deduction field.';
                }
            }
            group("Staff Loans")
            {
                Caption = 'Staff Loans';
                field("Loan Market Rate"; Rec."Loan Market Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Market Rate field.';
                }
                field("Loan Corporate Rate"; Rec."Loan Corporate Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Corporate Rate field.';
                }
            }
            group("Proration of Allowances")
            {
                Caption = 'Proration of Allowances';
                field("Prorate Allowances"; Rec."Prorate Allowances")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prorate Allowances field.';
                }
                field("Prorate Allowance Start Date"; Rec."Prorate Allowance Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prorate Allowance Start Date field.';
                }
                field("Prorate Basic Pay"; Rec."Prorate Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prorate Basic Pay field.';
                }
                field("Prorate Basic Pay Start Date"; Rec."Prorate Basic Pay Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prorate Basic Pay Start Date field.';
                }
            }
        }
    }

    actions { }
}
