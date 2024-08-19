#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50018 "Commuter/House/Bpay Allowances"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CommuterHouseBpay Allowances.rdlc';
    ApplicationArea = All;
    Caption = 'Commuter/House/Bpay Allowances';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(Balance_PRPeriodTransactions; "PR Period Transactions".Balance) { }
            column(OriginalAmount_PRPeriodTransactions; "PR Period Transactions"."Original Amount") { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(SalaryGrade_PRPeriodTransactions; "PR Period Transactions"."Salary Grade") { }
            column(JobTitle_PRPeriodTransactions; "PR Period Transactions"."Job Title") { }
            column(Picture; CI.Picture) { }
            column(Name; CI.Name) { }
            column(Amount1; Amount1) { }
            column(Amount2; Amount2) { }
            column(Amount3; Amount3) { }
            column(Amount4; Amount4) { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                column(ReportForNavId_17; 17) { }
                column(FullName_HREmployees; "HR Employees"."Full Name") { }
                column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
                column(Grade_HREmployees; "HR Employees".Grade) { }
            }

            trigger OnAfterGetRecord()
            begin

                PrPeriodTransactions.Reset();
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Transaction Code", 'BPAY');//Basic Pay
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Payroll Period", SelectedPeriod);
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Employee Code", "PR Period Transactions"."Employee Code");
                if PrPeriodTransactions.FindFirst() then
                    Amount1 := PrPeriodTransactions.Amount;


                PrPeriodTransactions.Reset();
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Transaction Code", 'E01'); //House Allowance
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Payroll Period", SelectedPeriod);
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Employee Code", "PR Period Transactions"."Employee Code");
                if PrPeriodTransactions.FindFirst() then
                    Amount2 := PrPeriodTransactions.Amount;


                PrPeriodTransactions.Reset();
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Transaction Code", 'E02'); //Commuter Allowance
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Payroll Period", SelectedPeriod);
                PrPeriodTransactions.SetRange(PrPeriodTransactions."Employee Code", "PR Period Transactions"."Employee Code");
                if PrPeriodTransactions.FindFirst() then
                    Amount3 := PrPeriodTransactions.Amount;
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
        CI.Reset();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        PrPeriodTransactions: Record "PR Period Transactions";
        Amount1: Decimal;
        Amount2: Decimal;
        Amount3: Decimal;
        Amount4: Decimal;
        PRPeriodTransactions1: Record "PR Period Transactions";
        PRPeriodTransactions2: Record "PR Period Transactions";
        SelectedPeriod: Date;
}
