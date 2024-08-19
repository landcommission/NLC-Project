#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50002 "HR Employee Employment History"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employee Employment History.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Employee Employment History';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1) { }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(CI_EMail; CI."E-Mail")
            {
                IncludeCaption = true;
            }
            column(CI_HomePage; CI."Home Page")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(E_Mail; "E-Mail")
            {

            }
            column(Cell_Phone_Number; "Cell Phone Number")
            {

            }
            column(ID_Number; "ID Number")
            {

            }
            column(Disabled; Disabled)
            {

            }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(ContractType_HREmployees; "HR Employees"."Contract Type") { }
            column(DAge; "HR Employees".DAge) { }
            dataitem("HR Employment History"; "HR Employment History")
            {
                DataItemLink = "Employee No." = field("No.");
                DataItemTableView = sorting(JobID, Department, "Description of Duties", "Previous Employer Contacts", "Name of Previous Employer");
                column(ReportForNavId_5; 5) { }
                column(Title_HREmploymentHistory; "HR Employment History".Title) { }
                column(Salary_HREmploymentHistory; "HR Employment History".Salary) { }
                column(NameofPreviousEmployer_HREmploymentHistory; "HR Employment History"."Name of Previous Employer") { }
                column(DateEmployed_HREmploymentHistory; "HR Employment History"."Date Employed") { }
                column(DateLeft_HREmploymentHistory; "HR Employment History".DateLeft) { }
            }

            trigger OnAfterGetRecord()
            begin
                Clear("HR Employees".DAge);



                if ("HR Employees"."Date Of Birth" <> 0D) then
                    "HR Employees".DAge := Dates.DetermineAge("HR Employees"."Date Of Birth", Today);
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
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        DAge: Text;
        Dates: Codeunit "HR Dates";
}
