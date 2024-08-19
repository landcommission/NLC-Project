#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193921 "Procurement Workplan Card"
{
    ApplicationArea = Basic;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = Workplan;
    SourceTableView = where("Last Year" = filter(false));
    UsageCategory = Lists;
    Caption = 'Procurement Workplan Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field("Workplan Description"; Rec."Workplan Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplan Description';
                    ToolTip = 'Specifies the value of the Workplan Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions { }
}
