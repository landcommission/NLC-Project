#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193637 "Employee Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Report1.rdlc';
    ApplicationArea = All;
    Caption = 'Employee Report1';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.", "ID Number";
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
            dataitem("PR Salary Card"; "PR Salary Card")
            {
                DataItemLink = "Employee Code" = field("No.");
                RequestFilterFields = "Employee Code", "Basic Pay", "Date of Birth";
                column(ReportForNavId_1; 1) { }
                column(EmployeeCode_PRSalaryCard; "PR Salary Card"."Employee Code") { }
                column(BasicPay_PRSalaryCard; "PR Salary Card"."Basic Pay") { }

                trigger OnAfterGetRecord()
                begin
                    Counter := Counter + 1
                end;
            }
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
}
