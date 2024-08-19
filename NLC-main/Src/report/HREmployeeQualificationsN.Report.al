#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50001 "HR Employee Qualifications N"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employee Qualifications N.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Employee Qualifications N';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.", Status;
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
            column(ID_Number; "ID Number")
            {

            }
            column(Cell_Phone_Number; "Cell Phone Number")
            { }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(ContractType_HREmployees; "HR Employees"."Contract Type") { }
            column(DAge; "HR Employees".DAge) { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            dataitem("HR Employee Qualifications"; "HR Employee Qualifications")
            {
                DataItemLink = "Employee No." = field("No.");
                DataItemTableView = sorting("Employee No.", "Line No.") where("Employee No." = filter(<> ''));
                column(ReportForNavId_5; 5) { }
                column(FromDate_HREmployeeQualifications; "HR Employee Qualifications"."From Date") { }
                column(ToDate_HREmployeeQualifications; "HR Employee Qualifications"."To Date") { }
                column(InstitutionCompany_HREmployeeQualifications; "HR Employee Qualifications"."Institution/Company") { }
                column(Description_HREmployeeQualifications; "HR Employee Qualifications".Description) { }
                column(Type_HREmployeeQualifications; "HR Employee Qualifications".Type) { }
                column(QualificationDescription_HREmployeeQualifications; "HR Employee Qualifications"."Qualification Description") { }

                trigger OnAfterGetRecord()
                begin
                    if "HR Employee Qualifications"."Qualification Description" <> '' then
                        if "HR Employee Qualifications".Description = '' then
                            "HR Employee Qualifications".Description := "HR Employee Qualifications"."Qualification Description";
                end;
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
