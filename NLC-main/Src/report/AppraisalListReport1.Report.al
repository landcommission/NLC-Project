#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193570 "Appraisal List Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Appraisal List Report1.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Appraisal List Report1';
    dataset
    {
        dataitem("HR Appraisal Header"; "HR Appraisal Header")
        {
            RequestFilterFields = "Appraisal Period", Status, "Employee No", "Job Title", "Responsibility Centre", "Responsibility Center";
            column(ReportForNavId_1; 1) { }
            column(AppraisalNo_HRAppraisalHeader; "HR Appraisal Header"."Appraisal No") { }
            column(AppraisalType_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Type") { }
            column(AppraisalPeriod_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Period") { }
            column(EmployeeNo_HRAppraisalHeader; "HR Appraisal Header"."Employee No") { }
            column(EmployeeName_HRAppraisalHeader; "HR Appraisal Header"."Employee Name") { }
            column(Supervisor_HRAppraisalHeader; "HR Appraisal Header".Supervisor) { }
            column(Status_HRAppraisalHeader; "HR Appraisal Header".Status) { }
            column(SupervisorJobTitle_HRAppraisalHeader; "HR Appraisal Header"."Supervisor Job Title") { }
            column(SecondSupervisor_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor") { }
            column(SupervisorName_HRAppraisalHeader; "HR Appraisal Header"."Supervisor Name") { }
            column(SecondSupervisorName_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor Name") { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee No");
                column(ReportForNavId_15; 15) { }
                column(Grade_HREmployees; "HR Employees".Grade) { }
                column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
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
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        HRAppraisalHeader: Record "HR Appraisal Header";
}
