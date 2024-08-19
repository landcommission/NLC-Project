#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193615 "Petty Cash Details"
{
    PageType = Card;
    SourceTable = "Imprest Details-User";
    ApplicationArea = All;
    Caption = 'Petty Cash Details';
    layout
    {
        area(Content)
        {
            repeater(Control1102758000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Account No:"; Rec."Account No:")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No: field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Imprest Holder"; Rec."Imprest Holder")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Holder field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Apply to"; Rec."Apply to")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apply to field.';
                }
                field("Apply to ID"; Rec."Apply to ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apply to ID field.';
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrender Date field.';
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrendered field.';
                }
                field("M.R. No"; Rec."M.R. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the M.R. No field.';
                }
                field("Date Issued"; Rec."Date Issued")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Issued field.';
                }
                field("Type of Surrender"; Rec."Type of Surrender")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Surrender field.';
                }
                field("Dept. Vch. No."; Rec."Dept. Vch. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dept. Vch. No. field.';
                }
                field("Cash Surrender Amt"; Rec."Cash Surrender Amt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cash Surrender Amt field.';
                }
                field("Bank/Petty Cash"; Rec."Bank/Petty Cash")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank/Petty Cash field.';
                }
            }
        }
    }

    actions { }
}
