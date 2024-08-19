#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193674 "Central Payment"
{
    Caption = 'Central Payment';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Load,Discharge';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,Load,Discharge;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; "Paid By"; Code[50])
        {
            Caption = 'Sender ID';
            Description = 'Cashier';
        }
        field(8; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(9; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Canceled,Rejected,Posted';
            OptionMembers = Open,Canceled,Rejected,Posted;
        }
        field(10; "Date Created"; DateTime)
        {
            Caption = 'Date-Time Sent for Approval';
        }
        field(11; "Last Date-Time Modified"; DateTime)
        {
            Caption = 'Last Date-Time Modified';
        }
        field(12; "Last Modified By ID"; Code[50])
        {
            Caption = 'Last Modified By ID';
        }
        field(13; Comment; Boolean)
        {
            CalcFormula = exist("Approval Comment Line" where("Table ID" = field("Table ID"),
                                                               "Document Type" = field("Document Type"),
                                                               "Document No." = field("Document No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(15; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(16; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
        }
        field(17; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(19; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
        }
        field(20; Payee; Code[100])
        {
            Caption = 'Payee';
        }
        field(21; "Date Paid"; Date)
        {
            Caption = 'Date Paid';
        }
        field(22; "Cheque No."; Code[20])
        {
            Caption = 'Cheque No.';
        }
        field(23; "Cheque type"; Option)
        {
            OptionMembers = " ","Computer Check","Manual Check";
            Caption = 'Cheque type';
        }
        field(24; "Release Date"; Date)
        {
            Caption = 'Release Date';
        }
        field(25; Approved; Boolean)
        {
            Caption = 'Approved';
        }
        field(26; DocumentPosted; Boolean)
        {
            Caption = 'DocumentPosted';
        }
    }

    keys
    {
        key(Key1; "Table ID", "Document Type", "Document No.")
        {
            Clustered = true;
        }
        key(Key2; Status) { }
        key(Key3; "Paid By") { }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        "Date Created" := CurrentDateTime;
    end;


    procedure ShowDocument()
    var
        SalesHeader: Record "Sales Header";
        PurchHeader: Record "Purchase Header";
        PaymentsHeader: Record "Payments Header";
        ImprestHeader: Record "Imprest Header";
        SRHeader: Record "Store Requistion Header";
        ImprestSurr: Record "Imprest Surrender Header";
        Interbank: Record "InterBank Transfers";
        StaffAdvance: Record "Staff Advance Header";
        StaffAdvanceSurr: Record "Staff Advance Surrender Header";
    begin
        case "Table ID" of
            Database::"Sales Header":
                begin
                    if not SalesHeader.Get("Document Type", "Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::Quote:
                            Page.Run(Page::"Sales Quote", SalesHeader);
                        "Document Type"::Order:
                            Page.Run(Page::"Sales Order", SalesHeader);
                        "Document Type"::Invoice:
                            Page.Run(Page::"Sales Invoice", SalesHeader);
                        "Document Type"::"Credit Memo":
                            Page.Run(Page::"Sales Credit Memo", SalesHeader);
                        "Document Type"::"Blanket Order":
                            Page.Run(Page::"Blanket Sales Order", SalesHeader);
                        "Document Type"::"Return Order":
                            Page.Run(Page::"Sales Return Order", SalesHeader);
                    end;
                end;
            Database::"Purchase Header":
                begin
                    if not PurchHeader.Get("Document Type", "Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::Quote:
                            Page.Run(Page::"Purchase Quote", PurchHeader);
                        "Document Type"::Order:
                            Page.Run(Page::"Purchase Order", PurchHeader);
                        "Document Type"::Invoice:
                            Page.Run(Page::"Purchase Invoice", PurchHeader);
                        "Document Type"::"Credit Memo":
                            Page.Run(Page::"Purchase Credit Memo", PurchHeader);
                        "Document Type"::"Blanket Order":
                            Page.Run(Page::"Blanket Purchase Order", PurchHeader);
                        "Document Type"::"Return Order":
                            Page.Run(Page::"Purchase Return Order", PurchHeader);
                    end;
                end;

            //Other Customized Documents

            //Payment Voucher and Petty Cash
            Database::"Payments Header":
                begin
                    if not PaymentsHeader.Get("Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::"Payment Voucher":
                            Page.Run(Page::"Payment Header", PaymentsHeader);
                        "Document Type"::"Petty Cash":
                            Page.Run(Page::"Cash Payment Header", PaymentsHeader);
                    end;
                end;

            //Imprests
            Database::"Imprest Header":
                begin
                    if not ImprestHeader.Get("Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::Imprest:
                            Page.Run(Page::"Imprest Request", ImprestHeader);
                    end;
                end;

            //staff advance
            Database::"Staff Advance Header":
                begin
                    if not StaffAdvance.Get("Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::"Staff Advance":
                            Page.Run(Page::"Staff Advance Request", StaffAdvance);
                    end;
                end;

            //Staff Advance Surrender Header
            Database::"Staff Advance Surrender Header":
                begin
                    if not StaffAdvanceSurr.Get("Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::AdvanceSurrender:
                            Page.Run(Page::"Staff Advance Surrender", StaffAdvanceSurr);
                    end;
                end;



            //Store Requisition
            Database::"Store Requistion Header":
                begin
                    if not SRHeader.Get("Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::Requisition:
                            Page.Run(Page::"Record Link View", SRHeader);
                    end;
                end;

            //Imprest Surrender
            Database::"Imprest Surrender Header":
                begin
                    if not ImprestSurr.Get("Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::ImprestSurrender:
                            Page.Run(Page::"Imprest Surrender", ImprestSurr);
                    end;
                end;
            //Interbank Transfer
            Database::"InterBank Transfers":
                begin
                    if not Interbank.Get("Document No.") then
                        exit;
                    case "Document Type" of
                        "Document Type"::Interbank:
                            Page.Run(Page::"Bank & Cash Transfer Request", Interbank);
                    end;
                end;

            else
                exit;
        end;
    end;
}
