#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193458 "Employee Confirmation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Confirmation Report.rdlc';
    ApplicationArea = All;
    Caption = 'Employee Confirmation Report';
    dataset
    {
        dataitem("HR Employee Confirmation"; "HR Employee Confirmation")
        {
            column(ReportForNavId_1; 1) { }
            column(No_HREmployeeConfirmation; "HR Employee Confirmation".No) { }
            column(EmployeeNumber_HREmployeeConfirmation; "HR Employee Confirmation"."Employee Number") { }
            column(EmployeeName_HREmployeeConfirmation; "HR Employee Confirmation"."Employee Name") { }
            column(RequestDate_HREmployeeConfirmation; "HR Employee Confirmation"."Request Date") { }
            column(ShortcutDimensioncode1_HREmployeeConfirmation; "HR Employee Confirmation"."Shortcut Dimension code1") { }
            column(ShortcutDimensioncode2_HREmployeeConfirmation; "HR Employee Confirmation"."Shortcut Dimension code2") { }
            column(Reason_HREmployeeConfirmation; "HR Employee Confirmation".Reason) { }
            column(ProbationStartDate_HREmployeeConfirmation; "HR Employee Confirmation"."Probation Start Date") { }
            column(ProbationEndDate_HREmployeeConfirmation; "HR Employee Confirmation"."Probation End Date") { }
            column(ConfirmationDate_HREmployeeConfirmation; "HR Employee Confirmation"."Confirmation Date") { }
            column(Designation_HREmployeeConfirmation; "HR Employee Confirmation".Designation) { }
            column(Grade_HREmployeeConfirmation; "HR Employee Confirmation".Grade) { }
            column(Status_HREmployeeConfirmation; "HR Employee Confirmation".Status) { }
            dataitem("Company Information"; "Company Information")
            {
                column(ReportForNavId_15; 15) { }
                column(Name; CompanyInformation.Name) { }
                column(Address; CompanyInformation.Address) { }
                column(Address2; CompanyInformation."Address 2") { }
                column(Picture; CompanyInformation.Picture) { }
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
        CompanyInformation: Record "Company Information";
}
