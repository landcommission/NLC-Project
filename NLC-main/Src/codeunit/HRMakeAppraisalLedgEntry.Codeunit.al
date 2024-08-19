#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193433 "HR Make Appraisal Ledg. Entry"
{



    procedure CopyFromJnlLine(var InsCoverageLedgEntry: Record "HR Appraisal Ledger Entries"; var InsuranceJnlLine: Record "HR Appraisal Journal Line")
    begin
        begin
            InsCoverageLedgEntry."User ID" := UserId;
            InsCoverageLedgEntry."Appraisal Period" := InsuranceJnlLine."Appraisal Period";
            InsCoverageLedgEntry."Staff No." := InsuranceJnlLine."Staff No.";
            InsCoverageLedgEntry."Staff Name" := InsuranceJnlLine."Staff Name";
            InsCoverageLedgEntry."Posting Date" := InsuranceJnlLine."Posting Date";
            InsCoverageLedgEntry."Appraisal Entry Type" := InsuranceJnlLine."Appraisal Entry Type";
            InsCoverageLedgEntry."Appraisal Type" := InsuranceJnlLine."Appraisal Type";
            InsCoverageLedgEntry."Appraisal Approval Date" := InsuranceJnlLine."Appraisal Approval Date";
            if InsCoverageLedgEntry."Appraisal Approval Date" = 0D then
                InsCoverageLedgEntry."Appraisal Approval Date" := InsCoverageLedgEntry."Posting Date";
            InsCoverageLedgEntry."Document No." := InsuranceJnlLine."Document No.";
            InsCoverageLedgEntry."External Document No." := InsuranceJnlLine."External Document No.";
            InsCoverageLedgEntry.Score := InsuranceJnlLine.Score;
            InsCoverageLedgEntry."Appraisal Posting Description" := InsuranceJnlLine.Description;
            InsCoverageLedgEntry."Global Dimension 1 Code" := InsuranceJnlLine."Shortcut Dimension 1 Code";
            InsCoverageLedgEntry."Global Dimension 2 Code" := InsuranceJnlLine."Shortcut Dimension 2 Code";
            InsCoverageLedgEntry."Source Code" := InsuranceJnlLine."Source Code";
            InsCoverageLedgEntry."Journal Batch Name" := InsuranceJnlLine."Journal Batch Name";
            InsCoverageLedgEntry."Reason Code" := InsuranceJnlLine."Reason Code";
            InsCoverageLedgEntry.Closed := SetDisposedFA(InsCoverageLedgEntry."Staff No.");
            InsCoverageLedgEntry."No. Series" := InsuranceJnlLine."Posting No. Series";
            InsCoverageLedgEntry."Self Appraisal" := InsuranceJnlLine."Self Rating";
            InsCoverageLedgEntry."Supervisor Appraisal" := InsuranceJnlLine."Supervisor Rating";
            InsCoverageLedgEntry."Agreed Appraisal" := InsuranceJnlLine."Agreed Rating";
        end;
    end;


    procedure CopyFromInsuranceCard(var InsCoverageLedgEntry: Record "HR Appraisal Ledger Entries"; var Insurance: Record "HR Appraisal Journal Line")
    begin
        /*WITH InsCoverageLedgEntry DO BEGIN
          "FA Class Code" := Insurance."FA Class Code";
          "FA Subclass Code" := Insurance."FA Subclass Code";
          "FA Location Code" := Insurance."FA Location Code";
          "Location Code" := Insurance."Location Code";
        END;*/

    end;


    procedure SetDisposedFA(FANo: Code[20]): Boolean
    var
        FASetup: Record "HR Setup";
    begin
        /*FASetup.GET;
        FASetup.TESTFIELD("Insurance Depr. Book");
        IF FADeprBook.GET(FANo,FASetup."Insurance Depr. Book") THEN
          EXIT(FADeprBook."Disposal Date" > 0D)
        ELSE
          EXIT(FALSE);
         */

    end;


    procedure UpdateLeaveApp(LeaveCode: Code[20]; Status: Option)
    var
        LeaveApplication: Record "HR Leave Application";
    begin
    end;
}
