#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193461 "HR Employees Supervisee"
{
    PageType = List;
    SourceTable = "HR Employees Supervisees";
    ApplicationArea = All;
    Caption = 'HR Employees Supervisee';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor No. field.';
                }
                field("Supervisee No."; Rec."Supervisee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisee No. field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Key Experience"; Rec."Key Experience")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Key Experience field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Number of Supervisees"; Rec."Number of Supervisees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Supervisees field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755011; Outlook) { }
        }
    }

    actions { }

}
