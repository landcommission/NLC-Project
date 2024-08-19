#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193456 "PR Bank Payments"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Bank Payments.rdlc';
    ApplicationArea = All;
    Caption = 'PR Bank Payments';
    dataset
    {
        dataitem("Bank Payment List"; "Bank Payment List")
        {
            CalcFields = "Department Code";
            RequestFilterFields = "Bank Code", "Branch Code", "Payroll Period", "Staff No.";
            column(ReportForNavId_1; 1) { }
            column(BankCode_HRBankSummary; "Bank Payment List"."Bank Code") { }
            column(StaffNo_HRBankSummary; "Bank Payment List"."Staff No.") { }
            column(BranchCode_HRBankSummary; "Bank Payment List"."Branch Code") { }
            column(PayrollPeriod_HRBankSummary; "Bank Payment List"."Payroll Period") { }
            column(Amount_HRBankSummary; "Bank Payment List".Amount) { }
            column(BankName_HRBankSummary; "Bank Payment List"."Bank Name") { }
            column(BranchName_HRBankSummary; "Bank Payment List"."Branch Name") { }
            column(StaffName_HRBankSummary; "Bank Payment List"."Staff Name") { }
            column(ACNumber_HRBankSummary; "Bank Payment List"."A/C Number") { }
            column(DepartmentCode_BankPaymentList; "Bank Payment List"."Department Code") { }
            column(PeriodName; PeriodName) { }
            column(Cur_PNAME; Cur_PNAME) { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(COMPANYNAME; CompanyName) { }
            column(PrintDate; PrintDate) { }
            column(DeptName; DeptName) { }

            trigger OnAfterGetRecord()
            begin
                HREmp.Get("Bank Payment List"."Staff No.");
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                if HREmp.Find('-') then begin



                    DeptName := '';

                    DimVal.Reset();
                    DimVal.SetRange(DimVal.Code, "Bank Payment List"."Department Code");
                    //DimVal.SETRANGE(DimVal."Global Dimension No.",1);
                    if DimVal.Find('-') then
                        DeptName := UpperCase(DimVal.Name);
                end
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
        CompInfo.Reset();
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);


        PeriodFilter := "Bank Payment List".GetFilter("Bank Payment List"."Payroll Period");
        PrintDate := Today;

        if PeriodFilter = '' then
            Error('Please Specify "Payroll Period" on the Request Page');
        SelectedPeriod := "Bank Payment List".GetRangeMin("Payroll Period");

        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get(SelectedPeriod) then
            PeriodName := PRPayrollPeriods."Period Name";
    end;

    var
        CompInfo: Record "Company Information";
        Num: Decimal;
        StaffName: Text;
        HREmp: Record "HR Employees";
        PeriodName: Text;
        Cur_PNAME: Text;
        PeriodFilter: Text;
        PRPayrollPeriods: Record "PR Payroll Periods";
        DebitValueDate: Text;
        PrintDate: Date;
        SelectedPeriod: Date;
        DeptName: Text;
        DimVal: Record "Dimension Value";
}
