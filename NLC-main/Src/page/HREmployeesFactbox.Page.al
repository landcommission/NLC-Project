#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193456 "HR Employees Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Employees";
    ApplicationArea = All;
    Caption = 'HR Employees Factbox';
    layout
    {
        area(Content)
        {
            field(PersonalDetails; PersonalDetails)
            {
                ApplicationArea = Basic;
                Style = StrongAccent;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the PersonalDetails field.';
            }
            field("No."; Rec."No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. field.';
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the First Name field.';
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Middle Name field.';
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Last Name field.';
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the E-Mail field.';
            }
            field("Company E-Mail"; Rec."Company E-Mail")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Company E-Mail field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
            field(JobDetails; JobDetails)
            {
                ApplicationArea = Basic;
                Style = StrongAccent;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the JobDetails field.';
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Title field.';
            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Grade field.';
            }
            field(LeaveDetails; LeaveDetails)
            {
                ApplicationArea = Basic;
                Style = StrongAccent;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the LeaveDetails field.';
            }
            field("Annual Leave Account"; Rec."Annual Leave Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Annual Leave Account field.';
            }
            field("Compassionate Leave Acc."; Rec."Compassionate Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Compassionate Leave Acc. field.';
            }
            field("Maternity Leave Acc."; Rec."Maternity Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Maternity Leave Acc. field.';
            }
            field("Paternity Leave Acc."; Rec."Paternity Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Paternity Leave Acc. field.';
            }
            field("Sick Leave Acc."; Rec."Sick Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Sick Leave Acc. field.';
            }
            field("Study Leave Acc"; Rec."Study Leave Acc")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Study Leave Acc field.';
            }
        }
    }

    actions { }

    var
        PersonalDetails: Label 'Personal Details';
        BankDetails: Label 'Bank Details';
        JobDetails: Label 'Job Details';
        LeaveDetails: Label 'Leave Details';
}
