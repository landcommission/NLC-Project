#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193918 "Budget Workplan"
{
    Caption = 'Budget';
    DataCaptionExpression = BudgetName;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = ListPlus;
    SaveValues = true;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(PeriodType; PeriodType)
                {
                    ApplicationArea = Basic;
                    Caption = 'View by';
                    Enabled = PeriodTypeEnable;
                    OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';
                    ToolTip = 'Specifies the value of the View by field.';
                    trigger OnValidate()
                    begin
                        FindPeriod('');
                        PeriodTypeOnAfterValidate();
                    end;
                }
            }
            part(MatrixForm; "Tender Plan Lines") { }
            group(Filters)
            {
                Caption = 'Filters';
                field(DateFilter; DateFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the value of the Date Filter field.';
                    trigger OnValidate()
                    var
                        ApplicationManagement: Codeunit "Filter Tokens";
                    begin
                        ApplicationManagement.MakeDateFilter(DateFilter);
                        GLAccBudgetBuf.SetFilter("Date Filter", DateFilter);
                        DateFilter := GLAccBudgetBuf.GetFilter("Date Filter");
                        InternalDateFilter := DateFilter;
                        DateFilterOnAfterValidate();
                    end;
                }
                field(GLAccFilter; GLAccFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Account Filter';
                    ToolTip = 'Specifies the value of the G/L Account Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        GLAccList: Page "Workplan Activities - Convert";
                    begin
                        GLAccList.LookupMode(true);
                        if not (GLAccList.RunModal() = Action::LookupOK) then
                            exit(false);

                        Text := GLAccList.GetSelectionFilter();
                        exit(true);
                    end;

                    trigger OnValidate()
                    begin
                        GLAccFilterOnAfterValidate();
                    end;
                }
                field(GlobalDim1Filter; GlobalDim1Filter)
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,3,1';
                    Caption = 'Global Dimension 1 Filter';
                    Enabled = GlobalDim1FilterEnable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(LookUpDimFilter(GLSetup."Global Dimension 1 Code", Text));
                    end;

                    trigger OnValidate()
                    begin
                        GlobalDim1FilterOnAfterValidat();
                    end;
                }
                field(GlobalDim2Filter; GlobalDim2Filter)
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,3,2';
                    Caption = 'Global Dimension 2 Filter';
                    Enabled = GlobalDim2FilterEnable;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(LookUpDimFilter(GLSetup."Global Dimension 2 Code", Text));
                    end;

                    trigger OnValidate()
                    begin
                        GlobalDim2FilterOnAfterValidat();
                    end;
                }
                field(BudgetDim1Filter; BudgetDim1Filter)
                {
                    ApplicationArea = Basic;
                    CaptionClass = GetCaptionClass(1);
                    Caption = 'Budget Dimension 1 Filter';
                    Enabled = BudgetDim1FilterEnable;
                    ToolTip = 'Specifies the value of the Budget Dimension 1 Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(LookUpDimFilter(GLBudgetName."Budget Dimension 1 Code", Text));
                    end;

                    trigger OnValidate()
                    begin
                        BudgetDim1FilterOnAfterValidat();
                    end;
                }
                field(BudgetDim2Filter; BudgetDim2Filter)
                {
                    ApplicationArea = Basic;
                    CaptionClass = GetCaptionClass(2);
                    Caption = 'Budget Dimension 2 Filter';
                    Enabled = BudgetDim2FilterEnable;
                    ToolTip = 'Specifies the value of the Budget Dimension 2 Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(LookUpDimFilter(GLBudgetName."Budget Dimension 2 Code", Text));
                    end;

                    trigger OnValidate()
                    begin
                        BudgetDim2FilterOnAfterValidat();
                    end;
                }
                field(BudgetDim3Filter; BudgetDim3Filter)
                {
                    ApplicationArea = Basic;
                    CaptionClass = GetCaptionClass(3);
                    Caption = 'Budget Dimension 3 Filter';
                    Enabled = BudgetDim3FilterEnable;
                    ToolTip = 'Specifies the value of the Budget Dimension 3 Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(LookUpDimFilter(GLBudgetName."Budget Dimension 3 Code", Text));
                    end;

                    trigger OnValidate()
                    begin
                        BudgetDim3FilterOnAfterValidat();
                    end;
                }
                field(BudgetDim4Filter; BudgetDim4Filter)
                {
                    ApplicationArea = Basic;
                    CaptionClass = GetCaptionClass(4);
                    Caption = 'Budget Dimension 4 Filter';
                    Enabled = BudgetDim4FilterEnable;
                    ToolTip = 'Specifies the value of the Budget Dimension 4 Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(LookUpDimFilter(GLBudgetName."Budget Dimension 4 Code", Text));
                    end;

                    trigger OnValidate()
                    begin
                        BudgetDim4FilterOnAfterValidat();
                    end;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Balance")
            {
                Caption = '&Balance';
                Image = Balance;
                action("Page G/L Balance/Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Balance/B&udget';
                    Image = ChartOfAccounts;
                    ToolTip = 'Executes the G/L Balance/B&udget action.';
                    trigger OnAction()
                    var
                        GLAccount: Record "G/L Account";
                    begin
                        GLAccount.SetFilter("Budget Filter", BudgetName);
                        Page.Run(Page::"G/L Balance/Budget", GLAccount);
                    end;
                }
            }
        }
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Copy Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Budget';
                    Ellipsis = true;
                    Image = CopyBudget;
                    RunObject = report "Copy G/L Budget";
                    Visible = false;
                    ToolTip = 'Executes the Copy Budget action.';
                }
                action("Delete Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Delete Budget';
                    Image = Delete;
                    ToolTip = 'Executes the Delete Budget action.';
                    trigger OnAction()
                    begin
                        DeleteBudget();
                    end;
                }
                separator(Action1102601004)
                {
                    Caption = '';
                }
                action("Export to Excel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Export to Excel';
                    Ellipsis = true;
                    Image = ExportToExcel;
                    ToolTip = 'Executes the Export to Excel action.';

                }
                action("Import from Excel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import from Excel';
                    Ellipsis = true;
                    Image = ImportExcel;
                    ToolTip = 'Executes the Import from Excel action.';

                }
                action(CreateBudget)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Budget';
                    Image = CreateLedgerBudget;
                    ToolTip = 'Executes the Create Budget action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        BudgetaryControl: Record "Budgetary Control Setup";
                    begin
                        //IF CONFIRM('Create Budget?',FALSE) = FALSE THEN EXIT;
                        //Check if the budget is blocked or not
                        GLBudgetName.TestField(Blocked, false);

                        //Added to load auto form
                        if BudgetaryControl.Get() then begin
                            BudgetaryControl.TestField("Current Item Budget");
                            BudgetaryControl.TestField("Current Budget Code");

                            WPBudgetAlloc.Reset();
                            LineNo := 0;
                            if WPBudgetAlloc.Find('+') then
                                LineNo := WPBudgetAlloc."Line No.";
                            LineNo := LineNo + 1;

                            WPBudgetAlloc.Init();
                            WPBudgetAlloc."Line No." := LineNo;
                            WPBudgetAlloc.Name := BudgetName;
                            WPBudgetAlloc."Analysis Area" := WPBudgetAlloc."Analysis Area"::"Item and G/L Account";
                            WPBudgetAlloc."Period Type" := WPBudgetAlloc."Period Type"::Monthly;
                            WPBudgetAlloc."Current G/L Budget" := BudgetaryControl."Current Budget Code";
                            WPBudgetAlloc."Current Item Budget" := BudgetaryControl."Current Item Budget";
                            WPBudgetAlloc.Insert();

                            Page.Run(Page::"Workplan Budget Creation", WPBudgetAlloc);
                        end else
                            Error('Please setup Budgetary Control Setup');
                    end;
                }
                separator(Action1102601007) { }
                action("Reverse Lines and Columns")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reverse Lines and Columns';
                    Image = Undo;
                    ToolTip = 'Executes the Reverse Lines and Columns action.';
                    trigger OnAction()
                    var
                        TempDimCode: Text[30];
                    begin
                        TempDimCode := ColumnDimCode;
                        ColumnDimCode := LineDimCode;
                        LineDimCode := TempDimCode;
                        ValidateLineDimCode();
                        ValidateColumnDimCode();

                        MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
                        UpdateMatrixSubform();
                    end;
                }
            }
            action("Next Period")
            {
                ApplicationArea = Basic;
                Caption = 'Next Period';
                Image = NextRecord;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Next Period action.';
                trigger OnAction()
                begin
                    if (LineDimOption = LineDimOption::Period) or (ColumnDimOption = ColumnDimOption::Period) then
                        exit;
                    FindPeriod('>');
                    CurrPage.Update();
                    UpdateMatrixSubform();
                end;
            }
            action("Previous Period")
            {
                ApplicationArea = Basic;
                Caption = 'Previous Period';
                Image = PreviousRecord;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Previous Period action.';
                trigger OnAction()
                begin
                    if (LineDimOption = LineDimOption::Period) or (ColumnDimOption = ColumnDimOption::Period) then
                        exit;
                    FindPeriod('<');
                    CurrPage.Update();
                    UpdateMatrixSubform();
                end;
            }
            action("Previous Set")
            {
                ApplicationArea = Basic;
                Caption = 'Previous Set';
                Image = PreviousSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Previous Set';

                trigger OnAction()
                begin
                    MATRIX_GenerateColumnCaptions(MATRIX_Step::Previous);
                    UpdateMatrixSubform();
                end;
            }
            action("Previous Column")
            {
                ApplicationArea = Basic;
                Caption = 'Previous Column';
                Image = PreviousRecord;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Previous Column action.';
                trigger OnAction()
                begin
                    MATRIX_GenerateColumnCaptions(MATRIX_Step::PreviousColumn);
                    UpdateMatrixSubform();
                end;
            }
            action("Next Column")
            {
                ApplicationArea = Basic;
                Caption = 'Next Column';
                Image = NextRecord;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Next Column action.';
                trigger OnAction()
                begin
                    MATRIX_GenerateColumnCaptions(MATRIX_Step::NextColumn);
                    UpdateMatrixSubform();
                end;
            }
            action("Next Set")
            {
                ApplicationArea = Basic;
                Caption = 'Next Set';
                Image = NextSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Next Set';

                trigger OnAction()
                begin
                    MATRIX_GenerateColumnCaptions(MATRIX_Step::Next);
                    UpdateMatrixSubform();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        BudgetDim4FilterEnable := true;
        BudgetDim3FilterEnable := true;
        BudgetDim2FilterEnable := true;
        BudgetDim1FilterEnable := true;
        PeriodTypeEnable := true;
        GlobalDim2FilterEnable := true;
        GlobalDim1FilterEnable := true;
    end;

    trigger OnOpenPage()
    var
        GLAcc: Record "Workplan Dimension";
        MATRIX_Step: Option First,Previous,Same,Next;
    begin
        if GLAccBudgetBuf.GetFilter("Global Dimension 1 Filter") <> '' then
            GlobalDim1Filter := GLAccBudgetBuf.GetFilter("Global Dimension 1 Filter");
        if GLAccBudgetBuf.GetFilter("Global Dimension 2 Filter") <> '' then
            GlobalDim2Filter := GLAccBudgetBuf.GetFilter("Global Dimension 2 Filter");

        GLSetup.Get();

        GlobalDim1FilterEnable :=
          (GLSetup."Global Dimension 1 Code" <> '') and
          (GLAccBudgetBuf.GetFilter("Global Dimension 1 Filter") = '');
        GlobalDim2FilterEnable :=
          (GLSetup."Global Dimension 2 Code" <> '') and
          (GLAccBudgetBuf.GetFilter("Global Dimension 2 Filter") = '');

        ValidateBudgetName();
        LineDimCode := '';
        if LineDimCode = '' then
            LineDimCode := GLAcc.TableCaption;
        if ColumnDimCode = '' then
            ColumnDimCode := Text001;

        LineDimOption := DimCodeToOption(LineDimCode);
        ColumnDimOption := DimCodeToOption(ColumnDimCode);

        if (NewBudgetName <> '') and (NewBudgetName <> BudgetName) then begin
            BudgetName := NewBudgetName;
            ValidateBudgetName();
            ValidateLineDimCode();
            ValidateColumnDimCode();
        end;

        FindPeriod('');
        MATRIX_GenerateColumnCaptions(MATRIX_Step::First);

        UpdateMatrixSubform();
    end;

    var
        GLSetup: Record "General Ledger Setup";
        GLAccBudgetBuf: Record "Workplan Budget Buffer";
        GLBudgetName: Record Workplan;
        PrevGLBudgetName: Record Workplan;
        MATRIX_MatrixRecords: array[12] of Record "Dimension Code Buffer";
        MATRIX_CaptionSet: array[32] of Text[80];
        MATRIX_CaptionRange: Text[80];
        FirstColumn: Text[80];
        LastColumn: Text[80];
        MATRIX_PrimKeyFirstCaptionInCu: Text[80];
        MATRIX_CurrentNoOfColumns: Integer;
        Text001: Label 'Period';
        Text003: Label 'Do you want to delete the budget entries shown?';
        Text004: Label 'DEFAULT';
        Text005: Label 'Default budget';
        Text006: Label '%1 is not a valid line definition.';
        Text007: Label '%1 is not a valid column definition.';
        Text008: Label '1,6,,Budget Dimension 1 Filter';
        Text009: Label '1,6,,Budget Dimension 2 Filter';
        Text010: Label '1,6,,Budget Dimension 3 Filter';
        Text011: Label '1,6,,Budget Dimension 4 Filter';
        MATRIX_Step: Option First,Previous,Same,Next,PreviousColumn,NextColumn;
        BudgetName: Code[10];
        NewBudgetName: Code[10];
        LineDimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4",Workplan;
        ColumnDimOption: Option "G/L Account",Period,"Business Unit","Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4",Workplan;
        LineDimCode: Text[30];
        ColumnDimCode: Text[30];
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        RoundingFactor: Option None,"1","1000","1000000";
        ShowColumnName: Boolean;
        DateFilter: Text[30];
        InternalDateFilter: Text[30];
        BusUnitFilter: Code[250];
        GLAccFilter: Code[250];
        GlobalDim1Filter: Code[250];
        GlobalDim2Filter: Code[250];
        BudgetDim1Filter: Code[250];
        BudgetDim2Filter: Code[250];
        BudgetDim3Filter: Code[250];
        BudgetDim4Filter: Code[250];
        [InDataSet]
        GlobalDim1FilterEnable: Boolean;
        [InDataSet]
        GlobalDim2FilterEnable: Boolean;
        [InDataSet]
        PeriodTypeEnable: Boolean;
        [InDataSet]
        BudgetDim1FilterEnable: Boolean;
        [InDataSet]
        BudgetDim2FilterEnable: Boolean;
        [InDataSet]
        BudgetDim3FilterEnable: Boolean;
        [InDataSet]
        BudgetDim4FilterEnable: Boolean;
        WPBudgetAlloc: Record "Workplan Budget Allocation";
        LineNo: Integer;


    procedure MATRIX_GenerateColumnCaptions(MATRIX_SetWanted: Option First,Previous,Same,Next,PreviousColumn,NextColumn)
    var
        MATRIX_PeriodRecords: array[32] of Record Date;
        BusUnit: Record "Business Unit";
        GLAccount: Record "Workplan Activities";
        MatrixMgt: Codeunit "Matrix Management";
        RecRef: RecordRef;
        FieldRef: FieldRef;
        CurrentMatrixRecordOrdinal: Integer;
        i: Integer;
    begin
        /*{
        CLEAR(MATRIX_CaptionSet);
        CurrentMatrixRecordOrdinal := 1;
        CLEAR(MATRIX_MatrixRecords);
        FirstColumn := '';
        LastColumn := '';
        MATRIX_CurrentNoOfColumns := 12;

        IF ColumnDimCode = '' THEN
          EXIT;

        CASE ColumnDimCode OF
          Text001:  // Period
            BEGIN
              MatrixMgt.GeneratePeriodMatrixData(
                MATRIX_SetWanted,MATRIX_CurrentNoOfColumns,ShowColumnName,
                PeriodType,DateFilter,MATRIX_PrimKeyFirstCaptionInCu,
                MATRIX_CaptionSet,MATRIX_CaptionRange,MATRIX_CurrentNoOfColumns,MATRIX_PeriodRecords);
              FOR i := 1 TO MATRIX_CurrentNoOfColumns DO BEGIN
                MATRIX_MatrixRecords[i]."Period Start" := MATRIX_PeriodRecords[i]."Period Start";
                MATRIX_MatrixRecords[i]."Period End" := MATRIX_PeriodRecords[i]."Period End";
              END;
              FirstColumn := FORMAT(MATRIX_PeriodRecords[1]."Period Start");
              LastColumn := FORMAT(MATRIX_PeriodRecords[MATRIX_CurrentNoOfColumns]."Period End");
              PeriodTypeEnable := TRUE;
            END;
          GLAccount.TABLECAPTION:
            BEGIN
              CLEAR(MATRIX_CaptionSet);
              RecRef.GETTABLE(GLAccount);
              RecRef.SETTABLE(GLAccount);
              IF GLAccFilter <> '' THEN BEGIN
                FieldRef := RecRef.FIELDINDEX(1);
                FieldRef.SETFILTER(GLAccFilter);
              END;
              MatrixMgt.GenerateMatrixData(
                RecRef,MATRIX_SetWanted,12,1,
                MATRIX_PrimKeyFirstCaptionInCu,MATRIX_CaptionSet,MATRIX_CaptionRange,MATRIX_CurrentNoOfColumns);
              FOR i := 1 TO MATRIX_CurrentNoOfColumns DO
                MATRIX_MatrixRecords[i].Code := COPYSTR(MATRIX_CaptionSet[i],1,MAXSTRLEN(MATRIX_MatrixRecords[i].Code));
              IF ShowColumnName THEN
                MatrixMgt.GenerateMatrixData(
                  RecRef,MATRIX_SetWanted::Same,12,GLAccount.FIELDNO("Activity Code"),
                  MATRIX_PrimKeyFirstCaptionInCu,MATRIX_CaptionSet,MATRIX_CaptionRange,MATRIX_CurrentNoOfColumns);
            END;


          BusUnit.TABLECAPTION:
            BEGIN
              CLEAR(MATRIX_CaptionSet);
              RecRef.GETTABLE(BusUnit);
              RecRef.SETTABLE(BusUnit);
              IF BusUnitFilter <> '' THEN BEGIN
                FieldRef := RecRef.FIELDINDEX(1);
                FieldRef.SETFILTER(BusUnitFilter);
              END;
              MatrixMgt.GenerateMatrixData(
                RecRef,MATRIX_SetWanted,12,1,
                MATRIX_PrimKeyFirstCaptionInCu,MATRIX_CaptionSet,MATRIX_CaptionRange,MATRIX_CurrentNoOfColumns);
              FOR i := 1 TO MATRIX_CurrentNoOfColumns DO
                MATRIX_MatrixRecords[i].Code := MATRIX_CaptionSet[i];
              IF ShowColumnName THEN
                MatrixMgt.GenerateMatrixData(
                  RecRef,MATRIX_SetWanted::Same,12,BusUnit.FIELDNO(Name),
                  MATRIX_PrimKeyFirstCaptionInCu,MATRIX_CaptionSet,MATRIX_CaptionRange,MATRIX_CurrentNoOfColumns);
            END;
          GLSetup."Global Dimension 1 Code":
            BEGIN
              MatrixMgt.SetDimColumnSet(
                GLSetup."Global Dimension 1 Code",
                GlobalDim1Filter,MATRIX_SetWanted,MATRIX_PrimKeyFirstCaptionInCu,FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns);
              MatrixMgt.DimToCaptions(
                MATRIX_CaptionSet,MATRIX_MatrixRecords,ColumnDimCode,
                FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns,ShowColumnName,MATRIX_CaptionRange,FALSE);
            END;
          GLSetup."Global Dimension 2 Code":
            BEGIN
              MatrixMgt.SetDimColumnSet(
                GLSetup."Global Dimension 2 Code",
                GlobalDim2Filter,MATRIX_SetWanted,MATRIX_PrimKeyFirstCaptionInCu,FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns);
              MatrixMgt.DimToCaptions(
                MATRIX_CaptionSet,MATRIX_MatrixRecords,ColumnDimCode,
                FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns,ShowColumnName,MATRIX_CaptionRange,FALSE);
            END;
          GLBudgetName."Budget Dimension 1 Code":
            BEGIN
              MatrixMgt.SetDimColumnSet(
                GLBudgetName."Budget Dimension 1 Code",
                BudgetDim1Filter,MATRIX_SetWanted,MATRIX_PrimKeyFirstCaptionInCu,FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns);
              MatrixMgt.DimToCaptions(
                MATRIX_CaptionSet,MATRIX_MatrixRecords,ColumnDimCode,
                FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns,ShowColumnName,MATRIX_CaptionRange,FALSE);
            END;
          GLBudgetName."Budget Dimension 2 Code":
            BEGIN
              MatrixMgt.SetDimColumnSet(
                GLBudgetName."Budget Dimension 2 Code",
                BudgetDim2Filter,MATRIX_SetWanted,MATRIX_PrimKeyFirstCaptionInCu,FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns);
              MatrixMgt.DimToCaptions(
                MATRIX_CaptionSet,MATRIX_MatrixRecords,ColumnDimCode,
                FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns,ShowColumnName,MATRIX_CaptionRange,FALSE);
            END;
          GLBudgetName."Budget Dimension 3 Code":
            BEGIN
              MatrixMgt.SetDimColumnSet(
                GLBudgetName."Budget Dimension 3 Code",
                BudgetDim3Filter,MATRIX_SetWanted,MATRIX_PrimKeyFirstCaptionInCu,FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns);
              MatrixMgt.DimToCaptions(
                MATRIX_CaptionSet,MATRIX_MatrixRecords,ColumnDimCode,
                FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns,ShowColumnName,MATRIX_CaptionRange,FALSE);
            END;
          GLBudgetName."Budget Dimension 4 Code":
            BEGIN
              MatrixMgt.SetDimColumnSet(
                GLBudgetName."Budget Dimension 4 Code",
                BudgetDim4Filter,MATRIX_SetWanted,MATRIX_PrimKeyFirstCaptionInCu,FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns);
              MatrixMgt.DimToCaptions(
                MATRIX_CaptionSet,MATRIX_MatrixRecords,ColumnDimCode,
                FirstColumn,LastColumn,MATRIX_CurrentNoOfColumns,ShowColumnName,MATRIX_CaptionRange,FALSE);
            END;
        END;
        }*/

    end;

    local procedure DimCodeToOption(DimCode: Text[30]): Integer
    var
        BusUnit: Record "Business Unit";
        GLAcc: Record "Workplan Activities";
    begin
        case DimCode of
            '':
                exit(-1);
            GLAcc.TableCaption:
                exit(9);
            Text001:
                exit(1);
            BusUnit.TableCaption:
                exit(2);
            GLSetup."Global Dimension 1 Code":
                exit(3);
            GLSetup."Global Dimension 2 Code":
                exit(4);
            GLBudgetName."Budget Dimension 1 Code":
                exit(5);
            GLBudgetName."Budget Dimension 2 Code":
                exit(6);
            GLBudgetName."Budget Dimension 3 Code":
                exit(7);
            GLBudgetName."Budget Dimension 4 Code":
                exit(8);
            else
                exit(-1);
        end;
    end;

    local procedure FindPeriod(SearchText: Code[10])
    var
        GLAcc: Record "Workplan Activities";
        Calendar: Record Date;
        PeriodFormMgt: Codeunit PeriodFormManagement;
    begin
        if DateFilter <> '' then begin
            Calendar.SetFilter("Period Start", DateFilter);
            if not PeriodFormMgt.FindDate('+', Calendar, PeriodType) then
                PeriodFormMgt.FindDate('+', Calendar, PeriodType::Day);
            Calendar.SetRange("Period Start");
        end;
        PeriodFormMgt.FindDate(SearchText, Calendar, PeriodType);
        GLAcc.SetRange("Date Filter", Calendar."Period Start", Calendar."Period End");
        if GLAcc.GetRangeMin("Date Filter") = GLAcc.GetRangeMax("Date Filter") then
            GLAcc.SetRange("Date Filter", GLAcc.GetRangeMin("Date Filter"));
        InternalDateFilter := GLAcc.GetFilter("Date Filter");
        if (LineDimOption <> LineDimOption::Period) and (ColumnDimOption <> ColumnDimOption::Period) then
            DateFilter := InternalDateFilter;
    end;

    local procedure GetDimSelection(OldDimSelCode: Text[30]): Text[30]
    var
        GLAcc: Record "Workplan Dimension";
        BusUnit: Record "Business Unit";
        DimSelection: Page "Dimension Selection";
    begin
        DimSelection.InsertDimSelBuf(false, GLAcc.TableCaption, GLAcc.TableCaption);
        DimSelection.InsertDimSelBuf(false, BusUnit.TableCaption, BusUnit.TableCaption);
        DimSelection.InsertDimSelBuf(false, Text001, Text001);
        if GLSetup."Global Dimension 1 Code" <> '' then
            DimSelection.InsertDimSelBuf(false, GLSetup."Global Dimension 1 Code", '');
        if GLSetup."Global Dimension 2 Code" <> '' then
            DimSelection.InsertDimSelBuf(false, GLSetup."Global Dimension 2 Code", '');
        if GLBudgetName."Budget Dimension 1 Code" <> '' then
            DimSelection.InsertDimSelBuf(false, GLBudgetName."Budget Dimension 1 Code", '');
        if GLBudgetName."Budget Dimension 2 Code" <> '' then
            DimSelection.InsertDimSelBuf(false, GLBudgetName."Budget Dimension 2 Code", '');
        if GLBudgetName."Budget Dimension 3 Code" <> '' then
            DimSelection.InsertDimSelBuf(false, GLBudgetName."Budget Dimension 3 Code", '');
        if GLBudgetName."Budget Dimension 4 Code" <> '' then
            DimSelection.InsertDimSelBuf(false, GLBudgetName."Budget Dimension 4 Code", '');

        DimSelection.LookupMode := true;
        if DimSelection.RunModal() = Action::LookupOK then
            exit(DimSelection.GetDimSelCode());

        exit(OldDimSelCode);
    end;

    local procedure LookUpDimFilter(Dim: Code[20]; var Text: Text[250]): Boolean
    var
        DimVal: Record "Dimension Value";
        DimValList: Page "Dimension Value List";
    begin
        if Dim = '' then
            exit(false);
        DimValList.LookupMode(true);
        DimVal.SetRange("Dimension Code", Dim);
        DimValList.SetTableView(DimVal);
        if DimValList.RunModal() = Action::LookupOK then begin
            DimValList.GetRecord(DimVal);
            Text := DimValList.GetSelectionFilter();
        end;
        exit(true);
    end;

    local procedure DeleteBudget()
    var
        GLBudgetEntry: Record "Workplan Budget Name";
        UpdateAnalysisView: Codeunit "Update Analysis View";
    begin
        /*{
        IF CONFIRM(Text003) THEN
          WITH GLBudgetEntry DO BEGIN

            SETRANGE("Workplan Code",BudgetName);
            IF BusUnitFilter <> '' THEN
              SETFILTER("Business Unit Code",BusUnitFilter);
            IF GLAccFilter <> '' THEN
              SETFILTER("G/L Account No.",GLAccFilter);
            IF DateFilter <> '' THEN
              SETFILTER(Date,DateFilter);
            IF GlobalDim1Filter <> '' THEN
              SETFILTER("Global Dimension 1 Code",GlobalDim1Filter);
            IF GlobalDim2Filter <> '' THEN
              SETFILTER("Global Dimension 2 Code",GlobalDim2Filter);
            IF BudgetDim1Filter <> '' THEN
              SETFILTER("Budget Dimension 1 Code",BudgetDim1Filter);
            IF BudgetDim2Filter <> '' THEN
              SETFILTER("Budget Dimension 2 Code",BudgetDim2Filter);
            IF BudgetDim3Filter <> '' THEN
              SETFILTER("Budget Dimension 3 Code",BudgetDim3Filter);
            IF BudgetDim4Filter <> '' THEN
              SETFILTER("Budget Dimension 4 Code",BudgetDim4Filter);
            SETCURRENTKEY("Entry No.");
            IF FINDFIRST THEN
              UpdateAnalysisView.SetLastBudgetEntryNo("Entry No." - 1);
            SETCURRENTKEY("Workplan Code");
            DELETEALL(TRUE);
          END;
          }*/

    end;

    local procedure ValidateBudgetName()
    begin
        GLBudgetName."Workplan Code" := BudgetName;
        if not GLBudgetName.Find('=<>') then begin
            GLBudgetName.Init();
            GLBudgetName."Workplan Code" := Text004;
            GLBudgetName."Workplan Description" := Text005;
            GLBudgetName.Insert();
        end;
        BudgetName := GLBudgetName."Workplan Code";
        GLAccBudgetBuf.SetRange("Budget Filter", BudgetName);
        if PrevGLBudgetName."Workplan Code" <> '' then begin
            if GLBudgetName."Budget Dimension 1 Code" <> PrevGLBudgetName."Budget Dimension 1 Code" then
                BudgetDim1Filter := '';
            if GLBudgetName."Budget Dimension 2 Code" <> PrevGLBudgetName."Budget Dimension 2 Code" then
                BudgetDim2Filter := '';
            if GLBudgetName."Budget Dimension 3 Code" <> PrevGLBudgetName."Budget Dimension 3 Code" then
                BudgetDim3Filter := '';
            if GLBudgetName."Budget Dimension 4 Code" <> PrevGLBudgetName."Budget Dimension 4 Code" then
                BudgetDim4Filter := '';
        end;
        GLAccBudgetBuf.SetFilter("Budget Dimension 1 Filter", BudgetDim1Filter);
        GLAccBudgetBuf.SetFilter("Budget Dimension 2 Filter", BudgetDim2Filter);
        GLAccBudgetBuf.SetFilter("Budget Dimension 3 Filter", BudgetDim3Filter);
        GLAccBudgetBuf.SetFilter("Budget Dimension 4 Filter", BudgetDim4Filter);
        BudgetDim1FilterEnable := (GLBudgetName."Budget Dimension 1 Code" <> '');
        BudgetDim2FilterEnable := (GLBudgetName."Budget Dimension 2 Code" <> '');
        BudgetDim3FilterEnable := (GLBudgetName."Budget Dimension 3 Code" <> '');
        BudgetDim4FilterEnable := (GLBudgetName."Budget Dimension 4 Code" <> '');

        PrevGLBudgetName := GLBudgetName;
    end;

    local procedure ValidateLineDimCode()
    var
        BusUnit: Record "Business Unit";
        GLAcc: Record "Workplan Dimension";
    begin
        if (UpperCase(LineDimCode) <> UpperCase(GLAcc.TableCaption)) and
           (UpperCase(LineDimCode) <> UpperCase(BusUnit.TableCaption)) and
           (UpperCase(LineDimCode) <> UpperCase(Text001)) and
           (UpperCase(LineDimCode) <> GLBudgetName."Budget Dimension 1 Code") and
           (UpperCase(LineDimCode) <> GLBudgetName."Budget Dimension 2 Code") and
           (UpperCase(LineDimCode) <> GLBudgetName."Budget Dimension 3 Code") and
           (UpperCase(LineDimCode) <> GLBudgetName."Budget Dimension 4 Code") and
           (UpperCase(LineDimCode) <> GLSetup."Global Dimension 1 Code") and
           (UpperCase(LineDimCode) <> GLSetup."Global Dimension 2 Code") and
           (LineDimCode <> '')
        then begin
            Message(Text006, LineDimCode);
            LineDimCode := '';
        end;
        LineDimOption := DimCodeToOption(LineDimCode);
        DateFilter := InternalDateFilter;
        if (LineDimOption <> LineDimOption::Period) and (ColumnDimOption <> ColumnDimOption::Period) then begin
            DateFilter := InternalDateFilter;
            if StrPos(DateFilter, '&') > 1 then
                DateFilter := CopyStr(DateFilter, 1, StrPos(DateFilter, '&') - 1);
        end else
            DateFilter := '';
    end;

    local procedure ValidateColumnDimCode()
    var
        BusUnit: Record "Business Unit";
        GLAcc: Record "Workplan Dimension";
    begin
        if (UpperCase(ColumnDimCode) <> UpperCase(GLAcc.TableCaption)) and
           (UpperCase(ColumnDimCode) <> UpperCase(BusUnit.TableCaption)) and
           (UpperCase(ColumnDimCode) <> UpperCase(Text001)) and
           (UpperCase(ColumnDimCode) <> GLBudgetName."Budget Dimension 1 Code") and
           (UpperCase(ColumnDimCode) <> GLBudgetName."Budget Dimension 2 Code") and
           (UpperCase(ColumnDimCode) <> GLBudgetName."Budget Dimension 3 Code") and
           (UpperCase(ColumnDimCode) <> GLBudgetName."Budget Dimension 4 Code") and
           (UpperCase(ColumnDimCode) <> GLSetup."Global Dimension 1 Code") and
           (UpperCase(ColumnDimCode) <> GLSetup."Global Dimension 2 Code") and
           (ColumnDimCode <> '')
        then begin
            Message(Text007, ColumnDimCode);
            ColumnDimCode := '';
        end;
        ColumnDimOption := DimCodeToOption(ColumnDimCode);
        DateFilter := InternalDateFilter;
        if (LineDimOption <> LineDimOption::Period) and (ColumnDimOption <> ColumnDimOption::Period) then begin
            DateFilter := InternalDateFilter;
            if StrPos(DateFilter, '&') > 1 then
                DateFilter := CopyStr(DateFilter, 1, StrPos(DateFilter, '&') - 1);
        end else
            DateFilter := '';
    end;

    local procedure GetCaptionClass(BudgetDimType: Integer): Text[250]
    begin
        if GLBudgetName."Workplan Code" <> BudgetName then
            GLBudgetName.Get(BudgetName);
        case BudgetDimType of
            1:
                begin
                    if GLBudgetName."Budget Dimension 1 Code" <> '' then
                        exit('1,6,' + GLBudgetName."Budget Dimension 1 Code");

                    exit(Text008);
                end;
            2:
                begin
                    if GLBudgetName."Budget Dimension 2 Code" <> '' then
                        exit('1,6,' + GLBudgetName."Budget Dimension 2 Code");

                    exit(Text009);
                end;
            3:
                begin
                    if GLBudgetName."Budget Dimension 3 Code" <> '' then
                        exit('1,6,' + GLBudgetName."Budget Dimension 3 Code");

                    exit(Text010);
                end;
            4:
                begin
                    if GLBudgetName."Budget Dimension 4 Code" <> '' then
                        exit('1,6,' + GLBudgetName."Budget Dimension 4 Code");

                    exit(Text011);
                end;
        end;
    end;


    procedure SetBudgetName(NextBudgetName: Code[10])
    begin
        NewBudgetName := NextBudgetName;
    end;


    procedure UpdateMatrixSubform()
    begin
        /*{
        CurrPage.MatrixForm.PAGE.Load(
          MATRIX_CaptionSet,MATRIX_MatrixRecords,MATRIX_CurrentNoOfColumns,LineDimCode,
          LineDimOption,ColumnDimOption,GlobalDim1Filter,GlobalDim2Filter,BudgetDim1Filter,
          BudgetDim2Filter,BudgetDim3Filter,BudgetDim4Filter,GLBudgetName,DateFilter,
          GLAccFilter,RoundingFactor,PeriodType);

        CurrPage.UPDATE;
          }*/

    end;


    procedure SetGLAccountFilter(NewGLAccFilter: Code[250])
    begin
        GLAccFilter := NewGLAccFilter;
        GLAccFilterOnAfterValidate();
    end;

    local procedure LineDimCodeOnAfterValidate()
    begin
        UpdateMatrixSubform();
    end;

    local procedure ColumnDimCodeOnAfterValidate()
    begin
        UpdateMatrixSubform();
    end;

    local procedure PeriodTypeOnAfterValidate()
    var
        MATRIX_Step: Option First,Previous,Same,Next;
    begin
        if ColumnDimOption = ColumnDimOption::Period then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure GLAccFilterOnAfterValidate()
    begin
        GLAccBudgetBuf.SetFilter("G/L Account Filter", GLAccFilter);
        if ColumnDimOption = ColumnDimOption::"G/L Account" then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure GlobalDim2FilterOnAfterValidat()
    begin
        GLAccBudgetBuf.SetFilter("Global Dimension 2 Filter", GlobalDim2Filter);
        if ColumnDimOption = ColumnDimOption::"Global Dimension 2" then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure GlobalDim1FilterOnAfterValidat()
    begin
        GLAccBudgetBuf.SetFilter("Global Dimension 1 Filter", GlobalDim1Filter);
        if ColumnDimOption = ColumnDimOption::"Global Dimension 1" then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure BudgetDim2FilterOnAfterValidat()
    begin
        GLAccBudgetBuf.SetFilter("Budget Dimension 2 Filter", BudgetDim2Filter);
        if ColumnDimOption = ColumnDimOption::"Budget Dimension 2" then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure BudgetDim1FilterOnAfterValidat()
    begin
        GLAccBudgetBuf.SetFilter("Budget Dimension 1 Filter", BudgetDim1Filter);
        if ColumnDimOption = ColumnDimOption::"Budget Dimension 1" then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure BudgetDim4FilterOnAfterValidat()
    begin
        GLAccBudgetBuf.SetFilter("Budget Dimension 4 Filter", BudgetDim4Filter);
        if ColumnDimOption = ColumnDimOption::"Budget Dimension 4" then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure BudgetDim3FilterOnAfterValidat()
    begin
        GLAccBudgetBuf.SetFilter("Budget Dimension 3 Filter", BudgetDim3Filter);
        if ColumnDimOption = ColumnDimOption::"Budget Dimension 3" then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure DateFilterOnAfterValidate()
    begin
        if ColumnDimOption = ColumnDimOption::Period then
            MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform();
    end;

    local procedure ShowColumnNameOnPush()
    var
        MATRIX_Step: Option First,Previous,Same,Next;
    begin
        MATRIX_GenerateColumnCaptions(MATRIX_Step::Same);
        UpdateMatrixSubform();
    end;
}
