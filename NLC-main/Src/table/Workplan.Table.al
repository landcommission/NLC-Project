#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193720 Workplan
{
    Caption = 'Workplan';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan Code"; Code[20])
        {
            Caption = 'Workplan Code';
        }
        field(2; "Workplan Description"; Text[250])
        {
            Caption = 'Workplan Description';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(4; "Budget Dimension 1 Code"; Code[20])
        {
            Caption = 'Budget Dimension 1 Code';
            TableRelation = Dimension;

        }
        field(5; "Budget Dimension 2 Code"; Code[20])
        {
            Caption = 'Budget Dimension 2 Code';
            TableRelation = Dimension;

        }
        field(6; "Budget Dimension 3 Code"; Code[20])
        {
            Caption = 'Budget Dimension 3 Code';
            TableRelation = Dimension;

        }
        field(7; "Budget Dimension 4 Code"; Code[20])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;

        }
        field(8; "Last Year"; Boolean)
        {
            Caption = 'Last Year';
        }
    }

    keys
    {
        key(Key1; "Workplan Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Dim: Record Dimension;
        DimSetEntry: Record "Dimension Set Entry";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        Text000: Label '%1\You cannot use the same dimension twice in the same budget.';
        Text001: Label 'Updating budget entries @1@@@@@@@@@@@@@@@@@@';

    local procedure GetDimValCode(DimSetID: Integer; DimCode: Code[20]): Code[20]
    begin
        if DimCode = '' then
            exit('');
        if TempDimSetEntry.Get(DimSetID, DimCode) then
            exit(TempDimSetEntry."Dimension Value Code");
        if DimSetEntry.Get(DimSetID, DimCode) then
            TempDimSetEntry := DimSetEntry
        else begin
            TempDimSetEntry.Init();
            TempDimSetEntry."Dimension Set ID" := DimSetID;
            TempDimSetEntry."Dimension Code" := DimCode;
        end;
        TempDimSetEntry.Insert();
        exit(TempDimSetEntry."Dimension Value Code")
    end;
}
