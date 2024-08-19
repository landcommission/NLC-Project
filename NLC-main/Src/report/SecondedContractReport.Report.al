#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193662 "Seconded/Contract Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SecondedContract Report.rdlc';
    ApplicationArea = All;
    Caption = 'Seconded/Contract Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = Status;
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(Gender_HREmployees; "HR Employees".Gender) { }
            column(sec_HREmployees; "HR Employees".sec) { }
            column(secdur_HREmployees; "HR Employees".secdur) { }
            column(sec2_HREmployees; "HR Employees".sec2) { }
        }
        dataitem("Company Information"; "Company Information")
        {
            column(ReportForNavId_10; 10) { }
            column(Name_CompanyInformation; "Company Information".Name) { }
            column(Picture_CompanyInformation; "Company Information".Picture) { }
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

        CompanyInformation.Get();
        CompanyInformation.CalcFields(CompanyInformation.Picture);
    end;

    var
        no: Integer;
        CompanyInformation: Record "Company Information";
        SecondedTable: Record "Seconded Table";
        HREmployees: Record "HR Employees";
}
