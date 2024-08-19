#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194067 "HR Training Application Lines"
{
    AutoSplitKey = true;
    Caption = 'HR Training Participants';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "HR Training App Lines";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field(Suggested; Rec.Suggested)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Suggested field.';
                }
                field(Attended; Rec.Attended)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended field.';
                }
                field(Objectives; Rec.Objectives)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objectives field.';
                }
                field("Application No."; "Application No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Suggest Participants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Participants';
                    ToolTip = 'Executes the Suggest Participants action.';
                    trigger OnAction()
                    begin
                        HRTrainingAppHeader.Reset();
                        HRTrainingAppHeader.SetRange(HRTrainingAppHeader."Application No", Rec."Application No.");
                        if HRTrainingAppHeader.Find('-') then;
                        //HRTrainingAppHeader.TESTFIELD(HRTrainingAppHeader.Status,HRTrainingAppHeader.Status::Approved);



                        Rec.Reset();
                        Rec.SetFilter(Rec."Application No.", Rec."Application No.");
                        Report.Run(Report::"HR Training Suggest Participan", true, true, Rec);
                    end;
                }
            }
        }
    }

    var
        HREmployees: Record "FA Budget Entry";
        HRTrainingAppHeader: Record "HR Training App Header";
        HRTrainingAppLines: Record "HR Training App Lines";
}
