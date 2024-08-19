#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193436 "HR Leave Year - Close Original"
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

            AccountingPeriod.SetRange(AccountingPeriod."Starting Date", FiscalYearStartDate, AccountingPeriod2."Starting Date");
            AccountingPeriod.ModifyAll(AccountingPeriod.Closed, true);

            AccountingPeriod.SetRange(AccountingPeriod."Starting Date", FiscalYearStartDate, AccountingPeriod3."Starting Date");
            AccountingPeriod.ModifyAll(AccountingPeriod."Date Locked", true);

            AccountingPeriod.Reset();
        end;
    end;


    procedure fnLeavebalance(lvApplicationcode: Code[10]; lvLeavetype: Code[10]; lvStaffno: Code[10]; lvBalance: Decimal)
    var
        lvLeavebalance: Record "HR Employees";
        HRLeaveTypes: Record "HR Leave Types";
    begin

        Message('hapa');

        if lvBalance = 0 then
            exit;

        /*{
        WITH lvLeavebalance DO BEGIN
            INIT;
            "No.":= lvStaffno;
            "Transaction Code" := TCode;
            "Group Text" := TGroup;
            "Transaction Name" := Description;
            INSERT;
          //Update the prEmployee Transactions  with the Amount
           fnLeavebalance( "No.","Transaction Code",Amount,"Period Month","Period Year","Payroll Period");
        END;
         }*/

        lvLeavebalance.Reset();
        lvLeavebalance.SetRange(lvLeavebalance."No.", lvStaffno);
        lvLeavebalance.SetRange(lvLeavebalance."Leave Type Filter", lvLeavetype);

        if lvLeavebalance.Find('-') then begin
            if lvLeavebalance."Leave Balance" >= HRLeaveTypes."Max Carry Forward Days" then
                lvLeavebalance."Reimbursed Leave Days" := HRLeaveTypes."Max Carry Forward Days"
            else
                if
       lvLeavebalance."Leave Balance" < HRLeaveTypes."Max Carry Forward Days" then
                    lvLeavebalance."Reimbursed Leave Days" := lvLeavebalance."Leave Balance";
            lvLeavebalance.Modify();


            lvLeavebalance.SetFilter("Leave Type Filter", lvLeavebalance.GetFilter(lvLeavebalance."Leave Type Filter"));

            HRLeaveTypes.Get(lvLeavebalance.GetFilter("Leave Type Filter"));

            lvLeavebalance.Validate("Allocated Leave Days");

            if lvLeavebalance."Leave Balance" >= HRLeaveTypes."Max Carry Forward Days" then
                lvLeavebalance."Reimbursed Leave Days" := HRLeaveTypes."Max Carry Forward Days"
            else
                if
       lvLeavebalance."Leave Balance" < HRLeaveTypes."Max Carry Forward Days" then
                    lvLeavebalance."Reimbursed Leave Days" := lvLeavebalance."Leave Balance";
            lvLeavebalance.Modify();
        end;

    end;
}
