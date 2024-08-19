#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193446 "Appraisal Report NEW"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Appraisal Report NEW.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Appraisal Report NEW';
    dataset
    {
        dataitem("HR Appraisal Header"; "HR Appraisal Header")
        {
            DataItemTableView = sorting("Appraisal No");
            RequestFilterFields = "Appraisal No", "Appraisal Period", Status;
            column(ReportForNavId_1; 1) { }
            column(Staff_Number; "HR Appraisal Header"."Employee No") { }
            column(Appraisal_Type; "HR Appraisal Header"."Appraisal Type") { }
            column(SupervisorName_HRAppraisalHeader; "HR Appraisal Header"."Supervisor Name") { }
            column(SecondSupervisorName_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor Name") { }
            column(EmployeeName_HRAppraisalHeader; "HR Appraisal Header"."Employee Name") { }
            column(AppraisalPeriod_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Period") { }
            column(SecSupervisorRecomendations_HRAppraisalHeader; "HR Appraisal Header"."SecSupervisor Recomendations") { }
            column(SecondSupervisorComments_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor Comments") { }
            column(Status_HRAppraisalHeader; "HR Appraisal Header".Status) { }
            column(ID_Number; IDNumber) { }
            column(Terms_Service; TermsService) { }
            column(Workstation; Workstation) { }
            column(Department; "HR Appraisal Header".Department) { }
            column(Employee_Email; EmployeeEmail) { }
            column(Gender; Gender) { }
            column(Job_Group; JobGroup) { }
            column(IM_SupervisorDesignation; IM_SupervisorDesignation) { }
            column(SC_SupervisorDesignation; SC_SupervisorDesignation) { }
            column(ApprCommentEndYear; ApprCommentEndYear) { }
            column(SupCommentEndYear; SupCommentEndYear) { }
            column(JobTitle_HRAppraisalHeader; "HR Appraisal Header"."Job Title") { }
            column(CompInfoPicture; CompInfo.Picture) { }
            dataitem("HR Individual Objectives1"; "HR Individual Objectives1")
            {
                DataItemLink = "Appraisal No" = field("Appraisal No");
                DataItemTableView = sorting(ID);
                column(ReportForNavId_18; 18) { }
                column(HRO_Objectives; "HR Individual Objectives1".Objectives) { }
            }
            dataitem("HR Objectives Targets"; "HR Objectives Targets")
            {
                DataItemLink = "Appraisal Code" = field("Appraisal No");
                DataItemTableView = sorting("No Series");
                column(ReportForNavId_20; 20) { }
                column(HOT_AgreedRatings; "HR Objectives Targets"."Agreed Ratings") { }
                column(HOT_Ratings; "HR Objectives Targets".Ratings) { }
                column(HOT_Performance; "HR Objectives Targets".Performance) { }
                column(HOT_TargetChangedOrAdded; "HR Objectives Targets"."Target Changed Or Added") { }
                column(HOT_Remarks; "HR Objectives Targets".Remarks) { }
                column(AchievementsReviewed_HRObjectivesTargets; "HR Objectives Targets"."Achievements Reviewed") { }
                column(HOT_PerformanceIndicator; "HR Objectives Targets"."Performance Indicator") { }
                column(HOT_Objectives; "HR Objectives Targets".Objectives) { }
                column(HOT_Series; "HR Objectives Targets"."No Series") { }
            }
            dataitem("HR Interpersonal Factors"; "HR Interpersonal Factors")
            {
                DataItemLink = "Appraisal Code" = field("Appraisal No");
                DataItemTableView = sorting("No Series");
                column(ReportForNavId_33; 33) { }
                column(HIF_InterpersonalFactorsText; "HR Interpersonal Factors"."Interpersonal Factors Text") { }
                column(HIF_CriteriaClusterDescription; "HR Interpersonal Factors"."Criteria Cluster Description") { }
                column(HIF_CriteriaCluster; "HR Interpersonal Factors"."Criteria Cluster") { }
                column(HIF_SupervisorComments; "HR Interpersonal Factors"."Supervisor Comments") { }
            }
            dataitem("Appraisal Training Development"; "Appraisal Training Development")
            {
                DataItemLink = "Appraisal Code" = field("Appraisal No");
                DataItemTableView = sorting("Entry No") order(ascending);
                column(ReportForNavId_37; 37) { }
                column(ATD_SkillsGap; "Appraisal Training Development"."Skills Gap") { }
                column(ATD_Duration; "Appraisal Training Development".Duration) { }
                column(ATD_TrainingType; "Appraisal Training Development"."Training Type") { }
            }
            dataitem("HR Overall Comments"; "HR Overall Comments")
            {
                DataItemLink = "Appraisal Code" = field("Appraisal No");
                DataItemTableView = sorting("No series") order(ascending);
                column(ReportForNavId_26; 26) { }
                column(HOC_SupervisorComments; "HR Overall Comments"."Supervisor Comments") { }
                column(HOC_Part; "HR Overall Comments".Part) { }
                column(HOC_AppraiseeComments; "HR Overall Comments"."Appraisee Comments") { }
            }

            trigger OnAfterGetRecord()
            begin
                IDNumber := '';
                TermsService := '';
                Workstation := '';
                "HR Appraisal Header".Department := '';
                EmployeeEmail := '';
                Gender := '';
                JobGroup := '';
                IM_SupervisorDesignation := '';
                SC_SupervisorDesignation := '';


                //Staff Details
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "HR Appraisal Header"."Employee No");
                if HREmp.Find('-') then begin
                    IDNumber := Format(HREmp."ID Number");
                    TermsService := Format(HREmp."Contract Type");
                    Workstation := HREmp."Global Dimension 1 Code";
                    DimVal.Reset();
                    DimVal.SetRange(DimVal."Global Dimension No.", 1);
                    DimVal.SetRange(DimVal.Code, Workstation);
                    if DimVal.Find('-') then
                        Workstation := Workstation + '-' + DimVal.Name;
                    "HR Appraisal Header".Department := HREmp."Global Dimension 2 Code";
                    EmployeeEmail := HREmp."Company E-Mail";
                    Gender := Format(HREmp.Gender);
                    JobGroup := HREmp.Grade;
                end;

                //Immediate Supervisor Details
                //mm start comment
                /*
                HREmp.RESET;
                HREmp.SETRANGE(HREmp."No.","HR Appraisal Header".Supervisor);
                IF HREmp.FIND('-') THEN
                BEGIN
                 IM_SupervisorDesignation:=HREmp."Job Title";
                 END;
                 */
                //mm end comment

                //mm code start
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "HR Appraisal Header".Supervisor);

                if "HR Appraisal Header".Supervisor = 'NLC20130011' then
                    IM_SupervisorDesignation := 'Acting Chief Executive Officer'
                else begin
                    HREmp.Reset();
                    HREmp.SetRange(HREmp."No.", "HR Appraisal Header".Supervisor);
                    if HREmp.Find('-') then
                        IM_SupervisorDesignation := HREmp."Job Title";
                end;
                //mm code end

                /*
                //Second Supervisor Details
                //mm comment start
                HREmp.RESET;
                HREmp.SETRANGE(HREmp."No.","HR Appraisal Header"."Second Supervisor");
                IF HREmp.FIND('-') THEN
                BEGIN
                    SC_SupervisorDesignation:=HREmp."Job Title";
                END;
                //mm comment end
                 */

                //mm code start
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "HR Appraisal Header"."Second Supervisor");

                if
          "HR Appraisal Header"."Second Supervisor" = 'NLC20130011' then
                    SC_SupervisorDesignation := 'Acting Chief Executive Officer'
                else begin
                    HREmp.Reset();
                    HREmp.SetRange(HREmp."No.", "HR Appraisal Header"."Second Supervisor");
                    if HREmp.Find('-') then
                        SC_SupervisorDesignation := HREmp."Job Title";
                end;
                //mm code end

            end;

            trigger OnPreDataItem()
            begin

                ApprCommentEndYear := '';
                SupCommentEndYear := '';

                HROverall.Reset();
                HROverall.SetRange(HROverall."Appraisal Code", "HR Appraisal Header".GetFilter("HR Appraisal Header"."Appraisal No"));
                HROverall.SetRange(HROverall.Part, 'F1');
                if HROverall.Find('-') then begin
                    //message(format(HROverall.Part));
                    ApprCommentEndYear := HROverall."Appraisee Comments";
                    SupCommentEndYear := HROverall."Supervisor Comments";
                end;
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
        HRAppraisalHeader: Record "HR Appraisal Header";
        SelectedPeriod: Integer;
        AppraisalNos: Code[50];
        StatusRecs: Option;


    procedure SetPeriod(AppraisalPeriod: Integer; AppraisalNo: Code[50]; StatusR: Option)
    begin
        SelectedPeriod := AppraisalPeriod;
        AppraisalNos := AppraisalNo;
        StatusRecs := StatusR;
    end;
}
