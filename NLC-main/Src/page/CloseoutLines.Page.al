#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193678 "Close out Lines"
{
    PageType = ListPart;
    SourceTable = "Closeout Checklist Lines";
    ApplicationArea = All;
    Caption = 'Close out Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Closeout Nos"; Rec."Closeout Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closeout Nos field.';
                }
                field(Sections; Rec.Sections)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sections field.';
                }
                field(Options; Rec.Options)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Options field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions { }
}
