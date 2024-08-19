#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194024 "Posted IBT Sub Page List"
{
    CardPageId = "Posted IBT Page Card";
    PageType = List;
    SourceTable = "HR Transport Requisition Pass";
    ApplicationArea = All;
    Caption = 'Posted IBT Sub Page List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Req No"; Rec."Req No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Req No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Passenger/s Full Name/s"; Rec."Passenger/s Full Name/s")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passenger/s Full Name/s field.';
                }
                field(Dept; Rec.Dept)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dept field.';
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Work Ticket field.';
                }
            }
        }
    }

    actions
    {
        area(Processing) { }
    }

    var
        GenJnlLine: Record "Gen. Journal Line";
        JTemplate: Code[20];
        "Inter Bank Template Name": Code[50];
        "Inter Bank Journal Batch": Code[50];
        BankAcc: Record "Bank Account";
        LineNo: Integer;
        IBTLines: Record "Clearance Certificate";
        Post: Boolean;
        JournalPostedSuccessfully: Codeunit "Journal Post Successful";
        ApprovalEntries: Page "Approval Entries";
        ApprovalEntry: Record "Approval Entry";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Payment Voucher","Petty Cash",Interbank,None;
        PBEditable: Boolean;
        currBankBalance: Decimal;
        NewBankBalanceAfterPost: Decimal;
        Text001: Label 'The [Requested Amount to Transfer in LCY: %1] should be same as the [Total Line Amount in LCY: %2]';
        Text002: Label 'The Transaction will result in a negative Balance of [%1] in Bank Account [%2 - %3]';
        Text003: Label 'Sorry you are not authorised to Cancel Petty Cash Documents. Please liase with the Approver (%1)';
        Text004: Label 'Document % 1 is already POSTED and cannot be reverted to Pending';
        Text006: Label 'The Transaction will result in a negative Maximum Credit Limit Balance of in Bank Account [%1 - %2]';
}
