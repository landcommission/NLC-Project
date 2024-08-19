#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193585 "HR Leave Relievers cards"
{
    PageType = Card;
    SourceTable = "HR Leave Relievers";
    ApplicationArea = All;
    Caption = 'HR Leave Relievers cards';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Line no"; Rec."Line no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line no field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Pending Assignment"; Rec."Pending Assignment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Assignment field.';
                }
                field("Reliever No"; Rec."Reliever No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever No field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
                field("Applicant No"; Rec."Applicant No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant No field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
