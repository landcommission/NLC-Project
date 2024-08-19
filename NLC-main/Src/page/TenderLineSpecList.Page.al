#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193980 "Tender Line Spec List"
{
    PageType = List;
    SourceTable = "Tender Line Specification";
    ApplicationArea = All;
    Caption = 'Tender Line Spec List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Specification; Rec.Specification)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specification field.';
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value field.';
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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
            }
        }
    }

    actions { }
}
