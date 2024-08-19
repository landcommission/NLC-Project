#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193480 "Bank Total NetPay"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank Total NetPay.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bank Total NetPay';
    dataset
    {
        dataitem("Bank Payment List"; "Bank Payment List")
        {
            RequestFilterFields = "Bank Code", "Payroll Period";
            column(ReportForNavId_1; 1) { }
            column(BankCode_BankPaymentList; "Bank Payment List"."Bank Code") { }
            column(PayrollPeriod_BankPaymentList; "Bank Payment List"."Payroll Period") { }
            column(Amount_BankPaymentList; "Bank Payment List".Amount) { }
            column(TransactionCode_BankPaymentList; "Bank Payment List"."Transaction Code") { }
            column(BankName_BankPaymentList; "Bank Payment List"."Bank Name") { }
            column(StaffName_BankPaymentList; "Bank Payment List"."Staff Name") { }
            column(ACNumber_BankPaymentList; "Bank Payment List"."A/C Number") { }
            dataitem("PR Bank Accounts"; "PR Bank Accounts")
            {
                DataItemLink = "Bank Code" = field("Bank Code");
                column(ReportForNavId_9; 9) { }
                column(BankCode_PRBankAccounts; "PR Bank Accounts"."Bank Code") { }
                column(BankName_PRBankAccounts; "PR Bank Accounts"."Bank Name") { }
                dataitem("Company Information"; "Company Information")
                {
                    column(ReportForNavId_12; 12) { }
                    column(Name_CompanyInformation; "Company Information".Name) { }
                    column(Address_CompanyInformation; "Company Information".Address) { }
                    column(Picture_CompanyInformation; "Company Information".Picture) { }
                }
            }

            trigger OnAfterGetRecord()
            begin
                HREmp2.Reset();
                HREmp2.SetRange(HREmp2."No.", "Bank Payment List"."Staff No.");
                HREmp2.SetRange(HREmp2.Status, HREmp2.Status::Active);
                if not HREmp2.Find('-') then
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        HREmp2: Record "HR Employees";
}
