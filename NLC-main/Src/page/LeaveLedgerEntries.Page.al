page 50053 "Leave Ledger Entries"
{
    ApplicationArea = All;
    Caption = 'Leave Ledger Entries';
    PageType = List;
    SourceTable = "HR Leave Journal Line";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ToolTip = 'Specifies the value of the Leave Period field.';
                }
                field("Leave Period End Date"; Rec."Leave Period End Date")
                {
                    ToolTip = 'Specifies the value of the Leave Period End Date field.', Comment = '%';
                }
                field("Leave Period Start Date"; Rec."Leave Period Start Date")
                {
                    ToolTip = 'Specifies the value of the Leave Period Start Date field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
            }
        }
    }
}
