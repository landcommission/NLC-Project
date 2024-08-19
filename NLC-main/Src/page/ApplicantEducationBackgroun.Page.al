#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193591 "Applicant Education Backgroun"
{
    PageType = Card;
    SourceTable = "Applicant Education Background";
    ApplicationArea = All;
    Caption = 'Applicant Education Backgroun';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(ApplicantNo; Rec.ApplicantNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ApplicantNo field.';
                }
                field(InstitutionName; Rec.InstitutionName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the InstitutionName field.';
                }
                field(StartDate; Rec.StartDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the StartDate field.';
                }
                field(EndDate; Rec.EndDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EndDate field.';
                }
                field(Qualifications; Rec.Qualifications)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualifications field.';
                }
                field(QualificationDescr; Rec.QualificationDescr)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the QualificationDescr field.';
                }
                field(QualificationType; Rec.QualificationType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the QualificationType field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(QualificationsCode; Rec.QualificationsCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the QualificationsCode field.';
                }
                field(QualificationTypeCode; Rec.QualificationTypeCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the QualificationTypeCode field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(RandomMapperEduBackGr; Rec.RandomMapperEduBackGr)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RandomMapperEduBackGr field.';
                }
                field(QualificationGrade; Rec.QualificationGrade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the QualificationGrade field.';
                }
                field(RenewalDate; Rec.RenewalDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RenewalDate field.';
                }
                field("Other Grade"; Rec."Other Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Grade field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country Code field.';
                }
            }
        }
    }

    actions { }
}
