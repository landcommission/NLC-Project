#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193791 "Investment Setup"
{
    PageType = Card;
    SourceTable = "Investment Setup";
    ApplicationArea = All;
    Caption = 'Investment Setup';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Investment Template"; Rec."Investment Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Template field.';
                }
                field("Investment Batch"; Rec."Investment Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Batch field.';
                }
                field("Investment G/L Account"; Rec."Investment G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment G/L Account field.';
                }
                field("Interest G/L Account"; Rec."Interest G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest G/L Account field.';
                }
                field("Withholding Tax G/L Account"; Rec."Withholding Tax G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax G/L Account field.';
                }
            }
            group(Numbering)
            {
                field("Investment Nos"; Rec."Investment Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Nos field.';
                }
            }
        }
    }

    actions { }
}
