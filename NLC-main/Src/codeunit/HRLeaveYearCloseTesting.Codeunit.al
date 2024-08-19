#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193440 "HR Leave Year - Close Testing"
{
    TableNo = "HR Leave Periods";

    trigger OnRun()
    begin
        AccountingPeriod.Copy(Rec);
        Code();
        Rec := AccountingPeriod;
    end;

    var
        Text001: Label 'You must create a new fiscal year before you can close the old year.';
        Text002: Label 'This function closes the fiscal year from %1 to %2. ';
        Text003: Label 'Once the fiscal year is closed it cannot be opened again, and the periods in the fiscal year cannot be changed.\\';
        Text004: Label 'Do you want to close the fiscal year?';
        AccountingPeriod: Record "HR Leave Periods";
        AccountingPeriod2: Record "HR Leave Periods";
        AccountingPeriod3: Record "HR Leave Periods";
        FiscalYearStartDate: Date;
        FiscalYearEndDate: Date;
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        HREmp: Record "HR Employees";
        HRSetup: Record "HR Setup";
        LeaveType: Record "HR Leave Types";
        LeaveJournalLine: Record "HR Leave Journal Line";
        FiscalYearEndPCode: Code[20];
        CarryForward: Decimal;

    local procedure "Code"()
    begin
        begin
            AccountingPeriod2.SetRange(Closed, false);
            AccountingPeriod2.Find('-');
            FiscalYearStartDate := AccountingPeriod2."Starting Date";
            //error(format(FiscalYearStartDate));
            AccountingPeriod := AccountingPeriod2;
            AccountingPeriod.TestField(AccountingPeriod."New Fiscal Year", true);
            AccountingPeriod2.SetRange("New Fiscal Year", true);
            if AccountingPeriod2.Find('>') then begin
                //error(format(AccountingPeriod2."Starting Date"));
                //Set the fiscal year end date to be the 1st Day of the Next Month
                FiscalYearEndDate := CalcDate('<-1D>', AccountingPeriod2."Starting Date");
                FiscalYearEndPCode := AccountingPeriod2."Period Code";
                //error(format(FiscalYearEndDate));
                AccountingPeriod3 := AccountingPeriod2;
                AccountingPeriod2.SetRange("New Fiscal Year");
                AccountingPeriod2.Find('<');
            end else
                Error(Text001);
            if not
               Confirm(
                 Text002 +
                 Text003 +
                 Text004, false,
                 FiscalYearStartDate, FiscalYearEndDate)
            then
                exit;
            AccountingPeriod.Reset();

            /*{
            SETRANGE("Starting Date",FiscalYearStartDate,AccountingPeriod2."Starting Date");
            MODIFYALL(Closed,TRUE);
            SETRANGE("Starting Date",FiscalYearStartDate,AccountingPeriod3."Starting Date");
            MODIFYALL("Date Locked",TRUE);
            }*/

            AccountingPeriod.Reset();
            //MESSAGE(FORMAT(FiscalYearEndPCode));
            fnCreateLeaveEntitlement(AccountingPeriod);
            fnCreateCarryForwardLeaveBal(AccountingPeriod);
        end;

    end;


    procedure fnCreateLeaveEntitlement(var PayrollPeriod: Record "HR Leave Periods")
    var
        AccPeriod: Record "HR Leave Periods";
        NextDate: Date;
        EndOfYear: Boolean;
        Empleave: Record "HR Leave Ledger Entries";
        LeaveType: Record "HR Leave Types";
        MaturityDate: Date;
        NextMaturityDate: Date;
        Emp: Record Employee;
        CarryForwardDays: Decimal;
        EmpleaveCpy: Record "HR Leave Ledger Entries";
    begin

        HRSetup.Get();

        LeaveType.Reset();
        LeaveType.SetRange(LeaveType.Code, 'ANNUAL');
        if LeaveType.Find('-') then begin
            HREmp.Reset();
            HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
            if HREmp.Find('-') then
                repeat
                    LeaveJournalLine.Reset();
                    LeaveJournalLine."Journal Template Name" := 'LEAVE';
                    LeaveJournalLine."Journal Batch Name" := 'POSITIVE';

                    LeaveJournalLine."Line No." := LeaveJournalLine."Line No." + 1000;
                    LeaveJournalLine."Leave Period" := FiscalYearEndPCode;
                    LeaveJournalLine."Leave Period Start Date" := PayrollPeriod."Starting Date";
                    LeaveJournalLine."Staff No." := HREmp."No.";
                    LeaveJournalLine."Staff Name" := HREmp."Full Name";
                    LeaveJournalLine."Posting Date" := Today;
                    LeaveJournalLine.Description := 'Leave Allocation on' + Format(Today);
                    LeaveJournalLine."Leave Entry Type" := LeaveJournalLine."Leave Entry Type"::Positive;
                    LeaveJournalLine."Leave Type" := 'ANNUAL';
                    LeaveJournalLine."No. of Days" := LeaveType.Days;
                    LeaveJournalLine."Document No." := 'LV' + FiscalYearEndPCode;
                    LeaveJournalLine.Insert();
                //CODEUNIT.RUN(CODEUNIT::"HR Leave Jnl.-Post",LeaveJournalLine);
                until HREmp.Next() = 0;
        end;
    end;


    procedure fnCreateCarryForwardLeaveBal(var PayrollPeriod: Record "HR Leave Periods")
    var
        AccPeriod: Record "HR Leave Periods";
        NextDate: Date;
        EndOfYear: Boolean;
        Empleave: Record "HR Leave Ledger Entries";
        LeaveType: Record "HR Leave Types";
        MaturityDate: Date;
        NextMaturityDate: Date;
        Emp: Record Employee;
        CarryForwardDays: Decimal;
        EmpleaveCpy: Record "HR Leave Ledger Entries";
    begin

        dAlloc := 0;
        dEarnd := 0;
        dTaken := 0;
        dLeft := 0;
        cReimbsd := 0;
        cPerDay := 0;
        cbf := 0;
        CarryForward := 0;


        HRSetup.Get();

        LeaveType.Reset();
        LeaveType.SetRange(LeaveType.Code, 'ANNUAL');
        if LeaveType.Find('-') then begin
            HREmp.Reset();
            HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
            if HREmp.Find('-') then
                repeat
                    HRLeaveLedgerEntries.Reset();
                    HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Staff No.", HREmp."No.");
                    HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Type", 'ANNUAL');
                    HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Posting Date", HRSetup."Leave Posting Period[FROM]", HRSetup."Leave Posting Period[TO]");
                    if HRLeaveLedgerEntries.Find('-') then begin
                        dAlloc := 0;
                        repeat
                            dAlloc := HRLeaveLedgerEntries."No. of days" + dAlloc;
                        until HRLeaveLedgerEntries.Next() = 0;
                    end;

                    if dAlloc > 15 then
                        dAlloc := 15;

                    //MESSAGE('%1',dAlloc);
                    LeaveJournalLine.Reset();
                    LeaveJournalLine."Journal Template Name" := 'LEAVE';
                    LeaveJournalLine."Journal Batch Name" := 'POSITIVE';
                    LeaveJournalLine."Line No." := LeaveJournalLine."Line No." + 1000;
                    LeaveJournalLine."Leave Period" := FiscalYearEndPCode;
                    LeaveJournalLine."Leave Period Start Date" := PayrollPeriod."Starting Date";
                    LeaveJournalLine."Staff No." := HREmp."No.";
                    LeaveJournalLine."Staff Name" := HREmp."Full Name";
                    LeaveJournalLine."Posting Date" := Today;
                    LeaveJournalLine.Description := 'Carry Forward Days on' + Format(Today);
                    LeaveJournalLine."Leave Entry Type" := LeaveJournalLine."Leave Entry Type"::Positive;
                    LeaveJournalLine."Leave Type" := 'ANNUAL';
                    LeaveJournalLine."No. of Days" := dAlloc;
                    LeaveJournalLine."Document No." := 'LV' + FiscalYearEndPCode;
                    if LeaveJournalLine."No. of Days" > 0 then
                        LeaveJournalLine.Insert();
                //CODEUNIT.RUN(CODEUNIT::"HR Leave Jnl.-Post",LeaveJournalLine);

                until HREmp.Next() = 0;
        end;
    end;
}
