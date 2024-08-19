#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193469 "HR Leave Jnl. Template List"
{
    Caption = 'Leave Jnl. Template List';
    Editable = true;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Template';
    SourceTable = "HR Leave Journal Template";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Template)
            {
                Caption = 'Template';
                action("&Batches")
                {
                    ApplicationArea = Basic;
                    Caption = '&Batches';
                    Image = ChangeBatch;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "HR Leave Batches";
                    RunPageLink = "Journal Template Name" = field(Name);
                    ToolTip = 'Executes the &Batches action.';
                }
            }
        }
    }
}
