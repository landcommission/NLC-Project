#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193492 "HR OSInvestigation Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR OSInvestigation";
    SourceTableView = where(Status = const("Reported Investigation"));
    ApplicationArea = All;
    Caption = 'HR OSInvestigation Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Investigation No"; Rec."Investigation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investigation No field.';
                }
                field("Incident No"; Rec."Incident No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident No field.';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Description field.';
                }
                field("Date of Incident"; Rec."Date of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Incident field.';
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Name field.';
                }
                field("Person Investigating"; Rec."Person Investigating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Person Investigating field.';
                }
                field("Date of Assigning"; Rec."Date of Assigning")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Assigning field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control8; "HR OSAccident Incident line")
            {
                SubPageLink = "Incident No" = field("Incident No");
            }
            part(Control9; "HR OSSafety Checklist List")
            {
                SubPageLink = "Incident No" = field("Incident No");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send For Inspection")
            {
                ApplicationArea = Basic;
                Caption = 'Send For Inspection';
                ToolTip = 'Executes the Send For Inspection action.';
                trigger OnAction()
                begin
                    Rec.TestField(Rec."Person Investigating");
                    if Confirm('Are you sure you want to Send for Inspection?', true, false) then begin
                        Rec.Status := Rec.Status::"Assigned Investigation";
                        Rec.Modify();
                    end;
                end;
            }
        }
    }

}
