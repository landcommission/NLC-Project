#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194034 "Applicants Profile List"
{
    PageType = List;
    SourceTable = "Applicant Profiles";
    ApplicationArea = All;
    Caption = 'Applicants Profile List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(FirstName; Rec.FirstName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FirstName field.';
                }
                field(MiddleName; Rec.MiddleName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MiddleName field.';
                }
                field(LastName; Rec.LastName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LastName field.';
                }
                field(MaritalStatus; Rec.MaritalStatus)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MaritalStatus field.';
                }
                field(SpouseName; Rec.SpouseName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SpouseName field.';
                }
                field(NoofChildren; Rec.NoofChildren)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NoofChildren field.';
                }
                field(DOB; Rec.DOB)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DOB field.';
                }
                field(TelNo; Rec.TelNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TelNo field.';
                }
                field(MobileNo; Rec.MobileNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MobileNo field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(MedicalCondition; Rec.MedicalCondition)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MedicalCondition field.';
                }
                field(IdNo; Rec.IdNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IdNo field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(CitizenShip; Rec.CitizenShip)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CitizenShip field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Physical Address"; Rec."Physical Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physical Address field.';
                }
                field(FLanguageCode; Rec.FLanguageCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FLanguageCode field.';
                }
                field(FLanguageDesc; Rec.FLanguageDesc)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FLanguageDesc field.';
                }
                field(SLanguageCode; Rec.SLanguageCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SLanguageCode field.';
                }
                field(SLanguageDesc; Rec.SLanguageDesc)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SLanguageDesc field.';
                }
                field(ALanguage; Rec.ALanguage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ALanguage field.';
                }
                field(FRead; Rec.FRead)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FRead field.';
                }
                field(FWrite; Rec.FWrite)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FWrite field.';
                }
                field(FSpeak; Rec.FSpeak)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FSpeak field.';
                }
                field(SRead; Rec.SRead)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SRead field.';
                }
                field(SWrite; Rec.SWrite)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SWrite field.';
                }
                field(Speak; Rec.Speak)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Speak field.';
                }
                field(ARead; Rec.ARead)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ARead field.';
                }
                field(AWrite; Rec.AWrite)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AWrite field.';
                }
                field(ASpeak; Rec.ASpeak)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ASpeak field.';
                }
                field(FinancialCommitments; Rec.FinancialCommitments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FinancialCommitments field.';
                }
                field(NatureofFinacialCommitments; Rec.NatureofFinacialCommitments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NatureofFinacialCommitments field.';
                }
                field(NOK; Rec.NOK)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NOK field.';
                }
                field(NOKRelationship; Rec.NOKRelationship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NOKRelationship field.';
                }
                field(CitamRelative; Rec.CitamRelative)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CitamRelative field.';
                }
                field(RelativeRelationship; Rec.RelativeRelationship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RelativeRelationship field.';
                }
                field("County Of Birth"; Rec."County Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Of Birth field.';
                }
                field("County Of Residence"; Rec."County Of Residence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Of Residence field.';
                }
                field(Tribe; Rec.Tribe)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tribe field.';
                }
                field("Physical impairement"; Rec."Physical impairement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physical impairement field.';
                }
                field("CitizenShip For Non-Kenyan"; Rec."CitizenShip For Non-Kenyan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CitizenShip For Non-Kenyan field.';
                }
                field(NextOfKinAddress; Rec.NextOfKinAddress)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NextOfKinAddress field.';
                }
                field("Alternative Contacts"; Rec."Alternative Contacts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alternative Contacts field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field(MaritalSatusCode; Rec.MaritalSatusCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MaritalSatusCode field.';
                }
                field(GenderCode; Rec.GenderCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GenderCode field.';
                }
                field(CitizenshipCode; Rec.CitizenshipCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CitizenshipCode field.';
                }
                field(CountyOfBirthCode; Rec.CountyOfBirthCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CountyOfBirthCode field.';
                }
                field(CountyOfResidenceCode; Rec.CountyOfResidenceCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CountyOfResidenceCode field.';
                }
                field(RelationshipCode; Rec.RelationshipCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RelationshipCode field.';
                }
                field(PostalCode; Rec.PostalCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PostalCode field.';
                }
                field(DisabilityCertNo; Rec.DisabilityCertNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DisabilityCertNo field.';
                }
                field(HasRelative; Rec.HasRelative)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HasRelative field.';
                }
            }
        }
    }

    actions { }
}
