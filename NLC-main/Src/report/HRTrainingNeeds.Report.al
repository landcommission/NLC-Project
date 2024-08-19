#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193433 "HR Training Needs"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Training Needs.rdlc';
    ApplicationArea = All;
    Caption = 'HR Training Needs';
    dataset
    {
        dataitem("HR Training Needs"; "HR Training Needs")
        {
            column(ReportForNavId_1; 1) { }
            column(Code_HRTrainingNeeds; "HR Training Needs".Code) { }
            column(Description_HRTrainingNeeds; "HR Training Needs".Description) { }
            column(StartDate_HRTrainingNeeds; "HR Training Needs"."Start Date") { }
            column(EndDate_HRTrainingNeeds; "HR Training Needs"."End Date") { }
            column(Duration_HRTrainingNeeds; "HR Training Needs".Duration) { }
            column(Costs_HRTrainingNeeds; "HR Training Needs".Costs) { }
            column(Location_HRTrainingNeeds; "HR Training Needs".Location) { }
            column(ReAssessmentDate_HRTrainingNeeds; "HR Training Needs"."Re-Assessment Date") { }
            column(NeedSource_HRTrainingNeeds; "HR Training Needs"."Need Source") { }
            column(Provider_HRTrainingNeeds; "HR Training Needs".Provider) { }
            column(Posted_HRTrainingNeeds; "HR Training Needs".Posted) { }
            column(Closed_HRTrainingNeeds; "HR Training Needs".Closed) { }
            column(QualificationCode_HRTrainingNeeds; "HR Training Needs"."Qualification Code") { }
            column(QualificationType_HRTrainingNeeds; "HR Training Needs"."Qualification Type") { }
            column(QualificationDescription_HRTrainingNeeds; "HR Training Needs"."Qualification Description") { }
            column(ProviderName_HRTrainingNeeds; "HR Training Needs"."Provider Name") { }
            column(ResponsibilityCenter_HRTrainingNeeds; "HR Training Needs"."Responsibility Center") { }
            column(BondageStartDate_HRTrainingNeeds; "HR Training Needs"."Bondage Start Date") { }
            column(BondageDuration_HRTrainingNeeds; "HR Training Needs"."Bondage Duration") { }
            column(BondageReleaseDate_HRTrainingNeeds; "HR Training Needs"."Bondage Release Date") { }
            column(InclusiveofNonWorkingDays_HRTrainingNeeds; "HR Training Needs"."Inclusive of Non Working Days") { }
            column(BondageRequired_HRTrainingNeeds; "HR Training Needs"."Bondage Required?") { }
            column(NoofTrainingCostItems_HRTrainingNeeds; "HR Training Needs"."No. of Training Cost Items") { }
            column(Status_HRTrainingNeeds; "HR Training Needs".Status) { }
            column(GlobalDimension1Code_HRTrainingNeeds; "HR Training Needs"."Global Dimension 1 Code") { }
            column(GlobalDimension2Code_HRTrainingNeeds; "HR Training Needs"."Global Dimension 2 Code") { }
            column(CurrencyCode_HRTrainingNeeds; "HR Training Needs"."Currency Code") { }
            column(EarlyBondedExit_HRTrainingNeeds; "HR Training Needs"."Early Bonded Exit?") { }
            column(EmployeeNo_HRTrainingNeeds; "HR Training Needs"."Employee No") { }
            column(Picture; CompInfo.Picture) { }
            column(Name; CompInfo.Name) { }
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
}
