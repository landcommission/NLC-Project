#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193490 "Jobs To Succeed List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Jobs To Succeed List.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Jobs To Succeed List';
    dataset
    {
        dataitem("HR Jobs to Succeed"; "HR Jobs to Succeed")
        {
            RequestFilterFields = Status, Criticality;
            column(ReportForNavId_1; 1) { }
            column(JobID_HRJobstoSucceed; "HR Jobs to Succeed"."Job ID") { }
            column(Description_HRJobstoSucceed; "HR Jobs to Succeed".Description) { }
            column(Department_HRJobstoSucceed; "HR Jobs to Succeed"."Department Name") { }
            column(ShortcutDimension1_HRJobstoSucceed; "HR Jobs to Succeed"."Shortcut Dimension 1") { }
            column(ShortcutDemension2_HRJobstoSucceed; "HR Jobs to Succeed"."Shortcut Demension 2") { }
            column(Availability_HRJobstoSucceed; "HR Jobs to Succeed".Availability) { }
            column(Comment_HRJobstoSucceed; "HR Jobs to Succeed".Comment) { }
            column(NoofPosts_HRJobstoSucceed; "HR Jobs to Succeed"."No of Posts") { }
            column(PositionReportingto_HRJobstoSucceed; "HR Jobs to Succeed"."Position Reporting to") { }
            column(OccupiedPosition_HRJobstoSucceed; "HR Jobs to Succeed"."Occupied Position") { }
            column(VacantPositions_HRJobstoSucceed; "HR Jobs to Succeed"."Vacant Positions") { }
            column(Dimension3_HRJobstoSucceed; "HR Jobs to Succeed".Dimension3) { }
            column(Dimension4_HRJobstoSucceed; "HR Jobs to Succeed".Dimension4) { }
            column(Dimension5_HRJobstoSucceed; "HR Jobs to Succeed".Dimension5) { }
            column(Dimension6_HRJobstoSucceed; "HR Jobs to Succeed".Dimension6) { }
            column(Dimension7_HRJobstoSucceed; "HR Jobs to Succeed".Dimension7) { }
            column(Grade_HRJobstoSucceed; "HR Jobs to Succeed".Grade) { }
            column(ActJobID_HRJobstoSucceed; "HR Jobs to Succeed"."Act Job ID") { }
            column(ResponsibilityCenter_HRJobstoSucceed; "HR Jobs to Succeed"."Responsibility Center") { }
            column(Status_HRJobstoSucceed; "HR Jobs to Succeed".Status) { }
            column(SuccessionExperience_HRJobstoSucceed; "HR Jobs to Succeed"."Succession Experience") { }
            column(IncumbentNo_HRJobstoSucceed; "HR Jobs to Succeed"."Incumbent No") { }
            column(IncumbentName_HRJobstoSucceed; "HR Jobs to Succeed"."Incumbent Name") { }
            column(RetirementDate_HRJobstoSucceed; "HR Jobs to Succeed"."Retirement Date") { }
            column(RetirementStatus_HRJobstoSucceed; "HR Jobs to Succeed"."Retirement Status") { }
            column(Criticality_HRJobstoSucceed; "HR Jobs to Succeed".Criticality) { }
            column(NumberofStaffready_HRJobstoSucceed; "HR Jobs to Succeed"."Number of Staff ready") { }
            column(NumberofStaffReadyin12_HRJobstoSucceed; "HR Jobs to Succeed"."Number of Staff Ready in 1-2") { }
            column(SuccessionPlanningprorities_HRJobstoSucceed; "HR Jobs to Succeed"."Succession Planning prorities") { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(Grade; "HR Jobs to Succeed".Grade) { }
            column(responsibility; responsibility) { }

            trigger OnAfterGetRecord()
            begin
                emp.Reset();
                emp.SetRange(emp."No.", "HR Jobs to Succeed"."Incumbent No");
                if emp.Find('-') then
                    "HR Jobs to Succeed".Grade := emp.Grade;
                responsibility := emp."Responsibility Center";
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
}
