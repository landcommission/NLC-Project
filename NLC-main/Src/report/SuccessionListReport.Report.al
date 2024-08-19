#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193492 "Succession List Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Succession List Report.rdlc';
    ApplicationArea = All;
    Caption = 'Succession List Report';
    dataset
    {
        dataitem("HR Succession Employee"; "HR Succession Employee")
        {
            column(ReportForNavId_1; 1) { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
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
            dataitem("HR Training App Header"; "HR Training App Header")
            {
                column(ReportForNavId_7; 7) { }
                column(ApplicationNo_HRTrainingAppHeader; "HR Training App Header"."Application No") { }
                column(Createdby_HRTrainingAppHeader; "HR Training App Header"."Created by") { }
                column(ApplicationDate_HRTrainingAppHeader; "HR Training App Header"."Application Date") { }
                column(CourseTitle_HRTrainingAppHeader; "HR Training App Header"."Course Title") { }
                column(CourseDescription_HRTrainingAppHeader; "HR Training App Header"."Course Description") { }
                column(NoofParticipants_HRTrainingAppHeader; "HR Training App Header"."No. of Participants") { }
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
                column(TrainingStatus_HRTrainingAppHeader; "HR Training App Header"."Training Status") { }
                column(ActualStartDate_HRTrainingAppHeader; "HR Training App Header"."Actual Start Date") { }
                column(ActualDuration_HRTrainingAppHeader; "HR Training App Header"."Actual Duration") { }
                column(ActualEndDate_HRTrainingAppHeader; "HR Training App Header"."Actual End Date") { }
                column(Courseapplying_HRTrainingAppHeader; "HR Training App Header"."Course applying") { }
                column(Justification_HRTrainingAppHeader; "HR Training App Header".Justification) { }
                column(EmployeeNo_HRTrainingAppHeader; "HR Training App Header"."Employee No_") { }
                column(EmployeeGrade_HRTrainingAppHeader; "HR Training App Header"."Employee Grade") { }
                column(EmployeeName_HRTrainingAppHeader; "HR Training App Header"."Employee Name") { }
                column(TrainingType_HRTrainingAppHeader; "HR Training App Header"."Training Type") { }
                column(TrainingCategory_HRTrainingAppHeader; "HR Training App Header".Training_Category) { }
                column(Sponsor_HRTrainingAppHeader; "HR Training App Header".Sponsor) { }
                column(Lasttraining_HRTrainingAppHeader; "HR Training App Header"."Last training") { }
                column(TimeLastTrainingAttended_HRTrainingAppHeader; "HR Training App Header"."Time Last Training Attended") { }
                dataitem("HR Succession Comments"; "HR Succession Comments")
                {
                    column(ReportForNavId_2; 2) { }
                    column(No_HRSuccessionComments; "HR Succession Comments"."No.") { }
                    column(PositiontoSucced_HRSuccessionComments; "HR Succession Comments"."Position to Succed") { }
                    column(Comment_HRSuccessionComments; "HR Succession Comments".Comment) { }
                    column(Description_HRSuccessionComments; "HR Succession Comments".Description) { }
                }
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
}
