#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193632 "Imprest Surrender Details"
{
    Caption = 'Imprest Surrender Details';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Surrender Doc No."; Code[20])
        {
            Editable = false;
            NotBlank = true;
            Caption = 'Surrender Doc No.';

        }
        field(2; "Account No:"; Code[10])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = "G/L Account"."No." where("Direct Posting" = const(true));
            Caption = 'Account No:';

        }
        field(3; "Account Name"; Text[30])
        {
            Editable = false;
            Caption = 'Account Name';
        }
        field(4; Amount; Decimal)
        {
            Editable = false;
            Caption = 'Amount';
        }
        field(5; "Due Date"; Date)
        {
            Editable = false;
            Caption = 'Due Date';
        }
        field(6; "Imprest Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
            Caption = 'Imprest Holder';
        }
        field(7; "Actual Spent"; Decimal)
        {
            Caption = 'Actual Spent';
            trigger OnValidate()
            begin
                if "Actual Spent" > Amount then
                    Error('The Actual Spent Cannot be more than the Issued Amount');
                if "Currency Factor" <> 0 then
                    "Amount LCY" := "Actual Spent" / "Currency Factor"
                else
                    "Amount LCY" := "Actual Spent";
            end;
        }
        field(8; "Apply to"; Code[20])
        {
            Editable = false;
            Caption = 'Apply to';
        }
        field(9; "Apply to ID"; Code[20])
        {
            Editable = false;
            Caption = 'Apply to ID';
        }
        field(10; "Surrender Date"; Date)
        {
            Editable = false;
            Caption = 'Surrender Date';
        }
        field(11; Surrendered; Boolean)
        {
            Editable = false;
            Caption = 'Surrendered';
        }
        field(12; "Cash Receipt No"; Code[20])
        {
            Caption = 'Cash Receipt No';

        }
        field(13; "Date Issued"; Date)
        {
            Editable = false;
            Caption = 'Date Issued';
        }
        field(14; "Type of Surrender"; Option)
        {
            OptionMembers = " ",Cash,Receipt;
            Caption = 'Type of Surrender';
        }
        field(15; "Dept. Vch. No."; Code[20])
        {
            Caption = 'Dept. Vch. No.';
        }
        field(16; "Cash Surrender Amt"; Decimal)
        {
            Caption = 'Cash Surrender Amt';
        }
        field(17; "Bank/Petty Cash"; Code[20])
        {
            TableRelation = "Bank Account";
            Caption = 'Bank/Petty Cash';
        }
        field(18; " Doc No."; Code[20])
        {
            Editable = false;
            Caption = ' Doc No.';
        }
        field(19; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Shortcut Dimension 1 Code';
            Editable = false;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(20; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Editable = false;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(27; "VAT Prod. Posting Group"; Code[20])
        {
            Editable = false;
            TableRelation = "VAT Product Posting Group".Code;
            Caption = 'VAT Prod. Posting Group';
        }
        field(28; "Imprest Type"; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code where(Type = const(Imprest));
            Caption = 'Imprest Type';
        }
        field(85; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(86; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(87; "Amount LCY"; Decimal)
        {
            Caption = 'Amount LCY';
        }
        field(88; "Cash Surrender Amt LCY"; Decimal)
        {
            Caption = 'Cash Surrender Amt LCY';
        }
        field(89; "Imprest Req Amt LCY"; Decimal)
        {
            Caption = 'Imprest Req Amt LCY';
        }
        field(90; "Cash Receipt Amount"; Decimal)
        {
            Caption = 'Cash Receipt Amount';
        }
        field(91; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions()
            end;
        }
    }

    keys
    {
        key(Key1; "Surrender Doc No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = "Amount LCY", "Imprest Req Amt LCY", "Actual Spent";
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        Pay.Reset();
        Pay.SetRange(Pay.No, "Surrender Doc No.");
        if Pay.Find('-') then
            if (Pay.Status = Pay.Status::Posted) or (Pay.Status = Pay.Status::"Pending Approval")
            or (Pay.Status = Pay.Status::Approved) then
                Error('This Document is already Send for Approval/Approved or Posted');
    end;

    trigger OnModify()
    begin
        Pay.Reset();
        Pay.SetRange(Pay.No, "Surrender Doc No.");
        if Pay.Find('-') then
            if (Pay.Status = Pay.Status::Posted) or (Pay.Status = Pay.Status::"Pending Approval")
            or (Pay.Status = Pay.Status::Approved) then
                Error('This Document is already Send for Approval/Approved or Posted');
    end;

    var
        GLAcc: Record "G/L Account";
        Pay: Record "Imprest Surrender Header";
        Dim: Record Dimension;
        CustLedger: Record "Cust. Ledger Entry";
        Text000: Label 'Receipt No %1 Is already Used in Another Document';
        DimMgt: Codeunit DimensionManagement;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Imprest', "Line No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;
}
