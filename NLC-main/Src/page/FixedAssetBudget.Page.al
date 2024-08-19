#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193684 "Fixed Asset Budget"
{
    Caption = 'Fixed Asset Budget';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPlus;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(BudgetName; BudgetName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Name';
                    TableRelation = "G/L Budget Name".Name;
                    ToolTip = 'Specifies the value of the Budget Name field.';
                    trigger OnValidate()
                    begin
                        SetMatrix();
                    end;
                }
                field(PeriodType; PeriodType)
                {
                    ApplicationArea = Basic;
                    Caption = 'View by';
                    OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';
                    ToolTip = 'Specifies the value of the View by field.';
                    trigger OnValidate()
                    begin
                        SetColumns(SetWanted::First);
                    end;
                }
                field(QtyType; QtyType)
                {
                    ApplicationArea = Basic;
                    Caption = 'View as';
                    OptionCaption = 'Net Change,Balance at Date';
                    ToolTip = 'Specifies the value of the View as field.';
                    trigger OnValidate()
                    begin
                        QtyTypeOnAfterValidate();
                    end;
                }
                field(ForecastType; ForecastType)
                {
                    ApplicationArea = Basic;
                    Caption = 'Forecast Type';
                    OptionCaption = 'Sales Item,Component,Both';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Forecast Type field.';
                    trigger OnValidate()
                    begin
                        ForecastTypeOnAfterValidate();
                    end;
                }
                field(DateFilter; DateFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the value of the Date Filter field.';
                    trigger OnValidate()
                    var
                        ApplicationManagement: Codeunit "Filter Tokens";
                        BuiltDateFilter: Text[1024];
                    begin
                        ApplicationManagement.MakeDateFilter(BuiltDateFilter);
                        DateFilter := BuiltDateFilter;
                        SetColumns(SetWanted::First);
                    end;
                }
                field(GlobalDim1Filter; GlobalDim1Filter)
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,3,1';
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the value of the Global Dimension 1 Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        GlSetup.Get();
                        exit(LookUpDimFilter(GlSetup."Global Dimension 1 Code", Text));
                    end;

                    trigger OnValidate()
                    begin
                        //GlobalDim1FilterOnAfterValidat;
                        SetMatrix();
                    end;
                }
                field(GlobalDim2Filter; GlobalDim2Filter)
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,3,2';
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the value of the Global Dimension 2 Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        GlSetup.Get();
                        exit(LookUpDimFilter(GlSetup."Global Dimension 2 Code", Text));
                    end;

                    trigger OnValidate()
                    begin
                        //GlobalDim2FilterOnAfterValidat;
                        SetMatrix();
                    end;
                }
                field(LocationFilter; LocationFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Location Filter';
                    ToolTip = 'Specifies the value of the Location Filter field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        LocList: Page "Location List";
                        Loc: Record Location;
                    begin
                        LocList.LookupMode(true);
                        Loc.SetRange("Use As In-Transit", false);
                        LocList.SetTableView(Loc);
                        if not (LocList.RunModal() = Action::LookupOK) then
                            exit(false);

                        Text := LocList.GetSelectionFilter();

                        exit(true);
                    end;

                    trigger OnValidate()
                    var
                        Location: Record Location;
                    begin
                        Location.SetFilter(Code, LocationFilter);
                        LocationFilter := Location.GetFilter(Code);
                        SetMatrix();
                    end;
                }
            }
            part(Matrix; "FA Budget Matrix") { }
        }
    }

    actions
    {
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Copy Production Forecast")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Production Forecast';
                    Ellipsis = true;
                    Image = CopyForecast;
                    RunObject = report "Copy Production Forecast";
                    ToolTip = 'Executes the Copy Production Forecast action.';
                }
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
                    SetColumns(SetWanted::Previous);
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
                    SetColumns(SetWanted::PreviousColumn);
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
                    SetColumns(SetWanted::NextColumn);
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
                    SetColumns(SetWanted::Next);
                end;
            }
            separator(Action2) { }
            action("Transfer To Budget")
            {
                ApplicationArea = Basic;
                Caption = 'Transfer To Budget';
                Image = CopyLedgerToBudget;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Transfer To Budget action.';
                trigger OnAction()
                var
                    FixedAssetsDet: Record "Fixed Asset";
                    FAPostingGRP: Record "FA Posting Group";
                    BudgetGl: Code[20];
                    FixedAssetsDep: Record "FA Depreciation Book";
                    FABudgetEntry: Record "FA Budget Entry";
                    BudgetEntry: Record "G/L Budget Entry";
                begin
                    if BudgetName <> '' then begin
                        FABudgetEntry.SetRange(FABudgetEntry."Budget Name", BudgetName);
                        FABudgetEntry.SetRange(FABudgetEntry."Transferred to budget", false);
                        if FABudgetEntry.FindSet() then
                            repeat
                                BudgetEntry.Init();
                                BudgetEntry."Entry No." := 0;
                                BudgetEntry."Budget Name" := FABudgetEntry."Budget Name";
                                BudgetEntry.Date := FABudgetEntry.Date;
                                FixedAssetsDet.Reset();
                                FixedAssetsDet.SetRange(FixedAssetsDet."No.", FABudgetEntry."FA No.");
                                FixedAssetsDet.FindSet();
                                begin
                                    FixedAssetsDep.Reset();
                                    FixedAssetsDep.SetRange(FixedAssetsDep."FA No.", FABudgetEntry."FA No.");
                                    FixedAssetsDep.FindSet();
                                    FAPostingGRP.Reset();
                                    FAPostingGRP.SetRange(FAPostingGRP.Code, FixedAssetsDep."FA Posting Group");
                                    FAPostingGRP.FindSet();
                                    if FABudgetEntry."FA Posting Type" = FABudgetEntry."FA Posting Type"::Maintenance then begin
                                        BudgetGl := FAPostingGRP."Maintenance Expense Account";
                                        if BudgetGl = '' then
                                            Error('Ensure Fixed Asset No %1 has the Maintenance G/L Account', FABudgetEntry."FA No.");
                                    end
                                    else
                                        if FABudgetEntry."FA Posting Type" = FABudgetEntry."FA Posting Type"::"Acquisition Cost" then begin
                                            BudgetGl := FAPostingGRP."Acquisition Cost Account";
                                            if BudgetGl = '' then
                                                Error('Ensure Fixed Asset No %1 has the Acquisition G/L Account', FABudgetEntry."FA No.");
                                        end
                                    /*   //To Accomodate any Additional Item under Custom 1 and Custom 2
                                    else if FABudgetEntry."FA Posting Type"=FABudgetEntry."fa posting type"::"3" then begin
                                        BudgetGl:=FAPostingGRP."Custom 2 Account";
                                           if BudgetGl ='' then
                                              Error('Ensure Fixed Asset No %1 has the %2 G/L Account',FABudgetEntry."FA No.",
                                             FAPostingGRP."Custom 1 Account");
                                    end

                                    else if FABudgetEntry."FA Posting Type"=FABudgetEntry."fa posting type"::"4" then begin
                                        BudgetGl:=FAPostingGRP."Custom 2 Account";
                                           if BudgetGl ='' then
                                              Error('Ensure Fixed Asset No %1 has the %2 G/L Account',FABudgetEntry."FA No.",
                                              FAPostingGRP."Custom 1 Account");
                                    end; */
                                end;

                                BudgetEntry."G/L Account No." := BudgetGl;
                                BudgetEntry.Amount := FABudgetEntry."Cost Amount";
                                BudgetEntry."Budget Dimension 1 Code" := FABudgetEntry."Budget Dimension 1 Code";
                                BudgetEntry."Budget Dimension 2 Code" := FABudgetEntry."Budget Dimension 2 Code";
                                BudgetEntry."Budget Dimension 3 Code" := FABudgetEntry."Budget Dimension 3 Code";
                                BudgetEntry."Global Dimension 1 Code" := FABudgetEntry."Global Dimension 1 Code";
                                BudgetEntry."Global Dimension 2 Code" := FABudgetEntry."Global Dimension 2 Code";
                                BudgetEntry."Dimension Set ID" := FABudgetEntry."Dimension Set ID";
                                BudgetEntry.Insert(true);

                                FABudgetEntry."Transferred to budget" := true;
                                FABudgetEntry.Modify();
                            until FABudgetEntry.Next() = 0;
                        Message('%1 Budget Lines successfully transferred to G/L budget', FABudgetEntry.Count);
                    end
                    else
                        Error('Please specify a budget');
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        BudgetaryControl: Record "Budgetary Control Setup";
    begin
        //IF (NewBudgetName <> '') AND (NewBudgetName <> BudgetName) THEN
        if BudgetaryControl.Get() then
            BudgetName := BudgetaryControl."Current Budget Code";
        SetColumns(SetWanted::First);
    end;

    var
        MatrixRecords: array[32] of Record Date;
        PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period";
        QtyType: Option "Net Change","Balance at Date";
        ForecastType: Option "Sales Item",Component,Both;
        BudgetName: Text[30];
        NewBudgetName: Text[30];
        LocationFilter: Text;
        DateFilter: Text;
        MatrixColumnCaptions: array[32] of Text[1024];
        ColumnSet: Text[1024];
        SetWanted: Option First,Previous,Same,Next,PreviousColumn,NextColumn;
        PKFirstRecInCurrSet: Text[100];
        CurrSetLength: Integer;
        GLAccFilter: Code[250];
        GlobalDim1Filter: Code[250];
        GlobalDim2Filter: Code[250];
        BudgetDim1Filter: Code[250];
        BudgetDim2Filter: Code[250];
        BudgetDim3Filter: Code[250];
        BudgetDim4Filter: Code[250];
        GlSetup: Record "General Ledger Setup";


    procedure SetColumns(SetWanted: Option Initial,Previous,Same,Next,PreviousSet,NextSet)
    var
        MatrixMgt: Codeunit "Matrix Management";
    begin
        MatrixMgt.GeneratePeriodMatrixData(SetWanted, ArrayLen(MatrixRecords), false, PeriodType, DateFilter, PKFirstRecInCurrSet,
          MatrixColumnCaptions, ColumnSet, CurrSetLength, MatrixRecords);
        SetMatrix();
    end;


    procedure SetProductionForecastName(NextProductionForecastName: Text[30])
    begin
        NewBudgetName := NextProductionForecastName;
    end;


    procedure SetMatrix()
    begin
        CurrPage.Matrix.Page.Load(
        //  MatrixColumnCaptions,MatrixRecords,BudgetName,DateFilter,LocationFilter,ForecastType,
          MatrixColumnCaptions, MatrixRecords, BudgetName, DateFilter, GlobalDim1Filter, GlobalDim2Filter,
          QtyType, CurrSetLength);
        CurrPage.Update(false);
    end;

    local procedure ForecastTypeOnAfterValidate()
    begin
        SetMatrix();
    end;

    local procedure QtyTypeOnAfterValidate()
    begin
        SetMatrix();
    end;

    local procedure GlobalDim2FilterOnAfterValidat()
    begin
        /*
        GLAccBudgetBuf.SETFILTER("Global Dimension 2 Filter",GlobalDim2Filter);
        IF ColumnDimOption = ColumnDimOption::"Global Dimension 2" THEN
          MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform;
        */

    end;

    local procedure GlobalDim1FilterOnAfterValidat()
    begin
        /*
        GLAccBudgetBuf.SETFILTER("Global Dimension 1 Filter",GlobalDim1Filter);
        IF ColumnDimOption = ColumnDimOption::"Global Dimension 1" THEN
          MATRIX_GenerateColumnCaptions(MATRIX_Step::First);
        UpdateMatrixSubform;
        */

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
}
