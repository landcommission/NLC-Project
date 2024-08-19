#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193470 "HR Leave Ledger Entries"
{
    Caption = 'Hr Leave Ledger Entries';
    DataCaptionFields = "Leave Calendar Code";
    Editable = true;
    PageType = List;
    SourceTable = "HR Leave Ledger Entries";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(Batched; Rec.Batched)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Batched field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Leave Calendar Code"; Rec."Leave Calendar Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Calendar Code field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Leave Entry Type"; Rec."Leave Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Entry Type field.';
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of days field.';
                }
                field("Leave Posting Description"; Rec."Leave Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Posting Description field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    RunObject = page "Default Dimension Where-Used";
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
        area(Processing)
        {
            action("&Navigate")
            {
                ApplicationArea = Basic;
                Caption = '&Navigate';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Navigate action.';
                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.Run();
                end;
            }
        }
    }

    var
        Navigate: Page Navigate;
}
