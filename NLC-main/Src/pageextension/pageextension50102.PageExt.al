#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50102 pageextension50102 extends "Chart of Accounts"
{
    layout
    {
        addafter("Net Change")
        {
            field("Budgeted Amount"; Rec."Budgeted Amount")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies either the G/L account''s total budget or, if you have specified a name in the Budget Name field, a specific budget.';
            }
        }
        addafter("Consol. Translation Method")
        {
            field("Expense Code"; Rec."Expense Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Expense Code field.';
            }
        }
    }
}
