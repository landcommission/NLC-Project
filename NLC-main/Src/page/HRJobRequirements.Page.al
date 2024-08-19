#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193430 "HR Job Requirements"
{
    DeleteAllowed = false;
    // InsertAllowed = true;
    // ModifyAllowed = false;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Jobs";
    ApplicationArea = All;
    Caption = 'HR Job Requirements';
    layout
    {
        area(Content)
        {
            group("Job Specification")
            {
                Caption = 'Job Details';
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
            }
            group("Job Requirements")
            {
                part("Job Req"; "HR Job Requirement Lines")
                {
                    SubPageLink = "Job ID" = field("Job ID");
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755008; Outlook) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Job Requirements")
            {
                ApplicationArea = Basic;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Job Requirements action.';
                trigger OnAction()
                begin
                    HRJobReq.Reset();
                    HRJobReq.SetRange(HRJobReq."Job ID", Rec."Job ID");
                    if HRJobReq.Find('-') then
                        Report.Run(Report::"HR Jobs(Conclusive)", true, true, HRJobReq);
                end;
            }
        }
    }

    var
        HRJobReq: Record "HR Jobs";
}
