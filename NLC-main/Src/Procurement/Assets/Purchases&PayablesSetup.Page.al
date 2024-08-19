// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 460 "Purchases & Payables Setup"
// {
//     Caption = 'Purchases & Payables Setup';
//     DataCaptionExpression = '';
//     DeleteAllowed = false;
//     InsertAllowed = false;
//     PageType = Card;
//     SourceTable = "Purchases & Payables Setup";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field(DiscountPosting; "Discount Posting")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(ReceiptonInvoice; "Receipt on Invoice")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(ReturnShipmentonCreditMemo; "Return Shipment on Credit Memo")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(InvoiceRounding; "Invoice Rounding")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(ExtDocNoMandatory; "Ext. Doc. No. Mandatory")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(AllowVATDifference; "Allow VAT Difference")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CalcInvDiscount; "Calc. Inv. Discount")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CalcInvDiscperVATID; "Calc. Inv. Disc. per VAT ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(ApplnbetweenCurrencies; "Appln. between Currencies")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CopyCommentsBlankettoOrder; "Copy Comments Blanket to Order")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CopyCommentsOrdertoInvoice; "Copy Comments Order to Invoice")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CopyCommentsOrdertoReceipt; "Copy Comments Order to Receipt")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CopyCmtsRetOrdtoCrMemo; "Copy Cmts Ret.Ord. to Cr. Memo")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CopyCmtsRetOrdtoRetShpt; "Copy Cmts Ret.Ord. to Ret.Shpt")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(ExactCostReversingMandatory; "Exact Cost Reversing Mandatory")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CheckPrepmtwhenPosting; "Check Prepmt. when Posting")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(ArchiveQuotesandOrders; "Archive Quotes and Orders")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(DefaultPostingDate; "Default Posting Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(DefaultQtytoReceive; "Default Qty. to Receive")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             group(Numbering)
//             {
//                 Caption = 'Numbering';
//                 field(VendorNos; "Vendor Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(QuoteNos; "Quote Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(BlanketOrderNos; "Blanket Order Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(OrderNos; "Order Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(ReturnOrderNos; "Return Order Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(InvoiceNos; "Invoice Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(PostedInvoiceNos; "Posted Invoice Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(CreditMemoNos; "Credit Memo Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(PostedCreditMemoNos; "Posted Credit Memo Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(PostedReceiptNos; "Posted Receipt Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(PostedReturnShptNos; "Posted Return Shpt. Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(PostedPrepmtInvNos; "Posted Prepmt. Inv. Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(PostedPrepmtCrMemoNos; "Posted Prepmt. Cr. Memo Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(StoresRequisitionNo; "Stores Requisition No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(StoreRequisitionNos; "Store Requisition Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(PurchaseReqNo; "Purchase Req No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(StartOrderfromRequisition; "Start Order from Requisition")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(RequisitionDefaultVendor; "Requisition Default Vendor")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(QuotationRequestNo; "Quotation Request No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(AppraisalParameterNo; "Appraisal Parameter No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(TenderNo; "Tender No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(ContractNo; "Contract No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(DisposalProcessNos; "Disposal Process Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(InternalMemoNos; "Internal Memo Nos.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(AssetReceivingNo; "Asset Receiving No")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//             group(BackgroundPosting)
//             {
//                 Caption = 'Background Posting';
//                 group(Post)
//                 {
//                     Caption = 'Post';
//                     field(PostwithJobQueue; "Post with Job Queue")
//                     {
//                         ApplicationArea = Basic;
//                     }
//                     field(JobQueuePriorityforPost; "Job Queue Priority for Post")
//                     {
//                         ApplicationArea = Basic;
//                     }
//                 }
//                 group(PostPrint)
//                 {
//                     Caption = 'Post & Print';
//                     field(PostPrintwithJobQueue; "Post & Print with Job Queue")
//                     {
//                         ApplicationArea = Basic;
//                     }
//                     field(JobQPrioforPostPrint; "Job Q. Prio. for Post & Print")
//                     {
//                         ApplicationArea = Basic;
//                     }
//                 }
//                 group(Control9)
//                 {
//                     Caption = 'General';
//                     field(JobQueueCategoryCode; "Job Queue Category Code")
//                     {
//                         ApplicationArea = Basic;
//                     }
//                     field(NotifyOnSuccess; "Notify On Success")
//                     {
//                         ApplicationArea = Basic;
//                     }
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control1900383207; Links)
//             {
//                 Visible = false;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnOpenPage()
//     begin
//         Reset;
//         if not Get then begin
//             Init;
//             Insert;
//         end;
//     end;
// }

