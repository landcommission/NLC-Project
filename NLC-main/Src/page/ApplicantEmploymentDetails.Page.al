#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193999 "Applicant Employment Details"
{
    PageType = Card;
    SourceTable = "Applicant Employment Details";
    ApplicationArea = All;
    Caption = 'Applicant Employment Details';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(ApplicantNo; Rec.ApplicantNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ApplicantNo field.';
                }
                field(Employer; Rec.Employer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer field.';
                }
                field(Contacts; Rec.Contacts)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contacts field.';
                }
                field("Current Salary"; Rec."Current Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Salary field.';
                }
                field("Addtional Benefits"; Rec."Addtional Benefits")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Addtional Benefits field.';
                }
                field("Acceptable Salary"; Rec."Acceptable Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acceptable Salary field.';
                }
                field("Leaving Reason"; Rec."Leaving Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leaving Reason field.';
                }
                field("Contact Employer"; Rec."Contact Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Employer field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Type Of Position"; Rec."Type Of Position")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type Of Position field.';
                }
                field("Staff No"; Rec."Staff No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No field.';
                }
                field("Date Employed"; Rec."Date Employed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Employed field.';
                }
                field(TypeOfPosCode; Rec.TypeOfPosCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TypeOfPosCode field.';
                }
            }
        }
    }

    actions { }
}
