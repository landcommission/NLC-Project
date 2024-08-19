#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193868 "Reporing Period"
{
    PageType = Card;
    SourceTable = "Reporting Date";
    ApplicationArea = All;
    Caption = 'Reporing Period';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("code"; Rec.code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the code field.';
                }
                field("Financial Reporting Date"; Rec."Financial Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Reporting Date field.';
                }
                field("Technical Reporting Date"; Rec."Technical Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technical Reporting Date field.';
                }
            }
        }
    }

    actions { }
}
