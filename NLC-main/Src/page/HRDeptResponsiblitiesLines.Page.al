#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194136 "HR Dept. Responsiblities Lines"
{
    PageType = List;
    SourceTable = "HR Dept. Responsibilities";
    ApplicationArea = All;
    Caption = 'HR Dept. Responsiblities Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Responsibility code"; Rec."Responsibility code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility code field.';
                }
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Description field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions { }
}
