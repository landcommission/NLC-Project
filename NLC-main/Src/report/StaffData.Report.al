#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193738 "Staff Data"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Data.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Staff Data';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = Status;
            column(ReportForNavId_21; 21) { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(PINNo_HREmployees; "HR Employees"."PIN No.") { }
            column(DateOfJoin_HREmployees; "HR Employees"."Date Of Join") { }
            column(Counter; Counter) { }
            column(Picture; CompInfo.Picture) { }
            column(DateOfJoiningtheCompany_HREmployees; "HR Employees"."Date Of Joining the Company") { }
            column(ContractEndDate_HREmployees; "HR Employees"."Contract End Date") { }
            column(NSSFNo_HREmployees; "HR Employees"."NSSF No.") { }
            column(NHIFNo_HREmployees; "HR Employees"."NHIF No.") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            column(BankName; BankName) { }
            column(BankBranch; BankBranch) { }
            column(BankAC; BankAC) { }
            column(PayrollPeriod; PayrollPeriod) { }
            dataitem("PR Salary Card"; "PR Salary Card")
            {
                DataItemLink = "Employee Code" = field("No.");
                column(ReportForNavId_1; 1) { }
                column(EmployeeCode_PRSalaryCard; "PR Salary Card"."Employee Code") { }
                column(BasicPay_PRSalaryCard; "PR Salary Card"."Basic Pay") { }

                trigger OnAfterGetRecord()
                begin
                    Counter := Counter + 1
                end;
            }

            trigger OnAfterGetRecord()
            begin

                BankName := '';
                BankBranch := '';
                BankAC := '';
                PayrollPeriod := 0D;


                //Get the open/current period
                PayPeriod.SetRange(PayPeriod.Closed, false);
                if PayPeriod.Find('-') then begin
                    strPeriodName := PayPeriod."Period Name";
                    dtOpenPeriod := PayPeriod."Date Opened";
                end;


                BankRec.Reset();
                BankRec.SetRange(BankRec."Employee Code", "HR Employees"."No.");
                BankRec.SetRange(BankRec."From payroll Period", dtOpenPeriod);
                if BankRec.Find('-') then begin
                    BankName := BankRec."Bank Name";
                    BankBranch := BankRec."Branch Name";
                    BankAC := BankRec."A/C  Number";
                    PayrollPeriod := BankRec."From payroll Period";
                end;
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
        Counter := 0;
        CompInfo.Reset();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        HREmp: Record "HR Employees";
        Counter: Integer;
        CompInfo: Record "Company Information";
        BankRec: Record "HR Employee Bank Accounts";
        PayPeriod: Record "PR Payroll Periods";
        strPeriodName: Text;
        dtOpenPeriod: Date;
        BankName: Text;
        BankBranch: Text;
        BankAC: Text;
        PayrollPeriod: Date;
}
