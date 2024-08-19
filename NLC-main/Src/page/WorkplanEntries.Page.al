#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193910 "Workplan Entries"
{
    Caption = 'W/P Budget Entries';
    DataCaptionFields = "Workplan Code", "Activity Code";
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Workplan Entry";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Global Dimension 1 CodeEnable";
                    Visible = "Global Dimension 1 CodeVisible";
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Global Dimension 2 CodeEnable";
                    Visible = "Global Dimension 2 CodeVisible";
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Budget Dimension 1 CodeEnable";
                    Visible = "Budget Dimension 1 CodeVisible";
                    ToolTip = 'Specifies the value of the Budget Dimension 1 Code field.';
                }
                field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Budget Dimension 2 CodeEnable";
                    Visible = "Budget Dimension 2 CodeVisible";
                    ToolTip = 'Specifies the value of the Budget Dimension 2 Code field.';
                }
                field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Budget Dimension 3 CodeEnable";
                    Visible = "Budget Dimension 3 CodeVisible";
                    ToolTip = 'Specifies the value of the Budget Dimension 3 Code field.';
                }
                field("Budget Dimension 4 Code"; Rec."Budget Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Budget Dimension 4 CodeEnable";
                    Visible = "Budget Dimension 4 CodeVisible";
                    ToolTip = 'Specifies the value of the Budget Dimension 4 Code field.';
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Business Unit Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Processed to Budget"; Rec."Processed to Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Processed to Budget field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Created By:"; Rec."Created By:")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By: field.';
                }
                field("Last Modified By:"; Rec."Last Modified By:")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Modified By: field.';
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
        area(Navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDimensions();
                        CurrPage.SaveRecord();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Entry No." <> 0 then
            if Rec."Dimension Set ID" <> xRec."Dimension Set ID" then
                LowestModifiedEntryNo := Rec."Entry No.";
    end;

    trigger OnClosePage()
    var
        UpdateAnalysisView: Codeunit "Update Analysis View";
    begin
        if LowestModifiedEntryNo < 2147483647 then
            UpdateAnalysisView.SetLastBudgetEntryNo(LowestModifiedEntryNo - 1);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec."Entry No." < LowestModifiedEntryNo then
            LowestModifiedEntryNo := Rec."Entry No.";
        exit(true);
    end;

    trigger OnInit()
    begin
        "Budget Dimension 4 CodeEnable" := true;
        "Budget Dimension 3 CodeEnable" := true;
        "Budget Dimension 2 CodeEnable" := true;
        "Budget Dimension 1 CodeEnable" := true;
        "Global Dimension 2 CodeEnable" := true;
        "Global Dimension 1 CodeEnable" := true;
        "Budget Dimension 4 CodeVisible" := true;
        "Budget Dimension 3 CodeVisible" := true;
        "Budget Dimension 2 CodeVisible" := true;
        "Budget Dimension 1 CodeVisible" := true;
        "Global Dimension 2 CodeVisible" := true;
        "Global Dimension 1 CodeVisible" := true;
        LowestModifiedEntryNo := 2147483647;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Entry No." < LowestModifiedEntryNo then
            LowestModifiedEntryNo := Rec."Entry No.";
        exit(true);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec.GetFilter(Rec."Workplan Code") <> '' then
            Rec."Workplan Code" := Rec.GetRangeMin(Rec."Workplan Code");
        if GLBudgetName."Workplan Code" <> Rec."Workplan Code" then
            GLBudgetName.Get(Rec."Workplan Code");
        if Rec.GetFilter(Rec."Activity Code") <> '' then
            Rec."Activity Code" := GetFirstGLAcc(Rec.GetFilter(Rec."Activity Code"));
        Rec.Date := GetFirstDate(Rec.GetFilter(Rec.Date));
        Rec."User ID" := UserId;

        if Rec.GetFilter(Rec."Global Dimension 1 Code") <> '' then
            Rec."Global Dimension 1 Code" :=
              GetFirstDimValue(GLSetup."Global Dimension 1 Code", Rec.GetFilter(Rec."Global Dimension 1 Code"));

        if Rec.GetFilter(Rec."Global Dimension 2 Code") <> '' then
            Rec."Global Dimension 2 Code" :=
              GetFirstDimValue(GLSetup."Global Dimension 2 Code", Rec.GetFilter(Rec."Global Dimension 2 Code"));

        if Rec.GetFilter(Rec."Budget Dimension 1 Code") <> '' then
            Rec."Budget Dimension 1 Code" :=
              GetFirstDimValue(GLBudgetName."Budget Dimension 1 Code", Rec.GetFilter(Rec."Budget Dimension 1 Code"));

        if Rec.GetFilter(Rec."Budget Dimension 2 Code") <> '' then
            Rec."Budget Dimension 2 Code" :=
              GetFirstDimValue(GLBudgetName."Budget Dimension 2 Code", Rec.GetFilter(Rec."Budget Dimension 2 Code"));

        if Rec.GetFilter(Rec."Budget Dimension 3 Code") <> '' then
            Rec."Budget Dimension 3 Code" :=
              GetFirstDimValue(GLBudgetName."Budget Dimension 3 Code", Rec.GetFilter(Rec."Budget Dimension 3 Code"));

        if Rec.GetFilter(Rec."Budget Dimension 4 Code") <> '' then
            Rec."Budget Dimension 4 Code" :=
              GetFirstDimValue(GLBudgetName."Budget Dimension 4 Code", Rec.GetFilter(Rec."Budget Dimension 4 Code"));

        if Rec.GetFilter(Rec."Business Unit Code") <> '' then
            Rec."Business Unit Code" := GetFirstBusUnit(Rec.GetFilter(Rec."Business Unit Code"));
    end;

    trigger OnOpenPage()
    var
        GLBudgetName: Record Workplan;
    begin


        if Rec.GetFilter(Rec."Workplan Code") = '' then
            GLBudgetName.Init()
        else begin
            Rec.CopyFilter(Rec."Workplan Code", GLBudgetName."Workplan Code");
            GLBudgetName.FindFirst();
        end;
        CurrPage.Editable := not GLBudgetName.Blocked;
        GLSetup.Get();
        "Global Dimension 1 CodeEnable" := GLSetup."Global Dimension 1 Code" <> '';
        "Global Dimension 2 CodeEnable" := GLSetup."Global Dimension 2 Code" <> '';
        "Budget Dimension 1 CodeEnable" := GLBudgetName."Budget Dimension 1 Code" <> '';
        "Budget Dimension 2 CodeEnable" := GLBudgetName."Budget Dimension 2 Code" <> '';
        "Budget Dimension 3 CodeEnable" := GLBudgetName."Budget Dimension 3 Code" <> '';
        "Budget Dimension 4 CodeEnable" := GLBudgetName."Budget Dimension 4 Code" <> '';
        "Global Dimension 1 CodeVisible" := GLSetup."Global Dimension 1 Code" <> '';
        "Global Dimension 2 CodeVisible" := GLSetup."Global Dimension 2 Code" <> '';
        "Budget Dimension 1 CodeVisible" := GLBudgetName."Budget Dimension 1 Code" <> '';
        "Budget Dimension 2 CodeVisible" := GLBudgetName."Budget Dimension 2 Code" <> '';
        "Budget Dimension 3 CodeVisible" := GLBudgetName."Budget Dimension 3 Code" <> '';
        "Budget Dimension 4 CodeVisible" := GLBudgetName."Budget Dimension 4 Code" <> '';
    end;

    var
        GLSetup: Record "General Ledger Setup";
        GLBudgetName: Record Workplan;
        LowestModifiedEntryNo: Integer;
        [InDataSet]
        "Global Dimension 1 CodeVisible": Boolean;
        [InDataSet]
        "Global Dimension 2 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 1 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 2 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 3 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 4 CodeVisible": Boolean;
        [InDataSet]
        "Global Dimension 1 CodeEnable": Boolean;
        [InDataSet]
        "Global Dimension 2 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 1 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 2 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 3 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 4 CodeEnable": Boolean;

    local procedure GetFirstGLAcc(GLAccFilter: Text[250]): Code[20]
    var
        GLAcc: Record "Workplan Activities";
    begin
        begin
            GLAcc.SetFilter(GLAcc."Activity Code", GLAccFilter);
            if GLAcc.FindFirst() then
                exit(GLAcc."Activity Code");

            exit('');
        end;
    end;

    local procedure GetFirstDate(DateFilter: Text[250]): Date
    var
        Period: Record Date;
    begin
        if DateFilter = '' then
            exit(0D);
        begin
            Period.SetRange(Period."Period Type", Period."Period Type"::Date);
            Period.SetFilter(Period."Period Start", DateFilter);
            if Period.FindFirst() then
                exit(Period."Period Start");

            exit(0D);
        end;
    end;

    local procedure GetFirstDimValue(DimCode: Code[20]; DimValFilter: Text[250]): Code[20]
    var
        DimVal: Record "Dimension Value";
    begin
        if (DimCode = '') or (DimValFilter = '') then
            exit('');
        begin
            DimVal.SetRange(DimVal."Dimension Code", DimCode);
            DimVal.SetFilter(DimVal.Code, DimValFilter);
            if DimVal.FindFirst() then
                exit(DimVal.Code);

            exit('');
        end;
    end;

    local procedure GetFirstBusUnit(BusUnitFilter: Text[250]): Code[10]
    var
        BusUnit: Record "Business Unit";
    begin
        begin
            BusUnit.SetFilter(BusUnit.Code, BusUnitFilter);
            if BusUnit.FindFirst() then
                exit(BusUnit.Code);

            exit('');
        end;
    end;
}
