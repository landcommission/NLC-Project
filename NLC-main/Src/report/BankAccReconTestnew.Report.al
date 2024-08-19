#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193708 "Bank Acc. Recon. - Test new"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank Acc. Recon. - Test new.rdlc';
    ApplicationArea = All;
    Caption = 'Bank Acc. Recon. - Test new';
    dataset
    {
        dataitem("Bank Acc. Reconciliation Line"; "Bank Acc. Reconciliation Line")
        {
            column(ReportForNavId_1102755000; 1102755000) { }
            column(ComapnyName; Company.Name) { }
            column(BankAccountNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Bank Account No.") { }
            column(BankAccNo; BankAccNo) { }
            column(BankName; BankName) { }
            column(VarBankRec_StatementDate; VarBankRec."Statement Date") { }
            column(CashBkBal; CashBkBal) { }
            column(BankStatBalance; BankStatBalance) { }
            column(ReconciliationStatement; ReconciliationStatement) { }
            column(TotalUnpresentedChqs; TotalUnpresentedChqs) { }
            column(TotalDifference; TotalDifference) { }
            column(Difference_BankAccReconciliationLine; "Bank Acc. Reconciliation Line".Difference) { }
            column(AppliedAmount_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Applied Amount") { }
            column(TransactionDate_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Transaction Date") { }
            column(Description_BankAccReconciliationLine; "Bank Acc. Reconciliation Line".Description) { }
            column(CheckNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Check No.") { }
            column(DocumentNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Document No.") { }
            column(UncreditedChqs; UncreditedChqs) { }
            column(TotalUnPresented; TotalUnPresented) { }

            trigger OnAfterGetRecord()
            begin
                //IF "Bank Acc. Reconciliation Line".Reconciled=FALSE THEN **changes
                if "Bank Acc. Reconciliation Line".Difference <> 0 then
                    if "Bank Acc. Reconciliation Line"."Applied Amount" > 0 then
                        UncreditedChqs := UncreditedChqs + "Bank Acc. Reconciliation Line"."Applied Amount"
                    else
                        TotalUnpresentedChqs := TotalUnpresentedChqs + "Bank Acc. Reconciliation Line"."Applied Amount";
            end;

            trigger OnPreDataItem()
            begin

                LastFieldNo := "Bank Acc. Reconciliation Line".FieldNo("Bank Acc. Reconciliation Line"."Bank Account No.");
                if DefinedBankNo = '' then
                    Error('Specify the bank account');
                if DefinedStatementNo = '' then
                    Error('Specify the Statement');
                VarBankRec.SetRange(VarBankRec."Bank Account No.", DefinedBankNo);
                VarBankRec.SetRange(VarBankRec."Statement No.", DefinedStatementNo);
                VarBankRec.FindSet();
                GetBank();
                //ADDED BY ERIC     **changes Anthony
                BankStatBalance := VarBankRec."Statement Ending Balance";
                BankLastBalance := VarBankRec."Balance Last Statement";
                TotalPresentedFunc();
                TotalUnpresentedFunc();
                TotalDiffFunc();
                "Bank Acc. Reconciliation Line".SetRange("Bank Acc. Reconciliation Line"."Bank Account No.", VarBankRec."Bank Account No.");
                "Bank Acc. Reconciliation Line".SetRange("Bank Acc. Reconciliation Line"."Statement No.", VarBankRec."Statement No.");
                if (TotalUnPresented + TotalDifference) = (CashBkBal - BankStatBalance) then
                    Finished := true;
                //MESSAGE('%1',TotalUnPresented+TotalDifference);
                //MESSAGE('%1',CashBkBal-BankStatBalance);

                if TotalUnPresented <> 0 then
                    IsDifferent := true;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field(DefinedBankNo; DefinedBankNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank No.';
                    TableRelation = "Bank Account";
                    ToolTip = 'Specifies the value of the Bank No. field.';
                }
                field(DefinedStatementNo; DefinedStatementNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statement No.';
                    TableRelation = "Bank Acc. Reconciliation"."Statement No.";
                    ToolTip = 'Specifies the value of the Statement No. field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin

        Company.Get();
        ReconciliationStatement := 'Reconciliation is incomplete please go through it again';
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        VarBankRec: Record "Bank Acc. Reconciliation";
        BankRecPresented: Record "Bank Acc. Reconciliation Line";
        BankRecUnPresented: Record "Bank Acc. Reconciliation Line";
        TotalPresented: Decimal;
        TotalUnPresented: Decimal;
        BankStatBalance: Decimal;
        BankLastBalance: Decimal;
        BankName: Text[30];
        BankAcc: Record "Bank Account";
        CashBkBal: Decimal;
        Difference: Decimal;
        Company: Record "Company Information";
        UncreditedChqs: Decimal;
        BankAccNo: Code[30];
        ReconciliationStatement: Text[250];
        Finished: Boolean;
        PrintWithRecon: Boolean;
        IsDifferent: Boolean;
        TotalUnpresentedChqs: Decimal;
        TotalDifference: Decimal;
        TotalFor: Label 'Total for ';
        DefinedBankNo: Code[20];
        DefinedStatementNo: Code[10];


    procedure getbankRec(var BankRec: Record "Bank Acc. Reconciliation"; var StatementBalance: Decimal)
    begin
        VarBankRec := BankRec;
        BankStatBalance := StatementBalance;
        //BankStatBalance:=BankRec."Statement Ending Balance"-BankRec."Balance Last Statement";
        //ADDED BY ERIC
        BankStatBalance := BankRec."Statement Ending Balance";
        BankLastBalance := BankRec."Balance Last Statement";
    end;


    procedure TotalPresentedFunc()
    begin
        BankRecPresented.SetRange(BankRecPresented."Bank Account No.", VarBankRec."Bank Account No.");
        BankRecPresented.SetRange(BankRecPresented."Statement No.", VarBankRec."Statement No.");
        //BankRecPresented.SETRANGE(BankRecPresented.Reconciled,TRUE);
        if BankRecPresented.Find('-') then
            repeat
                TotalPresented := TotalPresented + BankRecPresented."Applied Amount";
            until BankRecPresented.Next() = 0;
    end;


    procedure TotalUnpresentedFunc()
    begin
        BankRecUnPresented.SetRange(BankRecUnPresented."Bank Account No.", VarBankRec."Bank Account No.");
        BankRecUnPresented.SetRange(BankRecUnPresented."Statement No.", VarBankRec."Statement No.");
        //BankRecUnPresented.SETRANGE(BankRecUnPresented.Reconciled,FALSE);
        if BankRecPresented.Find('-') then
            repeat
                TotalUnPresented := TotalUnPresented + BankRecUnPresented."Applied Amount";
            until BankRecUnPresented.Next() = 0;
    end;


    procedure GetBank()
    begin
        if BankAcc.Get(VarBankRec."Bank Account No.") then begin
            BankAcc.SetRange(BankAcc."Date Filter", 0D, VarBankRec."Statement Date");
            BankAcc.CalcFields(BankAcc."Balance at Date");
            CashBkBal := BankAcc."Balance at Date";
            BankName := BankAcc.Name;
            BankAccNo := BankAcc."Bank Account No.";
        end;
    end;


    procedure TotalDiffFunc()
    begin
        BankRecPresented.Reset();
        BankRecPresented.SetRange(BankRecPresented."Bank Account No.", VarBankRec."Bank Account No.");
        BankRecPresented.SetRange(BankRecPresented."Statement No.", VarBankRec."Statement No.");
        //BankRecPresented.SETRANGE(BankRecPresented.Reconciled,TRUE);
        if BankRecPresented.Find('-') then
            repeat
                TotalDifference := TotalDifference + BankRecPresented.Difference;
            //MESSAGE('%1',TotalDifference);
            until BankRecPresented.Next() = 0;
    end;
}
