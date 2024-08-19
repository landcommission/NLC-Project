#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194175 "Employee Exit Interview list"
{
    ApplicationArea = Basic;
    CardPageId = "HR Employee Exit Interviews";
    PageType = List;
    SourceTable = "HR Employee Exit Interviews";
    UsageCategory = Lists;
    Caption = 'Employee Exit Interview list';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Exit Interview No"; Rec."Exit Interview No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Interview No field.';
                }

                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No Series field.';
                }
                field("Form Submitted"; Rec."Form Submitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Form Submitted field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interviewer Name field.';
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Interview field.';
                }
                field("Interview Done By"; Rec."Interview Done By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Done By field.';
                }
                field("Re Employ In Future"; Rec."Re Employ In Future")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re Employ In Future field.';
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Leaving field.';
                }
                field("Reason For Leaving (Other)"; Rec."Reason For Leaving (Other)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Leaving (Other) field.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
            }
        }
    }

    actions { }
}
