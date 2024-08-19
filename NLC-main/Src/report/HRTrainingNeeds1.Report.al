#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193453 "HR Training Needs1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Training Needs1.rdlc';
    ApplicationArea = All;
    Caption = 'HR Training Needs1';
    dataset
    {
        dataitem("HR Training Needs"; "HR Training Needs")
        {
            RequestFilterFields = "Code", "Bondage Start Date", "Responsibility Center";
            column(ReportForNavId_1905; 1905) { }
            column(Location_HRTrainingNeeds; "HR Training Needs"."Re-Assessment Date")
            {
                IncludeCaption = true;
            }
            column(GlobalDimension2Code_HRTrainingNeeds; "HR Training Needs"."Responsibility Center")
            {
                IncludeCaption = true;
            }
            column(Closed_HRTrainingNeeds; "HR Training Needs"."Bondage Start Date")
            {
                IncludeCaption = true;
            }
            column(QualificationCode_HRTrainingNeeds; "HR Training Needs"."Bondage Duration")
            {
                IncludeCaption = true;
            }
            column(QualificationType_HRTrainingNeeds; "HR Training Needs"."Bondage Release Date")
            {
                IncludeCaption = true;
            }
            column(QualificationDescription_HRTrainingNeeds; "HR Training Needs"."Inclusive of Non Working Days")
            {
                IncludeCaption = true;
            }
            column(ProviderName_HRTrainingNeeds; "HR Training Needs"."Provider Name")
            {
                IncludeCaption = true;
            }
            column(Code_HRTrainingNeeds; "HR Training Needs".Code)
            {
                IncludeCaption = true;
            }
            column(StartDate_HRTrainingNeeds; "HR Training Needs"."Start Date")
            {
                IncludeCaption = true;
            }
            column(EndDate_HRTrainingNeeds; "HR Training Needs"."End Date")
            {
                IncludeCaption = true;
            }
            column(DurationUnits_HRTrainingNeeds; "HR Training Needs".Duration)
            {
                IncludeCaption = true;
            }
            column(Duration_HRTrainingNeeds; "HR Training Needs".Costs)
            {
                IncludeCaption = true;
            }
            column(CostOfTraining_HRTrainingNeeds; "HR Training Needs".Location)
            {
                IncludeCaption = true;
            }
            column(Description_HRTrainingNeeds; "HR Training Needs".Description)
            {
                IncludeCaption = true;
            }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
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
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        VN: Text[50];
        Ven: Record Vendor;
        HR_Training_NeedsCaptionLbl: Label 'HR Training Needs';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Training_NeedsCaptionLbl: Label 'Training Needs';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Name_of_Training_CourseCaptionLbl: Label 'Name of Training Course';
        From__Date_CaptionLbl: Label 'From (Date)';
        Duration_CaptionLbl: Label 'Duration ';
        To__Date_CaptionLbl: Label 'To (Date)';
        Cost_of_TrainingCaptionLbl: Label 'Cost of Training';
        LocationCaptionLbl: Label 'Location';
        ProviderCaptionLbl: Label 'Provider';
        Brief_Description_of_Training_CourseCaptionLbl: Label 'Brief Description of Training Course';
        Qualifications_to_be_attained_at_the_end_of_the_Training_CourseCaptionLbl: Label 'Qualifications to be attained at the end of the Training Course';
}
