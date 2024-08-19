#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194126 "HR Job Interview"
{
    PageType = List;
    SourceTable = "HR Job Interview";
    ApplicationArea = All;
    Caption = 'HR Job Interview';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Interview Code"; Rec."Interview Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Code field.';
                }
                field("Interview Description"; Rec."Interview Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Interview Description';
                    ToolTip = 'Specifies the value of the Interview Description field.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Interviwer; Rec.Interviwer)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Interviwer field.';
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Interviewer Name field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Applicants)
            {
                Caption = 'Applicants';
                action("Hiring Criteria")
                {
                    ApplicationArea = Basic;
                    Caption = 'Hiring Criteria';
                    Image = Agreement;
                    Promoted = true;
                    RunObject = page "HR Hiring Criteria";
                    RunPageLink = "Application Code" = field("Applicant No");
                    ToolTip = 'Executes the Hiring Criteria action.';
                }
            }
        }
    }
}
