#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193523 "prP.A.Y.E Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "PR PAYE";
    UsageCategory = Lists;
    Caption = 'prP.A.Y.E Setup';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Tier Code"; Rec."Tier Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier Code field.';
                }
                field("PAYE Tier"; Rec."PAYE Tier")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PAYE Tier field.';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
            }
        }
    }

    actions { }
}
