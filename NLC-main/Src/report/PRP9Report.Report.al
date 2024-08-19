#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193475 "PR P9 Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR P9 Report.rdlc';
    ApplicationArea = All;
    Caption = 'PR P9 Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FirstName_HREmployees; "HR Employees"."First Name") { }
            column(MiddleName_HREmployees; "HR Employees"."Middle Name") { }
            column(LastName_HREmployees; "HR Employees"."Last Name") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(PINNo_HREmployees; "HR Employees"."PIN No.") { }
            dataitem("PR Period Transactions"; "PR Period Transactions")
            {
                column(ReportForNavId_2; 2) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
