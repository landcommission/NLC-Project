#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193993 "Banks List"
{
    PageType = List;
    SourceTable = "Banks List";
    ApplicationArea = All;
    Caption = 'Banks List';
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
                field("Name Of Bank"; Rec."Name Of Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name Of Bank field.';
                }
                field("Amount Deposited Bank"; Rec."Amount Deposited Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Deposited Bank field.';
                }
                field("Account Name In Bank"; Rec."Account Name In Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name In Bank field.';
                }
            }
        }
    }

    actions { }
}
