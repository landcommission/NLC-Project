#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50032 "Staff Needs From PMS"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Needs From PMS.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Staff Needs From PMS';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = const(Active));
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(Gender_HREmployees; "HR Employees".Gender) { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(Ethnicity_HREmployees; "HR Employees".Ethnicity) { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            dataitem("Appraisal Training Development"; "Appraisal Training Development")
            {
                DataItemLink = "Staff No" = field("No.");
                column(ReportForNavId_9; 9) { }
                column(EntryNo_AppraisalTrainingDevelopment; "Appraisal Training Development"."Entry No") { }
                column(SkillsGap_AppraisalTrainingDevelopment; "Appraisal Training Development"."Skills Gap") { }
                column(SkillsExample_AppraisalTrainingDevelopment; "Appraisal Training Development"."Skills Example") { }
                column(RecommendedDevelopment_AppraisalTrainingDevelopment; "Appraisal Training Development"."Recommended Development") { }
                column(Date_AppraisalTrainingDevelopment; "Appraisal Training Development".Date) { }
                column(StaffNo_AppraisalTrainingDevelopment; "Appraisal Training Development"."Staff No") { }
                column(AppraisalCode_AppraisalTrainingDevelopment; "Appraisal Training Development"."Appraisal Code") { }
                column(inhouseorouthouse_AppraisalTrainingDevelopment; "Appraisal Training Development"."inhouse or outhouse") { }
                column(Duration_AppraisalTrainingDevelopment; "Appraisal Training Development".Duration) { }
                column(TrainingType_AppraisalTrainingDevelopment; "Appraisal Training Development"."Training Type") { }
                dataitem("HR Appraisal Header"; "HR Appraisal Header")
                {
                    DataItemLink = "Appraisal No" = field("Appraisal Code");
                    column(ReportForNavId_20; 20) { }
                    column(AppraisalPeriod_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Period") { }
                    column(AppraisalNo_HRAppraisalHeader; "HR Appraisal Header"."Appraisal No") { }
                    column(EmployeeNo_HRAppraisalHeader; "HR Appraisal Header"."Employee No") { }
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
        CompInfo.Reset();
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        CompInfo: Record "Company Information";
        IDNumber: Text;
        TermsService: Text;
        Workstation: Text;
        Department: Text;
        EmployeeEmail: Text;
        Gender: Text;
        JobGroup: Text;
        IM_SupervisorDesignation: Text;
        SC_SupervisorDesignation: Text;
        HREmp: Record "HR Employees";
        DimVal: Record "Dimension Value";
        ApprCommentEndYear: Text;
        SupCommentEndYear: Text;
        HROverall: Record "HR Overall Comments";
}
