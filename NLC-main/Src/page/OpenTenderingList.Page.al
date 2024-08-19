#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193940 "Open Tendering List"
{
    ApplicationArea = Basic;
    CardPageId = "Open Tendering";
    PageType = List;
    SourceTable = "Purchase Quote Header";
    SourceTableView = where("Document Type" = const("Open Tender"));
    UsageCategory = Documents;
    Caption = 'Open Tendering List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Your Reference field.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Code field.';
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Name field.';
                }
                field("Ship-to Name 2"; Rec."Ship-to Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Name 2 field.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Address field.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Address 2 field.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to City field.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Contact field.';
                }
                field("Expected Opening Date"; Rec."Expected Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Opening Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Expected Closing Date"; Rec."Expected Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Closing Date field.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Description field.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Terms Code field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Discount % field.';
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pmt. Discount Date field.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shipment Method Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Posting Group field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prices Including VAT field.';
                }
                field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice Disc. Code field.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Language Code field.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchaser Code field.';
                }
                field("Order Class"; Rec."Order Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order Class field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Printed field.';
                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On Hold field.';
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-to Doc. Type field.';
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-to Doc. No. field.';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. Account No. field.';
                }
                field(Receive; Rec.Receive)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receive field.';
                }
                field(Invoice; Rec.Invoice)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Including VAT field.';
                }
                field("Receiving No."; Rec."Receiving No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receiving No. field.';
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting No. field.';
                }
                field("Last Receiving No."; Rec."Last Receiving No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Receiving No. field.';
                }
                field("Last Posting No."; Rec."Last Posting No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Posting No. field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Method field.';
                }
                field("VAT Country/Region Code"; Rec."VAT Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Country/Region Code field.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Post Code field.';
                }
                field("Ship-to County"; Rec."Ship-to County")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to County field.';
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Country/Region Code field.';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. Account Type field.';
                }
                field("Order Address Code"; Rec."Order Address Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order Address Code field.';
                }
                field("Entry Point"; Rec."Entry Point")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry Point field.';
                }
                field(Correction; Rec.Correction)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Correction field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Area"; Rec.Area)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Area field.';
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Specification field.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Method Code field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting No. Series field.';
                }
                field("Receiving No. Series"; Rec."Receiving No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receiving No. Series field.';
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Area Code field.';
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Liable field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-to ID field.';
                }
                field("VAT Base Discount %"; Rec."VAT Base Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Base Discount % field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Invoice Discount Calculation"; Rec."Invoice Discount Calculation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice Discount Calculation field.';
                }
                field("Invoice Discount Value"; Rec."Invoice Discount Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice Discount Value field.';
                }
                field("Send IC Document"; Rec."Send IC Document")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send IC Document field.';
                }
                field("IC Status"; Rec."IC Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IC Status field.';
                }
                field("Buy-from IC Partner Code"; Rec."Buy-from IC Partner Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Buy-from IC Partner Code field.';
                }
                field("Pay-to IC Partner Code"; Rec."Pay-to IC Partner Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay-to IC Partner Code field.';
                }
                field("IC Direction"; Rec."IC Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IC Direction field.';
                }
                field("Quote No."; Rec."Quote No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quote No. field.';
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Archived Versions field.';
                }
                field("Doc. No. Occurrence"; Rec."Doc. No. Occurrence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Doc. No. Occurrence field.';
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Campaign No. field.';
                }
                field("Buy-from Contact No."; Rec."Buy-from Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Buy-from Contact No. field.';
                }
                field("Pay-to Contact No."; Rec."Pay-to Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay-to Contact No. field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Completely Received"; Rec."Completely Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completely Received field.';
                }
                field("Posting from Whse. Ref."; Rec."Posting from Whse. Ref.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting from Whse. Ref. field.';
                }
                field("Location Filter"; Rec."Location Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Filter field.';
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Receipt Date field.';
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Promised Receipt Date field.';
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Time Calculation field.';
                }
                field("Inbound Whse. Handling Time"; Rec."Inbound Whse. Handling Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inbound Whse. Handling Time field.';
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filter field.';
                }
                field("Return Shipment No."; Rec."Return Shipment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Shipment No. field.';
                }
                field("Return Shipment No. Series"; Rec."Return Shipment No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Shipment No. Series field.';
                }
                field(Ship; Rec.Ship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship field.';
                }
                field("Last Return Shipment No."; Rec."Last Return Shipment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Return Shipment No. field.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned User ID field.';
                }
                field(Copied; Rec.Copied)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copied field.';
                }
                field("Debit Note"; Rec."Debit Note")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Debit Note field.';
                }
                field("PRF No"; Rec."PRF No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PRF No field.';
                }
                field("Released By"; Rec."Released By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Released By field.';
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Release Date field.';
                }
                field(Cancelled; Rec.Cancelled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cancelled field.';
                }
                field("Cancelled By"; Rec."Cancelled By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cancelled By field.';
                }
                field("Cancelled Date"; Rec."Cancelled Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cancelled Date field.';
                }
                field(DocApprovalType; Rec.DocApprovalType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DocApprovalType field.';
                }
                field("Procurement Type Code"; Rec."Procurement Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type Code field.';
                }
                field("Internal Requisition No."; Rec."Internal Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Requisition No. field.';
                }
                field("Date Received"; Rec."Date Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Received field.';
                }
                field("Time Received"; Rec."Time Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Received field.';
                }
                field("BizTalk Purchase Quote"; Rec."BizTalk Purchase Quote")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BizTalk Purchase Quote field.';
                }
                field("BizTalk Purch. Order Cnfmn."; Rec."BizTalk Purch. Order Cnfmn.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BizTalk Purch. Order Cnfmn. field.';
                }
                field("BizTalk Purchase Invoice"; Rec."BizTalk Purchase Invoice")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BizTalk Purchase Invoice field.';
                }
                field("BizTalk Purchase Receipt"; Rec."BizTalk Purchase Receipt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BizTalk Purchase Receipt field.';
                }
                field("BizTalk Purchase Credit Memo"; Rec."BizTalk Purchase Credit Memo")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BizTalk Purchase Credit Memo field.';
                }
                field("Date Sent"; Rec."Date Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Sent field.';
                }
                field("Time Sent"; Rec."Time Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Sent field.';
                }
                field("BizTalk Request for Purch. Qte"; Rec."BizTalk Request for Purch. Qte")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BizTalk Request for Purch. Qte field.';
                }
                field("BizTalk Purchase Order"; Rec."BizTalk Purchase Order")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BizTalk Purchase Order field.';
                }
                field("Vendor Quote No."; Rec."Vendor Quote No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Quote No. field.';
                }
                field("BizTalk Document Sent"; Rec."BizTalk Document Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BizTalk Document Sent field.';
                }
            }
        }
    }

    actions { }
}
