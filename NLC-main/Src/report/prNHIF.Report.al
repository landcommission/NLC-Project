#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193510 prNHIF
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prNHIF.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'prNHIF';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.";
            //PrintOnlyIfDetail=true;
            column(ReportForNavId_8631; 8631) { }
            column(USERID; UserId) { }
            column(TODAY; Today) { }
            column(PeriodName; PeriodName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(nAME; CompanyInfo.Name) { }
            column(NHIFNo; NHIFNo) { }
            column(Address; Address) { }
            column(nhif; CompanyInfo."NHIF Number") { }
            column(PeriodName_Control1102760003; PeriodName) { }
            column(TelNo; TelNo) { }
            column(HR_Employee__No__; "No.") { }
            column(HR_Employee__NHIF_No__; "NHIF No.") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(NhifAmount; NhifAmount) { }
            column(HR_Employee__Last_Name_; "Last Name") { }
            column(EmployeeName; EmployeeName) { }
            column(TotNhifAmount; TotNhifAmount) { }
            column(NATIONAL_HOSPITAL_INSURANCE_FUNDCaption; NATIONAL_HOSPITAL_INSURANCE_FUNDCaptionLbl) { }
            column(User_Name_Caption; User_Name_CaptionLbl) { }
            column(Print_Date_Caption; Print_Date_CaptionLbl) { }
            column(Period_Caption; Period_CaptionLbl) { }
            column(Page_No_Caption; Page_No_CaptionLbl) { }
            column(EMPLOYER_NO_Caption; EMPLOYER_NO_CaptionLbl) { }
            column(ADDRESS_Caption; ADDRESS_CaptionLbl) { }
            column(PERIOD_Caption_Control1102755031; PERIOD_Caption_Control1102755031Lbl) { }
            column(TEL_NO_Caption; TEL_NO_CaptionLbl) { }
            column(HR_Employee__No__Caption; FieldCaption("No.")) { }
            column(HR_Employee__ID_Number_Caption; FieldCaption("ID Number")) { }
            column(AmountCaption; AmountCaptionLbl) { }
            column(LAST_NAMECaption; LAST_NAMECaptionLbl) { }
            column(OTHER_NAMESCaption; OTHER_NAMESCaptionLbl) { }
            column(HR_Employee__NHIF_No__Caption; FieldCaption("NHIF No.")) { }
            column(prepared; Preparedby) { }
            column(checked; Checkedby) { }
            column(authorized; Authorizedby) { }
            column(approved; Approvedby) { }
            column(Total_NHIF_Caption; Total_NHIF_CaptionLbl) { }
            column(Counter; Counter) { }
            column(ID; ID) { }

            trigger OnAfterGetRecord()
            begin
                CoInfo.Get();
                //NHIFNo:=CoInfo."N.H.I.F No";
                //Address:=CoInfo.Address ;
                //TelNo:=CoInfo."Phone No.";

                //Counter:=Counter+1;
                EmployeeName := "First Name" + ' ' + "Middle Name";
                ID := "HR Employees"."ID Number";

                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "No.");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SetFilter(PeriodTrans."Group Order", '=7');
                PeriodTrans.SetFilter(PeriodTrans."Sub Group Order", '=2');
                PeriodTrans.SetCurrentKey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                PeriodTrans."Group Order", PeriodTrans."Sub Group Order");
                NhifAmount := 0;
                //mm

                //IF Status<>Status::Active THEN
                //CurrReport.SKIP;

                if PeriodTrans.Find('-') then
                    NhifAmount := PeriodTrans.Amount;

                if NhifAmount <= 0 then
                    CurrReport.Skip();
                TotNhifAmount := TotNhifAmount + NhifAmount;

                if PrintToExcel then
;
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
                if PrintToExcel then
;
            end;
        }
        /* dataitem("PR Period Transactions";"PR Period Transactions")
        {
            RequestFilterFields = "Payroll Period";
            column(ReportForNavId_8028; 8028)
            {
            }
        } */
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

    trigger OnPostReport()
    begin
        if PrintToExcel then
;
    end;

    trigger OnPreReport()
    begin


        if SelectedPeriod = 0D then
            Error('You must specify the period filter');
        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then
            PeriodName := objPeriod."Period Name";

        if PrintToExcel then
;
    end;

    var
        PeriodTrans: Record "PR Period Transactions";
        NhifAmount: Decimal;
        TotNhifAmount: Decimal;
        EmployeeName: Text[100];
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        NHIFNo: Text[100];
        NSSFNo: Code[100];
        PINNo: Code[100];
        Address: Text[100];
        TelNo: Text[100];
        ExcelBuf: Record "Excel Buffer" temporary;
        GLFilter: Text[250];
        PeriodText: Text[30];
        PrintToExcel: Boolean;
        CurrFormat: Text[30];
        Text000: Label 'Period: %1';
        Text001: Label 'NHIF';
        Text002: Label 'NHIF';
        Text003: Label 'Names';
        Text004: Label 'Amount';
        Text005: Label 'Company Name';
        Text006: Label 'Report No.';
        Text007: Label 'Report Name';
        Text008: Label 'User ID';
        Text009: Label 'Date';
        Text010: Label 'G/L Filter';
        Text011: Label 'Period Filter';
        Text012: Label 'ID Number';
        Text013: Label 'NHIF No.';
        Text014: Label 'Total Amount';
        CoInfo: Record "Company Information";
        CompanyInfo: Record "Company Information";
        NATIONAL_HOSPITAL_INSURANCE_FUNDCaptionLbl: Label 'NATIONAL HOSPITAL INSURANCE FUND';
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        EMPLOYER_NO_CaptionLbl: Label 'EMPLOYER NO:';
        ADDRESS_CaptionLbl: Label 'ADDRESS:';
        PERIOD_Caption_Control1102755031Lbl: Label 'PERIOD:';
        TEL_NO_CaptionLbl: Label 'TEL NO:';
        AmountCaptionLbl: Label 'Amount';
        LAST_NAMECaptionLbl: Label 'LAST NAME';
        OTHER_NAMESCaptionLbl: Label 'OTHER NAMES';
        Total_NHIF_CaptionLbl: Label 'Total NHIF:';
        Preparedby: Label 'Prepared By: ...............................................Date:..............................................';
        Checkedby: Label 'Checked By :................................................Date:..............................................';
        Authorizedby: Label 'Authorized By:..............................................Date:..............................................';
        Approvedby: Label 'Approved By:...............................................Date:..............................................';
        Counter: Integer;
        Scheme: Text[30];
        ContractType: Text[30];
        ID: Code[10];
}

