#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50000 "Bank Acc. Statement Lines"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Bank Acc. Statement Line";
    SourceTableView = where("Statement Type" = const("Bank Reconciliation"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Value Date"; Rec."Value Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Value Date field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Check No."; Rec."Check No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Check No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                    trigger OnValidate()
                    begin
                        SetUserInteractions();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Statement Amount"; Rec."Statement Amount")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the value of the Statement Amount field.';
                }
                field("Applied Amount"; Rec."Applied Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applied Amount field.';
                }
                field(Reconciled; Rec.Reconciled)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reconciled field.';
                }
                field(Difference; Rec.Difference)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Difference field.';
                }
                field("Applied Entries"; Rec."Applied Entries")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Applied Entries field.';
                }
                field("Related-Party Name"; Rec."Related-Party Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Related-Party Name field.';
                }
                field("Additional Transaction Info"; Rec."Additional Transaction Info")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Additional Transaction Info field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowStatementLineDetails)
            {
                ApplicationArea = Basic;
                Caption = 'Details';
                RunObject = page "Bank Statement Line Details";
                RunPageLink = "Data Exch. No." = field("Posting Exch. Entry No."),
                              "Line No." = field("Posting Exch. Line No.");
                Visible = false;
                ToolTip = 'Executes the Details action.';
            }
            action(ApplyEntries)
            {
                ApplicationArea = Basic;
                Caption = '&Apply Entries...';
                Enabled = ApplyEntriesAllowed;
                Image = ApplyEntries;
                Visible = false;
                ToolTip = 'Executes the &Apply Entries... action.';
                trigger OnAction()
                begin
                    ApplyEntries();
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Statement Line No." <> 0 then
            CalcBalance(Rec."Statement Line No.");
        SetUserInteractions();
    end;

    trigger OnAfterGetRecord()
    begin
        SetUserInteractions();
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        SetUserInteractions();
    end;

    trigger OnInit()
    begin
        BalanceEnable := true;
        TotalBalanceEnable := true;
        TotalDiffEnable := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if BelowxRec then
            CalcBalance(xRec."Statement Line No.")
        else
            CalcBalance(xRec."Statement Line No." - 1);
    end;

    var
        BankAccRecon: Record "Bank Acc. Reconciliation";
        StyleTxt: Text;
        TotalDiff: Decimal;
        Balance: Decimal;
        TotalBalance: Decimal;
        [InDataSet]
        TotalDiffEnable: Boolean;
        [InDataSet]
        TotalBalanceEnable: Boolean;
        [InDataSet]
        BalanceEnable: Boolean;
        ApplyEntriesAllowed: Boolean;

    local procedure CalcBalance(BankAccReconLineNo: Integer)
    var
        TempBankAccReconLine: Record "Bank Acc. Reconciliation Line";
    begin
        /*
        IF BankAccRecon.GET("Statement Type","Bank Account No.","Statement No.") THEN;

        TempBankAccReconLine.COPY(Rec);

        TotalDiff := -Difference;
        IF TempBankAccReconLine.CALCSUMS(Difference) THEN BEGIN
          TotalDiff := TotalDiff + TempBankAccReconLine.Difference;
          TotalDiffEnable := TRUE;
        END ELSE
          TotalDiffEnable := FALSE;

        TotalBalance := BankAccRecon."Balance Last Statement" - "Statement Amount";
        IF TempBankAccReconLine.CALCSUMS("Statement Amount") THEN BEGIN
          TotalBalance := TotalBalance + TempBankAccReconLine."Statement Amount";
          TotalBalanceEnable := TRUE;
        END ELSE
          TotalBalanceEnable := FALSE;

        Balance := BankAccRecon."Balance Last Statement" - "Statement Amount";
        TempBankAccReconLine.SETRANGE("Statement Line No.",0,BankAccReconLineNo);
        IF TempBankAccReconLine.CALCSUMS("Statement Amount") THEN BEGIN
          Balance := Balance + TempBankAccReconLine."Statement Amount";
          BalanceEnable := TRUE;
        END ELSE
          BalanceEnable := FALSE;
        */

    end;

    local procedure ApplyEntries()
    var
        BankAccReconApplyEntries: Codeunit "Bank Acc. Recon. Apply Entries";
    begin
        /*
        "Ready for Application" := TRUE;
        CurrPage.SAVERECORD;
        COMMIT;
        BankAccReconApplyEntries.ApplyEntries(Rec);
        */

    end;


    procedure GetSelectedRecords(var TempBankAccReconciliationLine: Record "Bank Acc. Statement Line" temporary)
    var
        BankAccReconciliationLine: Record "Bank Acc. Statement Line";
    begin
        CurrPage.SetSelectionFilter(BankAccReconciliationLine);
        if BankAccReconciliationLine.FindSet() then
            repeat
                TempBankAccReconciliationLine := BankAccReconciliationLine;
                TempBankAccReconciliationLine.Insert();
            until BankAccReconciliationLine.Next() = 0;
    end;

    local procedure SetUserInteractions()
    begin
        StyleTxt := Rec.GetStyle();
        ApplyEntriesAllowed := Rec.Type = Rec.Type::"Check Ledger Entry";
    end;


    procedure ToggleMatchedFilter(SetFilterOn: Boolean)
    begin
        if SetFilterOn then
            Rec.SetFilter(Rec.Difference, '<>%1', 0)
        else
            Rec.Reset();
        CurrPage.Update();
    end;
}
