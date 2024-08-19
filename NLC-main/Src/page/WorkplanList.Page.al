#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193907 "Workplan List"
{
    ApplicationArea = Basic;
    CardPageId = "Procurement Workplan Card";
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = Workplan;
    SourceTableView = where("Last Year" = filter(false));
    UsageCategory = Lists;
    Caption = 'Workplan List';
    layout
    {
        area(Content)
        {
            repeater(Control1102756000)
            {
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
        area(FactBoxes)
        {
            systempart(Control1000000002; Outlook) { }
            systempart(Control1000000000; Notes) { }
        }
    }

    actions
    {
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Visible = false;
                action(EditBudget)
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplan Budget';
                    Image = Bank;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ShortcutKey = 'Return';
                    ToolTip = 'Executes the Workplan Budget action.';
                    trigger OnAction()
                    var
                        Budget: Page "Budget Workplan";
                        WPCode: Code[20];
                    begin
                        Budget.SetBudgetName(Rec."Workplan Code");
                        Budget.Run();
                    end;
                }
                action("Workplan Activities")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplan Activities';
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "Workplan Activities";
                    RunPageLink = "Workplan Code" = field("Workplan Code");
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Workplan Activities action.';
                }
                action("Upload / Reverse Entries")
                {
                    ApplicationArea = Basic;
                    Image = ImportExport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = report "W/P Convert Workplan to Budget";
                    ToolTip = 'Executes the Upload / Reverse Entries action.';
                    trigger OnAction()
                    begin
                        Report.Run(Report::"W/P Convert Workplan to Budget", true, true);
                    end;
                }
            }
        }
    }
}
