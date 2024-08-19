#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193508 "prPaye Schedule 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prPaye Schedule 2.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Paye Payroll Schedule';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            RequestFilterFields = "Period Filter", "Employee Code";
            column(ReportForNavId_6207; 6207) { }
            column(USERID; UserId) { }
            column(TODAY; Today) { }
            column(PeriodName; PeriodName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(companyinfo_Picture; companyinfo.Picture) { }
            column(prSalary_Card__prSalary_Card___Employee_Code_; "PR Salary Card"."Employee Code") { }
            column(EmployeeName; EmployeeName) { }
            column(PinNumber; PinNumber) { }
            column(PayeAmount; PayeAmount) { }
            column(TaxablePay; TaxablePay) { }
            column(TotTaxablePay; TotTaxablePay) { }
            column(TotPayeAmount; TotPayeAmount) { }
            column(User_Name_Caption; User_Name_CaptionLbl) { }
            column(Print_Date_Caption; Print_Date_CaptionLbl) { }
            column(P_A_Y_E_ScheduleCaption; P_A_Y_E_ScheduleCaptionLbl) { }
            column(Period_Caption; Period_CaptionLbl) { }
            column(Page_No_Caption; Page_No_CaptionLbl) { }
            column(No_Caption; No_CaptionLbl) { }
            column(Employee_NameCaption; Employee_NameCaptionLbl) { }
            column(PIN_Number_Caption; PIN_Number_CaptionLbl) { }
            column(Paye_Amount_Caption; Paye_Amount_CaptionLbl) { }
            column(Gross_Pay_Caption; Gross_Pay_CaptionLbl) { }
            column(Prepared_by_______________________________________Date_________________Caption; Prepared_by_______________________________________Date_________________CaptionLbl) { }
            column(Checked_by________________________________________Date_________________Caption; Checked_by________________________________________Date_________________CaptionLbl) { }
            column(Totals_Caption; Totals_CaptionLbl) { }
            column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl) { }
            column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl) { }

            trigger OnAfterGetRecord()
            begin

                objEmp.Reset();
                objEmp.SetRange(objEmp."No.", "PR Salary Card"."Employee Code");
                if objEmp.Find('-') then
                    EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";

                PinNumber := objEmp."PIN No.";

                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "PR Salary Card"."Employee Code");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                //PeriodTrans.SETFILTER(PeriodTrans."Group Order",'=6|=7'); //Taxable Pay
                //PeriodTrans.SETFILTER(PeriodTrans."Sub Group Order",'=5|=3'); //Paye Amount

                TaxablePay := 0;
                PayeAmount := 0;
                if PeriodTrans.Find('-') then
                    repeat
                        //GROSS Pay -  BY BKK
                        if (PeriodTrans."Transaction Code" = 'GPAY') then
                            TaxablePay := PeriodTrans.Amount;

                        //GrpOrder 7, SubGrpOrder 3 = PAYE
                        if (PeriodTrans."Group Order" = 7) and (PeriodTrans."Sub Group Order" = 3) then
                            PayeAmount := PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;

                if PayeAmount <= 0 then
                    CurrReport.Skip();
                TotTaxablePay := TotTaxablePay + TaxablePay;
                TotPayeAmount := TotPayeAmount + PayeAmount;
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
        PeriodFilter := "PR Salary Card".GetFilter("Period Filter");
        if PeriodFilter = '' then
            Error('You must specify the period filter');

        SelectedPeriod := "PR Salary Card".GetRangeMin("Period Filter");
        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then
            PeriodName := objPeriod."Period Name";


        companyinfo.Get();
        companyinfo.CalcFields(companyinfo.Picture);
    end;

    var
        PeriodTrans: Record "PR Period Transactions";
        PayeAmount: Decimal;
        TotPayeAmount: Decimal;
        TaxablePay: Decimal;
        TotTaxablePay: Decimal;
        EmployeeName: Text[100];
        PinNumber: Text[30];
        objPeriod: Record "PR Payroll Periods";
        objEmp: Record "HR Employees";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        companyinfo: Record "Company Information";
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        P_A_Y_E_ScheduleCaptionLbl: Label 'P.A.Y.E Schedule';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        No_CaptionLbl: Label 'No:';
        Employee_NameCaptionLbl: Label 'Employee Name';
        PIN_Number_CaptionLbl: Label 'PIN Number:';
        Paye_Amount_CaptionLbl: Label 'Paye Amount:';
        Gross_Pay_CaptionLbl: Label 'Gross Pay:';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Totals_CaptionLbl: Label 'Totals:';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
}
