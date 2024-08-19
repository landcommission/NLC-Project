#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193875 "Budget Grouping Codes"
{
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Budget Grouping Codes";
    ApplicationArea = All;
    Caption = 'Budget Grouping Codes';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Budget Amount"; Rec."Budget Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Amount field.';
                }
            }
        }
    }

    actions { }
}
