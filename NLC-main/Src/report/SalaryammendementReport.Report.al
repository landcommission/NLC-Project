#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193549 "Salary ammendement Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Salary ammendement Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Salary ammendement Report';
    dataset
    {
        dataitem("Payroll Change"; "Payroll Change")
        {
            RequestFilterFields = "Employee No", "Payroll Period";
            column(ReportForNavId_1; 1) { }
            column(PayrollChangeNo_PayrollChange; "Payroll Change"."Payroll Change No") { }
            column(EmployeeNo_PayrollChange; "Payroll Change"."Employee No") { }
            column(EmployeeName_PayrollChange; "Payroll Change"."Employee Name") { }
            column(Department_PayrollChange; "Payroll Change".Department) { }
            column(Region_PayrollChange; "Payroll Change".Region) { }
            column(ResponsibilityCenter_PayrollChange; "Payroll Change"."Responsibility Center") { }
            column(Status_PayrollChange; "Payroll Change".Status) { }
            column(NoSeries_PayrollChange; "Payroll Change"."No Series") { }
            column(DateRequested_PayrollChange; "Payroll Change"."Date Requested") { }
            column(UserID_PayrollChange; "Payroll Change"."User ID") { }
            dataitem("Payroll Change Request Lines"; "Payroll Change Request Lines")
            {
                DataItemLink = "Payroll Change No" = field("Payroll Change No");
                column(ReportForNavId_12; 12) { }
                column(PayrollChangeNo_PayrollChangeRequestLines; "Payroll Change Request Lines"."Payroll Change No") { }
                column(ChangeType_PayrollChangeRequestLines; "Payroll Change Request Lines"."Change Type") { }
                column(OldValue_PayrollChangeRequestLines; "Payroll Change Request Lines"."Old Value") { }
                column(NewValue_PayrollChangeRequestLines; "Payroll Change Request Lines"."New Value") { }
                column(Transactioncode_PayrollChangeRequestLines; "Payroll Change Request Lines"."Transaction Code") { }
                column(TransactionName_PayrollChangeRequestLines; "Payroll Change Request Lines"."Transaction Name") { }
                column(EmployeeCode_PayrollChangeRequestLines; "Payroll Change Request Lines"."Employee Code") { }
                column(Picture; CompInfo.Picture) { }
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
        CompInfo.Reset();
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        CompInfo: Record "Company Information";
}
