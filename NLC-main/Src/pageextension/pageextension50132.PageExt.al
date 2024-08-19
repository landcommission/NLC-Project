#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50132 pageextension50132 extends "Bank Acc. Reconciliation"
{
    layout
    {
        modify(StmtLine)
        {

            //Unsupported feature: Property Modification (Level) on "StmtLine(Control 11)".

            Caption = 'Bank Reconciliation Lines';
        }
        modify(Control8)
        {
            Visible = false;
        }
        modify(ApplyBankLedgerEntries)
        {
            Visible = false;
        }

        addafter(General)
        {
            group(Control29)
            {
                /* part(ApplyBankLedgerEntries;"Apply Bank Acc. Ledger Entries")
                {
                    Caption = 'Bank Account Ledger Entries';
                     Visible = false;
                    SubPageLink = "Bank Account No."=field("Bank Account No."),
                                  Open=const(true),
                                  "Statement Status"=filter(Open|"Bank Acc. Entry Applied"|"Check Entry Applied");
                } */
                part(StmtLine2; "Bank Acc. Statement Lines")
                {
                    Caption = 'Bank Statement Lines';
                    SubPageLink = "Bank Account No." = field("Bank Account No."),
                                  "Statement No." = field("Statement No.");
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Insertion (VariableCollection) on "SuggestLines(Action 16).OnAction".

        //trigger (Variable: BankRecLines)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "SuggestLines(Action 16).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SuggestBankAccStatement.SetStmt(Rec);
        SuggestBankAccStatement.RUNMODAL;
        CLEAR(SuggestBankAccStatement);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        BankRecLines.RESET;
        BankRecLines.SETRANGE("Bank Account No.","Bank Account No.");
        BankRecLines.SETRANGE("Statement No.","Statement No.");
        BankRecLines.DELETEALL(TRUE);
        COMMIT;

        #1..3

        //MatchBankRecLines.RemoveMatch(TempBankAccReconciliationLine,TempBankAccountLedgerEntry);
        BankRecLines.RESET;
        BankRecLines.SETRANGE("Bank Account No.","Bank Account No.");
        BankRecLines.SETRANGE("Statement No.","Statement No.");
        IF BankRecLines.FINDSET THEN
        REPEAT
          MatchBankRecLines.RemoveMatch(BankRecLines,TempBankAccountLedgerEntry);
        UNTIL BankRecLines.NEXT = 0;
        */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on "ImportBankStatement(Action 3).OnAction".

        //trigger (Variable: TempBankAccReconciliationLine)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "ImportBankStatement(Action 3).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ImportBankStatement;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        BankRecLines.RESET;
        BankRecLines.SETRANGE("Statement Type","Statement Type");
        BankRecLines.SETRANGE("Bank Account No.","Bank Account No.");
        BankRecLines.SETRANGE("Statement No.","Statement No.");
        IF BankRecLines.FINDSET THEN
        REPEAT
          MatchBankRecLines.RemoveMatch(BankRecLines,TempBankAccountLedgerEntry);
        UNTIL BankRecLines.NEXT = 0;
        COMMIT;
        ImportBankStatement;
        //to be continued here
        {
        SuggestBankAccStatement.SetStmt(Rec);
        SuggestBankAccStatement.RUNMODAL;
        CLEAR(SuggestBankAccStatement);
        }
        */
        //end;


        //Unsupported feature: Code Modification on "MatchManually(Action 18).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
        CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
        MatchBankRecLines.MatchManually(TempBankAccReconciliationLine,TempBankAccountLedgerEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {
        #1..3
        }
        bankAccStatementLine.RESET;
        bankAccStatementLine.SETRANGE("Bank Account No.","Bank Account No.");
        bankAccStatementLine.SETRANGE("Statement No.","Statement No.");
        IF NOT bankAccStatementLine.FINDSET THEN
        BEGIN
          CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine2);
          BankAccountLedgerEntry.RESET;
          BankAccountLedgerEntry.SETRANGE("Entry No.",TempBankAccReconciliationLine2."Bank Ledger Entry Line No");
          IF BankAccountLedgerEntry.FINDSET THEN
          MatchBankRecLines.MatchManually(TempBankAccReconciliationLine2,BankAccountLedgerEntry);
        END
        ELSE
        BEGIN
          CurrPage.StmtLine2.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
          CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
          MatchBankRecLines.MatchManually2(TempBankAccReconciliationLine,TempBankAccountLedgerEntry);
        END
        */
        //end;


        //Unsupported feature: Code Modification on "RemoveMatch(Action 13).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
        CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
        MatchBankRecLines.RemoveMatch(TempBankAccReconciliationLine,TempBankAccountLedgerEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {
        #1..3
        }
        bankAccStatementLine.RESET;
        bankAccStatementLine.SETRANGE("Bank Account No.","Bank Account No.");
        bankAccStatementLine.SETRANGE("Statement No.","Statement No.");
        IF NOT bankAccStatementLine.FINDSET THEN
        BEGIN
          CurrPage.StmtLine.PAGE.GetSelectedRecords(TempBankAccReconciliationLine2);
          BankAccountLedgerEntry.RESET;
          BankAccountLedgerEntry.SETRANGE("Entry No.",TempBankAccReconciliationLine2."Bank Ledger Entry Line No");
          IF BankAccountLedgerEntry.FINDSET THEN
          MatchBankRecLines.RemoveMatch(TempBankAccReconciliationLine2,BankAccountLedgerEntry);
        END
        ELSE
        BEGIN
          //*changes to use statement line instead of recon line
          CurrPage.StmtLine2.PAGE.GetSelectedRecords(TempBankAccReconciliationLine);
          CurrPage.ApplyBankLedgerEntries.PAGE.GetSelectedRecords(TempBankAccountLedgerEntry);
          MatchBankRecLines.RemoveMatch2(TempBankAccReconciliationLine,TempBankAccountLedgerEntry);
        END
        */
        //end;
        addfirst("F&unctions")
        {
            action("Statement Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Statement Lines';
                Image = Splitlines;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Bank Acc. Statement Lines";
                RunPageLink = "Bank Account No." = field("Bank Account No."),
                              "Statement No." = field("Statement No.");
                ToolTip = 'Executes the Statement Lines action.';
            }
        }
        addafter(PostAndPrint)
        {
            action("Bank Recon Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                Visible = false;
                ToolTip = 'Executes the Bank Recon Report action.';
                trigger OnAction()
                begin
                    //     ReportPrint.PrintBankAccRecon(Rec);   --To allow for the new format
                    //NewReport.getbankRec(Rec,"Statement Ending Balance");
                    // NewReport.RUN;

                    Report.Run(Report::"Bank Acc. Recon. - Test", true, false, Rec);
                end;
            }
        }
    }

    var
        BankRecLines: Record "Bank Acc. Reconciliation Line";
        MatchBankRecLines: Codeunit "Match Bank Rec. Lines";
        TempBankAccountLedgerEntry: Record "Bank Account Ledger Entry" temporary;
        TempBankAccReconciliationLine: Record "Bank Acc. Reconciliation Line" temporary;




    //Unsupported feature: Property Modification (Subtype) on "MatchManually(Action 18).OnAction.TempBankAccReconciliationLine(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //MatchManually : "Bank Acc. Reconciliation Line";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MatchManually : "Bank Acc. Statement Line";
    //Variable type has not been exported.

    var
        TempBankAccReconciliationLine2: Record "Bank Acc. Reconciliation Line" temporary;
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        bankAccStatementLine: Record "Bank Acc. Statement Line";


    //Unsupported feature: Property Modification (Subtype) on "RemoveMatch(Action 13).OnAction.TempBankAccReconciliationLine(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //RemoveMatch : "Bank Acc. Reconciliation Line";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RemoveMatch : "Bank Acc. Statement Line";
    //Variable type has not been exported.



    var
        BankAccReconPost: Codeunit "Bank Acc. Recon. Post (Yes/No)";
        ReconLines: Record "Bank Acc. Reconciliation Line";
        BankAccReconLine: Record "Bank Acc. Reconciliation Line";
        BankAccReconLine2: Record "Bank Acc. Reconciliation Line";
        BankAcc: Record "Bank Account";
        BankAccLedgEntry: Record "Bank Account Ledger Entry";
        CheckLedgEntry: Record "Check Ledger Entry";
        CheckLedgEntry2: Record "Check Ledger Entry";
        BankAccStmt: Record "Bank Account Statement";
        BankAccStmtLine: Record "Bank Account Statement Line";
        AppliedAmount: Decimal;
        TotalAmount: Decimal;
        TotalAppliedAmount: Decimal;
        TotalDiff: Decimal;
        Lines: Integer;
        Window: Dialog;
        TotalPresented: Decimal;
        VarBankRec: Record "Bank Acc. Reconciliation";
        TestingReport: Report "Bank Acc. Recon. - Test";
        ReconReport: Report "Bank Acc. Recon. - Test";
        UserSetup: Record "User Setup";
        NewReport: Report "Bank Acc. Recon. - Test";

    procedure TotalPresentedFunc(var BankReconcile: Record "Bank Acc. Reconciliation")
    var
        BankRecPresented: Record "Bank Acc. Reconciliation Line";
    begin
        TotalPresented := 0;
        VarBankRec := BankReconcile;
        BankRecPresented.Reset();
        BankRecPresented.SetRange(BankRecPresented."Bank Account No.", VarBankRec."Bank Account No.");
        BankRecPresented.SetRange(BankRecPresented."Statement No.", VarBankRec."Statement No.");
        BankRecPresented.SetRange(BankRecPresented.Reconciled, true);

        if BankRecPresented.Find('-') then
            repeat
                TotalPresented := TotalPresented + BankRecPresented."Applied Amount";
            //MESSAGE('%1',Totalpresented);
            until BankRecPresented.Next() = 0
        else
            Message('No records');
    end;
}
