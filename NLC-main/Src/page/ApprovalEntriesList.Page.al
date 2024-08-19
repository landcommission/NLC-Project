page 50026 ApprovalEntriesList
{
    ApplicationArea = All;
    Caption = 'ApprovalEntriesList';
    PageType = Card;
    SourceTable = "Approval Entry";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the total amount (excl. VAT) on the document awaiting approval.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ToolTip = 'Specifies the total amount (excl. VAT) on the document awaiting approval. The amount is stated in the local currency.';
                }
                field("Approval Code"; Rec."Approval Code")
                {
                    ToolTip = 'Specifies the value of the Approval Code field.';
                }
                field("Approval Type"; Rec."Approval Type")
                {
                    ToolTip = 'Specifies which approvers apply to this approval template:';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ToolTip = 'Specifies the ID of the user who must approve the document.';
                }
                field("Approver Type"; Rec."Approver Type")
                {
                    ToolTip = 'Specifies the value of the Approval Type field.';
                }
                field("Available Credit Limit (LCY)"; Rec."Available Credit Limit (LCY)")
                {
                    ToolTip = 'Specifies the remaining credit (in LCY) that exists for the customer.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies whether there are comments relating to the approval of the record. If you want to read the comments, choose the field to open the Approval Comment Sheet window.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the code of the currency of the amounts on the sales or purchase lines.';
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                    ToolTip = 'Specifies the date and the time that the document was sent for approval.';
                }
                field("Delegation Date Formula"; Rec."Delegation Date Formula")
                {
                    ToolTip = 'Specifies the value of the Delegation Date Formula field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number copied from the relevant sales or purchase document, such as a purchase order or a sales quote.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the type of document that an approval entry has been created for. Approval entries can be created for six different types of sales or purchase documents:';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies when the record must be approved, by one or more approvers.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                    ToolTip = 'Specifies the date when the approval entry was last modified. If, for example, the document approval is canceled, this field will be updated accordingly.';
                }
                field("Last Modified By User ID"; Rec."Last Modified By User ID")
                {
                    ToolTip = 'Specifies the ID of the user who last modified the approval entry. If, for example, the document approval is canceled, this field will be updated accordingly.';
                }
                field("Limit Type"; Rec."Limit Type")
                {
                    ToolTip = 'Specifies the type of limit that applies to the approval template:';
                }
                field("Number of Approved Requests"; Rec."Number of Approved Requests")
                {
                    ToolTip = 'Specifies the value of the Number of Approved Requests field.';
                }
                field("Number of Rejected Requests"; Rec."Number of Rejected Requests")
                {
                    ToolTip = 'Specifies the value of the Number of Rejected Requests field.';
                }
                field("Pending Approvals"; Rec."Pending Approvals")
                {
                    ToolTip = 'Specifies the value of the Pending Approvals field.';
                }
                field("Record ID to Approve"; Rec."Record ID to Approve")
                {
                    ToolTip = 'Specifies the value of the Record ID to Approve field.';
                }
                field("Related to Change"; Rec."Related to Change")
                {
                    ToolTip = 'Specifies the value of the Related to Change field.';
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ToolTip = 'Specifies the code for the salesperson or purchaser that was in the document to be approved. It is not a mandatory field, but is useful if a salesperson or a purchaser responsible for the customer/vendor needs to approve the document before it is processed.';
                }
                field("Sender ID"; Rec."Sender ID")
                {
                    ToolTip = 'Specifies the ID of the user who sent the approval request for the document to be approved.';
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                    ToolTip = 'Specifies the order of approvers when an approval workflow involves more than one approver.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the approval status for the entry:';
                }
                field("Table ID"; Rec."Table ID")
                {
                    ToolTip = 'Specifies the ID of the table where the record that is subject to approval is stored.';
                }
            }
        }
    }
}
