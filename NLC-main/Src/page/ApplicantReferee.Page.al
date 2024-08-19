#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193593 "Applicant Referee"
{
    Caption = 'Applicant Referee';
    PageType = Card;
    SourceTable = "Applicant Referees";
    ApplicationArea = All;

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
                field(FullName; Rec.FullName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FullName field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(MobileNo; Rec.MobileNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MobileNo field.';
                }
                field(Occupation; Rec.Occupation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Occupation field.';
                }
                field(ReferenceType; Rec.ReferenceType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ReferenceType field.';
                }
                field(Company; Rec.Company)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
            }
        }
    }

    actions { }
}
