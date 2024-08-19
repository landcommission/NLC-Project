#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193872 "Project Partners (InE)"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Project Partners";
    ApplicationArea = All;
    Caption = 'Project Partners (InE)';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Grant No"; Rec."Grant No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant No field.';
                }
                field(PartnerID; Rec.PartnerID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PartnerID field.';
                }
                field("Partner Name"; Rec."Partner Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partner Name field.';
                }
                field("Partner Budget"; Rec."Partner Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Partner Budget field.';
                }
                field("Disbursed Amount (LCY)"; Rec."Disbursed Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disbursed Amount (LCY) field.';
                }
            }
        }
    }

    actions { }
}
