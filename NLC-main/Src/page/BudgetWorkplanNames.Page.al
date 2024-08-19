#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193920 "Budget Workplan Names"
{
    Caption = 'G/L Budget Names';
    PageType = List;
    SourceTable = "Workplan Budget Name";
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
                field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 1 Code field.';
                }
                field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 2 Code field.';
                }
                field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 3 Code field.';
                }
                field("Budget Dimension 4 Code"; Rec."Budget Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 4 Code field.';
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
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(EditBudget)
            {
                ApplicationArea = Basic;
                Caption = 'Edit Budget';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortcutKey = 'Return';
                ToolTip = 'Executes the Edit Budget action.';
                trigger OnAction()
                var
                    Budget: Page "Budget Workplan";
                begin
                    Budget.SetBudgetName(Rec.Name);
                    Budget.Run();
                end;
            }
        }
    }


    procedure GetSelectionFilter(): Text
    var
        GLBudgetName: Record Workplan;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(GLBudgetName);
        ///EXIT(SelectionFilterManagement.GetSelectionFilterForWorkPlanName(GLBudgetName));
    end;
}
