#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193440 "Appraisal Report OLD"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Appraisal Report OLD.rdlc';
    ApplicationArea = All;
    Caption = 'Appraisal Report OLD';
    dataset
    {
        dataitem("HR Appraisal Header"; "HR Appraisal Header")
        {
            DataItemTableView = sorting("Appraisal No");
            MaxIteration = 1;
            RequestFilterFields = "Appraisal No";
            column(ReportForNavId_1; 1) { }
            column(AppraisalNo_HRAppraisalHeader; "HR Appraisal Header"."Appraisal No") { }
            column(Supervisor_HRAppraisalHeader; "HR Appraisal Header".Supervisor) { }
            column(AppraisalType_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Type") { }
            column(AppraisalPeriod_HRAppraisalHeader; "HR Appraisal Header"."Appraisal Period") { }
            column(EmployeeNo_HRAppraisalHeader; "HR Appraisal Header"."Employee No") { }
            column(EmployeeName_HRAppraisalHeader; "HR Appraisal Header"."Employee Name") { }
            column(SecondSupervisorComments_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor Comments") { }
            column(ExploredBySecondSupervisor_HRAppraisalHeader; "HR Appraisal Header"."Explored By Second Supervisor") { }
            column(SupervisorRecomendations_HRAppraisalHeader; "HR Appraisal Header"."Supervisor Recomendations") { }
            column(SecSupervisorRecomendations_HRAppraisalHeader; "HR Appraisal Header"."SecSupervisor Recomendations") { }
            column(SecSupervisorComments_HRAppraisalHeader; "HR Appraisal Header"."SecSupervisor Comments") { }
            column(SupervisorName_HRAppraisalHeader; "HR Appraisal Header"."Supervisor Name") { }
            column(SecondSupervisorName_HRAppraisalHeader; "HR Appraisal Header"."Second Supervisor Name") { }
            column(Picture; CompInfo.Picture) { }
            column(ID; ID) { }
            column(Counter; Counter) { }
            column(Terms; Terms) { }
            column(Workstation; WorkStation) { }
            column(Staffname; StaffName) { }
            column(Gender; Grender) { }
            column(JobGroup; Jogbroup) { }
            column(SupDesig; SupDesig) { }
            column(Email; Email) { }
            column(ImeDSupDesig; ImeDSupDesig) { }
            column(Dept; Dept) { }
            column(ApprCommentEndYear; ApprCommentEndYear) { }
            column(SupCommentEndYear; SupCommentEndYear) { }
            dataitem("HR Individual Objectives"; "HR Individual Objectives")
            {
                DataItemLink = "Appraisal No" = field("Appraisal No"), "Staff No" = field("Employee No");
                DataItemTableView = sorting(ID);
                column(ReportForNavId_8; 8) { }
                column(Objectives_HRIndividualObjectives; "HR Individual Objectives".Objectives) { }
                column(ID_HRIndividualObjectives; "HR Individual Objectives".ID) { }
                column(StaffNo_HRIndividualObjectives; "HR Individual Objectives"."Staff No") { }
                column(Department_HRIndividualObjectives; "HR Individual Objectives".Department) { }
                column(Period_HRIndividualObjectives; "HR Individual Objectives".Period) { }
                column(AppraisalNo_HRIndividualObjectives; "HR Individual Objectives"."Appraisal No") { }
            }
            dataitem("HR Objectives Targets"; "HR Objectives Targets")
            {
                DataItemLink = "Appraisal Code" = field("Appraisal No");
                DataItemTableView = sorting("No Series");
                column(ReportForNavId_15; 15) { }
                column(NoSeries_HRObjectivesTargets; "HR Objectives Targets"."No Series") { }
                column(AppraisalCode_HRObjectivesTargets; "HR Objectives Targets"."Appraisal Code") { }
                column(SupervisorComments_HRObjectivesTargets; "HR Objectives Targets"."Supervisor Comments") { }
                column(AppraiseeComments_HRObjectivesTargets; "HR Objectives Targets"."Appraisee Comments") { }
                column(Ratings_HRObjectivesTargets; "HR Objectives Targets".Ratings) { }
                column(Objectives_HRObjectivesTargets; "HR Objectives Targets".Objectives) { }
                column(Performance_HRObjectivesTargets; "HR Objectives Targets".Performance) { }
                column(Period_HRObjectivesTargets; "HR Objectives Targets".Period) { }
                column(ForNextPeriod_HRObjectivesTargets; "HR Objectives Targets"."For Next Period") { }
                column(Type_HRObjectivesTargets; "HR Objectives Targets".Type) { }
                column(Criteria_HRObjectivesTargets; "HR Objectives Targets".Criteria) { }
                column(PerformanceIndicator_HRObjectivesTargets; "HR Objectives Targets"."Performance Indicator") { }
                column(SecondSupervisorComments_HRObjectivesTargets; "HR Objectives Targets"."Second Supervisor Comments") { }
                column(SupervisorRatings_HRObjectivesTargets; "HR Objectives Targets"."Supervisor Ratings") { }
                column(AgreedRatings_HRObjectivesTargets; "HR Objectives Targets"."Agreed Ratings") { }
                column(AchievementsReviewed_HRObjectivesTargets; "HR Objectives Targets"."Achievements Reviewed") { }
                column(TargetChangedOrAdded_HRObjectivesTargets; "HR Objectives Targets"."Target Changed Or Added") { }
                column(Remarks_HRObjectivesTargets; "HR Objectives Targets".Remarks) { }
                column(NoRatings; NoRatings) { }
                column(TotApraissees; TotApraissees) { }
                column(TotAgreed; TotAgreed) { }
                column(TotRatings; TotRatings) { }

                trigger OnAfterGetRecord()
                begin


                    //TotApraissees:=0;
                    //TotAgreed:=0;
                    // TotApraissees:=TotApraissees+"HR Objectives Targets".Ratings;
                    //  TotAgreed:=TotAgreed+"HR Objectives Targets"."Agreed Ratings";

                    //Total of all ratings
                    TotRatings += "HR Objectives Targets".Ratings;
                end;


                trigger OnPreDataItem()
                begin
                    //Initialize
                    TotRatings := 0;
                    Counter := 0;
                    NoRatings := "HR Objectives Targets".Count;
                end;
            }
            dataitem("HR Interpersonal Factors"; "HR Interpersonal Factors")
            {
                DataItemLink = "Appraisal Code" = field("Appraisal No");
                DataItemTableView = sorting("No Series");
                column(ReportForNavId_34; 34) { }
                column(NoSeries_HRInterpersonalFactors; "HR Interpersonal Factors"."No Series") { }
                column(AppraisalCode_HRInterpersonalFactors; "HR Interpersonal Factors"."Appraisal Code") { }
                column(InterpersonalFactors_HRInterpersonalFactors; "HR Interpersonal Factors"."Interpersonal Factors") { }
                column(IFDescription_HRInterpersonalFactors; "HR Interpersonal Factors"."IF Description") { }
                column(SupervisorComments_HRInterpersonalFactors; "HR Interpersonal Factors"."Supervisor Comments") { }
                column(AppraiseeComments_HRInterpersonalFactors; "HR Interpersonal Factors"."Appraisee Comments") { }
                column(Ratings_HRInterpersonalFactors; "HR Interpersonal Factors".Ratings) { }
                column(ExamplesBehaviours_HRInterpersonalFactors; "HR Interpersonal Factors"."Examples Behaviours") { }
                column(SupervisorRatings_HRInterpersonalFactors; "HR Interpersonal Factors"."Supervisor Ratings") { }
                column(PeerComments_HRInterpersonalFactors; "HR Interpersonal Factors"."Peer Comments") { }
                column(PeerRatings_HRInterpersonalFactors; "HR Interpersonal Factors"."Peer Ratings") { }
                column(AttributeDescription_HRInterpersonalFactors; "HR Interpersonal Factors"."Attribute Description") { }
                column(CriteriaCluster_HRInterpersonalFactors; "HR Interpersonal Factors"."Criteria Cluster") { }
                column(CriteriaClusterDescription_HRInterpersonalFactors; "HR Interpersonal Factors"."Criteria Cluster Description") { }
                column(InterpersonalFactorsText_HRInterpersonalFactors; "HR Interpersonal Factors"."Interpersonal Factors Text") { }
                column(AgreedRatings_HRInterpersonalFactors; "HR Interpersonal Factors"."Agreed Ratings") { }
            }
            dataitem("Appraisal Training Development"; "Appraisal Training Development")
            {
                DataItemLink = "Appraisal Code" = field("Appraisal No");
                DataItemTableView = sorting("Entry No");
                column(ReportForNavId_51; 51) { }
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
            }
            dataitem("HR Overall Comments"; "HR Overall Comments")
            {
                DataItemLink = "Appraisal Code" = field("Appraisal No");
                DataItemTableView = sorting("No series");
                column(ReportForNavId_62; 62) { }
                column(Noseries_HROverallComments; "HR Overall Comments"."No series") { }
                column(AppraisalCode_HROverallComments; "HR Overall Comments"."Appraisal Code") { }
                column(SupervisorComments_HROverallComments; "HR Overall Comments"."Supervisor Comments") { }
                column(AppraiseeComments_HROverallComments; "HR Overall Comments"."Appraisee Comments") { }
                column(Part_HROverallComments; "HR Overall Comments".Part) { }
                column(SecondSupervisorComments_HROverallComments; "HR Overall Comments"."Second Supervisor Comments") { }
            }

            trigger OnAfterGetRecord()
            begin
                ID := 0;
                Terms := '';
                StaffName := '';
                WorkStation := '';
                Grender := '';
                Jogbroup := '';
                SupDesig := '';
                Email := '';
                ImeDSupDesig := '';
                Dept := '';


                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "HR Appraisal Header"."Employee No");
                if HREmp.Find('-') then begin
                    //ID:= HREmp."ID Number";
                    Terms := Format(HREmp."Contract Type");
                    StaffName := HREmp."Full Name";


                    WorkStation := HREmp."Global Dimension 1 Code";

                    DimVal.Reset();
                    DimVal.SetRange(DimVal."Global Dimension No.", 1);
                    DimVal.SetRange(DimVal.Code, WorkStation);
                    if DimVal.Find('-') then
                        WorkStation := WorkStation + '-' + DimVal.Name;

                    Grender := Format(HREmp.Gender);
                    Jogbroup := HREmp.Grade;
                    Dept := HREmp."Global Dimension 2 Code";

                    Email := HREmp."Company E-Mail";
                end;

                HREmp2.Reset();
                HREmp2.SetRange(HREmp2."No.", "HR Appraisal Header"."Second Supervisor");
                if HREmp2.Find('-') then
                    SupDesig := HREmp2."Job Title";

                HREmp2.Reset();
                HREmp2.SetRange(HREmp2."No.", "HR Appraisal Header".Supervisor);
                if HREmp2.Find('-') then
                    ImeDSupDesig := HREmp2."Job Title";
            end;

            trigger OnPreDataItem()
            begin

                HRObjTarg.Reset();
                HRObjTarg.SetRange(HRObjTarg."Appraisal Code", "HR Appraisal Header".GetFilter("HR Appraisal Header"."Appraisal No"));
                Counter := HRObjTarg.Count;

                ApprCommentEndYear := '';

                HROverall.Reset();
                HROverall.SetRange(HROverall."Appraisal Code", "HR Appraisal Header".GetFilter("HR Appraisal Header"."Appraisal No"));
                HROverall.SetRange(HROverall.Part, 'F1');
                if HROverall.Find('-') then begin
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

        appraisalNo := "HR Appraisal Header".GetFilter("HR Appraisal Header"."Appraisal No");
        if appraisalNo = '' then begin
            Message('Kindly FILTER by "Appraisal No" to preview this Staff Appraisal report');

            CurrReport.Quit();
        end;

        Counter := 0;
    end;

    var
        CompInfo: Record "Company Information";
        HREmp: Record "HR Employees";
        ID: Integer;
        Terms: Text[50];
        WorkStation: Text[100];
        StaffName: Text[100];
        Grender: Text[100];
        Jogbroup: Text[100];
        SupDesig: Text[100];
        Email: Text[100];
        TotApraissees: Decimal;
        TotAgreed: Decimal;
        TotRatings: Decimal;
        AvgRating: Decimal;
        NoRatings: Integer;
        appraisalNo: Text;
        HREmp2: Record "HR Employees";
        ImeDSupDesig: Text;
        DimVal: Record "Dimension Value";
        Dept: Text;
        Counter: Integer;
        HRObjTarg: Record "HR Objectives Targets";
        ApprCommentEndYear: Text;
        SupCommentEndYear: Text;
        HROverall: Record "HR Overall Comments";
}
