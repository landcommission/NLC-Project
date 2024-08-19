#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193425 "HR Job Occupants"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report';
    SourceTable = "HR Jobs";
    ApplicationArea = All;
    Caption = 'HR Job Occupants';
    layout
    {
        area(Content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = false;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
            }
            part(Control1102755000; "HR Employee List (ALL)")
            {
                Caption = 'Job Occupants';
                Editable = false;
                SubPageLink = "Job ID" = field("Job ID");
            }
        }
        area(FactBoxes)
        {
            part(Control1102755005; "HR Job Applications Factbox")
            {
                SubPageLink = "Job Application No." = field("Job ID");
            }
            systempart(Control1102755003; Outlook) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print HR Job Occupants")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Print HR Job Occupants action.';
                //RunObject = Report 39005582;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty then
            Error('No jobs have been setup');
    end;

    var
        Text19006026: Label 'Job Occupants';
}
