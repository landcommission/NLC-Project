#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193814 "HR Transport Passengers Card"
{
    PageType = Card;
    SourceTable = "HR Transport Requisition Line";
    ApplicationArea = All;
    Caption = 'HR Transport Passengers Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
            }
        }
    }

    actions { }
}
