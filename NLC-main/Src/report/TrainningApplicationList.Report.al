#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193441 "Trainning Application List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Trainning Application List.rdlc';
    ApplicationArea = All;
    Caption = 'Trainning Application List';
    dataset
    {
        dataitem("HR Training App Header"; "HR Training App Header")
        {
            column(ReportForNavId_1; 1) { }
            column(ApplicationNo_HRTrainingAppHeader; "HR Training App Header"."Application No") { }
            column(Createdby_HRTrainingAppHeader; "HR Training App Header"."Created by") { }
            column(NoSeries_HRTrainingAppHeader; "HR Training App Header"."No. Series") { }
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
            column(EmployeeGrade_HRTrainingAppHeader; "HR Training App Header"."Employee Grade") { }
            column(EmployeeName_HRTrainingAppHeader; "HR Training App Header"."Employee Name") { }
            column(Courseapplying_HRTrainingAppHeader; "HR Training App Header"."Course applying") { }
            column(Justification_HRTrainingAppHeader; "HR Training App Header".Justification) { }
            column(EntryNo_HRTrainingAppHeader; "HR Training App Header"."Entry No") { }
            column(EmployeeNo_HRTrainingAppHeader; "HR Training App Header"."Employee No_") { }
            column(pic; compinfo.Picture) { }
            column(TrainingType_HRTrainingAppHeader; "HR Training App Header"."Training Type") { }
            column(TrainingCategory_HRTrainingAppHeader; "HR Training App Header".Training_Category) { }
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
        compinfo.Reset();
        compinfo.CalcFields(compinfo.Picture)
    end;

    var
        compinfo: Record "Company Information";
}
