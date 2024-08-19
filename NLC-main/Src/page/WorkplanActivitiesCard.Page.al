#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193914 "Workplan Activities Card"
{
    PageType = List;
    SourceTable = "Workplan Activities";
    ApplicationArea = All;
    Caption = 'Workplan Activities Card';
    layout
    {
        area(Content)
        {
            repeater(Control1102756000)
            {
                IndentationColumn = ActivitiesIndent;
                IndentationControls = "Activity Description";
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Default RFP Code"; Rec."Default RFP Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default RFP Code field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Expense Code"; Rec."Expense Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Code field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Totaling field.';
                }
                field("Proc. Method No."; Rec."Proc. Method No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field("Converted to Budget"; Rec."Converted to Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Converted to Budget field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Strategic Plan Code"; Rec."Strategic Plan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Plan Code field.';
                }
                field("Strategic Plan Desc"; Rec."Strategic Plan Desc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategic Plan Desc field.';
                }
                field("Medium term Plan Code"; Rec."Medium term Plan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medium term Plan Code field.';
                }
                field("Medium term  Plan Desc"; Rec."Medium term  Plan Desc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medium term  Plan Desc field.';
                }
                field("PC Code"; Rec."PC Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PC Code field.';
                }
                field("PC Name"; Rec."PC Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PC Name field.';
                }
                field(Indentation; Rec.Indentation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Indentation field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Convert)
            {
                ApplicationArea = Basic;
                Caption = 'Convert';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Convert action.';
                trigger OnAction()
                begin
                    xRec."Converted to Budget" := false;
                    Workplan.Reset();
                    if Workplan.Find('-') then
                        Rec."Converted to Budget" := true;
                    repeat
                        Rec."Converted to Budget" := true;
                    until Workplan.Next() = 0;
                    Rec.Modify();
                    //END;
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Indent Workplan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Indent Workplan';
                    RunObject = codeunit "Workplan Indent";
                    ToolTip = 'Executes the Indent Workplan action.';
                }
                action("Import Workplan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Workplan';
                    ToolTip = 'Executes the Import Workplan action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ActivitiesIndent := 0;
        WorkPlanCodeOnFormat();
        ActivitiesOnFormat();
        TypeOnFormat();
        TotalingOnFormat();
    end;

    var
        Workplan: Record "Workplan Activities";
        [InDataSet]
        "WorkPlan CodeEmphasize": Boolean;
        [InDataSet]
        ActivitiesEmphasize: Boolean;
        [InDataSet]
        ActivitiesIndent: Integer;
        [InDataSet]
        TypeEmphasize: Boolean;
        [InDataSet]
        TotalingEmphasize: Boolean;


    procedure SetSelection(var GLAcc: Record "Workplan Activities")
    begin
    end;


    procedure GetSelectionFilter(): Code[80]
    var
        GLAcc: Record "Workplan Activities";
        FirstAcc: Text[20];
        LastAcc: Text[20];
        SelectionFilter: Code[80];
        GLAccCount: Integer;
        More: Boolean;
    begin
    end;

    local procedure WorkPlanCodeOnFormat()
    begin
        "WorkPlan CodeEmphasize" := Rec."Account Type" <> Rec."Account Type"::Posting;
    end;

    local procedure ActivitiesOnFormat()
    begin
        ActivitiesIndent := Rec.Indentation;
        ActivitiesEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
    end;

    local procedure TypeOnFormat()
    begin
        TypeEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
    end;

    local procedure TotalingOnFormat()
    begin
        TotalingEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
    end;
}
