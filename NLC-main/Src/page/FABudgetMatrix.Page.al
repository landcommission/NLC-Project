#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193683 "FA Budget Matrix"
{
    Caption = 'FA Budget Matrix';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Fixed Asset";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies a description of the fixed asset.';
                }
                field(Field1; MATRIX_CellData[1])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[1];
                    DecimalPlaces = 0 : 5;
                    Visible = Field1Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[1] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(1);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(1);
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[2];
                    DecimalPlaces = 0 : 5;
                    Visible = Field2Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[2] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(2);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(2);
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[3];
                    DecimalPlaces = 0 : 5;
                    Visible = Field3Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[3] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(3);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(3);
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[4];
                    DecimalPlaces = 0 : 5;
                    Visible = Field4Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[4] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(4);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(4);
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[5];
                    DecimalPlaces = 0 : 5;
                    Visible = Field5Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[5] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(5);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(5);
                    end;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[6];
                    DecimalPlaces = 0 : 5;
                    Visible = Field6Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[6] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(6);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(6);
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[7];
                    DecimalPlaces = 0 : 5;
                    Visible = Field7Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[7] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(7);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(7);
                    end;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[8];
                    DecimalPlaces = 0 : 5;
                    Visible = Field8Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[8] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(8);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(8);
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[9];
                    DecimalPlaces = 0 : 5;
                    Visible = Field9Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[9] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(9);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(9);
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[10];
                    DecimalPlaces = 0 : 5;
                    Visible = Field10Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[10] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(10);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(10);
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[11];
                    DecimalPlaces = 0 : 5;
                    Visible = Field11Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[11] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(11);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(11);
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[12];
                    DecimalPlaces = 0 : 5;
                    Visible = Field12Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[12] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(12);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(12);
                    end;
                }
                field(Field13; MATRIX_CellData[13])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[13];
                    DecimalPlaces = 0 : 5;
                    Visible = Field13Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[13] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(13);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(13);
                    end;
                }
                field(Field14; MATRIX_CellData[14])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[14];
                    DecimalPlaces = 0 : 5;
                    Visible = Field14Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[14] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(14);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(14);
                    end;
                }
                field(Field15; MATRIX_CellData[15])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[15];
                    DecimalPlaces = 0 : 5;
                    Visible = Field15Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[15] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(15);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(15);
                    end;
                }
                field(Field16; MATRIX_CellData[16])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[16];
                    DecimalPlaces = 0 : 5;
                    Visible = Field16Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[16] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(16);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(16);
                    end;
                }
                field(Field17; MATRIX_CellData[17])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[17];
                    DecimalPlaces = 0 : 5;
                    Visible = Field17Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[17] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(17);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(17);
                    end;
                }
                field(Field18; MATRIX_CellData[18])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[18];
                    DecimalPlaces = 0 : 5;
                    Visible = Field18Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[18] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(18);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(18);
                    end;
                }
                field(Field19; MATRIX_CellData[19])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[19];
                    DecimalPlaces = 0 : 5;
                    Visible = Field19Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[19] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(19);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(19);
                    end;
                }
                field(Field20; MATRIX_CellData[20])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[20];
                    DecimalPlaces = 0 : 5;
                    Visible = Field20Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[20] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(20);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(20);
                    end;
                }
                field(Field21; MATRIX_CellData[21])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[21];
                    DecimalPlaces = 0 : 5;
                    Visible = Field21Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[21] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(21);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(21);
                    end;
                }
                field(Field22; MATRIX_CellData[22])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[22];
                    DecimalPlaces = 0 : 5;
                    Visible = Field22Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[22] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(22);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(22);
                    end;
                }
                field(Field23; MATRIX_CellData[23])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[23];
                    DecimalPlaces = 0 : 5;
                    Visible = Field23Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[23] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(23);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(23);
                    end;
                }
                field(Field24; MATRIX_CellData[24])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[24];
                    DecimalPlaces = 0 : 5;
                    Visible = Field24Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[24] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(24);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(24);
                    end;
                }
                field(Field25; MATRIX_CellData[25])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[25];
                    DecimalPlaces = 0 : 5;
                    Visible = Field25Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[25] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(25);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(25);
                    end;
                }
                field(Field26; MATRIX_CellData[26])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[26];
                    DecimalPlaces = 0 : 5;
                    Visible = Field26Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[26] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(26);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(26);
                    end;
                }
                field(Field27; MATRIX_CellData[27])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[27];
                    DecimalPlaces = 0 : 5;
                    Visible = Field27Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[27] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(27);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(27);
                    end;
                }
                field(Field28; MATRIX_CellData[28])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[28];
                    DecimalPlaces = 0 : 5;
                    Visible = Field28Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[28] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(28);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(28);
                    end;
                }
                field(Field29; MATRIX_CellData[29])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[29];
                    DecimalPlaces = 0 : 5;
                    Visible = Field29Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[29] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(29);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(29);
                    end;
                }
                field(Field30; MATRIX_CellData[30])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[30];
                    DecimalPlaces = 0 : 5;
                    Visible = Field30Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[30] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(30);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(30);
                    end;
                }
                field(Field31; MATRIX_CellData[31])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[31];
                    DecimalPlaces = 0 : 5;
                    Visible = Field31Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[31] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(31);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(31);
                    end;
                }
                field(Field32; MATRIX_CellData[32])
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[32];
                    DecimalPlaces = 0 : 5;
                    Visible = Field32Visible;
                    ToolTip = 'Specifies the value of the MATRIX_CellData[32] field.';
                    trigger OnDrillDown()
                    begin
                        MatrixOnDrillDown(32);
                    end;

                    trigger OnValidate()
                    begin
                        QtyValidate(32);
                    end;
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    var
        MATRIX_CurrentColumnOrdinal: Integer;
    begin
        MATRIX_CurrentColumnOrdinal := 0;
        while MATRIX_CurrentColumnOrdinal < MATRIX_NoOfMatrixColumns do begin
            MATRIX_CurrentColumnOrdinal := MATRIX_CurrentColumnOrdinal + 1;
            MATRIX_OnAfterGetRecord(MATRIX_CurrentColumnOrdinal);
        end;
        if (MATRIX_CurrentColumnOrdinal > 0) and (QtyType = QtyType::"Net Change") then
            Rec.SetRange(Rec."Date Filter", MatrixRecords[1]."Period Start", MatrixRecords[MATRIX_CurrentColumnOrdinal]."Period End");
    end;

    trigger OnInit()
    begin
        Field32Visible := true;
        Field31Visible := true;
        Field30Visible := true;
        Field29Visible := true;
        Field28Visible := true;
        Field27Visible := true;
        Field26Visible := true;
        Field25Visible := true;
        Field24Visible := true;
        Field23Visible := true;
        Field22Visible := true;
        Field21Visible := true;
        Field20Visible := true;
        Field19Visible := true;
        Field18Visible := true;
        Field17Visible := true;
        Field16Visible := true;
        Field15Visible := true;
        Field14Visible := true;
        Field13Visible := true;
        Field12Visible := true;
        Field11Visible := true;
        Field10Visible := true;
        Field9Visible := true;
        Field8Visible := true;
        Field7Visible := true;
        Field6Visible := true;
        Field5Visible := true;
        Field4Visible := true;
        Field3Visible := true;
        Field2Visible := true;
        Field1Visible := true;
    end;

    var
        QtyType: Option "Net Change","Balance at Date";
        ForecastType: Option "Sales Item",Component,Both;
        MatrixRecords: array[32] of Record Date;
        MATRIX_NoOfMatrixColumns: Integer;
        MATRIX_CellData: array[32] of Decimal;
        MATRIX_CaptionSet: array[32] of Text[1024];
        BudgetName: Code[10];
        LocationFilter: Text;
        GlobalDim1Filter: Code[250];
        GlobalDim2Filter: Code[250];
        DateFilter: Text;
        Text000: Label 'The Forecast On field must be Sales Items or Component.';
        Text001: Label 'A forecast was previously made on the %1. Do you want all forecasts of the period %2-%3 moved to the start of the period?', Comment = 'A forecast was previously made on the 01-10-11. Do you want all forecasts of the period 12/02/2012-12/03/2012 moved to the start of the period?';
        Text003: Label 'You must set a location filter.';
        Text004: Label 'You must change view to Sales Items or Component.';
        [InDataSet]
        Field1Visible: Boolean;
        [InDataSet]
        Field2Visible: Boolean;
        [InDataSet]
        Field3Visible: Boolean;
        [InDataSet]
        Field4Visible: Boolean;
        [InDataSet]
        Field5Visible: Boolean;
        [InDataSet]
        Field6Visible: Boolean;
        [InDataSet]
        Field7Visible: Boolean;
        [InDataSet]
        Field8Visible: Boolean;
        [InDataSet]
        Field9Visible: Boolean;
        [InDataSet]
        Field10Visible: Boolean;
        [InDataSet]
        Field11Visible: Boolean;
        [InDataSet]
        Field12Visible: Boolean;
        [InDataSet]
        Field13Visible: Boolean;
        [InDataSet]
        Field14Visible: Boolean;
        [InDataSet]
        Field15Visible: Boolean;
        [InDataSet]
        Field16Visible: Boolean;
        [InDataSet]
        Field17Visible: Boolean;
        [InDataSet]
        Field18Visible: Boolean;
        [InDataSet]
        Field19Visible: Boolean;
        [InDataSet]
        Field20Visible: Boolean;
        [InDataSet]
        Field21Visible: Boolean;
        [InDataSet]
        Field22Visible: Boolean;
        [InDataSet]
        Field23Visible: Boolean;
        [InDataSet]
        Field24Visible: Boolean;
        [InDataSet]
        Field25Visible: Boolean;
        [InDataSet]
        Field26Visible: Boolean;
        [InDataSet]
        Field27Visible: Boolean;
        [InDataSet]
        Field28Visible: Boolean;
        [InDataSet]
        Field29Visible: Boolean;
        [InDataSet]
        Field30Visible: Boolean;
        [InDataSet]
        Field31Visible: Boolean;
        [InDataSet]
        Field32Visible: Boolean;

    local procedure SetDateFilter(ColumnID: Integer)
    begin
        if DateFilter <> '' then
            MatrixRecords[ColumnID].SetFilter("Period Start", DateFilter)
        else
            MatrixRecords[ColumnID].SetRange("Period Start");

        if QtyType = QtyType::"Net Change" then
            if MatrixRecords[ColumnID]."Period Start" = MatrixRecords[ColumnID]."Period End" then
                Rec.SetRange(Rec."Date Filter", MatrixRecords[ColumnID]."Period Start")
            else
                Rec.SetRange(Rec."Date Filter", MatrixRecords[ColumnID]."Period Start", MatrixRecords[ColumnID]."Period End")
        else
            Rec.SetRange(Rec."Date Filter", 0D, MatrixRecords[ColumnID]."Period End");
    end;


    procedure Load(MatrixColumns1: array[32] of Text[1024]; var MatrixRecords1: array[32] of Record Date; BudgetName1: Code[10]; DateFilter1: Text; GlobalDim1Filter1: Code[250]; GlobalDim2Filter1: Code[250]; QtyType1: Option "Net Change","Balance at Date"; NoOfMatrixColumns1: Integer)
    var
        i: Integer;
    begin
        CopyArray(MATRIX_CaptionSet, MatrixColumns1, 1);
        for i := 1 to ArrayLen(MatrixRecords) do begin
            if MatrixColumns1[i] = '' then
                MATRIX_CaptionSet[i] := ' '
            else
                MATRIX_CaptionSet[i] := MatrixColumns1[i];
            MatrixRecords[i] := MatrixRecords1[i];
        end;

        BudgetName := BudgetName1;
        DateFilter := DateFilter1;
        GlobalDim1Filter := GlobalDim1Filter1;
        GlobalDim2Filter := GlobalDim2Filter1;
        QtyType := QtyType1;
        MATRIX_NoOfMatrixColumns := NoOfMatrixColumns1;
        /*
        IF ForecastType = ForecastType::Component THEN
          SETRANGE("Component Forecast",TRUE);
        IF ForecastType = ForecastType::"Sales Item" THEN
          SETRANGE("Component Forecast",FALSE);
        IF ForecastType = ForecastType::Both THEN
          SETRANGE("Component Forecast");
        */
        SetVisible();

    end;

    local procedure MatrixOnDrillDown(ColumnID: Integer)
    var
        BudgetEntry: Record "FA Budget Entry";
    begin
        SetDateFilter(ColumnID);
        BudgetEntry.SetCurrentKey(
        //  "Production Forecast Name","Item No.","Location Code","Forecast Date","Component Forecast");
          "Budget Name", "FA No.", Date);
        BudgetEntry.SetRange("FA No.", Rec."No.");
        if QtyType = QtyType::"Net Change" then
            BudgetEntry.SetRange(Date, MatrixRecords[ColumnID]."Period Start", MatrixRecords[ColumnID]."Period End")
        else
            BudgetEntry.SetRange(Date, 0D, MatrixRecords[ColumnID]."Period End");
        if BudgetName <> '' then
            BudgetEntry.SetRange("Budget Name", BudgetName)
        else
            BudgetEntry.SetRange("Budget Name");

        if GlobalDim1Filter <> '' then
            BudgetEntry.SetFilter("Global Dimension 1 Code", GlobalDim1Filter)
        else
            BudgetEntry.SetRange("Global Dimension 1 Code");

        if GlobalDim2Filter <> '' then
            BudgetEntry.SetFilter("Global Dimension 2 Code", GlobalDim2Filter)
        else
            BudgetEntry.SetRange("Global Dimension 2 Code");

        //BudgetEntry.SETFILTER("Component Forecast",GETFILTER("Component Forecast"));

        Page.Run(0, BudgetEntry);
    end;

    local procedure MATRIX_OnAfterGetRecord(ColumnOrdinal: Integer)
    begin
        SetDateFilter(ColumnOrdinal);

        if BudgetName <> '' then
            Rec.SetRange(Rec."Budget Name", BudgetName)
        else
            Rec.SetRange(Rec."Budget Name");
        if LocationFilter <> '' then
            Rec.SetFilter(Rec."Location Filter", LocationFilter)
        else
            Rec.SetRange(Rec."Location Filter");
        if GlobalDim1Filter <> '' then
            Rec.SetFilter(Rec."Global Dimension 1 Code", GlobalDim1Filter)
        else
            Rec.SetRange(Rec."Global Dimension 1 Code");

        if GlobalDim2Filter <> '' then
            Rec.SetFilter(Rec."Global Dimension 2 Code", GlobalDim2Filter)
        else
            Rec.SetRange(Rec."Global Dimension 2 Code");

        /*
        IF ForecastType = ForecastType::Component THEN
          SETRANGE("Component Forecast",TRUE);
        IF ForecastType = ForecastType::"Sales Item" THEN
          SETRANGE("Component Forecast",FALSE);
        IF ForecastType = ForecastType::Both THEN
          SETRANGE("Component Forecast");
        */
        Rec.CalcFields(Rec."Budget Qty");

        MATRIX_CellData[ColumnOrdinal] := Rec."Budget Qty";

    end;


    procedure SetVisible()
    begin
        Field1Visible := MATRIX_CaptionSet[1] <> '';
        Field2Visible := MATRIX_CaptionSet[2] <> '';
        Field3Visible := MATRIX_CaptionSet[3] <> '';
        Field4Visible := MATRIX_CaptionSet[4] <> '';
        Field5Visible := MATRIX_CaptionSet[5] <> '';
        Field6Visible := MATRIX_CaptionSet[6] <> '';
        Field7Visible := MATRIX_CaptionSet[7] <> '';
        Field8Visible := MATRIX_CaptionSet[8] <> '';
        Field9Visible := MATRIX_CaptionSet[9] <> '';
        Field10Visible := MATRIX_CaptionSet[10] <> '';
        Field11Visible := MATRIX_CaptionSet[11] <> '';
        Field12Visible := MATRIX_CaptionSet[12] <> '';
        Field13Visible := MATRIX_CaptionSet[13] <> '';
        Field14Visible := MATRIX_CaptionSet[14] <> '';
        Field15Visible := MATRIX_CaptionSet[15] <> '';
        Field16Visible := MATRIX_CaptionSet[16] <> '';
        Field17Visible := MATRIX_CaptionSet[17] <> '';
        Field18Visible := MATRIX_CaptionSet[18] <> '';
        Field19Visible := MATRIX_CaptionSet[19] <> '';
        Field20Visible := MATRIX_CaptionSet[20] <> '';
        Field21Visible := MATRIX_CaptionSet[21] <> '';
        Field22Visible := MATRIX_CaptionSet[22] <> '';
        Field23Visible := MATRIX_CaptionSet[23] <> '';
        Field24Visible := MATRIX_CaptionSet[24] <> '';
        Field25Visible := MATRIX_CaptionSet[25] <> '';
        Field26Visible := MATRIX_CaptionSet[26] <> '';
        Field27Visible := MATRIX_CaptionSet[27] <> '';
        Field28Visible := MATRIX_CaptionSet[28] <> '';
        Field29Visible := MATRIX_CaptionSet[29] <> '';
        Field30Visible := MATRIX_CaptionSet[30] <> '';
        Field31Visible := MATRIX_CaptionSet[31] <> '';
        Field32Visible := MATRIX_CaptionSet[32] <> '';
    end;

    local procedure QtyValidate(ColumnID: Integer)
    begin
        Enter_BaseQty(ColumnID);
        ProdForecastQtyBase_OnValidate(ColumnID);
    end;


    procedure Enter_BaseQty(ColumnID: Integer)
    begin
        SetDateFilter(ColumnID);
        if QtyType = QtyType::"Net Change" then
            Rec.SetRange(Rec."Date Filter", MatrixRecords[ColumnID]."Period Start", MatrixRecords[ColumnID]."Period End")
        else
            Rec.SetRange(Rec."Date Filter", 0D, MatrixRecords[ColumnID]."Period End");
        if BudgetName <> '' then
            Rec.SetRange(Rec."Budget Name", BudgetName)
        else
            Rec.SetRange(Rec."Budget Name");
        if LocationFilter <> '' then
            Rec.SetFilter(Rec."Location Filter", LocationFilter)
        else
            Rec.SetRange(Rec."Location Filter");
        if GlobalDim1Filter <> '' then
            Rec.SetFilter(Rec."Global Dimension 1 Code", GlobalDim1Filter)
        else
            Rec.SetRange(Rec."Global Dimension 1 Code");

        if GlobalDim2Filter <> '' then
            Rec.SetFilter(Rec."Global Dimension 2 Code", GlobalDim2Filter)
        else
            Rec.SetRange(Rec."Global Dimension 2 Code");

        /*
        IF ForecastType = ForecastType::Component THEN
          SETRANGE("Component Forecast",TRUE);
        IF ForecastType = ForecastType::"Sales Item" THEN
          SETRANGE("Component Forecast",FALSE);
        IF ForecastType = ForecastType::Both THEN
          SETRANGE("Component Forecast");
        */
        Rec.Validate(Rec."Budget Qty", MATRIX_CellData[ColumnID]);

    end;


    procedure ProdForecastQtyBase_OnValidate(ColumnID: Integer)
    var
        ProdForecastEntry: Record "Production Forecast Entry";
        ProdForecastEntry2: Record "Production Forecast Entry";
        LocationCode: Code[10];
    begin
        /*
        IF ForecastType = ForecastType::Both THEN
          ERROR(Text000);
        ProdForecastEntry.SETCURRENTKEY("Production Forecast Name","Item No.","Location Code","Forecast Date","Component Forecast");
        ProdForecastEntry.SETRANGE("Production Forecast Name",GETFILTER("Production Forecast Name"));
        ProdForecastEntry.SETRANGE("Item No.","No.");
        ProdForecastEntry.SETRANGE("Location Code",GETFILTER("Location Filter"));
        ProdForecastEntry.SETRANGE(
          "Forecast Date",
          MatrixRecords[ColumnID]."Period Start",
          MatrixRecords[ColumnID]."Period End");
        ProdForecastEntry.SETFILTER("Component Forecast",GETFILTER("Component Forecast"));
        IF ProdForecastEntry.FINDLAST THEN
          IF ProdForecastEntry."Forecast Date" > MatrixRecords[ColumnID]."Period Start" THEN
            IF CONFIRM(
                 Text001,
                 FALSE,
                 ProdForecastEntry."Forecast Date",
                 MatrixRecords[ColumnID]."Period Start",
                 MatrixRecords[ColumnID]."Period End")
            THEN
              ProdForecastEntry.MODIFYALL("Forecast Date",MatrixRecords[ColumnID]."Period Start")
            ELSE
              ERROR(Text004);
        ProdForecastEntry2.SETCURRENTKEY(
          "Production Forecast Name","Item No.","Location Code","Forecast Date","Component Forecast");
        IF GETFILTER("Location Filter") = '' THEN BEGIN
          ProdForecastEntry2.COPYFILTERS(ProdForecastEntry);
          ProdForecastEntry2.SETRANGE("Location Code");
          IF ProdForecastEntry2.FINDFIRST THEN BEGIN
            LocationCode := ProdForecastEntry2."Location Code";
            ProdForecastEntry2.FINDLAST;
            IF ProdForecastEntry2."Location Code" <> LocationCode THEN
              ERROR(Text003);
          END;
        END;
        */

    end;
}
