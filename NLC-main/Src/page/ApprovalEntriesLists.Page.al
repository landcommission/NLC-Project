#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193583 "Approval Entries Lists"
{
    PageType = List;
    SourceTable = "Approval Entry";
    ApplicationArea = All;
    Caption = 'Approval Entries Lists';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the table where the record that is subject to approval is stored.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of document that an approval entry has been created for. Approval entries can be created for six different types of sales or purchase documents:';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the document number copied from the relevant sales or purchase document, such as a purchase order or a sales quote.';
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the order of approvers when an approval workflow involves more than one approver.';
                }
                field("Approval Code"; Rec."Approval Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Code field.';
                }
                field("Sender ID"; Rec."Sender ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the user who sent the approval request for the document to be approved.';
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for the salesperson or purchaser that was in the document to be approved. It is not a mandatory field, but is useful if a salesperson or a purchaser responsible for the customer/vendor needs to approve the document before it is processed.';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the user who must approve the document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the approval status for the entry:';
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date and the time that the document was sent for approval.';
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the approval entry was last modified. If, for example, the document approval is canceled, this field will be updated accordingly.';
                }
                // field("Last Modified By ID";Rec."Last Modified By ID")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether there are comments relating to the approval of the record. If you want to read the comments, choose the field to open the Approval Comment Sheet window.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when the record must be approved, by one or more approvers.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total amount (excl. VAT) on the document awaiting approval.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total amount (excl. VAT) on the document awaiting approval. The amount is stated in the local currency.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the currency of the amounts on the sales or purchase lines.';
                }
                field("Approval Type"; Rec."Approval Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies which approvers apply to this approval template:';
                }
                field("Limit Type"; Rec."Limit Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of limit that applies to the approval template:';
                }
                field("Available Credit Limit (LCY)"; Rec."Available Credit Limit (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the remaining credit (in LCY) that exists for the customer.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Approver Type"; Rec."Approver Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Type field.';
                }
            }
        }
    }

    actions { }
}
