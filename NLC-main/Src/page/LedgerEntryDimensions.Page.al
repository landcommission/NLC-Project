#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193838 "Ledger Entry Dimensions"
{
    Caption = 'Ledger Entry Dimensions';
    DataCaptionExpression = GetCaption();
    Editable = false;
    PageType = List;
    SourceTable = "Ledger Entry Dimension";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
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

    actions { }

    var
        CurrTableID: Integer;
        CurrEntryNo: Integer;
        SourceTableName: Text[100];


    procedure GetCaption(): Text[250]
    var
        ObjTransl: Record "Object Translation";
        NewTableID: Integer;
    begin
        if Rec.GetFilter("Table ID") = '' then
            NewTableID := 0
        else
            if Rec.GetRangeMin("Table ID") = Rec.GetRangeMax("Table ID") then
                NewTableID := Rec.GetRangeMin("Table ID")
            else
                NewTableID := 0;

        if NewTableID = 0 then
            SourceTableName := ''
        else
            if NewTableID <> CurrTableID then
                SourceTableName := ObjTransl.TranslateObject(ObjTransl."Object Type"::Table, NewTableID);

        CurrTableID := NewTableID;

        if Rec.GetFilter("Entry No.") = '' then
            CurrEntryNo := 0
        else
            if Rec.GetRangeMin("Entry No.") = Rec.GetRangeMax("Entry No.") then
                CurrEntryNo := Rec.GetRangeMin("Entry No.")
            else
                CurrEntryNo := 0;

        if NewTableID = 0 then
            exit('')
        else
            exit(StrSubstNo('%1 %2', SourceTableName, Format(CurrEntryNo)));
    end;
}
