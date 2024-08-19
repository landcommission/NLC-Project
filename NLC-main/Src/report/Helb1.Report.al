report 52193574 "Helb 1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Products NSSF.rdlc';
    ApplicationArea = All;
    Caption = 'Helb 1';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = sorting("Group Order", "Transaction Code", "Period Month", "Period Year");
            RequestFilterFields = "Payroll Period", "Transaction Code";
            column(GETFILTERS; GetFilters) { }
            column(USERID; UserId) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(prPeriod_Transactions__prPeriod_Transactions___Transaction_Name_; "PR Period Transactions"."Transaction Name") { }
            column(prPeriod_Transactions_Amount; Amount) { }
            column(prPeriod_Transactions_Balance; Balance) { }
            column(prPeriod_Transactions__Employee_Code_; "Employee Code") { }
            column(strEmpName; strEmpName) { }
            column(prPeriod_Transactions__prPeriod_Transactions__Membership; "PR Period Transactions".Membership) { }
            column(prPeriod_Transactions_Amount_Control1102755038; Amount) { }
            column(prPeriod_Transactions_Balance_Control1102755039; Balance) { }
            column(prPeriod_Transactions__Transaction_Name_; "Transaction Name") { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Transactions___DetailedCaption; Transactions___DetailedCaptionLbl) { }
            column(Period_AmountCaption; Period_AmountCaptionLbl) { }
            column(BalanceCaption; BalanceCaptionLbl) { }
            column(Employee_No_Caption; Employee_No_CaptionLbl) { }
            column(Employee_Name_Caption; Employee_Name_CaptionLbl) { }
            column(prPeriod_Transactions_Transaction_Code; "Transaction Code") { }
            column(prPeriod_Transactions_Period_Month; "Period Month") { }
            column(prPeriod_Transactions_Period_Year; "Period Year") { }
            column(prPeriod_Transactions_Reference_No; "Reference No") { }
            column(prPeriod_Transactions_Group_Order; "Group Order") { }
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
            dataitem("PR Transaction Codes"; "PR Transaction Codes")
            {
                DataItemLink = "Transaction Code" = field("Transaction Code");
                column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code") { }
            }

            trigger OnAfterGetRecord()
            begin
                Rcount := Rcount + 1;
                //Get the staff details (header)
                objEmp.SetRange(objEmp."No.", "Employee Code");
                if objEmp.Find('-') then
                    strEmpName := objEmp."Last Name" + ' ' + objEmp."First Name" + ' ' + objEmp."Middle Name";

                "PR Period Transactions".SetRange("Payroll Period", SelectedPeriod);
                //"prPeriod Transactions".SETFILTER("Group Order",'=7|=8');

                if (Amount <= 0) or ("PR Period Transactions"."Transaction Code" = 'TOT-DED') or ("PR Period Transactions"."Group Order" = 1) then begin
                    GrandTotal := GrandTotal + 0;
                    CurrReport.Skip();
                end;

                GrandTotal := GrandTotal + Amount;
                GrandBalance := GrandBalance + Balance;

                objEmp.Reset();
                objEmp.SetRange(objEmp."No.", "PR Period Transactions"."Employee Code");
                if objEmp.Find('-') then begin
                    Employee_Name := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    EmployeeID := objEmp."ID Number";
                    NSSF := objEmp."NSSF No.";
                    DOB := objEmp."Date Of Birth";
                    PIN := objEmp."PIN No.";
                end;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Period Year");

                UserSetup.Get(UserId);
                SetRange("Payroll Code", UserSetup."Payroll Code");
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
        EmployeeID: Code[10];
        Rcount: Integer;
        NSSF: Code[20];
        DOB: Date;
        PIN: Code[100];
}

