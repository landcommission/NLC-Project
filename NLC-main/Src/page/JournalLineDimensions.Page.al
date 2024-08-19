#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193839 "Journal Line Dimensions"
{
    Caption = 'Journal Line Dimensions';
    DataCaptionExpression = GetCaption();
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Journal Line Dimension";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Code field.';
                }
                field("Dimension Value Code"; Rec."Dimension Value Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Value Code field.';
                }
            }
        }
    }

    actions { }

    var
        CurrTableID: Integer;
        CurrLineNo: Integer;
        SourceTableName: Text[100];


    procedure GetCaption(): Text[250]
    var
        ObjTransl: Record "Object Translation";
        NewTableID: Integer;
    begin
        NewTableID := GetTableID(Rec.GetFilter(Rec."Table ID"));
        if NewTableID = 0 then
            exit('');

        if NewTableID = 0 then
            SourceTableName := ''
        else
            if NewTableID <> CurrTableID then
                SourceTableName := ObjTransl.TranslateObject(ObjTransl."Object Type"::Table, NewTableID);

        CurrTableID := NewTableID;

        if Rec.GetFilter(Rec."Journal Line No.") = '' then
            CurrLineNo := 0
        else
            if Rec.GetRangeMin(Rec."Journal Line No.") = Rec.GetRangeMax(Rec."Journal Line No.") then
                CurrLineNo := Rec.GetRangeMin(Rec."Journal Line No.")
            else
                CurrLineNo := 0;

        if NewTableID = 0 then
            exit('')
        else
            exit(StrSubstNo('%1 %2', SourceTableName, Format(CurrLineNo)));
    end;


    procedure GetTableID(TableIDFilter: Text[250]): Integer
    var
        NewTableID: Integer;
    begin
        if Evaluate(NewTableID, TableIDFilter) then
            exit(NewTableID)
        else
            exit(0);
    end;
}
