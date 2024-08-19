#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193735 "Grant Surrender Details"
{
    Caption = 'Grant Surrender Details';
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
            trigger OnValidate()
            begin

                if GLAcc.Get("Account No:") then
                    "Account Name" := GLAcc.Name;
                GLAcc.TestField("Direct Posting", true);
                "Budgetary Control A/C" := GLAcc."Budget Controlled";
                Pay.SetRange(Pay.No, "Surrender Doc No.");
                if Pay.FindFirst() then
                    if Pay."Account No." <> '' then begin
                        Partner := Pay."Account No.";
                        "Shortcut Dimension 1 Code" := Pay."Global Dimension 1 Code";
                        "Shortcut Dimension 2 Code" := Pay."Shortcut Dimension 2 Code";
                        "Currency Factor" := Pay."Currency Factor";
                        "Currency Code 1" := Pay."Currency Code";

                    end else
                        Error('Please Enter the Customer/Account Number');
            end;
        }
        field(3; "Account Name"; Text[50])
        {
            Editable = false;
            Caption = 'Account Name';
        }
        field(4; "Disbursed Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Disbursed Amount';
        }
        field(5; "Due Date"; Date)
        {
            Editable = false;
            Caption = 'Due Date';
        }
        field(6; Partner; Code[20])
        {
            Editable = true;
            TableRelation = Customer."No.";
            Caption = 'Partner';
        }
        field(7; "Actual Spent"; Decimal)
        {
            Caption = 'Actual Spent';
            trigger OnValidate()
            begin
                //Allow actual spent to be more than amount if open for overexpenditure and from original document

                //IF NOT ("Allow Overexpenditure") AND ("Line on Original Document") THEN BEGIN
                if "Actual Spent" > "Disbursed Amount" then
                    Error('The Actual Spent Cannot be more than the disbursed Amount');
                //END;



                /*
                     IF "Currency Factor"<>0 THEN
                        "Amount LCY":="Actual Spent"/"Currency Factor"
                       ELSE
                          "Amount LCY":="Actual Spent";
                */



                "Remaining Amount" := "Disbursed Amount" - "Actual Spent";

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
        }
        field(20; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Editable = false;
            TableRelation = Dimension;
        }
        field(21; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = Dimension;
        }
        field(22; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = Dimension;
        }
        field(23; "Shortcut Dimension 5 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = Dimension;
        }
        field(24; "Shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = Dimension;
        }
        field(25; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = Dimension;
        }
        field(26; "Shortcut Dimension 8 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = Dimension;
        }
        field(27; "VAT Prod. Posting Group"; Code[20])
        {
            Editable = false;
            TableRelation = "VAT Product Posting Group".Code;
            Caption = 'VAT Prod. Posting Group';
        }
        field(86; "Currency Code 1"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = false;
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
            AutoIncrement = false;
            Caption = 'Line No.';
        }
        field(92; Committed; Boolean)
        {
            Caption = 'Committed';
        }
        field(93; "Budgetary Control A/C"; Boolean)
        {
            Caption = 'Budgetary Control A/C';
        }
        field(94; "Line on Original Document"; Boolean)
        {
            Caption = 'Line on Original Document';
        }
        field(95; "Allow Overexpenditure"; Boolean)
        {
            Caption = 'Allow Overexpenditure';
        }
        field(96; "Open for Overexpenditure by"; Code[20])
        {
            Caption = 'Open for Overexpenditure by';
        }
        field(97; "Date opened for OvExpenditure"; Date)
        {
            Caption = 'Date opened for OvExpenditure';
        }
        field(1023; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
        }
        field(1024; "Currency Date"; Date)
        {
            Caption = 'Currency Date';

        }
        field(1025; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin

                if ("Currency Code 1" = '') and ("Currency Factor" <> 0) then
                    FieldError("Currency Factor", StrSubstNo(Text001, FieldCaption("Currency Code 1")));
                UpdateAllAmounts();
            end;
        }
        field(1026; "PV No"; Code[10])
        {
            Editable = false;
            Caption = 'PV No';
        }
        field(1027; "Posting Date"; Date)
        {
            Editable = false;
            Caption = 'Posting Date';
        }
        field(1028; "Grant No"; Code[10])
        {
            Editable = false;
            Caption = 'Grant No';

        }
        field(1029; "Job-Planning Line No"; Integer)
        {
            Caption = 'Job-Planning Line No';
        }
        field(1030; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining Amount';
        }
        field(1031; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(1032; "Accounted Amount"; Decimal)
        {
            Caption = 'Accounted Amount';
        }
    }

    keys
    {
        key(Key1; "Surrender Doc No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = "Amount LCY", "Imprest Req Amt LCY", "Actual Spent", "Cash Receipt Amount", "Disbursed Amount";
        }
        key(Key2; "Grant No", Partner, "Job-Planning Line No", Posted)
        {
            SumIndexFields = "Actual Spent";
        }
    }

    fieldgroups { }


    var
        GLAcc: Record "G/L Account";
        Pay: Record "Grant Surrender Header";
        Dim: Record Dimension;
        CustLedger: Record "Cust. Ledger Entry";
        JobPlanningLine: Record "Job-Planning Line";
        Text000: Label 'Receipt No %1 Is already Used in Another Document';
        GrantHeader: Record "Grant Surrender Header";
        CurrExchRate: Record "Currency Exchange Rate";
        CurrencyDate: Date;
        Text001: Label 'cannot be specified without %1';


    procedure UpdateCurrencyFactor()
    begin
        /*
        IF "Currency Code" <> '' THEN BEGIN
          IF "Currency Date" = 0D THEN
            CurrencyDate := WORKDATE
          ELSE
            CurrencyDate := "Currency Date";
          "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate,"Currency Code");
        END ELSE
          "Currency Factor" := 0;
        */

    end;


    procedure UpdateAllAmounts()
    begin
        /*
        GetJob;

        UpdateUnitCost;
        UpdateTotalCost;
        */
        /*
        FindPriceAndDiscount(Rec,CurrFieldNo);
        HandleCostFactor;
        UpdateUnitPrice;
        UpdateTotalPrice;
        UpdateAmountsAndDiscounts;
        */

    end;

    local procedure UpdateUnitCost()
    var
        RetrievedCost: Decimal;
    begin
        /*
        IF (Type = Type::Item) AND Item.GET("No.") THEN BEGIN
          IF Item."Costing Method" = Item."Costing Method"::Standard THEN BEGIN
            IF RetrieveCostPrice THEN BEGIN
              IF GetSKU THEN
                "Unit Cost (LCY)" := SKU."Unit Cost" * "Qty. per Unit of Measure"
              ELSE
                "Unit Cost (LCY)" := Item."Unit Cost" * "Qty. per Unit of Measure";
              "Unit Cost" := ROUND(
                  CurrExchRate.ExchangeAmtLCYToFCY(
                    "Currency Date","Currency Code",
                    "Unit Cost (LCY)","Currency Factor"),
                  UnitAmountRoundingPrecision);
            END ELSE BEGIN
              IF "Unit Cost" <> xRec."Unit Cost" THEN
                "Unit Cost (LCY)" := ROUND(
                    CurrExchRate.ExchangeAmtFCYToLCY(
                      "Currency Date","Currency Code",
                      "Unit Cost","Currency Factor"),
                    UnitAmountRoundingPrecision)
              ELSE
                "Unit Cost" := ROUND(
                    CurrExchRate.ExchangeAmtLCYToFCY(
                      "Currency Date","Currency Code",
                      "Unit Cost (LCY)","Currency Factor"),
                    UnitAmountRoundingPrecision);
            END;
          END ELSE BEGIN
            IF RetrieveCostPrice THEN BEGIN
              IF GetSKU THEN
                RetrievedCost := SKU."Unit Cost" * "Qty. per Unit of Measure"
              ELSE
                RetrievedCost := Item."Unit Cost" * "Qty. per Unit of Measure";
              "Unit Cost" := ROUND(
                  CurrExchRate.ExchangeAmtLCYToFCY(
                    "Currency Date","Currency Code",
                    RetrievedCost,"Currency Factor"),
                  UnitAmountRoundingPrecision);
              "Unit Cost (LCY)" := ROUND(
                  CurrExchRate.ExchangeAmtFCYToLCY(
                    "Currency Date","Currency Code",
                    "Unit Cost","Currency Factor"),
                  UnitAmountRoundingPrecision);
            END ELSE BEGIN
              "Unit Cost (LCY)" := ROUND(
                  CurrExchRate.ExchangeAmtFCYToLCY(
                    "Currency Date","Currency Code",
                    "Unit Cost","Currency Factor"),
                  UnitAmountRoundingPrecision);
            END;
          END;
        END ELSE
          IF (Type = Type::Resource) AND Res.GET("No.") THEN BEGIN
            IF RetrieveCostPrice THEN BEGIN
              ResCost.INIT;
              ResCost.Code := "No.";
              ResCost."Work Type Code" := "Work Type Code";
              ResFindUnitCost.RUN(ResCost);
              "Direct Unit Cost (LCY)" := ResCost."Direct Unit Cost" * "Qty. per Unit of Measure";
              RetrievedCost := ROUND(ResCost."Unit Cost" * "Qty. per Unit of Measure",UnitAmountRoundingPrecision);
              "Unit Cost" := ROUND(
                  CurrExchRate.ExchangeAmtLCYToFCY(
                    "Currency Date","Currency Code",
                    RetrievedCost,"Currency Factor"),
                  UnitAmountRoundingPrecision);
              "Unit Cost (LCY)" := ROUND(
                  CurrExchRate.ExchangeAmtFCYToLCY(
                    "Currency Date","Currency Code",
                    "Unit Cost","Currency Factor"),
                  UnitAmountRoundingPrecision);
            END ELSE BEGIN
              "Unit Cost (LCY)" := ROUND(
                  CurrExchRate.ExchangeAmtFCYToLCY(
                    "Currency Date","Currency Code",
                    "Unit Cost","Currency Factor"),
                  UnitAmountRoundingPrecision);
            END;
          END ELSE BEGIN
            "Unit Cost (LCY)" := ROUND(
                CurrExchRate.ExchangeAmtFCYToLCY(
                  "Currency Date","Currency Code",
                  "Unit Cost","Currency Factor"),
                UnitAmountRoundingPrecision);
          END;
        */

    end;

    local procedure UpdateTotalCost()
    begin
        /*
        "Total Cost" := ROUND("Unit Cost" * Quantity,AmountRoundingPrecision);
        "Total Cost (LCY)" := ROUND(
            CurrExchRate.ExchangeAmtFCYToLCY(
              "Currency Date","Currency Code",
              "Total Cost","Currency Factor"),
            AmountRoundingPrecision);
        */

    end;
}
