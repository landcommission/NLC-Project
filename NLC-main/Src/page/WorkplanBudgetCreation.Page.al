#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193922 "Workplan Budget Creation"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Workplan Budget Allocation";
    UsageCategory = Lists;
    Caption = 'Workplan Budget Creation';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Analysis Area"; Rec."Analysis Area")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Analysis Area field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplan Code';
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field("Current G/L Budget"; Rec."Current G/L Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current G/L Budget field.';
                }
                field("Current Item Budget"; Rec."Current Item Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Item Budget field.';
                }
                field("Business Unit"; Rec."Business Unit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Unit field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Dimension 1 Code';
                    Enabled = FieldsEditable;
                    Visible = FieldsEditable;
                    ToolTip = 'Specifies the value of the Budget Dimension 1 Code field.';
                }
                field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Dimension 2 Code';
                    Enabled = FieldsEditable;
                    Visible = FieldsEditable;
                    ToolTip = 'Specifies the value of the Budget Dimension 2 Code field.';
                }
                field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Dimension 3 Code';
                    Enabled = FieldsEditable;
                    Visible = FieldsEditable;
                    ToolTip = 'Specifies the value of the Budget Dimension 3 Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Period Type"; Rec."Period Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Type field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Overwrite; Rec.Overwrite)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overwrite field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Process)
            {
                ApplicationArea = Basic;
                Caption = 'Process';
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Process action.';
                trigger OnAction()
                begin
                    Rec.TestField(Rec."Start Date");
                    Rec.TestField(Rec."End Date");
                    if Confirm('Process Allocation?', false) = false then begin
                        Error('Processing Aborted');
                        exit;
                    end else
                        fnProcessAllocation();
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Budget.Reset();
        Budget.SetRange(Budget."Workplan Code", Rec.Name);
        if Budget.Find('-') then begin
            //Check if the budget dimension 1 is to be enabled
            if Budget."Budget Dimension 1 Code" = '' then
                FieldsEditable := false
            else
                FieldsEditable := true;
            if Budget."Budget Dimension 2 Code" = '' then
                FieldsEditable := false
            else
                FieldsEditable := true;
            if Budget."Budget Dimension 3 Code" = '' then
                FieldsEditable := false
            else
                FieldsEditable := true;
        end;
    end;

    var
        Budget: Record Workplan;
        FieldsEditable: Boolean;
        BudgetAllocation: Codeunit "WP Budget Allocation";


    procedure fnProcessAllocation()
    begin
        Rec.SetRange(Rec."Line No.", Rec."Line No.");
        BudgetAllocation.CreateBudgetFromWorkplan(Rec);
    end;
}
