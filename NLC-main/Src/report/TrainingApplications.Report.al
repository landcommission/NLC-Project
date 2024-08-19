#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50031 "Training Applications"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Training Applications.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Training Applications';
    dataset
    {
        dataitem("HR Training App Header"; "HR Training App Header")
        {
            RequestFilterFields = Status, "Responsibility Center", "Application No";
            column(ReportForNavId_1; 1) { }
            column(ApplicationNo_HRTrainingAppHeader; "HR Training App Header"."Application No") { }
            column(Createdby_HRTrainingAppHeader; "HR Training App Header"."Created by") { }
            column(ApplicationDate_HRTrainingAppHeader; "HR Training App Header"."Application Date") { }
            column(CourseTitle_HRTrainingAppHeader; "HR Training App Header"."Course Title") { }
            column(CourseDescription_HRTrainingAppHeader; "HR Training App Header"."Course Description") { }
            column(StartDate_HRTrainingAppHeader; "HR Training App Header"."Start Date") { }
            column(EndDate_HRTrainingAppHeader; "HR Training App Header"."End Date") { }
            column(Duration_HRTrainingAppHeader; "HR Training App Header".Duration) { }
            column(ResponsibilityCenter_HRTrainingAppHeader; "HR Training App Header"."Responsibility Center") { }
            column(Status_HRTrainingAppHeader; "HR Training App Header".Status) { }
            column(TrainingInstitution_HRTrainingAppHeader; "HR Training App Header"."Training Institution") { }
            column(TrainingVenue_HRTrainingAppHeader; "HR Training App Header"."Training Venue") { }
            column(TrainingCostCstimated_HRTrainingAppHeader; "HR Training App Header"."Training Cost Cstimated") { }
            column(BondedTraining_HRTrainingAppHeader; "HR Training App Header"."Bonded Training?") { }
            column(GlobalDimension1Code_HRTrainingAppHeader; "HR Training App Header"."Global Dimension 1 Code") { }
            column(GlobalDimension2Code_HRTrainingAppHeader; "HR Training App Header"."Global Dimension 2 Code") { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(TrainingStatus_HRTrainingAppHeader; "HR Training App Header"."Training Status") { }
            column(ActualStartDate_HRTrainingAppHeader; "HR Training App Header"."Actual Start Date") { }
            column(ActualDuration_HRTrainingAppHeader; "HR Training App Header"."Actual Duration") { }
            column(ActualEndDate_HRTrainingAppHeader; "HR Training App Header"."Actual End Date") { }
            column(Courseapplying_HRTrainingAppHeader; "HR Training App Header"."Course applying") { }
            column(Justification_HRTrainingAppHeader; "HR Training App Header".Justification) { }
            column(EntryNo_HRTrainingAppHeader; "HR Training App Header"."Entry No") { }
            column(EmployeeNo_HRTrainingAppHeader; "HR Training App Header"."Employee No_") { }
            column(UserId_HRTrainingAppHeader; "HR Training App Header".UserId) { }
            column(EmployeeGrade_HRTrainingAppHeader; "HR Training App Header"."Employee Grade") { }
            column(EmployeeName_HRTrainingAppHeader; "HR Training App Header"."Employee Name") { }
            column(Location_HRTrainingAppHeader; "HR Training App Header".Location) { }
            column(TrainingType_HRTrainingAppHeader; "HR Training App Header"."Training Type") { }
            column(TrainingCategory_HRTrainingAppHeader; "HR Training App Header".Training_Category) { }
            column(Sponsor_HRTrainingAppHeader; "HR Training App Header".Sponsor) { }
            column(Lasttraining_HRTrainingAppHeader; "HR Training App Header"."Last training") { }
            column(TimeLastTrainingAttended_HRTrainingAppHeader; "HR Training App Header"."Time Last Training Attended") { }
            column(PartofRecommendedTrainning_HRTrainingAppHeader; "HR Training App Header"."Part of Recommended Trainning") { }
            column(Comments_HRTrainingAppHeader; "HR Training App Header".Comments) { }
            column(LastAttendFrom_HRTrainingAppHeader; "HR Training App Header"."Last Attend From") { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee No_");
                column(ReportForNavId_40; 40) { }
                column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
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
        CI.Reset();
        CI.SetRange(Picture);
    end;

    var
        CI: Record "Company Information";
}
