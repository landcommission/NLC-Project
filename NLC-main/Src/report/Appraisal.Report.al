#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193448 Appraisal
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Appraisal.rdlc';
    ApplicationArea = All;
    Caption = 'Appraisal';
    dataset
    {
        dataitem("HR Appraisal Header"; "HR Appraisal Header")
        {
            column(ReportForNavId_1; 1) { }
            column(AppraisalNo_HRAppraisalHeader; "HR Appraisal Header"."Appraisal No") { }
            column(Supervisor_HRAppraisalHeader; "HR Appraisal Header".Supervisor) { }
            column(AppraisalType_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Type") { }
            column(AppraisalPeriod_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Period") { }
            column(Status_HRAppraisalHeader; "HR Appraisal Header".Status) { }
            column(Recommendations_HRAppraisalHeader; "HR Appraisal Header".Recommendations) { }
            column(NoSeries_HRAppraisalHeader; "HR Appraisal Header"."No Series") { }
            column(AppraisalStage_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Stage") { }
            column(Sent_HRAppraisalHeader; "HR Appraisal Header".Sent) { }
            column(UserID_HRAppraisalHeader; "HR Appraisal Header"."User ID") { }
            column(Picture_HRAppraisalHeader; "HR Appraisal Header".Picture) { }
            column(EmployeeNo_HRAppraisalHeader; "HR Appraisal Header"."Employee No") { }
            column(EmployeeName_HRAppraisalHeader; "HR Appraisal Header"."Employee Name") { }
            column(DateofEmployment_HRAppraisalHeader; "HR Appraisal Header"."Date of Employment") { }
            column(JobTitle_HRAppraisalHeader; "HR Appraisal Header"."Job Title") { }
            column(Department_HRAppraisalHeader; "HR Appraisal Header".Department) { }
            column(GlobalDimension1Code_HRAppraisalHeader; "HR Appraisal Header"."Global Dimension 1 Code") { }
            column(GlobalDimension2Code_HRAppraisalHeader; "HR Appraisal Header"."Global Dimension 2 Code") { }
            column(CommentsAppraisee_HRAppraisalHeader; "HR Appraisal Header"."Comments Appraisee") { }
            column(CommentsSupervisor_HRAppraisalHeader; "HR Appraisal Header"."Comments Supervisor") { }
            column(AppraisalDate_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Date") { }
            column(EvaluationPeriodStart_HRAppraisalHeader; "HR Appraisal Header"."Evaluation Period Start") { }
            column(EvaluationPeriodEnd_HRAppraisalHeader; "HR Appraisal Header"."Evaluation Period End") { }
            column(TargetType_HRAppraisalHeader; "HR Appraisal Header"."Target Type") { }
            column(ResponsibilityDutiesAgrdSco_HRAppraisalHeader; "HR Appraisal Header"."Responsibility/Duties Agrd Sco") { }
            column(AttendancePunctualityAgrSco_HRAppraisalHeader; "HR Appraisal Header"."Attendance&Punctuality Agr Sco") { }
            column(CommunicationAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Communication Agreed Score") { }
            column(CooperationAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Cooperation Agreed Score") { }
            column(CustomerServiceAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Customer Service Agreed Score") { }
            column(InitiativeAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Initiative Agreed Score") { }
            column(QualityAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Quality Agreed Score") { }
            column(TeamworkAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Teamwork Agreed Score") { }
            column(SalesSkillsAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Sales Skills Agreed Score") { }
            column(LeadershipAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Leadership Agreed Score") { }
            column(PerformanceCoachingAgreedSc_HRAppraisalHeader; "HR Appraisal Header"."Performance Coaching Agreed Sc") { }
            column(ActionRecomended_HRAppraisalHeader; "HR Appraisal Header"."Action Recomended") { }
            column(JobSpecificAgreedScore_HRAppraisalHeader; "HR Appraisal Header"."Job Specific Agreed Score") { }
            column(EmployeeSubordinates_HRAppraisalHeader; "HR Appraisal Header"."Employee Subordinates") { }
            column(EmployeePeers_HRAppraisalHeader; "HR Appraisal Header"."Employee Peers") { }
            column(JobDescription_HRAppraisalHeader; "HR Appraisal Header"."Job Description") { }
            column(AppraisalMethod_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Method") { }
            column(SupervisorID_HRAppraisalHeader; "HR Appraisal Header"."Supervisor ID") { }
            column(SupervisorJobTitle_HRAppraisalHeader; "HR Appraisal Header"."Supervisor Job Title") { }
            column(ResponsibilityCenter_HRAppraisalHeader; "HR Appraisal Header"."Responsibility Center") { }
            column(ContractType_HRAppraisalHeader; "HR Appraisal Header"."Contract Type") { }
            column(AppraisalApprovalStatus_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Approval Status") { }
            column(SupervisorUserID_HRAppraisalHeader; "HR Appraisal Header"."Supervisor UserID") { }
            column(PrevAppraisalCode_HRAppraisalHeader; "HR Appraisal Header"."Prev Appraisal Code") { }
            column(AgreedGoals1_HRAppraisalHeader; "HR Appraisal Header"."Agreed Goals 1") { }
            column(ResponsibilityDutiesComment_HRAppraisalHeader; "HR Appraisal Header"."Responsibility/Duties Comment") { }
            column(AttendancePunctualityComment_HRAppraisalHeader; "HR Appraisal Header"."Attendance&Punctuality Comment") { }
            column(CommunicationAgreedComment_HRAppraisalHeader; "HR Appraisal Header"."Communication Agreed Comment") { }
            column(CooperationAgreedComment_HRAppraisalHeader; "HR Appraisal Header"."Cooperation Agreed Comment") { }
            column(CustomerServiceAgrComment_HRAppraisalHeader; "HR Appraisal Header"."Customer Service Agr Comment") { }
            column(InitiativeAgreedComment_HRAppraisalHeader; "HR Appraisal Header"."Initiative Agreed Comment") { }
            column(QualityAgreedComment_HRAppraisalHeader; "HR Appraisal Header"."Quality Agreed Comment") { }
            column(TeamworkAgreedComment_HRAppraisalHeader; "HR Appraisal Header"."Teamwork Agreed Comment") { }
            column(SalesSkillsAgreedComment_HRAppraisalHeader; "HR Appraisal Header"."Sales Skills Agreed Comment") { }
            column(LeadershipAgreedComment_HRAppraisalHeader; "HR Appraisal Header"."Leadership Agreed Comment") { }
            column(PerformanceCoachingComment_HRAppraisalHeader; "HR Appraisal Header"."Performance Coaching Comment") { }
            column(EntryNo_HRAppraisalHeader; "HR Appraisal Header"."Entry No") { }
            column(ExploredByAppraisee_HRAppraisalHeader; "HR Appraisal Header"."Explored By Appraisee") { }
            column(ExploredBySupervisor_HRAppraisalHeader; "HR Appraisal Header"."Explored By Supervisor") { }
            column(SecondSupervisor_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor") { }
            column(SecondSupervisorUserID_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor UserID") { }
            column(SecondSupervisorComments_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor Comments") { }
            column(ExploredBySecondSupervisor_HRAppraisalHeader; "HR Appraisal Header"."Explored By Second Supervisor") { }
            column(SupervisorRecomendations_HRAppraisalHeader; "HR Appraisal Header"."Supervisor Recomendations") { }
            column(SecSupervisorRecomendations_HRAppraisalHeader; "HR Appraisal Header"."SecSupervisor Recomendations") { }
            column(SecSupervisorComments_HRAppraisalHeader; "HR Appraisal Header"."SecSupervisor Comments") { }
            column(SupervisorName_HRAppraisalHeader; "HR Appraisal Header"."Supervisor Name") { }
            column(AppraisalScore_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Score") { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
