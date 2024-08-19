#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193923 "Workplan Activities - Convert"
{
    ApplicationArea = Basic;
    Editable = true;
    PageType = List;
    SourceTable = "Workplan Activities";
    SourceTableView = where("Uploaded to Procurement Workpl" = const(true));
    UsageCategory = Lists;
    Caption = 'Workplan Activities - Convert';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                IndentationColumn = NameIndent;
                IndentationControls = "Activity Code";
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity Code';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = NoEmphasize;
                    ToolTip = 'Specifies the value of the Account Type field.';
                    trigger OnValidate()
                    begin
                        UpdateControls();
                    end;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ToolTip = 'Specifies the value of the Type field.';
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
                    Editable = false;
                    Style = Strong;
                    StyleExpr = NoEmphasize;
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
                field("Amount to Transfer"; Rec."Amount to Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount to Transfer field.';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budgeted Amount field.';
                }
                field("Converted to Budget"; Rec."Converted to Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Converted to Budget field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control2; Outlook) { }
            systempart(Control1; Notes) { }
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
                action(IndentWorkPlan)
                {
                    ApplicationArea = Basic;
                    Caption = 'Indent Workplan Activities';
                    Image = IndentChartOfAccounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = codeunit "Workplan Indent";
                    ToolTip = 'Executes the Indent Workplan Activities action.';
                }
                action(Convert)
                {
                    ApplicationArea = Basic;
                    Caption = 'Convert to Workplan Budget Entry';
                    Image = InsertFromCheckJournal;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Convert to Workplan Budget Entry action.';
                    trigger OnAction()
                    begin
                        //DW
                        if Rec."Account Type" <> Rec."Account Type"::Posting then
                            Rec.TestField(Rec."Account Type", Rec."Account Type"::Posting)
                        else begin
                            //Check Required Fields
                            CheckRequiredFields();

                            //Dialog
                            if Confirm(Text0001, false, Rec."Activity Code", Rec."Activity Description") = false then
                                exit;

                            //Upload to Workplan Entry Table and mark as converted to Workplan Entry

                            //Completion
                            Message(Text0002, Rec."Activity Code", Rec."Activity Description");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        UpdateControls();
    end;

    var
        [InDataSet]
        NoEmphasize: Boolean;
        [InDataSet]
        NameEmphasize: Boolean;
        [InDataSet]
        NameIndent: Integer;
        Text0001: Label 'Convert to Workplan Activity %1-%2 to a Workplan Budget Entry?';
        Text0002: Label 'Workplan Budget Entry created for Workplan Activity %1-%2.';


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


    procedure UpdateControls()
    begin
        /*
        IF (Type = Type::"Begin-Total") OR (Type = Type::"End-Total") THEN
        BEGIN
            FieldEditable:=FALSE;
        END ELSE
        BEGIN
            FieldEditable:=TRUE;
        END;
        */

        //For Bold and Indentation
        NoEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
        NameIndent := Rec.Indentation;
        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;

    end;


    procedure CheckRequiredFields()
    begin
        /*
        testfield(Type);
        testfield();
        testfield();
        */

    end;
}
