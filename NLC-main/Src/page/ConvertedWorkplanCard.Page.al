#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193915 "Converted Workplan Card"
{
    ApplicationArea = Basic;
    Editable = true;
    PageType = Card;
    SourceTable = "Workplan Activities";
    SourceTableView = where("Converted to Budget" = filter(true));
    UsageCategory = Lists;
    Caption = 'Converted Workplan Card';
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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Totaling field.';
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
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
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
        CurrPage.SetSelectionFilter(GLAcc);
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
        CurrPage.SetSelectionFilter(GLAcc);
        GLAcc.SetCurrentKey("Activity Code");
        GLAccCount := GLAcc.Count;
        if GLAccCount > 0 then begin
            GLAcc.Find('-');
            while GLAccCount > 0 do begin
                GLAccCount := GLAccCount - 1;
                GLAcc.MarkedOnly(false);
                FirstAcc := GLAcc."Activity Code";
                LastAcc := FirstAcc;
                More := (GLAccCount > 0);
                while More do
                    if GLAcc.Next() = 0 then
                        More := false
                    else
                        if not GLAcc.Mark() then
                            More := false
                        else begin
                            LastAcc := GLAcc."Activity Code";
                            GLAccCount := GLAccCount - 1;
                            if GLAccCount = 0 then
                                More := false;
                        end;
                if SelectionFilter <> '' then
                    SelectionFilter := SelectionFilter + '|';
                if FirstAcc = LastAcc then
                    SelectionFilter := SelectionFilter + FirstAcc
                else
                    SelectionFilter := SelectionFilter + FirstAcc + '..' + LastAcc;
                if GLAccCount > 0 then begin
                    GLAcc.MarkedOnly(true);
                    GLAcc.Next();
                end;
            end;
        end;
        exit(SelectionFilter);
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
