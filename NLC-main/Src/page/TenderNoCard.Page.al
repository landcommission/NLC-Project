#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193942 "Tender No. Card"
{
    PageType = Card;
    SourceTable = "W/P Budget Buffer";
    ApplicationArea = All;
    Caption = 'Tender No. Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field("Dimension Value Code 2"; Rec."Dimension Value Code 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Value Code 2 field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
            part("Tender Stages"; "Budget Workplan Names")
            {
                SubPageLink = Name = field("Workplan Code");
                //SubPageView = sorting(Name,Field12);
            }
        }
    }

    actions { }
}
