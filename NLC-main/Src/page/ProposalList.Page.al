#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193878 "Proposal List"
{
    Caption = 'Grant List';
    CardPageId = "Proposal Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Jobs;
    SourceTableView = where(Status = const(Proposal),
                            "Approval Status" = filter(Open | "Pending Approval"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Person Responsible field.';
                }
                field("Next Invoice Date"; Rec."Next Invoice Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Next Invoice Date field.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Kind of Program field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control8; Links)
            {
                Editable = false;
                Visible = true;
            }
            systempart(Control7; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Grant")
            {
                Caption = '&Grant';
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = page "Proposal Card";
                    RunPageLink = "No." = field("No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Card action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Job),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action("<Page Grant Task Dimensions>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        RunObject = page "Grant Task Dimensions";
                        RunPageLink = "Job No." = field("No."),
                                      "Job Task No." = const('');
                        ShortcutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        ToolTip = 'Executes the Dimensions-&Multiple action.';
                        trigger OnAction()
                        var
                            Job: Record Jobs;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Job);
                            //DefaultDimMultiple.SetMultiJob(Job);
                            DefaultDimMultiple.RunModal();
                        end;
                    }
                }
                action("<Page Grant Ledger Entries>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    RunObject = page "Grant Ledger Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Task No.", "Entry Type", "Posting Date");
                    ShortcutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Ledger E&ntries action.';
                }
                action("Grant Task Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task Lines';
                    ToolTip = 'Executes the Grant Task Lines action.';
                    trigger OnAction()
                    var
                        JTLines: Page "Grant Task Lines";
                    begin
                        JTLines.SetJobNo(Rec."No.");
                        JTLines.Run();
                    end;
                }
                action("<Page Grant Statistics>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Grant Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                }
            }
        }
        area(Processing)
        {
            action("G/l")
            {
                ApplicationArea = Basic;
                Caption = 'G/l';
                RunObject = page "G/L Account Card";
                ToolTip = 'Executes the G/l action.';
            }
        }
        area(Reporting) { }
    }
}
