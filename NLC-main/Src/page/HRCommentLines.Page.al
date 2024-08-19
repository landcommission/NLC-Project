page 50021 "HR Comment Lines"
{
    ApplicationArea = All;
    Caption = 'HR Comment Lines';
    PageType = Card;
    SourceTable = "HR Comment Lines";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Applicant Comments"; Rec."Applicant Comments")
                {
                    ToolTip = 'Specifies the value of the Applicant Comments field.';
                }
                field("Application Code"; Rec."Application Code")
                {
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Approver Comments"; Rec."Approver Comments")
                {
                    ToolTip = 'Specifies the value of the Approver Comments field.';
                }
                field("Approver Name"; Rec."Approver Name")
                {
                    ToolTip = 'Specifies the value of the Approver Name field.';
                }
                field("Date Modified"; Rec."Date Modified")
                {
                    ToolTip = 'Specifies the value of the Date Modified field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.';
                }

                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }
}
