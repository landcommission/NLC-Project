#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194080 "HR Successor"
{
    PageType = List;
    SourceTable = "HR Succession Employee";
    ApplicationArea = All;
    Caption = 'HR Successor';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Employee Qualifications"; Rec."Employee Qualifications")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Qualifications field.';
                }
                field("Position to Succeed"; Rec."Position to Succeed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Position to Succeed field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID No. field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Date of Join"; Rec."Date of Join")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Join field.';
                }
                field("Succession Date"; Rec."Succession Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Succession Date field.';
                }
                field(Readiness; Rec.Readiness)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Readiness field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Marked"; Rec."Date Marked")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date Marked field.';
                }
            }
        }
    }

    actions { }
}
