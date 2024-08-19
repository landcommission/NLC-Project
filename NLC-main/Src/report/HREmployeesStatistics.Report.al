#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193438 "HR Employees Statistics"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employees Statistics.rdlc';
    ApplicationArea = All;
    Caption = 'HR Employees Statistics';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.", Status;
            column(ReportForNavId_1000000000; 1000000000) { }
            column(CI_Picture; CI.Picture) { }
            column(CI_Address; CI.Address) { }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code") { }
            column(CI_City; CI.City) { }
            column(CI_PhoneNo; CI."Phone No.") { }
            column(COMPANYNAME; CompanyName) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(Designation_HREmployees; "HR Employees"."Job Title") { }
            column(FullName_HREmployees; HREmp."First Name") { }
            column(Status_HREmployees; "HR Employees".Status) { }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(Job_Title; HREmp."Job Title") { }
            column(JobDescription_HREmployees; "HR Employees"."Job Title") { }
            column(DepartmentCode_HREmployees; "HR Employees"."Responsibility Center") { }
            column(Gender_HREmployees; "HR Employees".Gender) { }
            column(MaritalStatus_HREmployees; "HR Employees"."Marital Status") { }
            column(FullPartTime_HREmployees; "HR Employees"."Full / Part Time") { }
            column(PensionFundAdministrator_HREmployees; HREmp."Last Name") { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(SalaryStep_HREmployees; HREmp."Postal Address") { }
            column(EmployeeCategory_HREmployees; HREmp."Work Phone Number") { }
            column(Branch_Code; "HR Employees"."Global Dimension 1 Code") { }
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
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HREmp: Record "HR Employees";
}
