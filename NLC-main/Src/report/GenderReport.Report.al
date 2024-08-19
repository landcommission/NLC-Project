#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193663 "Gender Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Gender Report.rdlc';
    ApplicationArea = All;
    Caption = 'Gender Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = Status, Gender, "Job ID";
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(Gender_HREmployees; "HR Employees".Gender) { }
            column(Title_HREmployees; "HR Employees".Title) { }
            column(Position_HREmployees; "HR Employees".Position) { }
            column(ContractType_HREmployees; "HR Employees"."Contract Type") { }
            column(ContractEndDate_HREmployees; "HR Employees"."Contract End Date") { }
            column(DateOfJoin_HREmployees; "HR Employees"."Date Of Join") { }
            column(Age_HREmployees; "HR Employees".Age) { }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(JobID_HREmployees; "HR Employees"."Job ID") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            dataitem("Company Information"; "Company Information")
            {
                column(ReportForNavId_16; 16) { }
                column(Address_CompanyInformation; "Company Information".Address) { }
                column(Picture_CompanyInformation; "Company Information".Picture) { }
                column(Name_CompanyInformation; "Company Information".Name) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        HREmployees: Record "HR Employees";
        CompanyInformation: Record "Company Information";
}
