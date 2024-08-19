#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193505 prNSSF
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prNSSF.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'prNSSF';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            RequestFilterFields = "Employee Code";
            column(ReportForNavId_6207; 6207) { }
            column(USERID; UserId) { }
            column(TODAY; Today) { }
            column(PeriodName; PeriodName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(Name; CompanyInfo.Name) { }
            column(Nssf; CompanyInfo."NSSF Number") { }
            column(COMPANYNAME; CompanyName) { }
            column(PeriodName_Control1102756011; PeriodName) { }
            column(TotalAmount; TotalAmount) { }
            column(Volume_Amount_; "Volume Amount") { }
            column(IDNumber; IDNumber) { }
            column(EmployeeName; EmployeeName) { }
            column(prSalary_Card__prSalary_Card___Employee_Code_; "PR Salary Card"."Employee Code") { }
            column(NssfAmount_2; NssfAmount / 2) { }
            column(NssfNo; NssfNo) { }
            column(TotVolNssf; TotVolNssf) { }
            column(VolNssf; VolNssf) { }
            column(TotalNssfAmount; TotalNssfAmount) { }
            column(NssfAmount_2_Control1102756008; NssfAmount / 2) { }
            column(TotNssfAmount_2; TotNssfAmount / 2) { }
            column(totTotalAmount; totTotalAmount) { }
            column(TotVolume_Amount_; "TotVolume Amount") { }
            column(TotNssfAmount_2_Control1102756015; TotNssfAmount / 2) { }
            column(NATIONAL_SOCIAL_SECURITY_FUNDCaption; NATIONAL_SOCIAL_SECURITY_FUNDCaptionLbl) { }
            column(User_Name_Caption; User_Name_CaptionLbl) { }
            column(Print_Date_Caption; Print_Date_CaptionLbl) { }
            column(Period_Caption; Period_CaptionLbl) { }
            column(Page_No_Caption; Page_No_CaptionLbl) { }
            column(PERIOD_Caption_Control1102755031; PERIOD_Caption_Control1102755031Lbl) { }
            column(EMPLOYER_NO_Caption; EMPLOYER_NO_CaptionLbl) { }
            column(EMPLOYER_NAME_Caption; EMPLOYER_NAME_CaptionLbl) { }
            column(Payroll_No_Caption; Payroll_No_CaptionLbl) { }
            column(Employee_NameCaption; Employee_NameCaptionLbl) { }
            column(NSSF_No_Caption; NSSF_No_CaptionLbl) { }
            column(ID_Number_Caption; ID_Number_CaptionLbl) { }
            column(Vol_AmountCaption; Vol_AmountCaptionLbl) { }
            column(Total_AmountCaption; Total_AmountCaptionLbl) { }
            column(Employee_AmountCaption; Employee_AmountCaptionLbl) { }
            column(Employer_AmountCaption; Employer_AmountCaptionLbl) { }
            column(Total_Amounts_Caption; Total_Amounts_CaptionLbl) { }
            column(Prepared_by_______________________________________Date_________________Caption; Prepared_by_______________________________________Date_________________CaptionLbl) { }
            column(Checked_by________________________________________Date_________________Caption; Checked_by________________________________________Date_________________CaptionLbl) { }
            column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl) { }
            column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl) { }

            trigger OnAfterGetRecord()
            begin

                objEmp.Reset();
                objEmp.SetRange(objEmp."No.", "Employee Code");
                objEmp.SetRange(objEmp.Status, objEmp.Status::Active);
                if objEmp.Find('-') then;
                EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                NssfNo := objEmp."NSSF No.";
                IDNumber := objEmp."ID Number";

                //Volume Amount****************************************************************************
                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "Employee Code");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SetFilter(PeriodTrans."Transaction Code", Format(427));  //Nssf Code
                PeriodTrans.SetCurrentKey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                PeriodTrans."Group Order", PeriodTrans."Sub Group Order");

                "Volume Amount" := 0;
                if PeriodTrans.Find('-') then
                    "Volume Amount" := PeriodTrans.Amount;

                "TotVolume Amount" := "TotVolume Amount" + "Volume Amount";


                //Standard Amount**************************************************************************
                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "Employee Code");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SetFilter(PeriodTrans."Group Order", '=7');
                PeriodTrans.SetFilter(PeriodTrans."Sub Group Order", '=1');
                PeriodTrans.SetCurrentKey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                PeriodTrans."Group Order", PeriodTrans."Sub Group Order");

                NssfAmount := 0;
                if PeriodTrans.Find('-') then
                    NssfAmount := PeriodTrans.Amount + PeriodTrans.Amount;

                //Standard Amount**************************************************************************
                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "Employee Code");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SetFilter(PeriodTrans."Transaction Code", 'D110');
                //PeriodTrans.SETFILTER(PeriodTrans."Sub Group Order",'=1');
                PeriodTrans.SetCurrentKey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year");
                //PeriodTrans."Group Order",PeriodTrans."Sub Group Order");

                VolNssf := 0;
                TotVolNssf := 0;

                if PeriodTrans.Find('-') then
                    VolNssf := PeriodTrans.Amount;//+PeriodTrans.Amount;






                //Total Amount=NssfAmount+Volume Amount**************************************************
                TotalAmount := NssfAmount + "Volume Amount";
                TotVolNssf := TotVolNssf + VolNssf;

                //Add Employer plus employee contribution Plus Voluntary
                TotalNssfAmount := TotalAmount + VolNssf;


                //Summation Total Amount=****************************************************************
                totTotalAmount := totTotalAmount + TotalAmount;

                if NssfAmount <= 0 then
                    CurrReport.Skip();
                TotNssfAmount := TotNssfAmount + NssfAmount;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field(SelectedPeriod; SelectedPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'SelectedPeriod';
                    TableRelation = "PR Payroll Periods";
                    ToolTip = 'Specifies the value of the SelectedPeriod field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        /*
        PeriodFilter:="prSalary Card".GETFILTER("Period Filter");
        IF PeriodFilter='' THEN ERROR('You must specify the period filter');

        SelectedPeriod:="prSalary Card".GETRANGEMIN("Period Filter");
        objPeriod.RESET;
        IF objPeriod.GET(SelectedPeriod) THEN PeriodName:=objPeriod."Period Name";
        */

        if SelectedPeriod = 0D then
            Error('You must specify the period filter');
        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then
            PeriodName := objPeriod."Period Name";


        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);

    end;

    var
        PeriodTrans: Record "PR Period Transactions";
        NssfAmount: Decimal;
        TotNssfAmount: Decimal;
        objEmp: Record "HR Employees";
        EmployeeName: Text[150];
        NssfNo: Text[30];
        IDNumber: Code[10];
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        "Volume Amount": Decimal;
        "TotVolume Amount": Decimal;
        TotalAmount: Decimal;
        totTotalAmount: Decimal;
        CompanyInfo: Record "Company Information";
        NATIONAL_SOCIAL_SECURITY_FUNDCaptionLbl: Label 'NATIONAL SOCIAL SECURITY FUND';
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        PERIOD_Caption_Control1102755031Lbl: Label 'PERIOD:';
        EMPLOYER_NO_CaptionLbl: Label 'EMPLOYER NO:';
        EMPLOYER_NAME_CaptionLbl: Label 'EMPLOYER NAME:';
        Payroll_No_CaptionLbl: Label 'Payroll No:';
        Employee_NameCaptionLbl: Label 'Employee Name';
        NSSF_No_CaptionLbl: Label 'NSSF No:';
        ID_Number_CaptionLbl: Label 'ID Number:';
        Vol_AmountCaptionLbl: Label 'Vol Amount';
        Total_AmountCaptionLbl: Label 'Total Amount';
        Employee_AmountCaptionLbl: Label 'Employee Amount';
        Employer_AmountCaptionLbl: Label 'Employer Amount';
        Total_Amounts_CaptionLbl: Label 'Total Amounts:';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        VolNssf: Decimal;
        TotVolNssf: Decimal;
        TotalNssfAmount: Decimal;
        GrandTotalNssfAmount: Decimal;
}

