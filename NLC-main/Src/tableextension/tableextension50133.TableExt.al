#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50133 tableextension50133 extends "Bank Acc. Reconciliation"
{
    fields
    {

        //Unsupported feature: Code Modification on ""Bank Account No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Statement No." = '' THEN BEGIN
          BankAcc.LOCKTABLE;
          BankAcc.GET("Bank Account No.");
        #4..16
        END;

        CreateDim(DATABASE::"Bank Account",BankAcc."No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //Added as a control to ensure that only one bank reconciliation per bank exists at a particular time
        BankAccRecon.RESET;
        BankAccRecon.SETRANGE("Bank Account No.","Bank Account No.");
        IF BankAccRecon.FIND('-') THEN
           ERROR(Text003);
        // End Addition

        #1..19
        */
        //end;
    }


    //Unsupported feature: Code Modification on "MatchSingle(PROCEDURE 5)".

    //procedure MatchSingle();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MatchBankRecLines.MatchSingle(Rec,DateRange);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //MatchBankRecLines.MatchSingle(Rec,DateRange);//**changes to change matching criteria
    MatchBankRecLines.MatchSingle2(Rec,DateRange);
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: ProcessBankAccRecLines2) (VariableCollection) on "ImportBankStatement(PROCEDURE 6)".



    //Unsupported feature: Code Modification on "ImportBankStatement(PROCEDURE 6)".

    //procedure ImportBankStatement();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF BankAccountCouldBeUsedForImport THEN BEGIN
      PostingExch.INIT;
      ProcessBankAccRecLines.ImportBankStatement(Rec,PostingExch);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    BankAccStatementLine.RESET;
    BankAccStatementLine.SETRANGE("Bank Account No.","Bank Account No.");
    BankAccStatementLine.SETRANGE("Statement No.","Statement No.");
    BankAccStatementLine.DELETEALL;

    IF BankAccountCouldBeUsedForImport THEN BEGIN
      PostingExch.INIT;
      //ProcessBankAccRecLines.ImportBankStatement(Rec,PostingExch); //**changes to transfer to statement line instead of reconciliation line
      //ProcessBankAccRecLines2.DetermineWeekends(Rec,PostingExch);
    END;
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: ProcessBankAccRecLines2) (VariableCollection) on "ImportAndProcessStatement(PROCEDURE 15)".



    //Unsupported feature: Code Modification on "ImportAndProcessStatement(PROCEDURE 15)".

    //procedure ImportAndProcessStatement();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT ProcessBankAccRecLines.ImportBankStatement(BankAccReconciliation,PostingExch) THEN
      EXIT;

    COMMIT;
    #5..7
      CODEUNIT.RUN(CODEUNIT::"Bank Acc. Reconciliation Post",BankAccReconciliation)
    ELSE
      OpenWorksheet(BankAccReconciliation);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {
    IF NOT ProcessBankAccRecLines2.DetermineWeekends(BankAccReconciliation,PostingExch) THEN
    #2..10
      }
    */
    //end;

    var
        Text003: Label 'Another Bank Statement already exists for this Bank finalize with it first';
        BankAccStatementLine: Record "Bank Acc. Statement Line";
}
