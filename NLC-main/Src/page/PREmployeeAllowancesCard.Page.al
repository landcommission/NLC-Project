#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193741 "PR Employee Allowances Card"
{
    PageType = Card;
    SourceTable = "PR Employee Allowances";
    ApplicationArea = All;
    Caption = 'PR Employee Allowances Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Job Group"; Rec."Job Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Group field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'House Allowance for Other Areas Excluding Head Office';
                }
                field("County Desc"; Rec."County Desc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Desc field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions { }
}
