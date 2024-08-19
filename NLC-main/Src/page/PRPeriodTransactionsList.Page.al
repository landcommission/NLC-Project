page 50025 PRPeriodTransactionsList
{
    ApplicationArea = All;
    Caption = 'PRPeriodTransactionsList';
    PageType = Card;
    SourceTable = "PR Period Transactions";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Period Year"; Rec."Period Year")
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}
