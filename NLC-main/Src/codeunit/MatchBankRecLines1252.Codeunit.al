/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70001252 "Match Bank Rec. Lines1252"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Match Bank Rec. Lines"(Codeunit 1252)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=06222015D;
        //      Time=103247T;
        //      Modified=Yes;
        //      Version List=NAVW18.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Match Bank Rec. Lines"(Codeunit 1252);
        //    }
        //    CHANGES
        //    {
        //      { Insertion         ;Target=SaveOneToOneMatching(PROCEDURE 28);
        //                           InsertAfter=BankAccEntrySetReconNo(Variable 1002);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             BankAccStatementLine@1006 : Record "Bank Acc. Statement Line";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          TempBankStatementMatchingBuffer.RESET;
        //                                          TempBankStatementMatchingBuffer.SETCURRENTKEY(Quality);
        //                                          TempBankStatementMatchingBuffer.ASCENDING(FALSE);
        //
        //                                          IF TempBankStatementMatchingBuffer.FINDSET THEN
        //                                            REPEAT
        //                                              BankAccountLedgerEntry.GET(TempBankStatementMatchingBuffer."Entry No.");
        //                                              BankAccReconciliationLine.GET(
        //                                                BankAccReconciliationLine."Statement Type"::"Bank Reconciliation",
        //                                                BankAccountNo,StatementNo,
        //                                                TempBankStatementMatchingBuffer."Line No.");
        //                                              BankAccEntrySetReconNo.ApplyEntries(BankAccReconciliationLine,BankAccountLedgerEntry,Relation::"One-to-One");
        //                                            UNTIL TempBankStatementMatchingBuffer.NEXT = 0;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..7
        //
        //                                              BankAccReconciliationLine.RESET;      //**changes to add the statement line to the reconciliation
        //                                              BankAccReconciliationLine.SETRANGE("Bank Ledger Entry Line No",BankAccountLedgerEntry."Entry No.");
        //                                              IF BankAccReconciliationLine.FINDFIRST THEN
        //                                               BEGIN
        //                                                  {
        //                                                  BankAccReconciliationLine.GET(
        //                                                    BankAccReconciliationLine."Statement Type"::"Bank Reconciliation",
        //                                                    BankAccountNo,StatementNo,
        //                                                    TempBankStatementMatchingBuffer."Line No.");
        //                                                  }
        //                                                  BankAccStatementLine.GET(
        //                                                    BankAccStatementLine."Statement Type"::"Bank Reconciliation",
        //                                                    BankAccountNo,StatementNo,
        //                                                    TempBankStatementMatchingBuffer."Line No.");
        //
        //                                                  BankAccEntrySetReconNo.ApplyEntries2(BankAccReconciliationLine,BankAccountLedgerEntry,Relation::"One-to-One",BankAccStatementLine);
        //                                               END;
        //                                            UNTIL TempBankStatementMatchingBuffer.NEXT = 0;
        //                                        END;
        //
        //                           Target=SaveOneToOneMatching(PROCEDURE 28) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          BankRecDescription := RecordMatchMgt.Trim(BankRecDescription);
        //                                          BankEntryDescription := RecordMatchMgt.Trim(BankEntryDescription);
        //
        //                                          #4..14
        //                                          IF Nearness = NormalizingFactor THEN
        //                                            Score += Nearness;
        //
        //                                          Nearness := RecordMatchMgt.CalculateStringNearness(BankRecDescription,BankEntryDescription,
        //                                              MatchLengthTreshold,NormalizingFactor);
        //                                          IF Nearness >= 0.8 * NormalizingFactor THEN
        //                                            Score += Nearness;
        //
        //                                          EXIT(Score);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..17
        //                                          //Nearness := RecordMatchMgt.CalculateStringNearness(BankRecDescription,BankEntryDescription,     **changes to exclude description from fashion choice lane
        //                                          //    MatchLengthTreshold,NormalizingFactor);
        //                                          //IF Nearness >= 0.8 * NormalizingFactor THEN
        //                                          //  Score += Nearness;
        //
        //                                          EXIT(Score);
        //                                        END;
        //
        //                           Target=GetDescriptionMatchScore(PROCEDURE 3) }
        //      { Insertion         ;InsertAfter=GetNormalizingFactor(PROCEDURE 1063);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             PROCEDURE MatchManually2@8(VAR SelectedBankAccReconciliationLine@1004 : Record "Bank Acc. Statement Line";VAR SelectedBankAccountLedgerEntry@1003 : Record "Bank Account Ledger Entry");
        //                             VAR
        //                               BankAccReconciliationLine@1006 : Record "Bank Acc. Statement Line";
        //                               BankAccountLedgerEntry@1002 : Record "Bank Account Ledger Entry";
        //                               BankAccEntrySetReconNo@1000 : Codeunit "Bank Acc. Entry Set Recon.-No.";
        //                               BankAccReconciliationLine2@1005 : Record "Bank Acc. Reconciliation Line";
        //                             BEGIN
        //                               IF SelectedBankAccReconciliationLine.FINDFIRST THEN BEGIN
        //                                 BankAccReconciliationLine.GET(
        //                                   SelectedBankAccReconciliationLine."Statement Type",
        //                                   SelectedBankAccReconciliationLine."Bank Account No.",
        //                                   SelectedBankAccReconciliationLine."Statement No.",
        //                                   SelectedBankAccReconciliationLine."Statement Line No.");
        //                                 IF BankAccReconciliationLine.Type <> BankAccReconciliationLine.Type::"Bank Account Ledger Entry" THEN
        //                                   EXIT;
        //
        //                                 IF SelectedBankAccountLedgerEntry.FINDSET THEN BEGIN
        //                                   REPEAT
        //                                     BankAccountLedgerEntry.GET(SelectedBankAccountLedgerEntry."Entry No.");
        //                                     BankAccEntrySetReconNo.RemoveApplication2(BankAccountLedgerEntry);
        //                                     //**changes added to include the matched statement line to the reconciliation line
        //                                     BankAccReconciliationLine2.RESET;
        //                                     BankAccReconciliationLine2.SETRANGE("Bank Ledger Entry Line No",BankAccountLedgerEntry."Entry No.");
        //                                     BankAccReconciliationLine2.FINDSET;
        //                                     BankAccEntrySetReconNo.ApplyEntries2(BankAccReconciliationLine2,BankAccountLedgerEntry,Relation::"One-to-Many",SelectedBankAccReconciliationLine);
        //                                   UNTIL SelectedBankAccountLedgerEntry.NEXT = 0;
        //                                 END;
        //                               END;
        //                             END;
        //
        //                             PROCEDURE RemoveMatch2@7(VAR SelectedBankAccReconciliationLine@1001 : Record "Bank Acc. Statement Line";VAR SelectedBankAccountLedgerEntry@1000 : Record "Bank Account Ledger Entry");
        //                             VAR
        //                               BankAccReconciliationLine@1004 : Record "Bank Acc. Statement Line";
        //                               BankAccountLedgerEntry@1003 : Record "Bank Account Ledger Entry";
        //                               BankAccEntrySetReconNo@1002 : Codeunit "Bank Acc. Entry Set Recon.-No.";
        //                               BankAccReconciliationLine2@1005 : Record "Bank Acc. Reconciliation Line";
        //                             BEGIN
        //                               IF SelectedBankAccReconciliationLine.FINDSET THEN
        //                                 REPEAT
        //                                   BankAccReconciliationLine.GET(
        //                                     SelectedBankAccReconciliationLine."Statement Type",
        //                                     SelectedBankAccReconciliationLine."Bank Account No.",
        //                                     SelectedBankAccReconciliationLine."Statement No.",
        //                                     SelectedBankAccReconciliationLine."Statement Line No.");
        //                                   BankAccountLedgerEntry.SETRANGE("Bank Account No.",BankAccReconciliationLine."Bank Account No.");
        //                                   BankAccountLedgerEntry.SETRANGE("Statement No.",BankAccReconciliationLine."Statement No.");
        //                                   BankAccountLedgerEntry.SETRANGE("Statement Line No.",BankAccReconciliationLine."Statement Line No.");
        //                                   BankAccountLedgerEntry.SETRANGE(Open,TRUE);
        //                                   BankAccountLedgerEntry.SETRANGE("Statement Status",BankAccountLedgerEntry."Statement Status"::"Bank Acc. Entry Applied");
        //                                   IF BankAccountLedgerEntry.FINDSET THEN
        //                                     REPEAT
        //                                       BankAccEntrySetReconNo.RemoveApplication2(BankAccountLedgerEntry);
        //                                     UNTIL BankAccountLedgerEntry.NEXT = 0;
        //                                 UNTIL SelectedBankAccReconciliationLine.NEXT = 0;
        //
        //                               IF SelectedBankAccountLedgerEntry.FINDSET THEN
        //                                 REPEAT
        //                                   BankAccountLedgerEntry.GET(SelectedBankAccountLedgerEntry."Entry No.");
        //                                   BankAccEntrySetReconNo.RemoveApplication2(BankAccountLedgerEntry);
        //                                 UNTIL SelectedBankAccountLedgerEntry.NEXT = 0;
        //                             END;
        //
        //                             PROCEDURE MatchSingle2@6(BankAccReconciliation@1003 : Record "Bank Acc. Reconciliation";DateRange@1008 : Integer);
        //                             VAR
        //                               TempBankStatementMatchingBuffer@1000 : TEMPORARY Record "Bank Statement Matching Buffer";
        //                               BankRecMatchCandidates@1001 : Query "Bank Rec. Match Candidates";
        //                               Window@1004 : Dialog;
        //                               Score@1002 : Integer;
        //                             BEGIN
        //                               TempBankStatementMatchingBuffer.DELETEALL;
        //
        //                               Window.OPEN(ProgressBarMsg);
        //                               SetMatchLengthTreshold(4);
        //                               SetNormalizingFactor(10);
        //                               BankRecMatchCandidates.SETRANGE(Rec_Line_Bank_Account_No,BankAccReconciliation."Bank Account No.");
        //                               BankRecMatchCandidates.SETRANGE(Rec_Line_Statement_No,BankAccReconciliation."Statement No.");
        //                               IF BankRecMatchCandidates.OPEN THEN
        //                                 WHILE BankRecMatchCandidates.READ DO BEGIN
        //                                   Score := 0;
        //
        //                                   IF BankRecMatchCandidates.Rec_Line_Difference = BankRecMatchCandidates.Remaining_Amount THEN
        //                                     Score += 13;
        //
        //                                   //change the matching to check with check no.
        //                                   IF BankRecMatchCandidates.Rec_Line_Check_No = BankRecMatchCandidates.External_Document_No THEN
        //                                     Score += 12;
        //
        //                                   Score += GetDescriptionMatchScore(BankRecMatchCandidates.Rec_Line_Description,BankRecMatchCandidates.Description,
        //                                       BankRecMatchCandidates.Document_No,BankRecMatchCandidates.External_Document_No);
        //
        //                                   Score += GetDescriptionMatchScore(BankRecMatchCandidates.Rec_Line_RltdPty_Name,BankRecMatchCandidates.Description,
        //                                       BankRecMatchCandidates.Document_No,BankRecMatchCandidates.External_Document_No);
        //
        //                                   Score += GetDescriptionMatchScore(BankRecMatchCandidates.Rec_Line_Transaction_Info,BankRecMatchCandidates.Description,
        //                                       BankRecMatchCandidates.Document_No,BankRecMatchCandidates.External_Document_No);
        //
        //                               {
        //                                   IF BankRecMatchCandidates.Rec_Line_Transaction_Date <> 0D THEN
        //                                     CASE TRUE OF
        //                                       BankRecMatchCandidates.Rec_Line_Transaction_Date = BankRecMatchCandidates.Posting_Date:
        //                                         Score += 1;
        //                                       ABS(BankRecMatchCandidates.Rec_Line_Transaction_Date - BankRecMatchCandidates.Posting_Date) > DateRange:
        //                                         Score := 0;
        //                                     END;
        //                               }
        //                                   IF BankRecMatchCandidates.Rec_Line_Difference <> BankRecMatchCandidates.Remaining_Amount THEN    //changes if check no is same, but amount is diff.
        //                                         Score := 0;
        //
        //                                   IF BankRecMatchCandidates.Rec_Line_Check_No <> BankRecMatchCandidates.External_Document_No THEN
        //                                     Score := 0;
        //
        //                                   IF Score > 2 THEN
        //                                     TempBankStatementMatchingBuffer.AddMatchCandidate(BankRecMatchCandidates.Rec_Line_Statement_Line_No,
        //                                       BankRecMatchCandidates.Entry_No,Score,0,'');
        //                                 END;
        //
        //                               SaveOneToOneMatching(TempBankStatementMatchingBuffer,BankAccReconciliation."Bank Account No.",
        //                                 BankAccReconciliation."Statement No.");
        //
        //                               Window.CLOSE;
        //                               ShowMatchSummary(BankAccReconciliation);
        //                             END;
        //
        //                           }
        //                            }
        //    }
        //    CODE
        //    {
        //
        //      BEGIN
        //      END.
        //    }
        //  }
        //
        //

    end;
}
 */