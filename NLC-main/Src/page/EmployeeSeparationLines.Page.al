#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194011 "Employee Separation Lines"
{
    PageType = ListPart;
    SourceTable = "Employee Separation Lines";
    ApplicationArea = All;
    Caption = 'Employee Separation Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Separation No."; Rec."Separation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation No. field.';
                }
                field("Staff Code"; Rec."Staff Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Code field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Current Staff Status"; Rec."Current Staff Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Staff Status field.';
                }
                field("Reason for Separation"; Rec."Reason for Separation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Separation field.';
                }
                field("Date of Leaving"; Rec."Date of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Leaving field.';
                }
                field("HOD Comments"; Rec."HOD Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD Comments field.';
                }
                field("Director Comments"; Rec."Director Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director Comments field.';
                }
                field(Cleared; Rec.Cleared)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cleared field.';
                }
                field(Details; Rec.Details)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Details field.';
                }
            }
        }
    }

    actions { }
}
