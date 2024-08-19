#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193458 "WP Matrix Management"
{


    var
        Text001: Label 'The previous column set could not be found.';
        Text002: Label 'The period could not be found.';
        Text003: Label 'There are no Calendar entries within the filter.';


    procedure SetPeriodColumnSet(DateFilter: Text[1024]; PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period"; Direction: Option Backward,Forward; var FirstColumn: Date; var LastColumn: Date; NoOfColumns: Integer)
    var
        Period: Record Date;
        PeriodFormMgt: Codeunit PeriodFormManagement;
        Steps: Integer;
        TmpFirstColumn: Date;
        TmpLastColumn: Date;
    begin
        Period.SetRange("Period Type", PeriodType);
        if DateFilter = '' then begin
            Period."Period Start" := WorkDate();
            if PeriodFormMgt.FindDate('<=', Period, PeriodType) then
                Steps := 1;
            PeriodFormMgt.NextDate(Steps, Period, PeriodType);
            DateFilter := '>=' + Format(Period."Period Start");
        end else begin
            Period.SetFilter("Period Start", DateFilter);
            Period.Find('-');
        end;

        if (Format(FirstColumn) = '') and (Format(LastColumn) = '') then begin
            FirstColumn := Period."Period Start";
            Period.Next(NoOfColumns - 1);
            LastColumn := Period."Period Start";
            exit;
        end;

        if Direction = Direction::Forward then begin
            Period.SetFilter("Period Start", DateFilter);
            if Period.Get(PeriodType, LastColumn) then
                Period.Next();
            TmpFirstColumn := Period."Period Start";
            Period.Next(NoOfColumns - 1);
            TmpLastColumn := Period."Period Start";
            if TmpFirstColumn <> LastColumn then begin
                FirstColumn := TmpFirstColumn;
                LastColumn := TmpLastColumn;
            end;
            exit;
        end;

        if Direction = Direction::Backward then begin
            if Period.Get(PeriodType, FirstColumn) then
                Period.Next(-1);
            TmpLastColumn := Period."Period Start";
            Period.Next(-NoOfColumns + 1);
            TmpFirstColumn := Period."Period Start";
            if TmpLastColumn <> FirstColumn then begin
                FirstColumn := TmpFirstColumn;
                LastColumn := TmpLastColumn;
            end;
        end;
    end;


    procedure SetDimColumnSet(DimensionCode: Code[20]; DimFilter: Text[1024]; SetWanted: Option Initial,Previous,Same,Next,PreviousColumn,NextColumn; var PKFirstRecInCurrSet: Text[1024]; var FirstColumn: Text[1024]; var LastColumn: Text[1024]; NoOfColumns: Integer)
    var
        DimVal: Record "Dimension Value";
        TmpFirstColumn: Text[1024];
        TmpLastColumn: Text[1024];
        TmpSteps: Integer;
    begin
        DimVal.SetRange("Dimension Code", DimensionCode);
        if DimFilter <> '' then
            DimVal.SetFilter(Code, DimFilter);

        case SetWanted of
            SetWanted::Initial:

                if DimVal.Find('-') then begin
                    PKFirstRecInCurrSet := DimVal.GetPosition();
                    FirstColumn := DimVal.Code;
                    TmpSteps := DimVal.Next(NoOfColumns - 1);
                    LastColumn := DimVal.Code;
                end;
            SetWanted::Same:

                if PKFirstRecInCurrSet <> '' then begin
                    DimVal.SetPosition(PKFirstRecInCurrSet);
                    DimVal.Find('=');
                    FirstColumn := DimVal.Code;
                    TmpSteps := DimVal.Next(NoOfColumns - 1);
                    LastColumn := DimVal.Code;
                end;
            SetWanted::Next:

                if PKFirstRecInCurrSet <> '' then begin
                    DimVal.SetPosition(PKFirstRecInCurrSet);
                    DimVal.Find('=');
                    if DimVal.Next(NoOfColumns) <> 0 then begin
                        PKFirstRecInCurrSet := DimVal.GetPosition();
                        TmpFirstColumn := DimVal.Code;
                        TmpSteps := DimVal.Next(NoOfColumns - 1);
                        TmpLastColumn := DimVal.Code;
                        if TmpFirstColumn <> LastColumn then begin
                            FirstColumn := TmpFirstColumn;
                            LastColumn := TmpLastColumn;
                        end;
                    end else
                        SetDimColumnSet(DimensionCode, DimFilter, SetWanted::Same, PKFirstRecInCurrSet, FirstColumn, LastColumn, NoOfColumns);
                end;
            SetWanted::Previous:

                if PKFirstRecInCurrSet <> '' then begin
                    DimVal.SetPosition(PKFirstRecInCurrSet);
                    DimVal.Find('=');
                    if DimVal.Next(-1) <> 0 then begin
                        TmpLastColumn := DimVal.Code;
                        TmpSteps := DimVal.Next(-NoOfColumns + 1);
                        PKFirstRecInCurrSet := DimVal.GetPosition();
                        TmpFirstColumn := DimVal.Code;
                        if TmpLastColumn <> FirstColumn then begin
                            FirstColumn := TmpFirstColumn;
                            LastColumn := TmpLastColumn;
                        end;
                    end else
                        SetDimColumnSet(DimensionCode, DimFilter, SetWanted::Same, PKFirstRecInCurrSet, FirstColumn, LastColumn, NoOfColumns);
                end;
            SetWanted::NextColumn:

                if PKFirstRecInCurrSet <> '' then begin
                    DimVal.SetPosition(PKFirstRecInCurrSet);
                    DimVal.Find('=');
                    if DimVal.Next() <> 0 then begin
                        PKFirstRecInCurrSet := DimVal.GetPosition();
                        TmpFirstColumn := DimVal.Code;
                        TmpSteps := DimVal.Next(NoOfColumns - 1);
                        TmpLastColumn := DimVal.Code;
                        if TmpFirstColumn <> LastColumn then begin
                            FirstColumn := TmpFirstColumn;
                            LastColumn := TmpLastColumn;
                        end;
                    end else
                        SetDimColumnSet(DimensionCode, DimFilter, SetWanted::Same, PKFirstRecInCurrSet, FirstColumn, LastColumn, NoOfColumns);
                end;
            SetWanted::PreviousColumn:

                if PKFirstRecInCurrSet <> '' then begin
                    DimVal.SetPosition(PKFirstRecInCurrSet);
                    DimVal.Find('=');
                    if DimVal.Next(-1) <> 0 then begin
                        PKFirstRecInCurrSet := DimVal.GetPosition();
                        TmpFirstColumn := DimVal.Code;
                        TmpSteps := DimVal.Next(NoOfColumns - 1);
                        TmpLastColumn := DimVal.Code;
                        if TmpLastColumn <> FirstColumn then begin
                            FirstColumn := TmpFirstColumn;
                            LastColumn := TmpLastColumn;
                        end;
                    end else
                        SetDimColumnSet(DimensionCode, DimFilter, SetWanted::Same, PKFirstRecInCurrSet, FirstColumn, LastColumn, NoOfColumns);
                end;
        end;

        if Abs(TmpSteps) <> NoOfColumns then
            NoOfColumns := Abs(TmpSteps);
    end;


    procedure DimToCaptions(var CaptionSet: array[32] of Text[1024]; var MatrixRecords: array[32] of Record "Dimension Code Buffer"; DimensionCode: Text[30]; FirstColumn: Text[1024]; LastColumn: Text[1024]; var NumberOfColumns: Integer; ShowColumnName: Boolean; var CaptionRange: Text[1024]; CopyTotaling: Boolean)
    var
        DimensionValue: Record "Dimension Value";
        i: Integer;
    begin
        DimensionValue.SetRange("Dimension Code", DimensionCode);
        DimensionValue.SetRange(Code, FirstColumn, LastColumn);
        i := 0;
        if DimensionValue.FindSet() then
            repeat
                i := i + 1;
                MatrixRecords[i].Code := DimensionValue.Code;
                MatrixRecords[i].Name := DimensionValue.Name;
                if CopyTotaling then
                    MatrixRecords[i].Totaling := DimensionValue.Totaling;
                if ShowColumnName then
                    CaptionSet[i] := DimensionValue.Name
                else
                    CaptionSet[i] := DimensionValue.Code
            until (i = ArrayLen(CaptionSet)) or (DimensionValue.Next() = 0);

        NumberOfColumns := i;

        if NumberOfColumns = 1 then
            CaptionRange := CaptionSet[1]
        else
            CaptionRange := CaptionSet[1] + '..' + CaptionSet[NumberOfColumns];
    end;


    procedure FillPeriodColumns(PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period"; var MatrixColumnCaptions: array[32] of Text[1024]; var MatrixRecords: array[32] of Record Date; FirstColumn: Date; LastColumn: Date; ShowColumnName: Boolean)
    var
        Period: Record Date;
        PeriodFormMgt: Codeunit PeriodFormManagement;
        i: Integer;
    begin
        Period.SetRange("Period Start", FirstColumn, LastColumn);
        Period.SetRange("Period Type", PeriodType);
        i := 1;
        if Period.Find('-') then
            repeat
                if ShowColumnName then
                    MatrixColumnCaptions[i] := Format(Period."Period Name")
                else
                    MatrixColumnCaptions[i] := PeriodFormMgt.CreatePeriodFormat(PeriodType, Period."Period Start");

                MatrixRecords[i].Copy(Period);
                i := i + 1;
            until (Period.Next() = 0) or (i = ArrayLen(MatrixColumnCaptions));
    end;


    procedure CreateCaptionSet(var RecRef: RecordRef; SetWanted: Option Initial,Previous,Same,Next,PreviousColumn,NextColumn; MaximumNoOfCaptions: Integer; CaptionFieldNo: Integer; var PrimaryKeyFirstCaptionInCurrSe: Text[1024]; var CaptionSet: array[32] of Text[1024]; var CaptionRange: Text[1024]): Integer
    var
        CurrentCaptionOrdinal: Integer;
    begin
        Clear(CaptionSet);
        CaptionRange := '';

        CurrentCaptionOrdinal := 0;

        case SetWanted of
            SetWanted::Initial:
                RecRef.Find('=><')
                ;
            SetWanted::Previous:
                begin
                    RecRef.SetPosition(PrimaryKeyFirstCaptionInCurrSe);
                    RecRef.Find('=');
                    RecRef.Next(-MaximumNoOfCaptions);
                end;
            SetWanted::Same:
                begin
                    RecRef.SetPosition(PrimaryKeyFirstCaptionInCurrSe);
                    RecRef.Find('=');
                end;
            SetWanted::Next:
                begin
                    RecRef.SetPosition(PrimaryKeyFirstCaptionInCurrSe);
                    RecRef.Find('=');
                    if not (RecRef.Next(MaximumNoOfCaptions) = MaximumNoOfCaptions) then begin
                        RecRef.SetPosition(PrimaryKeyFirstCaptionInCurrSe);
                        RecRef.Find('=')
                    end;
                end;
            SetWanted::PreviousColumn:
                begin
                    RecRef.SetPosition(PrimaryKeyFirstCaptionInCurrSe);
                    RecRef.Find('=');
                    RecRef.Next(-1);
                end;
            SetWanted::NextColumn:
                begin
                    RecRef.SetPosition(PrimaryKeyFirstCaptionInCurrSe);
                    RecRef.Find('=');
                    if not (RecRef.Next() = 1) then begin
                        RecRef.SetPosition(PrimaryKeyFirstCaptionInCurrSe);
                        RecRef.Find('=')
                    end;
                end;
        end;

        PrimaryKeyFirstCaptionInCurrSe := RecRef.GetPosition();

        repeat
            CurrentCaptionOrdinal := CurrentCaptionOrdinal + 1;
            CaptionSet[CurrentCaptionOrdinal] := Format(RecRef.Field(CaptionFieldNo).Value);
        until (CurrentCaptionOrdinal = MaximumNoOfCaptions) or (RecRef.Next() <> 1);

        if CurrentCaptionOrdinal = 1 then
            CaptionRange := CaptionSet[1]
        else
            CaptionRange := CaptionSet[1] + '..' + CaptionSet[CurrentCaptionOrdinal];
    end;


    procedure GenerateMatrixData(var RecRef: RecordRef; SetWanted: Option Initial,Previous,Same,Next,PreviousColumn,NextColumn; MaximumSetLength: Integer; CaptionFieldNo: Integer; var PKFirstRecInCurrSet: Text[1024]; var CaptionSet: array[32] of Text[1024]; var CaptionRange: Text[1024]; var CurrSetLength: Integer)
    var
        Steps: Integer;
    begin
        Clear(CaptionSet);
        CaptionRange := '';
        CurrSetLength := 0;

        if RecRef.IsEmpty then begin
            PKFirstRecInCurrSet := '';
            exit;
        end;

        case SetWanted of
            SetWanted::Initial:
                RecRef.FindFirst();
            SetWanted::Previous:
                begin
                    RecRef.SetPosition(PKFirstRecInCurrSet);
                    RecRef.Get(RecRef.RecordId);
                    Steps := RecRef.Next(-MaximumSetLength);
                    if not (Steps in [-MaximumSetLength, 0]) then
                        Error(Text001);
                end;
            SetWanted::Same:
                begin
                    RecRef.SetPosition(PKFirstRecInCurrSet);
                    RecRef.Get(RecRef.RecordId);
                end;
            SetWanted::Next:
                begin
                    RecRef.SetPosition(PKFirstRecInCurrSet);
                    RecRef.Get(RecRef.RecordId);
                    if not (RecRef.Next(MaximumSetLength) = MaximumSetLength) then begin
                        RecRef.SetPosition(PKFirstRecInCurrSet);
                        RecRef.Get(RecRef.RecordId);
                    end;
                end;
            SetWanted::PreviousColumn:
                begin
                    RecRef.SetPosition(PKFirstRecInCurrSet);
                    RecRef.Get(RecRef.RecordId);
                    Steps := RecRef.Next(-1);
                    if not (Steps in [-1, 0]) then
                        Error(Text001);
                end;
            SetWanted::NextColumn:
                begin
                    RecRef.SetPosition(PKFirstRecInCurrSet);
                    RecRef.Get(RecRef.RecordId);
                    if not (RecRef.Next(1) = 1) then begin
                        RecRef.SetPosition(PKFirstRecInCurrSet);
                        RecRef.Get(RecRef.RecordId);
                    end;
                end;
        end;

        PKFirstRecInCurrSet := RecRef.GetPosition();

        repeat
            CurrSetLength := CurrSetLength + 1;
            CaptionSet[CurrSetLength] := Format(RecRef.Field(CaptionFieldNo).Value);
        until (CurrSetLength = MaximumSetLength) or (RecRef.Next() <> 1);

        if CurrSetLength = 1 then
            CaptionRange := CaptionSet[1]
        else
            CaptionRange := CaptionSet[1] + '..' + CaptionSet[CurrSetLength];
    end;


    procedure GeneratePeriodMatrixData(SetWanted: Option Initial,Previous,Same,Next,PreviousColumn,NextColumn; MaximumSetLength: Integer; UseNameForCaption: Boolean; PeriodType: Option Day,Week,Month,Quarter,Year,"Accounting Period"; DateFilter: Text[30]; var PKFirstRecInCurrSet: Text[100]; var CaptionSet: array[32] of Text[200]; var CaptionRange: Text[100]; var CurrSetLength: Integer; var PeriodRecords: array[32] of Record Date temporary)
    var
        Steps: Integer;
        Calendar: Record Date;
        PeriodFormMgt: Codeunit PeriodFormManagement;
    begin
        Clear(CaptionSet);
        CaptionRange := '';
        CurrSetLength := 0;
        Clear(PeriodRecords);
        Clear(Calendar);
        Clear(PeriodFormMgt);

        Calendar.SetFilter("Period Start", DateFilter);
        if not FindDate('-', Calendar, PeriodType, false) then begin
            PKFirstRecInCurrSet := '';
            Error(Text003);
        end;

        case SetWanted of
            SetWanted::Initial:
                begin
                    if (PeriodType = PeriodType::"Accounting Period") or (DateFilter <> '') then
                        FindDate('-', Calendar, PeriodType, true)
                    else
                        Calendar."Period Start" := 0D;
                    FindDate('=><', Calendar, PeriodType, true);
                end;
            SetWanted::Previous:
                begin
                    Calendar.SetPosition(PKFirstRecInCurrSet);
                    FindDate('=', Calendar, PeriodType, true);
                    Steps := PeriodFormMgt.NextDate(-MaximumSetLength, Calendar, PeriodType);
                    if not (Steps in [-MaximumSetLength, 0]) then
                        Error(Text001);
                end;
            SetWanted::PreviousColumn:
                begin
                    Calendar.SetPosition(PKFirstRecInCurrSet);
                    FindDate('=', Calendar, PeriodType, true);
                    Steps := PeriodFormMgt.NextDate(-1, Calendar, PeriodType);
                    if not (Steps in [-1, 0]) then
                        Error(Text001);
                end;
            SetWanted::NextColumn:
                begin
                    Calendar.SetPosition(PKFirstRecInCurrSet);
                    FindDate('=', Calendar, PeriodType, true);
                    if not (PeriodFormMgt.NextDate(1, Calendar, PeriodType) = 1) then begin
                        Calendar.SetPosition(PKFirstRecInCurrSet);
                        FindDate('=', Calendar, PeriodType, true);
                    end;
                end;
            SetWanted::Same:
                begin
                    Calendar.SetPosition(PKFirstRecInCurrSet);
                    FindDate('=', Calendar, PeriodType, true)
                end;
            SetWanted::Next:
                begin
                    Calendar.SetPosition(PKFirstRecInCurrSet);
                    FindDate('=', Calendar, PeriodType, true);
                    if not (PeriodFormMgt.NextDate(MaximumSetLength, Calendar, PeriodType) = MaximumSetLength) then begin
                        Calendar.SetPosition(PKFirstRecInCurrSet);
                        FindDate('=', Calendar, PeriodType, true);
                    end;
                end;
        end;

        PKFirstRecInCurrSet := Calendar.GetPosition();

        repeat
            CurrSetLength := CurrSetLength + 1;
            if UseNameForCaption then
                CaptionSet[CurrSetLength] := Format(Calendar."Period Name")
            else
                CaptionSet[CurrSetLength] := PeriodFormMgt.CreatePeriodFormat(PeriodType, Calendar."Period Start");
            PeriodRecords[CurrSetLength].Copy(Calendar);
        until (CurrSetLength = MaximumSetLength) or (PeriodFormMgt.NextDate(1, Calendar, PeriodType) <> 1);

        if CurrSetLength = 1 then
            CaptionRange := CaptionSet[1]
        else
            CaptionRange := CaptionSet[1] + '..' + CaptionSet[CurrSetLength];
    end;


    procedure CreateTextAmount(Amount: Text[1024]; DecimalPoint: Option Period,Comma) TextAmount: Text[1024]
    var
        FormattedAmount: Text[1024];
        Position: Integer;
        Decimals: Code[10];
    begin
        if DecimalPoint = DecimalPoint::Comma then begin
            Position := 0;
            FormattedAmount := Amount;
            Position := StrPos(FormattedAmount, ',');
            if Position > 0 then begin
                Decimals := CopyStr(FormattedAmount, Position, StrLen(FormattedAmount));
                if StrLen(Decimals) > 3 then
                    TextAmount := CopyStr(FormattedAmount, 1, Position - 1) + CopyStr(Decimals, 1, 3);
                if StrLen(Decimals) <= 3 then
                    TextAmount := CopyStr(FormattedAmount, 1, Position - 1) + Decimals;
                if StrLen(Decimals) <= 2 then
                    TextAmount := CopyStr(FormattedAmount, 1, Position - 1) + Decimals + '0';
                if StrLen(Decimals) <= 1 then
                    TextAmount := CopyStr(FormattedAmount, 1, Position - 1) + '00';
            end else
                TextAmount := FormattedAmount + ',00';
        end else begin
            Position := 0;
            FormattedAmount := Amount;
            Position := StrPos(FormattedAmount, '.');
            if Position > 0 then begin
                Decimals := CopyStr(FormattedAmount, Position, StrLen(FormattedAmount));
                if StrLen(Decimals) > 3 then
                    TextAmount := CopyStr(FormattedAmount, 1, Position - 1) + CopyStr(Decimals, 1, 3);
                if StrLen(Decimals) <= 3 then
                    TextAmount := CopyStr(FormattedAmount, 1, Position - 1) + Decimals;
                if StrLen(Decimals) <= 2 then
                    TextAmount := CopyStr(FormattedAmount, 1, Position - 1) + Decimals + '0';
                if StrLen(Decimals) <= 1 then
                    TextAmount := CopyStr(FormattedAmount, 1, Position - 1) + '00';
            end else
                TextAmount := FormattedAmount + '.00';
        end;
    end;

    local procedure FindDate(SearchString: Text[3]; var Calendar: Record Date; PeriodType: Enum "Analysis Period Type"; ErrorWhenNotFound: Boolean): Boolean
    var
        Found: Boolean;
        //PeriodFormMgt: Codeunit PeriodFormManagement;
        PeriodFormMgt: Codeunit PeriodPageManagement;
    begin
        Clear(PeriodFormMgt);
        Found := PeriodFormMgt.FindDate(SearchString, Calendar, PeriodType);
        if ErrorWhenNotFound and not Found then
            Error(Text002);
        exit(Found);
    end;


    procedure SetIndentation(var TextString: Text[1024]; Indentation: Integer)
    var
        Substr: Text[1024];
    begin
        Substr := PadStr(Substr, Indentation * 2, ' ');
        TextString := Substr + TextString;
    end;
}
