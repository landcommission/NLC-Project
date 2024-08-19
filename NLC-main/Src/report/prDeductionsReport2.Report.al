#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193512 "prDeductions Report2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prDeductions Report2.rdlc';
    ApplicationArea = All;
    Caption = 'prDeductions Report2';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = sorting("Group Order", "Transaction Code", "Period Month", "Period Year");
            RequestFilterFields = "Payroll Period", "Transaction Code";
            column(ReportForNavId_7769; 7769) { }
            column(USERID; UserId) { }
            column(TODAY; Today) { }
            column(PeriodName; PeriodName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(prPeriod_Transactions_Amount; "PR Period Transactions".Amount) { }
            column(prPeriod_Transactions__Transaction_Name_; "PR Period Transactions"."Transaction Name") { }
            column(GrandTotal; GrandTotal) { }
            column(Deductions_Summary_ReportCaption; Deductions_Summary_ReportCaptionLbl) { }
            column(User_Name_Caption; User_Name_CaptionLbl) { }
            column(Print_Date_Caption; Print_Date_CaptionLbl) { }
            column(Period_Caption; Period_CaptionLbl) { }
            column(Page_No_Caption; Page_No_CaptionLbl) { }
            column(Transaction_Name_Caption; Transaction_Name_CaptionLbl) { }
            column(Period_Amount_Caption; Period_Amount_CaptionLbl) { }
            column(Prepared_by_______________________________________Date_________________Caption; Prepared_by_______________________________________Date_________________CaptionLbl) { }
            column(Checked_by________________________________________Date_________________Caption; Checked_by________________________________________Date_________________CaptionLbl) { }
            column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl) { }
            column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl) { }
            column(Grand_Total_Caption; Grand_Total_CaptionLbl) { }
            column(prPeriod_Transactions_Employee_Code; "PR Period Transactions"."Employee Code") { }
            column(prPeriod_Transactions_Transaction_Code; "PR Period Transactions"."Transaction Code") { }
            column(prPeriod_Transactions_Period_Month; "PR Period Transactions"."Period Month") { }
            column(prPeriod_Transactions_Period_Year; "PR Period Transactions"."Period Year") { }
            column(prPeriod_Transactions_Membership; "PR Period Transactions".Membership) { }
            column(prPeriod_Transactions_Reference_No; "PR Period Transactions"."Reference No") { }
            column(prPeriod_Transactions_Group_Order; "PR Period Transactions"."Group Order") { }

            trigger OnAfterGetRecord()
            begin
                //Get the staff details (header)
                objEmp.SetRange(objEmp."No.", "PR Period Transactions"."Employee Code");
                if objEmp.Find('-') then
                    strEmpName := objEmp."Last Name" + ' ' + objEmp."First Name" + ' ' + objEmp."Middle Name";

                if ("PR Period Transactions".Amount <= 0) or ("PR Period Transactions"."Transaction Code" = 'TOT-DED') or ("PR Period Transactions"."Group Order" = 1) then begin
                    GrandTotal := GrandTotal + 0;
                    CurrReport.Skip();
                end;

                GrandTotal := GrandTotal + "PR Period Transactions".Amount;
                GrandBalance := GrandBalance + "PR Period Transactions".Balance;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := "PR Period Transactions".FieldNo("PR Period Transactions"."Period Year");
                "PR Period Transactions".SetRange("Payroll Period", SelectedPeriod);
                "PR Period Transactions".SetFilter("Group Order", '=7|=8');
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
        Deductions_Summary_ReportCaptionLbl: Label 'Deductions Summary Report';
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        Transaction_Name_CaptionLbl: Label 'Transaction Name:';
        Period_Amount_CaptionLbl: Label 'Period Amount:';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Grand_Total_CaptionLbl: Label 'Grand Total:';
}
