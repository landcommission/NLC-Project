#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50008 "HR Retirement Report2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Retirement Report2.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Retirement Report2';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = filter(Active), "Contract Type" = const("Permanent and Pensionable"));
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
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(ContractType_HREmployees; "HR Employees"."Contract Type") { }
            column(DAge; "HR Employees".DAge) { }
            column(Status_HREmployees; "HR Employees".Status) { }
            column(PeriodToRetire; PeriodToRetire) { }

            trigger OnAfterGetRecord()
            begin
                Clear("HR Employees".DAge);



                if ("HR Employees"."Date Of Birth" <> 0D) then begin
                    "HR Employees".DAge := Dates.DetermineAge("HR Employees"."Date Of Birth", Today);

                    if "HR Employees"."Contract Type" = "HR Employees"."Contract Type"::"Permanent and Pensionable" then begin
                        CYR := Date2DMY(Today, 3);
                        DOB := Date2DMY("HR Employees"."Date Of Birth", 3);
                        myAge := CYR - DOB;

                        PeriodToRetire := 60 - myAge;
                    end;

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
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        DAge: Text;
        Dates: Codeunit "HR Dates";
        PeriodToRetire: Integer;
        CYR: Integer;
        DOB: Integer;
        myAge: Integer;
}
