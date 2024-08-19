#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193730 "JV Header"
{
    PageType = Document;
    SourceTable = "JV Header";
    SourceTableView = where(Status = filter(<> Posted));
    ApplicationArea = All;
    Caption = 'JV Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Expense Code"; Rec."Expense Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Expense Code field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Debit Amount field.';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Credit Amount field.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Balance (LCY) field.';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Applies-to Doc. Type field.';
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Applies-to Doc. No. field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payment Terms Code field.';
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Applies-to ID field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control33; "JV Subform")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(ReOpen)
                {
                    ApplicationArea = Basic;
                    Caption = 'ReOpen';
                    Image = ReOpen;
                    ToolTip = 'Executes the ReOpen action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to ReOpen the document?', false) then begin
                            Rec.Status := Rec.Status::Pending;
                            Rec.Modify();
                        end
                    end;
                }
                separator(Action1000000001) { }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Express Pv",JV,Capex,"Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Disciplinary Approvals",Lease;
                    begin
                        ApprovalEntries.Setfilters(Database::"JV Header", DocumentType::JV, Rec."Document No.");
                        ApprovalEntries.Run();
                    end;
                }
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                action("Test Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Test Report action.';
                    trigger OnAction()
                    begin
                        //ReportPrint.PrintGenJnlLine(Rec);
                        //RESET;
                        Rec.SetRange(Rec."Document No.", Rec."Document No.");
                        Report.Run(Report::"JV Header", true, false, Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        /*
                        //Check batch status is approved
                        GenJnlBatch.RESET;
                        GenJnlBatch.SETRANGE(GenJnlBatch.Name,"Journal Batch Name");//CurrentJnlBatchName);
                        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
                        IF GenJnlBatch.FIND('-') THEN BEGIN
                          IF GenJnlBatch.Status<>GenJnlBatch.Status::Approved THEN
                             ERROR('The Batch %1 you are trying to post is yet to be approved',CurrentJnlBatchName);
                        END;

                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",Rec);

                        //Check batch status is approved
                        IF JournalPosted.PostedSuccessfully() THEN BEGIN
                        GenJnlBatch.RESET;
                        GenJnlBatch.SETRANGE(GenJnlBatch.Name,"Journal Batch Name");//CurrentJnlBatchName);
                        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
                        IF GenJnlBatch.FIND('-') THEN BEGIN
                            GenJnlBatch.Status:=GenJnlBatch.Status::Open;
                            GenJnlBatch.MODIFY;
                        END;
                        END;

                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                        */
                        if Rec.Status <> Rec.Status::Approved then
                            Error('The Document %1 you are trying to post is yet to be approved', Rec."Document No.");
                        PostDoc();

                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'Shift+F9';
                    ToolTip = 'Executes the Post and &Print action.';
                    trigger OnAction()
                    begin
                        /*
                        //Check batch status is approved
                        GenJnlBatch.RESET;
                        GenJnlBatch.SETRANGE(GenJnlBatch.Name,"Journal Batch Name");//CurrentJnlBatchName);
                        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
                        IF GenJnlBatch.FIND('-') THEN BEGIN
                          IF GenJnlBatch.Status<>GenJnlBatch.Status::Approved THEN
                             ERROR('The Batch %1 you are trying to post is yet to be approved',"Journal Batch Name");//CurrentJnlBatchName);
                        END;

                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post+Print",Rec);

                        //Check batch status is approved
                        IF JournalPosted.PostedSuccessfully() THEN BEGIN
                        GenJnlBatch.RESET;
                        GenJnlBatch.SETRANGE(GenJnlBatch.Name,"Journal Batch Name");//CurrentJnlBatchName);
                        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
                        IF GenJnlBatch.FIND('-') THEN BEGIN
                            GenJnlBatch.Status:=GenJnlBatch.Status::Open;
                            GenJnlBatch.MODIFY;
                        END;
                        END;


                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                        */

                        if Rec.Status <> Rec.Status::Approved then
                            Error('The Document %1 you are trying to post is yet to be approved', Rec."Document No.");

                        PostDoc();
                        Commit();
                        Rec.Reset();
                        Rec.SetRange(Rec."Document No.", Rec."Document No.");
                        Report.Run(Report::"JV Header", true, false, Rec);

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        xRec := Rec;
        if Rec.Status <> Rec.Status::Pending then begin
            CurrPage.Editable := false;
            CurrPage.Update();
        end
    end;


    procedure PostDoc()
    var
        JnlLine: Record "Gen. Journal Line";
        CashOfficeUser: Record "Cash Office User Template";
        Lines: Record "JV Lines";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
    begin
        //get cash office user details
        CashOfficeUser.SetRange(CashOfficeUser.UserID, UserId);
        if not CashOfficeUser.FindFirst() then
            Error('Setup the user under Cash Office User Setup');
        if CashOfficeUser."Journal Voucher Template" = '' then
            Error('Journal voucher template must have a value in the Cash Office User Setup');
        if CashOfficeUser."Journal Voucher Batch" = '' then
            Error('Journal voucher batch must have a value in the Cash Office User Setup');
        //delete all journal lines
        JnlLine.SetRange("Journal Template Name", CashOfficeUser."Journal Voucher Template");
        JnlLine.SetRange("Journal Batch Name", CashOfficeUser."Journal Voucher Batch");
        JnlLine.DeleteAll();

        //add header
        LineNo := 10000;
        JnlLine.Init();
        JnlLine."Line No." := LineNo;
        JnlLine."Journal Template Name" := CashOfficeUser."Journal Voucher Template";
        JnlLine."Journal Batch Name" := CashOfficeUser."Journal Voucher Batch";
        JnlLine."Document No." := Rec."Document No.";
        JnlLine."Account Type" := Rec."Account Type";
        JnlLine.Validate("Account No.", Rec."Account No.");
        JnlLine."Document Date" := Rec."Document Date";
        JnlLine."Posting Date" := Rec."Posting Date";
        JnlLine."Document Type" := Rec."Document Type";
        JnlLine.Description := Rec.Description;
        JnlLine.Validate("Currency Code", Rec."Currency Code");
        JnlLine.Validate(Amount, Rec.Amount);
        JnlLine."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
        JnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
        JnlLine."Job No." := Rec."Job No.";
        JnlLine."Payment Terms Code" := Rec."Payment Terms Code";
        JnlLine."Reason Code" := Rec."Reason Code";
        JnlLine."External Document No." := Rec."External Document No.";
        JnlLine."Dimension Set ID" := Rec."Dimension Set ID";
        JnlLine."User ID" := UserId;
        if JnlLine.Amount <> 0 then
            JnlLine.Insert(true);

        //add lines
        Lines.SetRange("Document No.", Rec."Document No.");
        Lines.FindSet();
        repeat
            LineNo += 10000;
            JnlLine.Init();
            JnlLine."Line No." := LineNo;
            JnlLine."Journal Template Name" := CashOfficeUser."Journal Voucher Template";
            JnlLine."Journal Batch Name" := CashOfficeUser."Journal Voucher Batch";
            JnlLine."Document No." := Rec."Document No.";
            JnlLine."Account Type" := Lines."Account Type";
            JnlLine.Validate("Account No.", Lines."Account No.");
            JnlLine."Document Date" := Lines."Document Date";
            JnlLine."Posting Date" := Rec."Posting Date";
            JnlLine."Document Type" := Lines."Document Type";
            JnlLine.Description := Lines.Description;
            JnlLine.Validate("Currency Code", Rec."Currency Code");
            JnlLine.Validate(Amount, Lines.Amount);
            JnlLine."Shortcut Dimension 1 Code" := Lines."Shortcut Dimension 1 Code";
            JnlLine."Shortcut Dimension 2 Code" := Lines."Shortcut Dimension 2 Code";
            JnlLine."Job No." := Lines."Job No.";
            JnlLine."Payment Terms Code" := Lines."Payment Terms Code";
            JnlLine."Reason Code" := Lines."Reason Code";
            JnlLine."External Document No." := Lines."External Document No.";
            JnlLine."Dimension Set ID" := Lines."Dimension Set ID";
            JnlLine."User ID" := UserId;
            if JnlLine.Amount <> 0 then
                JnlLine.Insert(true);
        until Lines.Next() = 0;



        JnlLine.Reset();
        JnlLine.SetRange(JnlLine."Journal Template Name", CashOfficeUser."Journal Voucher Template");
        JnlLine.SetRange(JnlLine."Journal Batch Name", CashOfficeUser."Journal Voucher Batch");
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", JnlLine);

        Post := false;
        Post := JournlPosted.PostedSuccessfully();
        if Post then begin
            Rec.Posted := true;
            Rec."DateTime Posted" := CurrentDateTime;
            Rec."Posted By" := UserId;
            Rec.Status := Rec.Status::Posted;
            Rec.Modify();
        end;
    end;
}
