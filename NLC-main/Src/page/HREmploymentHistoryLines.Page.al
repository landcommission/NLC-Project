#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194120 "HR Employment History Lines"
{
    Caption = 'Employment History Lines';
    PageType = List;
    SourceTable = "HR Employment History";
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Name of Previous Employer"; Rec."Name of Previous Employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name of Previous Employer field.';
                }
                field("Date Employed"; Rec."Date Employed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Employed field.';
                }
                field("Date Left"; Rec."Date Left")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Left field.';
                }
                field("Applicant No"; Rec."Applicant No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant No field.';
                }
                field("Previous Employer Contacts"; Rec."Previous Employer Contacts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employer Address';
                    ToolTip = 'Specifies the value of the Employer Address field.';
                }
                field(Salary; Rec.Salary)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Number of Employees Supervised"; Rec."Number of Employees Supervised")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Employees Supervised field.';
                }
                field("Reason for Leaving"; Rec."Reason for Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Leaving field.';
                }
                field("Terms of Service"; Rec."Terms of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terms of Service field.';
                }
                field("Description of Duties"; Rec."Description of Duties")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description of Duties field.';
                }
                field("Type of Business"; Rec."Type of Business")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Business field.';
                }
            }
        }
    }

    actions { }
}
