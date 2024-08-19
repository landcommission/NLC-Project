#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 55000 "HR Employee Qualifications 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employee Qualifications 2.rdlc';
    ApplicationArea = All;
    Caption = 'HR Employee Qualifications 2';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
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
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            dataitem("HR Employee Kin"; "HR Employee Kin")
            {
                DataItemLink = "Employee Code" = field("No.");
                DataItemTableView = sorting("Employee Code", Type, Relationship, "Full Name");
                column(ReportForNavId_5; 5) { }
                column(Relationship_HREmployeeKin; "HR Employee Kin".Relationship) { }
                column(FullName_HREmployeeKin; "HR Employee Kin"."Full Name") { }
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
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}
