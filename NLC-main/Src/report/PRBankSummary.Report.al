#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193556 "PR Bank Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Bank Summary.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR Bank Summary';
    dataset
    {
        dataitem("Bank Payment List"; "Bank Payment List")
        {
            RequestFilterFields = "Payroll Period", "Bank Code", "Branch Code", "Staff No.";
            column(ReportForNavId_1; 1) { }
            column(BankCode_HRBankSummary; "Bank Payment List"."Bank Code") { }
            column(StaffNo_HRBankSummary; "Bank Payment List"."Staff No.") { }
            column(BranchCode_HRBankSummary; "Bank Payment List"."Branch Code") { }
            column(PayrollPeriod_HRBankSummary; "Bank Payment List"."Payroll Period") { }
            column(ACNumber_HRBankSummary; "Bank Payment List"."A/C Number") { }
            column(Amount_HRBankSummary; "Bank Payment List".Amount) { }
            column(StaffName_BankPaymentList; "Bank Payment List"."Staff Name") { }
            column(PeriodName; PeriodName) { }
            column(Cur_PNAME; Cur_PNAME) { }
            column(DebitValueDate; DebitValueDate) { }
            column(Num; Num) { }
            column(CompInfoName; CompInfo.Name) { }
            column(PayrollPeriod_BankPaymentList; "Bank Payment List"."Payroll Period") { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            dataitem("PR Bank Accounts"; "PR Bank Accounts")
            {
                DataItemLink = "Bank Code" = field("Bank Code");
                column(ReportForNavId_13; 13) { }
                column(BankName_PRBankAccounts; "PR Bank Accounts"."Bank Name") { }
            }

            trigger OnAfterGetRecord()
            begin
                /*{
                HREmp2.RESET;
                HREmp2.SETRANGE(HREmp2."No.","Bank Payment List"."Staff No.");
                //mm commentedd below on 21st nov 2018
                HREmp2.SETRANGE(HREmp2.Status,HREmp2.Status::Active);
                IF NOT HREmp2.FIND('-') THEN
                CurrReport.SKIP;
                 }*/

                Num += 1;

            end;

            trigger OnPreDataItem()
            begin
                if PeriodFilter = '' then
                    "Bank Payment List".SetFilter("Bank Payment List"."Payroll Period", PeriodFilter);

                if "Bank Payment List".Amount = 0 then
                    CurrReport.Skip();




                //ROUND("HR Bank Summary".Amount,1'>');
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        PeriodFilter := "Bank Payment List".GetFilter("Bank Payment List"."Payroll Period");
        DebitValueDate := '';

        //IF "Bank Payment List".GETFILTER("Bank Payment List"."Bank Type") = '' THEN ERROR('Please select Bank Type');

        if PeriodFilter = '' then begin
            PRPayrollPeriods.Reset();
            // PRPayrollPeriods.SETRANGE(PRPayrollPeriods.Closed,FALSE);
            if PRPayrollPeriods.Find('-') then;
            // Cur_PNAME:=PRPayrollPeriods."Period Name";
        end else begin
            PRPayrollPeriods.Reset();
            // PRPayrollPeriods.SETRANGE(PRPayrollPeriods.Closed,FALSE);
            if PRPayrollPeriods.Find('-') then;
            // Cur_PNAME:=PRPayrollPeriods."Period Name";
        end;

        DebitValueDate := Format(Date2DMY(Today, 3)); //Year 12-05-88
        DebitValueDate += Format(Date2DMY(Today, 2)); //Month
        DebitValueDate += Format(Date2DMY(Today, 1)); //Day



        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        CompInfo: Record "Company Information";
        Num: Decimal;
        StaffName: Text;
        HREmp: Record "prSalary Card Casual";
        PeriodName: Text;
        Cur_PNAME: Text;
        PeriodFilter: Text;
        PRPayrollPeriods: Record "PR Bank Branches";
        DebitValueDate: Text;
        Rcount: Integer;
        HREmp2: Record "HR Employees";
}
