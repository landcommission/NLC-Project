#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193609 "Employee Grades"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Grades.rdlc';
    ApplicationArea = All;
    Caption = 'Employee Grades';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(Total; Total) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        Total: Integer;
}
