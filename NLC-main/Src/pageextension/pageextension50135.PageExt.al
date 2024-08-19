#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50135 pageextension50135 extends "Bank Account Statement"
{
    actions
    {
        addafter("&Card")
        {
            action("Posted Bank Reconciliation")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Posted Bank Reconciliation action.';
                trigger OnAction()
                begin
                    BankAccountStatement.Reset();
                    BankAccountStatement.SetRange(BankAccountStatement."Statement No.", Rec."Statement No.");
                    BankAccountStatement.SetRange(BankAccountStatement."Bank Account No.", Rec."Bank Account No.");
                    if BankAccountStatement.Find('-') then
                        Report.Run(Report::"Bank Account - Labels", true, false, BankAccountStatement);
                end;
            }
        }
    }

    var
        BankAccountStatement: Record "Bank Account Statement";
}
