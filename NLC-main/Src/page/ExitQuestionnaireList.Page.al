#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194043 "Exit Questionnaire List"
{
    ApplicationArea = Basic;
    CardPageId = "Exit Questinnaire Card HR";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Exit Interview Questionnaire";
    UsageCategory = Lists;
    Caption = 'Exit Questionnaire List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Interview No."; Rec."Interview No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview No. field.';
                }
                field("Seperation No"; "Seperation No")
                {
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field("Date of Employement"; Rec."Date of Employement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Employement field.';
                }
                field("Separation Date"; Rec."Separation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation Date field.';
                }

            }
        }
    }

    actions { }
}
