
#pragma implicitwith disable
page 52193851 "Grant WIP G/L Entries"
{
    Caption = 'Grant WIP G/L Entries';
    DataCaptionFields = "Job No.";
    Editable = false;
    PageType = Card;
    SourceTable = "Job-WIP G/L Entry";
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Reversed; Rec.Reversed)
                {
                    ToolTip = 'Specifies the value of the Reversed field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("WIP Posting Date"; Rec."WIP Posting Date")
                {
                    ToolTip = 'Specifies the value of the WIP Posting Date field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ToolTip = 'Specifies the value of the G/L Account No. field.';
                }
                field("G/L Bal. Account No."; Rec."G/L Bal. Account No.")
                {
                    ToolTip = 'Specifies the value of the G/L Bal. Account No. field.';
                }
                field("Reverse Date"; Rec."Reverse Date")
                {
                    ToolTip = 'Specifies the value of the Reverse Date field.';
                }
                field("WIP Method Used"; Rec."WIP Method Used")
                {
                    ToolTip = 'Specifies the value of the WIP Method Used field.';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("WIP Entry Amount"; Rec."WIP Entry Amount")
                {
                    ToolTip = 'Specifies the value of the WIP Entry Amount field.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ToolTip = 'Specifies the value of the Job Posting Group field.';
                }
                field("WIP Transaction No."; Rec."WIP Transaction No.")
                {
                    ToolTip = 'Specifies the value of the WIP Transaction No. field.';
                }
                field("WIP Schedule (Total Cost)"; Rec."WIP Schedule (Total Cost)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Schedule (Total Cost) field.';
                }
                field("WIP Schedule (Total Price)"; Rec."WIP Schedule (Total Price)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Schedule (Total Price) field.';
                }
                field("WIP Usage (Total Cost)"; Rec."WIP Usage (Total Cost)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Usage (Total Cost) field.';
                }
                field("WIP Usage (Total Price)"; Rec."WIP Usage (Total Price)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Usage (Total Price) field.';
                }
                field("WIP Contract (Total Cost)"; Rec."WIP Contract (Total Cost)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Contract (Total Cost) field.';
                }
                field("WIP Contract (Total Price)"; Rec."WIP Contract (Total Price)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Contract (Total Price) field.';
                }
                field("WIP (Invoiced Price)"; Rec."WIP (Invoiced Price)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP (Invoiced Price) field.';
                }
                field("WIP (Invoiced Cost)"; Rec."WIP (Invoiced Cost)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP (Invoiced Cost) field.';
                }
                field("WIP Posting Date Filter"; Rec."WIP Posting Date Filter")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Posting Date Filter field.';
                }
                field("WIP Planning Date Filter"; Rec."WIP Planning Date Filter")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Planning Date Filter field.';
                }
                field("G/L Entry No."; Rec."G/L Entry No.")
                {
                    ToolTip = 'Specifies the value of the G/L Entry No. field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
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
                action("<Page Ledger Entry Dimensions>")
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = page "Ledger Entry Dimensions";
                    RunPageLink = "Table ID" = const(39004347),
                                  "Entry No." = field("Entry No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
        area(Processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
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

#pragma implicitwith restore

