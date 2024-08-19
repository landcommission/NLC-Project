#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193586 "HR Training App Lines Cards"
{
    PageType = Card;
    SourceTable = "HR Training App Lines";
    ApplicationArea = All;
    Caption = 'HR Training App Lines Cards';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Objectives; Rec.Objectives)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objectives field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field(Suggested; Rec.Suggested)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Suggested field.';
                }
                field(Attended; Rec.Attended)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended field.';
                }
            }
        }
    }

    actions { }
}
