#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193466 P10A
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/P10A.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'P10A';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000) { }
            column(HREmpPR_No; "HR Employees"."No.") { }
            column(HREmpPR_FName; "HR Employees"."First Name") { }
            column(HREmpPR_PinNo; "HR Employees"."PIN No.") { }
            column(HREmpPR_MName; "HR Employees"."Middle Name") { }
            column(HREmpPR_LName; "HR Employees"."Last Name") { }
            column(Tot_TaxablePay; Tot_TaxablePay) { }
            column(Tot_PAYE; Tot_PAYE) { }
            column(SelectedYear; SelectedYear) { }
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(CompanyInfoPicture; CompanyInfo.Picture) { }
            column(CompanyInfoPINNo; CompanyInfo."PIN No") { }

            trigger OnAfterGetRecord()
            begin
                //Total Taxable Pay
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No");
                PRPeriodTrans.SetRange(PRPeriodTrans."Period Year", SelectedYear);
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'TXBP');
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                //PRPeriodTrans.SETRANGE(PRPeriodTrans."Period Closed",true);
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    Tot_TaxablePay := PRPeriodTrans.Amount;
                end else
                    Tot_TaxablePay := 0;

                //Total PAYE
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No");
                PRPeriodTrans.SetRange(PRPeriodTrans."Period Year", SelectedYear);
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PAYE');
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                //PRPeriodTrans.SETRANGE(PRPeriodTrans."Period Closed",true);
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    Tot_PAYE := PRPeriodTrans.Amount;
                end else
                    Tot_PAYE := 0;
                if (Tot_TaxablePay = 0) and (Tot_PAYE = 0) then
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group(Period)
                {
                    field(Year; SelectedYear)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the SelectedYear field.';
                    }
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin

        if SelectedYear = 0 then
            Error(Text001);

        CompanyInfo.Reset();
        if CompanyInfo.Get() then begin
            CompanyInfo.TestField(CompanyInfo.Name);
            CompanyInfo.TestField(CompanyInfo."PIN No");
            CompanyInfo.CalcFields(CompanyInfo.Picture);
        end;
    end;

    var
        SelectedYear: Integer;
        CompanyInfo: Record "Company Information";
        PRPeriodTrans: Record "PR Period Transactions";
        Text001: Label 'Please enter Period Year';
        Tot_TaxablePay: Decimal;
        Tot_PAYE: Decimal;
        PRPeriodTrans_1: Record "PR Period Transactions";
        PRPeriodTrans_2: Record "PR Period Transactions";
        PRPayrollPeriod: Record "PR Payroll Periods";
}
