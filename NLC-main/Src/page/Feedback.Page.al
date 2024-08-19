#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193981 Feedback
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Online Feedback";
    UsageCategory = Lists;
    Caption = 'Feedback';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Sender Email"; Rec."Sender Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Email field.';
                }
            }
        }
    }

    actions { }
}
