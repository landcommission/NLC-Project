#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56124 "Case Mentions"
{
    PageType = ListPart;
    SourceTable = "Case Hearing";
    ApplicationArea = All;
    Caption = 'Case Mentions';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Day field.';
                }
                field("Mention Date"; Rec."Last Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Hearing Date field.';
                }
                field(Progress; Rec.Progress)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Progress field.';
                }
                field("Next Mention Date"; Rec."Next Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Hearing Date field.';
                }
                field("Advocate On Record"; Rec."Advocate On Record")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advocate On Record field.';
                }
                field("Bring Up Date"; Rec."Bring Up Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bring Up Date field.';
                }
                field(Decision; Rec.Decision)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Decision field.';
                }
            }
        }
    }

    actions { }

}

#pragma implicitwith restore

