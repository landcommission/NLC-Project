#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193427 "HR Job Responsiblities Lines"
{
    PageType = List;
    SourceTable = "HR Job Responsiblities";
    ApplicationArea = All;
    Caption = 'HR Job Responsiblities Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Request No"; "Request No")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }
                field("Responsibility Code"; Rec."Responsibility Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Responsibility Code field.';
                }
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Responsibility Description field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions { }
}
