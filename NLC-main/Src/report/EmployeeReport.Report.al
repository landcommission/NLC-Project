#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193559 "Employee Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Employee Report';
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
            column(ContractEndDate_HREmployees; EndDAteCon) { }
            column(NSSFNo_HREmployees; "HR Employees"."NSSF No.") { }
            column(NHIFNo_HREmployees; "HR Employees"."NHIF No.") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            column(CI_Address; CompanyAdre)
            {
                //IncludeCaption = true;
            }
            column(Compname; CompnayName)
            {

            }
            column(CI_Address2; CompInfo."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_City; CompInfo.City)
            {
                IncludeCaption = true;
            }
            column(CI_EMail; Compmail)
            {
                // IncludeCaption = true;
            }
            column(CI_HomePage; CompInfo."Home Page")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CompPhone)
            {
                //IncludeCaption = true;
            }
            column(CI_Picture; CompInfo.Picture)
            {
                IncludeCaption = true;
            }
            column(Disabled; Disabled)
            {

            }
            column(Gender; Gender)
            {

            }
            column(Ethnicity; Ethnicity)
            {

            }
            column(Highest_Leverl_Description; "Highest Leverl Description")
            { }
            column(E_Mail; "E-Mail")
            {

            }
            column(Grade; Grade)
            {

            }
            column(Cell_Phone_Number; "Cell Phone Number")
            {

            }
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
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                EndDAteCon := '';
                if "HR Employees"."Contract End Date" <> 0D then
                    EndDAteCon := globalFun.FormatDate("HR Employees"."Contract End Date");

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
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
        CompanyAdre := CompInfo.Address;
        CompnayName := CompInfo.Name;
        CompPhone := CompInfo."Phone No.";
        Compmail := CompInfo."E-Mail";

    end;

    var
        HREmp: Record "HR Employees";
        Counter: Integer;
        CompInfo: Record "Company Information";
        CompanyAdre: Text;
        CompnayName: Text;
        CompPhone: Text;
        EndDAteCon: Text;
        Compmail: Text;
        globalFun: Codeunit "Global Functions";
}
