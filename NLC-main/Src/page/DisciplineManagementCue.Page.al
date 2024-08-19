page 50191 "Discipline Management Cue"
{
    Caption = 'Discipline Management Cue';
    PageType = CardPart;
    SourceTable = "HR Disclipline Cue";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            cuegroup("HR Discipline Activities")
            {
                field("No of Open Cases"; Rec."No of Open Cases")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Open Cases field.';
                    DrillDownPageId = "Hr New Discplinary List";
                }
                field("No of Closed Cases"; Rec."No of Closed Cases")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Closed Cases field.';
                    DrillDownPageId = "Hr Cld Discplinary List";
                }
                field("No of Submitted Cases"; Rec."No of Submitted Cases")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Submitted Cases field.';
                    DrillDownPageId = "Hr Sub Discplinary List";
                }
            }

            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Requests to Approve";
                    ToolTip = 'Specifies the value of the Requests to Approve field.';
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Approval Entries";
                    ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        Rec.SetFilter("User ID Filter", '=%1', UserId);
    end;
}

