#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193513 "HR OSIncident Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR OSIncident";
    SourceTableView = where(Status = const(Open));
    ApplicationArea = All;
    Caption = 'HR OSIncident Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Description field.';
                }
                field("Type of Incident"; Rec."Type of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Incident field.';
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Name field.';
                }
                field("Date of Incident"; Rec."Date of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Incident field.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Date Notification Received"; Rec."Date Notification Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Notification Received field.';
                }
                field("First Witness Name"; Rec."First Witness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Witness Name field.';
                }
                field("First Witness Address"; Rec."First Witness Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Witness Address field.';
                }
                field("Second Witness Name"; Rec."Second Witness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Witness Name field.';
                }
                field("Second Witness Address"; Rec."Second Witness Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Witness Address field.';
                }
                field("First Aid Given"; Rec."First Aid Given")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Aid Given field.';
                }
                field("Taken Home"; Rec."Taken Home")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taken Home field.';
                }
                field("Return to Work on same day"; Rec."Return to Work on same day")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return to Work on same day field.';
                }
                field("Went Absent"; Rec."Went Absent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Went Absent field.';
                }
                field("Taken to Hospital"; Rec."Taken to Hospital")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taken to Hospital field.';
                }
                field(Admitted; Rec.Admitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Admitted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
            part(Control7; "HR OSInjured Person List")
            {
                SubPageLink = "Incident No" = field("Incident No");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Approval)
            {
                ApplicationArea = Basic;
                Caption = 'Approval';
                ToolTip = 'Executes the Approval action.';
            }
            action("Send Approval")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval';
                ToolTip = 'Executes the Send Approval action.';
            }
            action("Cancel Approval")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval';
                ToolTip = 'Executes the Cancel Approval action.';
            }
            action("Send for Investigation")
            {
                ApplicationArea = Basic;
                Caption = 'Send for Investigation';
                ToolTip = 'Executes the Send for Investigation action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Send Incident for Investigation?', true, false) then begin
                        Rec.Status := Rec.Status::"Reported Investigation";
                        Rec.Modify();
                    end;
                end;
            }
        }
    }
}
