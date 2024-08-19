#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193917 "Work Plan Budget"
{
    Caption = ' Work Plan Budget';
    CardPageId = "prMassEmployee Trans";
    PageType = List;
    SourceTable = "Workplan Dimension";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Code field.';
                }
                field("Dimension Value Code"; Rec."Dimension Value Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Value Code field.';
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

            }
        }
    }


    procedure GetSelectionFilter(): Text
    var
        GLBudgetName: Record "G/L Budget Name";
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(GLBudgetName);
        //EXIT(SelectionFilterManagement.GetSelectionFilterForGLBudgetName(GLBudgetName));
    end;
}
