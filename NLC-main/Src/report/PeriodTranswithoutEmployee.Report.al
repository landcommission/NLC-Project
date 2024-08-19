#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193626 "Period Trans without Employee"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Period Trans without Employee.rdlc';
    ApplicationArea = All;
    Caption = 'Period Trans without Employee';
    dataset
    {
        dataitem("Cshmgt PV Audit"; "Cshmgt PV Audit")
        {
            DataItemTableView = sorting("PV No.", "PV Date");
            //RequestFilterFields = Field13;
            column(ReportForNavId_7769; 7769) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; UserId) { }
            column(prPeriod_Transactions__Employee_Code_; "Cshmgt PV Audit"."PV No.") { }
            column(prPeriod_Transactions__Transaction_Code_; "Cshmgt PV Audit"."PV Date") { }
            column(prPeriod_Transactions__Transaction_Name_; "Cshmgt PV Audit".Status) { }
            column(prPeriod_Transactions_Amount; "Cshmgt PV Audit"."Status Date") { }
            column(prPeriod_Transactions_Balance; "Cshmgt PV Audit"."Status Time") { }
            column(prPeriod_TransactionsCaption; prPeriod_TransactionsCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(prPeriod_Transactions__Employee_Code_Caption; "Cshmgt PV Audit".FieldCaption("Cshmgt PV Audit"."PV No.")) { }
            column(prPeriod_Transactions__Transaction_Code_Caption; "Cshmgt PV Audit".FieldCaption("Cshmgt PV Audit"."PV Date")) { }
            column(prPeriod_Transactions__Transaction_Name_Caption; "Cshmgt PV Audit".FieldCaption("Cshmgt PV Audit".Status)) { }
            column(prPeriod_Transactions_AmountCaption; "Cshmgt PV Audit".FieldCaption("Cshmgt PV Audit"."Status Date")) { }
            column(prPeriod_Transactions_BalanceCaption; "Cshmgt PV Audit".FieldCaption("Cshmgt PV Audit"."Status Time")) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        Employee: Record "FA Budget Entry";
        prPeriod_TransactionsCaptionLbl: Label 'prPeriod Transactions';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
