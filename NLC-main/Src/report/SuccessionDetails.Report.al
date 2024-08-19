#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193491 "Succession Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Succession Details.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Succession Details';
    dataset
    {
        dataitem("HR Jobs to Succeed"; "HR Jobs to Succeed")
        {
            RequestFilterFields = Status, Criticality;
            column(ReportForNavId_1; 1) { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(JobID_HRJobstoSucceed; "HR Jobs to Succeed"."Job ID") { }
            column(Description_HRJobstoSucceed; "HR Jobs to Succeed".Description) { }
            column(PositionReportingto_HRJobstoSucceed; "HR Jobs to Succeed"."Position Reporting to") { }
            column(OccupiedPosition_HRJobstoSucceed; "HR Jobs to Succeed"."Occupied Position") { }
            column(VacantPositions_HRJobstoSucceed; "HR Jobs to Succeed"."Vacant Positions") { }
            column(Grade; "HR Jobs to Succeed".Grade) { }
            column(responsibility; responsibility) { }
            column(Title; Title) { }
            dataitem("HR Succession Employee"; "HR Succession Employee")
            {
                DataItemLink = "Position to Succeed" = field("Job ID");
                column(ReportForNavId_7; 7) { }
                column(StaffNo_HRSuccessionEmployee; "HR Succession Employee"."Staff No.") { }
                column(FirstName_HRSuccessionEmployee; "HR Succession Employee"."First Name") { }
                column(MiddleName_HRSuccessionEmployee; "HR Succession Employee"."Middle Name") { }
                column(LastName_HRSuccessionEmployee; "HR Succession Employee"."Last Name") { }
                column(IDNo_HRSuccessionEmployee; "HR Succession Employee"."ID No.") { }
                column(DepartmentCode_HRSuccessionEmployee; "HR Succession Employee"."Department Code") { }
                column(DateofJoin_HRSuccessionEmployee; "HR Succession Employee"."Date of Join") { }
                column(SuccessionDate_HRSuccessionEmployee; "HR Succession Employee"."Succession Date") { }
                column(Readiness_HRSuccessionEmployee; "HR Succession Employee".Readiness) { }
                column(Status_HRSuccessionEmployee; "HR Succession Employee".Status) { }
                column(DateMarked_HRSuccessionEmployee; "HR Succession Employee"."Date Marked") { }
            }

            trigger OnAfterGetRecord()
            begin
                emp.Reset();
                emp.SetRange(emp."No.", "HR Jobs to Succeed"."Incumbent No");
                if emp.Find('-') then
                    "HR Jobs to Succeed".Grade := emp.Grade;
                responsibility := emp."Responsibility Center";
                Title := emp."Job Title"
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
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        grade: Text;
        responsibility: Text;
        emp: Record "HR Employees";
        Title: Text;
}
