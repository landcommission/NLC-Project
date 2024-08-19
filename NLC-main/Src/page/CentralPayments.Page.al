#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193673 "Central Payments"
{
    Editable = false;
    PageType = List;
    SourceTable = "Central Payment";
    SourceTableView = where(Status = filter(<> Posted));
    ApplicationArea = All;
    Caption = 'Central Payments';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Table ID field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Paid By"; Rec."Paid By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Date Paid"; Rec."Date Paid")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Paid field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date-Time Sent for Approval field.';
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Date-Time Modified field.';
                }
                field("Last Modified By ID"; Rec."Last Modified By ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Modified By ID field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                Image = View;
                action(Document)
                {
                    ApplicationArea = Basic;
                    Caption = 'Document';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Document action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocument();
                    end;
                }
                action("<Page Comments>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "Funds Mgt Comment Sheet";
                    RunPageLink = "Table Id" = field("Table ID"),
                                  "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No.");
                    RunPageView = sorting("Table Id", "Document Type", "Document No.");
                    ToolTip = 'Executes the Comments action.';
                }
                action("O&verdue Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'O&verdue Entries';
                    Image = OverdueEntries;
                    ToolTip = 'Executes the O&verdue Entries action.';
                    trigger OnAction()
                    begin
                        Rec.SetFilter(Rec.Status, '%1|%2', Rec.Status::Open, Rec.Status::Canceled);
                        Rec.SetFilter(Rec."Due Date", '<%1', Today);
                    end;
                }
                action("All Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'All Entries';
                    Image = Entries;
                    ToolTip = 'Executes the All Entries action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange(Rec.Status);
                        Rec.SetRange(Rec."Due Date");
                    end;
                }
            }
        }
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = '&Post';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Post action.';
                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                    CentralPayment: Record "Central Payment";
                    PaymentHeaderForm: Page "Payment Header";
                    PaymentHeader: Record "Payments Header";
                    PettyCashForm: Page "Cash Payment Header";
                    ImprestHeader: Record "Imprest Header";
                    ImprestHeaderForm: Page "Imprest Request";
                    StaffAdvance: Record "Staff Advance Header";
                    StaffAdvanceForm: Page "Staff Advance Request";
                begin
                    /*
                    CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    IF ApprovalEntry.FIND('-') THEN
                      REPEAT
                        ApprovalMgt.ApproveApprovalRequest(ApprovalEntry);
                      UNTIL ApprovalEntry.NEXT = 0;
                    */
                    CurrPage.SetSelectionFilter(CentralPayment);
                    if CentralPayment.Find('-') then
                        repeat
                            case CentralPayment."Table ID" of
                                Database::"Payments Header":

                                    case CentralPayment."Document Type" of
                                        CentralPayment."Document Type"::"Payment Voucher":
                                            begin
                                                PaymentHeader.Get(CentralPayment."Document No.");
                                                if PaymentHeader."Cheque No." = '' then
                                                    PaymentHeader."Cheque No." := Rec."Cheque No.";
                                                if PaymentHeader."Cheque Type" = 0 then
                                                    PaymentHeader."Cheque Type" := Rec."Cheque type";
                                                if PaymentHeader."Payment Release Date" = 0D then
                                                    PaymentHeader."Payment Release Date" := Rec."Release Date";
                                                PaymentHeader.Modify();
                                                PaymentHeaderForm.SetRecord(PaymentHeader);
                                                PaymentHeaderForm.CheckPVRequiredItems(PaymentHeader);
                                                PaymentHeaderForm.PostPaymentVoucher(PaymentHeader);
                                                CentralPayment.Status := CentralPayment.Status::Posted;
                                                CentralPayment.Modify();
                                            end;

                                        CentralPayment."Document Type"::"Petty Cash":
                                            begin
                                                PaymentHeader.Get(CentralPayment."Document No.");
                                                if PaymentHeader."Cheque No." = '' then
                                                    PaymentHeader."Cheque No." := Rec."Cheque No.";
                                                if PaymentHeader."Cheque Type" = 0 then
                                                    PaymentHeader."Cheque Type" := Rec."Cheque type";
                                                if PaymentHeader."Payment Release Date" = 0D then
                                                    PaymentHeader."Payment Release Date" := Rec."Release Date";
                                                PaymentHeader.Modify();
                                                PettyCashForm.SetRecord(PaymentHeader);
                                                PettyCashForm.CheckPVRequiredItems(PaymentHeader);
                                                PettyCashForm.PostPaymentVoucher(PaymentHeader);
                                                CentralPayment.Status := CentralPayment.Status::Posted;
                                                CentralPayment.Modify();
                                            end
                                    end;

                                Database::"Imprest Header":
                                    begin
                                        ImprestHeader.Get(CentralPayment."Document No.");
                                        if ImprestHeader."Payment Release Date" = 0D then
                                            ImprestHeader."Payment Release Date" := Rec."Release Date";
                                        ImprestHeader.Modify();
                                        ImprestHeaderForm.SetRecord(ImprestHeader);
                                        ImprestHeaderForm.CheckImprestRequiredItems(ImprestHeader);
                                        ImprestHeaderForm.PostImprest(ImprestHeader);
                                        CentralPayment.Status := CentralPayment.Status::Posted;
                                        CentralPayment.Modify();
                                    end;

                                Database::"Staff Advance Header":
                                    begin
                                        StaffAdvance.Get(CentralPayment."Document No.");
                                        if StaffAdvance."Payment Release Date" = 0D then
                                            StaffAdvance."Payment Release Date" := Rec."Release Date";
                                        StaffAdvance.Modify();
                                        StaffAdvanceForm.SetRecord(StaffAdvance);
                                        StaffAdvanceForm.CheckImprestRequiredItems(StaffAdvance);
                                        StaffAdvanceForm.PostImprest(StaffAdvance);
                                        CentralPayment.Status := CentralPayment.Status::Posted;
                                        CentralPayment.Modify();
                                    end


                                else
                                    exit;
                            end
                        until CentralPayment.Next() = 0;

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Report.Run(39005899, false, false);
        Rec.SetRange(Rec.DocumentPosted, false);
    end;
}
