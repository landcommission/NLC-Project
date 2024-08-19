#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193494 "HR OSInspection Card"
{
    PageType = Card;
    SourceTable = "HR OSInvestigation";
    SourceTableView = where(Status = const("Assigned Investigation"));
    ApplicationArea = All;
    Caption = 'HR OSInspection Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = false;
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
                Visible = false;
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
            action("Return for Investigation")
            {
                ApplicationArea = Basic;
                Caption = 'Return for Investigation';
                ToolTip = 'Executes the Return for Investigation action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Retrun for Investigation?', true, false) then begin
                        Rec.Status := Rec.Status::"Reported Investigation";
                        Rec.Modify();
                    end;
                end;
            }
            action("Generate Training Need")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Training Need';
                ToolTip = 'Executes the Generate Training Need action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Generate Training Need for this Measures?', true, false) then
                        Message('Training Need Has been created Successfully');
                end;
            }
        }
    }
}
