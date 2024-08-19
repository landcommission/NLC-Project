#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193741 "By Products Housing Levy"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/By Products Housing Levy.rdlc';
    Caption = 'By Products Housing Levy';
    ApplicationArea = All;

    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = sorting("Group Order", "Transaction Code", "Period Month", "Period Year") where("Transaction Code" = const('HOUSING LEVY'));
            RequestFilterFields = "Payroll Period";
            column(ReportForNavId_7769; 7769) { }
            column(GETFILTERS; "PR Period Transactions".GetFilters) { }
            column(USERID; UserId) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(prPeriod_Transactions__prPeriod_Transactions___Transaction_Name_; "PR Period Transactions"."Transaction Name") { }
            column(prPeriod_Transactions_Amount; "PR Period Transactions".Amount) { }
            column(prPeriod_Transactions_Balance; "PR Period Transactions".Balance) { }
            column(prPeriod_Transactions__Employee_Code_; "PR Period Transactions"."Employee Code") { }
            column(strEmpName; strEmpName) { }
            column(prPeriod_Transactions__prPeriod_Transactions__Membership; "PR Period Transactions".Membership) { }
            column(prPeriod_Transactions_Amount_Control1102755038; "PR Period Transactions".Amount) { }
            column(prPeriod_Transactions_Balance_Control1102755039; "PR Period Transactions".Balance) { }
            column(prPeriod_Transactions__Transaction_Name_; "PR Period Transactions"."Transaction Name") { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Transactions___DetailedCaption; Transactions___DetailedCaptionLbl) { }
            column(Period_AmountCaption; Period_AmountCaptionLbl) { }
            column(BalanceCaption; BalanceCaptionLbl) { }
            column(Employee_No_Caption; Employee_No_CaptionLbl) { }
            column(Employee_Name_Caption; Employee_Name_CaptionLbl) { }
            column(prPeriod_Transactions_Transaction_Code; "PR Period Transactions"."Transaction Code") { }
            column(prPeriod_Transactions_Period_Month; "PR Period Transactions"."Period Month") { }
            column(prPeriod_Transactions_Period_Year; "PR Period Transactions"."Period Year") { }
            column(prPeriod_Transactions_Reference_No; "PR Period Transactions"."Reference No") { }
            column(prPeriod_Transactions_Group_Order; "PR Period Transactions"."Group Order") { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(PayrollCode_PRPeriodTransactions; "PR Period Transactions"."Payroll Code") { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(EmployeeID; EmployeeID) { }
            column(PeriodMonth_PRPeriodTransactions; "PR Period Transactions"."Period Month") { }
            column(PeriodYear_PRPeriodTransactions; "PR Period Transactions"."Period Year") { }
            column(Rcount; Rcount) { }
            column(NSSF; NSSF) { }
            column(DOB; DOB) { }
            column(PIN; PIN) { }
            column(IDNO; IDNO) { }
            column(GrossPayRec; GrossPayRec) { }
            column(GPAY; GPAY) { }
            column(HPAY; HPAY) { }
            dataitem("PR Transaction Codes"; "PR Transaction Codes")
            {
                DataItemLink = "Transaction Code" = field("Transaction Code");
                column(ReportForNavId_2; 2) { }
                column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code") { }
            }

            trigger OnAfterGetRecord()
            begin
                Rcount := Rcount + 1;
                //Get the staff details (header)
                objEmp.SetRange(objEmp."No.", "PR Period Transactions"."Employee Code");
                if objEmp.Find('-') then
                    strEmpName := objEmp."Last Name" + ' ' + objEmp."First Name" + ' ' + objEmp."Middle Name";

                "PR Period Transactions".SetRange("Payroll Period", SelectedPeriod);
                //"prPeriod Transactions".SETFILTER("Group Order",'=7|=8');

                if ("PR Period Transactions".Amount <= 0) or ("PR Period Transactions"."Transaction Code" = 'TOT-DED') or ("PR Period Transactions"."Group Order" = 1) then begin
                    GrandTotal := GrandTotal + 0;
                    CurrReport.Skip();
                end;

                GrandTotal := GrandTotal + "PR Period Transactions".Amount;
                GrandBalance := GrandBalance + "PR Period Transactions".Balance;

                objEmp.Reset();
                objEmp.SetRange(objEmp."No.", "PR Period Transactions"."Employee Code");
                if objEmp.Find('-') then begin
                    Employee_Name := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    EmployeeID := objEmp."ID Number";
                    NSSF := objEmp."NSSF No.";
                    DOB := objEmp."Date Of Birth";
                    PIN := objEmp."PIN No.";
                    IDNO := objEmp."ID Number";
                end;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := "PR Period Transactions".FieldNo("PR Period Transactions"."Period Year");

                UserSetup.Get(UserId);
                "PR Period Transactions".SetRange("PR Period Transactions"."Payroll Code", UserSetup."Payroll Code");
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
        SelectedPeriod := "PR Period Transactions".GetRangeMin("Payroll Period");
        objPeriod.Reset();
        objPeriod.SetRange(objPeriod."Date Opened", SelectedPeriod);
        if objPeriod.Find('-') then
            PeriodName := objPeriod."Period Name";


        //TransFilter := transcode.GETFILTER(transcode."Group Code");
        //PayDateFilter := "Payments Header".GETFILTER("Payments Header"."Date Posted");



        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        PeriodTrans: Record "PR Period Transactions";
        GroupOrder: Label '3';
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        GrandTotal: Decimal;
        strEmpName: Text[100];
        objEmp: Record "HR Employees";
        GrandBalance: Decimal;
        CompanyInfo: Record "Company Information";
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Transactions___DetailedCaptionLbl: Label 'Transactions - Detailed';
        Period_AmountCaptionLbl: Label 'Period Amount';
        BalanceCaptionLbl: Label 'Balance';
        Employee_No_CaptionLbl: Label 'Employee No.';
        Employee_Name_CaptionLbl: Label 'Employee Name:';
        Employee_Name: Text[250];
        UserSetup: Record "User Setup";
        TransFilter: Text[100];
        transcode: Record "PR Transaction Codes";
        EmployeeID: Code[10];
        Rcount: Integer;
        NSSF: Code[20];
        DOB: Date;
        PIN: Code[100];
        GrossPayRec: Decimal;
        IDNO: Text;
        HPAY: Integer;
        GPAY: Decimal;
}
