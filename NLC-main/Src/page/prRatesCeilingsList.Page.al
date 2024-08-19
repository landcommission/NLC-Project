#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193545 "prRates & Ceilings List"
{
    CardPageId = "prRates & Ceilings";
    PageType = List;
    SourceTable = "PR Vital Setup Info";
    ApplicationArea = All;
    Caption = 'prRates & Ceilings List';
    layout
    {
        area(Content)
        {
            repeater("Rates & Ceilings")
            {
                field("Setup Code"; Rec."Setup Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Setup Code field.';
                }
                field("Tax Relief"; Rec."Tax Relief")
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
                field("Mortgage Relief"; Rec."Mortgage Relief")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mortgage Relief field.';
                }
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
                field("Taxable Pay (Normal)"; Rec."Taxable Pay (Normal)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable Pay (Normal) field.';
                }
                field("Taxable Pay (Agricultural)"; Rec."Taxable Pay (Agricultural)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable Pay (Agricultural) field.';
                }
                field("NHIF Based on"; Rec."NHIF Based on")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF Based on field.';
                }
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
                field("OOI Deduction"; Rec."OOI Deduction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OOI Deduction field.';
                }
                field("OOI December"; Rec."OOI December")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OOI December field.';
                }
                field("Security Day (U)"; Rec."Security Day (U)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Day (U) field.';
                }
                field("Security Night (U)"; Rec."Security Night (U)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Night (U) field.';
                }
                field("Ayah (U)"; Rec."Ayah (U)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ayah (U) field.';
                }
                field("Gardener (U)"; Rec."Gardener (U)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gardener (U) field.';
                }
                field("Security Day (R)"; Rec."Security Day (R)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Day (R) field.';
                }
                field("Security Night (R)"; Rec."Security Night (R)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Night (R) field.';
                }
                field("Ayah (R)"; Rec."Ayah (R)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ayah (R) field.';
                }
                field("Gardener (R)"; Rec."Gardener (R)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gardener (R) field.';
                }
                field("Benefit Threshold"; Rec."Benefit Threshold")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Threshold field.';
                }
                field("NSSF Based on"; Rec."NSSF Based on")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF Based on field.';
                }
            }
        }
    }

    actions { }
}
