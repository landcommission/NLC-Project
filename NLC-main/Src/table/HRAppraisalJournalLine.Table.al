#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193853 "HR Appraisal Journal Line"
{
    Caption = 'HR Appraisal Journal Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "HR Leave Journal Template";
        }
        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "HR Leave Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(4; "Appraisal Period"; Code[20])
        {
            Caption = 'Appraisal Period';

        }
        field(6; "Staff No."; Code[20])
        {
            Caption = 'Staff No.';
            TableRelation = "HR Employees"."No.";
        }
        field(7; "Staff Name"; Text[120])
        {
            Caption = 'Staff Name';
            Editable = false;
        }
        field(8; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(9; "Appraisal Entry Type"; Option)
        {
            Caption = 'Leave Entry Type';
            Editable = true;
            OptionCaption = 'target setting,Achievement';
            OptionMembers = "target setting",Achievement;
        }
        field(10; "Appraisal Approval Date"; Date)
        {
            Caption = 'Leave Approval Date';
            Editable = false;
        }
        field(11; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(12; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(13; Score; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'No. of Days';
            Editable = true;

        }
        field(14; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(15; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

        }
        field(16; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

        }
        field(17; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(18; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(20; "Index Entry"; Boolean)
        {
            Caption = 'Index Entry';
        }
        field(21; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }
        field(22; "Appraisal Type"; Option)
        {
            Editable = true;
            OptionCaption = ' ,Service Delivery,Financial Stewardship,Training and Development,Customer and Sales';
            OptionMembers = " ","Service Delivery","Financial Stewardship","Training and Development","Customer and Sales";
            Caption = 'Appraisal Type';

        }
        field(23; "Appraisal Period Start Date"; Date)
        {
            Caption = 'Appraisal Period Start Date';

        }
        field(24; "Appraisal Period End Date"; Date)
        {
            Caption = 'Appraisal Period End Date';
        }
        field(25; "Appraisal No."; Code[20])
        {
            Caption = 'Leave Application No.';
            TableRelation = "HR Leave Application"."Application Code";
        }
        field(26; "Self Rating"; Integer)
        {
            Caption = 'Self Rating';
        }
        field(27; "Supervisor Rating"; Integer)
        {
            Caption = 'Supervisor Rating';
        }
        field(28; "Agreed Rating"; Integer)
        {
            Caption = 'Agreed Rating';
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Journal Template Name", "Journal Batch Name", "Posting Date")
        {
            MaintainSqlIndex = false;
        }
    }

    fieldgroups { }


    var
        Insurance: Record "HR Individual Targets Header";
        FA: Record "FA Budget Entry";
        InsuranceJnlLine: Record "HR Appraisal Journal Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        Text001: Label 'You can not post more than maximum days allowed for this leave type %1';


    procedure SetUpNewLine()
    begin
        /*InsuranceJnlTempl.GET("Journal Template Name");
        InsuranceJnlBatch.GET("Journal Template Name","Journal Batch Name");
        InsuranceJnlLine.SETRANGE("Journal Template Name","Journal Template Name");
        InsuranceJnlLine.SETRANGE("Journal Batch Name","Journal Batch Name");
        IF InsuranceJnlLine.FIND('-') THEN BEGIN
          "Posting Date" := LastInsuranceJnlLine."Posting Date";
          "Document No." := LastInsuranceJnlLine."Document No.";
        END ELSE BEGIN
          "Posting Date" := WORKDATE;
          IF InsuranceJnlBatch."No. Series" <> '' THEN BEGIN
            CLEAR(NoSeriesMgt);
            "Document No." := NoSeriesMgt.TryGetNextNo(InsuranceJnlBatch."No. Series","Posting Date");
          END;
        END;
        "Source Code" := InsuranceJnlTempl."Source Code";
        "Reason Code" := InsuranceJnlBatch."Reason Code";
        "Posting No. Series" := InsuranceJnlBatch."Posting No. Series";
        */

    end;


    procedure CreateDim(Type1: Integer; No1: Code[20])
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        /*TableID[1] := Type1;
        No[1] := No1;
        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        DimMgt.GetDefaultDim(
          TableID,No,"Source Code",
          "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        IF "Line No." <> 0 THEN
          DimMgt.UpdateJnlLineDefaultDim(
            DATABASE::Table5635,
            "Journal Template Name","Journal Batch Name","Line No.",0,
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
          */

    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        /*DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        IF "Line No." <> 0 THEN BEGIN
          DimMgt.SaveJnlLineDim(
            DATABASE::Table5635,"Journal Template Name",
            "Journal Batch Name","Line No.",0,FieldNumber,ShortcutDimCode);
          IF MODIFY THEN;
        END ELSE
          DimMgt.SaveTempDim(FieldNumber,ShortcutDimCode);
         */

    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        /*DimMgt.LookupDimValueCode(FieldNumber,ShortcutDimCode);
        IF "Line No." <> 0 THEN BEGIN
          DimMgt.SaveJnlLineDim(
            DATABASE::Table5635,"Journal Template Name",
            "Journal Batch Name","Line No.",0,FieldNumber,ShortcutDimCode);
          MODIFY;
        END ELSE
          DimMgt.SaveTempDim(FieldNumber,ShortcutDimCode);
        */

    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        /*IF "Line No." <> 0 THEN
          DimMgt.ShowJnlLineDim(
            DATABASE::Table5635,"Journal Template Name",
            "Journal Batch Name","Line No.",0,ShortcutDimCode)
        ELSE
          DimMgt.ShowTempDim(ShortcutDimCode);
        */

    end;


    procedure ValidateOpenPeriod()
    begin
        /*WITH LeavePeriod DO
        BEGIN
         Rec1.RESET;
        IF Rec1.FIND('-')THEN BEGIN
        "Leave Period Start Date":=Rec1."Starting Date";
        VALIDATE("Leave Period Start Date");    `
        END;
        END;*/

    end;
}
