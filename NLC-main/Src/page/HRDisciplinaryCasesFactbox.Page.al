#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194176 "HR Disciplinary Cases Factbox"
{
    Caption = 'HR Disciplinary Cases Factbox';
    PageType = CardPart;
    SourceTable = "HR Disciplinary Cases NCA";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field("Case Number"; Rec."Case Number")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Case Number field.';
            }
            field("Date of Complaint"; Rec."Date of Complaint")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Date of Complaint field.';
            }
            field("Type Complaint"; Rec."Type Complaint")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Type Complaint field.';
            }
            field("Recommended Action"; Rec."Recommended Action")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Recommended Action field.';
            }
            field("Description of Complaint"; Rec."Description of Complaint")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Description of Complaint field.';
            }
            field("Accuser Name"; Rec."Accuser Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Accuser Name field.';
            }
            field("Accused Employee Name"; Rec."Accused Employee Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Accused Employee Name field.';
            }
            field("Action Taken"; Rec."Action Taken")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Action Taken field.';
            }
            field("Date To Discuss Case"; Rec."Date To Discuss Case")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Date To Discuss Case field.';
            }
            field("Case Discussion"; Rec."Case Discussion")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Case Discussion field.';
            }
            field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Mode of Lodging the Complaint field.';
            }
            field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Body Handling The Complaint field.';
            }
            field("Policy Guidlines In Effect"; Rec."Policy Guidlines In Effect")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Policy Guidlines In Effect field.';
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
            field("Disciplinary Stage Status"; Rec."Disciplinary Stage Status")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Disciplinary Stage Status field.';
            }
        }
    }

    actions { }
}
