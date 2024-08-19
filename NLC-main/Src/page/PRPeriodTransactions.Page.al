page 50023 "PR Period Transactions"
{
    ApplicationArea = All;
    Caption = 'PR Period Transactions';
    PageType = Card;
    SourceTable = "PR Period Transactions";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Payroll Period"; Rec."Payroll Period")
                {
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
            }
        }
    }
}
