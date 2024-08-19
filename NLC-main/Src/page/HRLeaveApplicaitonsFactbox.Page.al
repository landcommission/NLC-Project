#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193471 "HR Leave Applicaitons Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Employees";
    ApplicationArea = All;
    Caption = 'HR Leave Applicaitons Factbox';
    layout
    {
        area(Content)
        {
            label(Control1102755011)
            {
                ApplicationArea = Basic;
                CaptionClass = Text1;
                Style = StrongAccent;
                StyleExpr = true;
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
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Title field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the E-Mail field.';
            }
            label(Control1102755005)
            {
                ApplicationArea = Basic;
                Style = StrongAccent;
                StyleExpr = true;
            }
            label(Control1102755012)
            {
                ApplicationArea = Basic;
                CaptionClass = Text2;
                Style = StrongAccent;
                StyleExpr = true;
            }
            field("Allocated Leave Days"; Rec."Allocated Leave Days")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Allocated Leave Days field.';
            }
            field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Reimbursed Leave Days field.';
            }
            field("Total Leave Taken"; Rec."Total Leave Taken")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total Leave Taken field.';
            }
            field("Leave Balance"; Rec."Leave Balance")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Balance field.';
            }
            field("Total (Leave Days)"; Rec."Total (Leave Days)")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total (Leave Days) field.';
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
        Text1: Label 'Employee Details';
        Text2: Label 'Employeee Leave Details';

}

