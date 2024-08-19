#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193846 "Grant Task Card"
{
    Caption = 'Grant Activity Card';
    DataCaptionExpression = Rec.Caption();
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Job-Task";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Grant Task No."; Rec."Grant Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Task No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Grant Task Type"; Rec."Grant Task Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Type field.';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Totaling field.';
                }
                field("Grant Posting Group"; Rec."Grant Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Posting Group field.';
                }
                field("New Page"; Rec."New Page")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Page field.';
                }
                field("No. of Blank Lines"; Rec."No. of Blank Lines")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Blank Lines field.';
                }
            }
            group(WIP)
            {
                Caption = 'WIP';
                field("WIP Method Used"; Rec."WIP Method Used")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Method Used field.';
                }
                field("WIP Posting Date"; Rec."WIP Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Posting Date field.';
                }
                field("WIP Account"; Rec."WIP Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Account field.';
                }
                field("WIP Balance Account"; Rec."WIP Balance Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Balance Account field.';
                }
                field("WIP Amount"; Rec."WIP Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Amount field.';
                }
                field("Invoiced Sales Amount"; Rec."Invoiced Sales Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoiced Sales Amount field.';
                }
                field("Invoiced Sales Account"; Rec."Invoiced Sales Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoiced Sales Account field.';
                }
                field("Invoiced Sales Bal. Account"; Rec."Invoiced Sales Bal. Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoiced Sales Bal. Account field.';
                }
                field("WIP Posting Date Filter"; Rec."WIP Posting Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Posting Date Filter field.';
                }
                field("WIP Planning Date Filter"; Rec."WIP Planning Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Planning Date Filter field.';
                }
                field("WIP Schedule (Total Cost)"; Rec."WIP Schedule (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Schedule (Total Cost) field.';
                }
                field("WIP Schedule (Total Price)"; Rec."WIP Schedule (Total Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Schedule (Total Price) field.';
                }
                field("WIP Usage (Total Cost)"; Rec."WIP Usage (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Usage (Total Cost) field.';
                }
                field("WIP Usage (Total Price)"; Rec."WIP Usage (Total Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Usage (Total Price) field.';
                }
                field("WIP Contract (Total Cost)"; Rec."WIP Contract (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Contract (Total Cost) field.';
                }
                field("WIP Contract (Total Price)"; Rec."WIP Contract (Total Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Contract (Total Price) field.';
                }
                field("WIP (Invoiced Price)"; Rec."WIP (Invoiced Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP (Invoiced Price) field.';
                }
                field("WIP (Invoiced Cost)"; Rec."WIP (Invoiced Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP (Invoiced Cost) field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Grant Task")
            {
                Caption = '&Grant Task';
                action("<Page Grant Task Dimensions>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = page "Grant Task Dimensions";
                    RunPageLink = "Job No." = field("Grant No."),
                                  "Job Task No." = field("Grant Task No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
    }
}
