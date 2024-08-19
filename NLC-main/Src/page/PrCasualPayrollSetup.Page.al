#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193555 "PrCasual Payroll Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "PrCasual Payroll Setup";
    UsageCategory = Administration;
    Caption = 'PrCasual Payroll Setup';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Normal Hours Rate per Hour"; Rec."Normal Hours Rate per Hour")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Normal Hours Rate per Hour field.';
                }
                field("Overtime Hours Rate per Hour"; Rec."Overtime Hours Rate per Hour")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Hours Rate per Hour field.';
                }
                field("PHs and Weekends Rate per Hour"; Rec."PHs and Weekends Rate per Hour")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PHs and Weekends Rate per Hour field.';
                }
            }
        }
    }

    actions { }
}
