#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193994 "Partnership List"
{
    PageType = List;
    SourceTable = Partnership;
    ApplicationArea = All;
    Caption = 'Partnership List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Questionaire No"; Rec."Questionaire No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Questionaire No field.';
                }
                field("Tender No."; Rec."Tender No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender No. field.';
                }
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality field.';
                }
                field("Shares Held"; Rec."Shares Held")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shares Held field.';
                }
            }
        }
    }

    actions { }
}
