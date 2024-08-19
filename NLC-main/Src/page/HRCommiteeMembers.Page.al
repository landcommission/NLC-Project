#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193512 "HR Commitee Members"
{
    PageType = List;
    SourceTable = "HR Commitee Members";
    ApplicationArea = All;
    Caption = 'HR Commitee Members';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member No. field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field("Date Appointed"; Rec."Date Appointed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Appointed field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active field.';
                }
            }
        }
    }

    actions { }
}
