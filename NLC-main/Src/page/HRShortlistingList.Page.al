#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193498 "HR Shortlisting List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Shortlisting Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Employee Requisitions";
    SourceTableView = where(Status = const(Approved),
                            Closed = const(false));
    UsageCategory = Lists;
    Caption = 'HR Shortlisting List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Request field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Date field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755005; Outlook) { }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Shortlisting Panel")
            {
                ApplicationArea = Basic;
                Promoted = true;
                RunObject = page "HR Shortlisting Panel";
                ToolTip = 'Executes the Shortlisting Panel action.';
                //RunPageLink = "Applicant No"=field("Requisition No.");
            }
        }
    }
}
