#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193649 "Lab request form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Lab request form.rdlc';
    ApplicationArea = All;
    Caption = 'Lab request form';
    dataset
    {
        dataitem(Jobs; Jobs)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1) { }
            column(DateSubmitted; Jobs."Starting Date") { }
            column(ProjectTitle; Jobs.Title) { }
            column(PIName; Jobs."Principal Investigator") { }
            column(OrganizaitonAddress; Jobs."Bill-to Address") { }
            column(OrganizationTelephone; Jobs."PI Telephone") { }
            column(OrganizationEmail; Jobs."Bill-to Address 2") { }
            column(CoInvestigatorName; Jobs."PI Name") { }
            column(CoPIAddress; Jobs."PI Address") { }
            column(CoTelephone; Jobs."PI Telephone") { }
            column(CoEmailAddress; Jobs."PI EMail") { }
            column(CompanyPicture; CompanyInfo.Picture) { }
            dataitem("Lab request"; "Lab request")
            {
                DataItemLink = "Proposal No." = field("No.");
                column(ReportForNavId_13; 13) { }
                column(StudyPurpose; "Lab request"."Study Purpose/Use") { }
                column(SynopsisAttached; "Lab request"."Study Synopsis Attached") { }
                column(AlgorithmKnown; "Lab request"."Lab Testing Algorithm Known") { }
                column(TestingSchedule; "Lab request"."Test schedule/Vol./Repertoire") { }
                column(TestsCovered; "Lab request"."All Test Covered by Test List") { }
                column(TestListDescription; "Lab request"."Test List Description") { }
                column(SpecialSpecimenTesting; "Lab request"."Specimen/Isolates Processing") { }
                column(SpecialSpecimenTestingDescription; "Lab request"."Specimen/Isolates Process Desc") { }
                column(StorageRequired; "Lab request"."Special Storage Required") { }
                column(DestroySamples; "Lab request"."Destroy Samples Per Protocol") { }
                column(ShipSamples; "Lab request"."Samples need to be Shipped") { }
                column(ShipSamplesDesc; "Lab request"."Samples Shipped Desc") { }
                column(SpecialRequirementsDataStorage; "Lab request"."Special Data/H.copy Storage") { }
                column(SpecialRequirementsDataStorageDesc; "Lab request"."Special Data/H.copy Desc.") { }
                column(SpecialStaffRequirements; "Lab request"."Special Staff/working hrs Req.") { }
                column(SpecialStaffRequirementsDesc; "Lab request"."Special Staff/working hrs Desc") { }
                column(ExpPermitsRequired; "Lab request"."Exp/Imp Permits Required") { }
                column(IRECApprovalRequired; "Lab request"."IREC Approval") { }
            }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get(CompanyInfo.Picture);
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        objLogos: Record "HR Job Responsiblities";
        CompanyInfo: Record "Company Information";
}
