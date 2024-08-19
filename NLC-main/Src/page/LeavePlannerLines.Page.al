#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69230 "Leave Planner Lines"
{
    PageType = ListPart;
    SourceTable = "HR Leave Planner Lines";
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("Applicant Comments"; Rec."Applicant Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Comments field.';
                }
                field("Request Leave Allowance"; Rec."Request Leave Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Leave Allowance field.';
                }
                field(Reliever; Rec.Reliever)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reliever No';
                    ToolTip = 'Specifies the value of the Reliever field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved days field.';
                }
                field("Date of Exam"; Rec."Date of Exam")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Exam field.';
                }
                field("Details of Examination"; Rec."Details of Examination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Details of Examination field.';
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

