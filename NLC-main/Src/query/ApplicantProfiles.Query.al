#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
query 50003 "Applicant Profiles"
{
    Caption = 'Applicant Profiles';
    elements
    {
        dataitem(Applicant_Profiles; "Applicant Profiles")
        {
            column(No; No) { }
            column(FirstName; FirstName) { }
            column(MiddleName; MiddleName) { }
            column(LastName; LastName) { }
            column(MaritalStatus; MaritalStatus) { }
            column(SpouseName; SpouseName) { }
            column(NoofChildren; NoofChildren) { }
            column(DOB; DOB) { }
            column(TelNo; TelNo) { }
            column(MobileNo; MobileNo) { }
            column(Email; Email) { }
            column(MedicalCondition; MedicalCondition) { }
            column(IdNo; IdNo) { }
            column(Gender; Gender) { }
            column(CitizenShip; CitizenShip) { }
            column(Postal_Address; "Postal Address") { }
            column(Physical_Address; "Physical Address") { }
            column(FLanguageCode; FLanguageCode) { }
            column(FLanguageDesc; FLanguageDesc) { }
            column(SLanguageCode; SLanguageCode) { }
            column(SLanguageDesc; SLanguageDesc) { }
            column(ALanguage; ALanguage) { }
            column(FRead; FRead) { }
            column(FWrite; FWrite) { }
            column(FSpeak; FSpeak) { }
            column(SRead; SRead) { }
            column(SWrite; SWrite) { }
            column(Speak; Speak) { }
            column(ARead; ARead) { }
            column(AWrite; AWrite) { }
            column(ASpeak; ASpeak) { }
            column(FinancialCommitments; FinancialCommitments) { }
            column(NatureofFinacialCommitments; NatureofFinacialCommitments) { }
            column(NOK; NOK) { }
            column(NOKRelationship; NOKRelationship) { }
            column(CitamRelative; CitamRelative) { }
            column(RelativeRelationship; RelativeRelationship) { }
            column(County_Of_Birth; "County Of Birth") { }
            column(County_Of_Residence; "County Of Residence") { }
            column(Tribe; Tribe) { }
            column(Physical_impairement; "Physical impairement") { }
            column(CitizenShip_For_Non_Kenyan; "CitizenShip For Non-Kenyan") { }
            column(NextOfKinAddress; NextOfKinAddress) { }
            column(Alternative_Contacts; "Alternative Contacts") { }
            column(Religion; Religion) { }
        }
    }
}
