#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193908 "Workplan Activities"
{
    ApplicationArea = Basic;
    Editable = true;
    PageType = List;
    SourceTable = "Workplan Activities";
    UsageCategory = Lists;
    Caption = 'Workplan Activities';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                IndentationColumn = NameIndent;
                IndentationControls = "Activity Code", "Activity Description";
                ShowAsTree = false;
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity Code';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                    ToolTip = 'Specifies the value of the Activity Code field.';
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = Strong;
                    StyleExpr = NoEmphasize;
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
                field("Amount to Transfer"; Rec."Amount to Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount to Transfer field.';
                }
                field("Date to Transfer"; Rec."Date to Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date to Transfer field.';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budgeted Amount field.';
                }
                field("Uploaded to Procurement Workpl"; Rec."Uploaded to Procurement Workpl")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Uploaded to Procurement Workplan field.';
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
        Text0001: Label 'Convert to Workplan Activity [ %1-%2 ]to a Workplan Budget Entry?';
        Text0002: Label 'Workplan Budget Entry created for Workplan Activity [ %1-%2 ]';


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

        Rec.TestField(Rec."Account Type");
        Rec.TestField(Rec."Activity Description");
        Rec.TestField(Rec."Workplan Code");
        Rec.TestField(Rec."Date to Transfer", 0D);
        //if
    end;


    procedure UploadWorkplanActivities()
    var
        WorkplanEntry: Record "Workplan Entry";
        EntryNum: Integer;
    begin
        WorkplanEntry.Reset();
        WorkplanEntry.Init();

        WorkplanEntry."Entry No." := GetNextEntryNo();

        WorkplanEntry."Workplan Code" := WorkplanEntry."Workplan Code";
        WorkplanEntry."Activity Code" := WorkplanEntry."Activity Code";
        WorkplanEntry.Date := Rec."Date to Transfer";

        //Validation will fill other variables
        WorkplanEntry.Validate(WorkplanEntry.Date);

        WorkplanEntry.Insert();
    end;

    local procedure GetNextEntryNo(): Integer
    var
        WorkplanEntry: Record "Workplan Entry";
        EntryNum: Integer;
    begin
        WorkplanEntry.SetCurrentKey("Entry No.");
        if WorkplanEntry.Find('+') then
            exit(WorkplanEntry."Entry No." + 1)
        else
            exit(1);
    end;
}
