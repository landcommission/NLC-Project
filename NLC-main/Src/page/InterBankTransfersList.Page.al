#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193649 "InterBank Transfers List"
{
    CardPageId = "Bank & Cash Transfer Request";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "InterBank Transfers";
    SourceTableView = where(Posted = const(false));
    ApplicationArea = All;
    Caption = 'InterBank Transfers List';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Source Transfer Type"; Rec."Source Transfer Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Transfer Type field.';
                }
                field("Paying  Bank Account Name"; Rec."Paying  Bank Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying  Bank Account Name field.';
                }
                field("Receiving Transfer Type"; Rec."Receiving Transfer Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receiving Transfer Type field.';
                }
                field("Receiving Bank Account Name"; Rec."Receiving Bank Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receiving Bank Account Name field.';
                }
                field("Currency Code Destination"; Rec."Currency Code Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code Destination field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Cancelled By"; Rec."Cancelled By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cancelled By field.';
                }
                field("Time Cancelled"; Rec."Time Cancelled")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Cancelled field.';
                }
                field("Date Cancelled"; Rec."Date Cancelled")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Cancelled field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank;
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := DocumentType::Interbank;
                        ApprovalEntries.Setfilters(Database::"InterBank Transfers", DocumentType, Rec.No);
                        ApprovalEntries.Run();
                    end;
                }
                separator(Action1102755010) { }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        //Release the ImprestSurrender for Approval
                        Rec.TestField(Rec."Request Amt LCY");
                        //TESTFIELD("Pay Amt LCY");

                        //if ApprovalMgt.SendInterbankapprovalRequest(Rec) then;
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Request action.';

                }
                separator(Action1102755007) { }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange(Rec.No, Rec.No);
                        Report.Run(39006009, true, true, Rec);
                        Rec.Reset();
                    end;
                }
                action("Cancel Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Document';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Document action.';
                    trigger OnAction()
                    var
                        Text000: Label 'Are you sure you want to Cancel this Document?';
                        Text001: Label 'You have selected not to Cancel this Document';
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        if Confirm(Text000, true) then begin
                            Rec.Status := Rec.Status::Cancelled;
                            Rec."Cancelled By" := UserId;
                            Rec."Date Cancelled" := Today;
                            Rec."Time Cancelled" := Time;
                            Rec.Modify();
                        end else
                            Error(Text001);
                    end;
                }
            }
            action("&Post")
            {
                ApplicationArea = Basic;
                Caption = '&Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Post action.';
                trigger OnAction()
                begin
                    TempBatch.Reset();
                    TempBatch.SetRange(TempBatch.UserID, UserId);
                    if TempBatch.Find('-') then begin
                        Rec."Inter Bank Template Name" := TempBatch."Inter Bank Template Name";
                        Rec."Inter Bank Journal Batch" := TempBatch."Inter Bank Batch Name";
                    end;

                    Rec.TestField(Rec.Status, Rec.Status::Approved);
                    Rec.TestField(Rec."Transfer Release Date");

                    //Check whether the two LCY amounts are same
                    if Rec."Request Amt LCY" <> Rec."Pay Amt LCY" then
                        Error('The [Requested Amount in LCY: %1] should be same as the [Paid Amount in LCY: %2]', Rec."Request Amt LCY", Rec."Pay Amt LCY");

                    //get the source account balance from the database table
                    BankAcc.Reset();
                    BankAcc.SetRange(BankAcc."No.", Rec."Paying Account");
                    BankAcc.SetRange(BankAcc."Bank Type", BankAcc."Bank Type"::Cash);
                    if BankAcc.FindFirst() then begin
                        BankAcc.CalcFields(BankAcc.Balance);
                        Rec."Current Source A/C Bal." := BankAcc.Balance;
                        if (Rec."Current Source A/C Bal." - Rec.Amount) < 0 then
                            Error('The transaction will result in a negative balance in a CASH ACCOUNT.');
                    end;
                    if Rec.Amount = 0 then
                        Error('Please ensure Amount to Transfer is entered');
                    /*Check if the user's batch has any records within it*/
                    GenJnlLine.Reset();
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", Rec."Inter Bank Template Name");
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec."Inter Bank Journal Batch");
                    GenJnlLine.DeleteAll();

                    LineNo := 1000;
                    /*Insert the new lines to be updated*/
                    GenJnlLine.Init();
                    /*Insert the lines*/
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Journal Template Name" := Rec."Inter Bank Template Name";
                    GenJnlLine."Journal Batch Name" := Rec."Inter Bank Journal Batch";
                    GenJnlLine."Posting Date" := Rec."Transfer Release Date";
                    GenJnlLine."Document No." := Rec.No;
                    if Rec."Receiving Transfer Type" = Rec."Receiving Transfer Type"::"Intra-Company" then
                        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account"
                    else
                        if Rec."Receiving Transfer Type" = Rec."Receiving Transfer Type"::"Inter-Company" then
                            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"IC Partner";
                    GenJnlLine."Account No." := Rec."Receiving Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + Format(Rec.No);
                    GenJnlLine."Shortcut Dimension 1 Code" := Rec."Receiving Depot Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Receiving Department Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code1");
                    GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code1");
                    GenJnlLine."External Document No." := Rec."External Doc No.";
                    GenJnlLine.Description := Rec.Remarks;
                    if Rec.Remarks = '' then
                        GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + Format(Rec.No);
                    GenJnlLine."Currency Code" := Rec."Currency Code Destination";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    if Rec."Currency Code Destination" <> '' then begin
                        GenJnlLine."Currency Factor" := Rec."Exch. Rate Destination";//"Reciprical 2";
                        GenJnlLine.Validate(GenJnlLine."Currency Factor");
                    end;
                    GenJnlLine.Amount := Rec."Amount 2";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Insert();


                    GenJnlLine.Init();
                    /*Insert the lines*/
                    GenJnlLine."Line No." := LineNo + 1;
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Journal Template Name" := Rec."Inter Bank Template Name";
                    GenJnlLine."Journal Batch Name" := Rec."Inter Bank Journal Batch";
                    GenJnlLine."Posting Date" := Rec."Transfer Release Date";
                    GenJnlLine."Document No." := Rec.No;
                    if Rec."Source Transfer Type" = Rec."Source Transfer Type"::"Intra-Company" then
                        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account"
                    else
                        if Rec."Source Transfer Type" = Rec."Source Transfer Type"::"Inter-Company" then
                            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"IC Partner";


                    GenJnlLine."Account No." := Rec."Paying Account";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code" := Rec."Source Depot Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Source Department Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                    GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                    GenJnlLine."External Document No." := Rec."External Doc No.";
                    GenJnlLine.Description := Rec.Remarks;
                    if Rec.Remarks = '' then
                        GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + Format(Rec.No);
                    GenJnlLine."Currency Code" := Rec."Currency Code Source";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    if Rec."Currency Code Source" <> '' then begin
                        GenJnlLine."Currency Factor" := Rec."Exch. Rate Source";//"Reciprical 1";
                        GenJnlLine.Validate(GenJnlLine."Currency Factor");
                    end;
                    GenJnlLine.Amount := -Rec.Amount;
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Insert();
                    Post := false;
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", GenJnlLine);
                    Post := JournalPostedSuccessfully.PostedSuccessfully();

                    if Post then begin
                        Rec.Posted := true;
                        Rec."Date Posted" := Today;
                        Rec."Time Posted" := Time;
                        Rec."Posted By" := UserId;
                        Rec.Modify();
                        Message('The Journal Has Been Posted Successfully');
                    end;

                end;
            }
        }
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Reciept Responsibility Center", UserMgt.GetPurchasesFilter());
            //  setrange("global Dimension 2 Code",UserMgt.GetSetDimensions(userid,2));
            Rec.FilterGroup(0);
        end;
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TempBatch: Record "Cash Office User Template";
        JTemplate: Code[20];
        JBatch: Code[20];
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        BankAcc: Record "Bank Account";
        RegNo: Integer;
        FromNo: Integer;
        ToNo: Integer;
        RegMgt: Codeunit "Register Management";
        JournalPostedSuccessfully: Codeunit "Journal Post Successful";
        RespCenter: Record "Responsibility Center BR 2";
        UserMgt: Codeunit "User Setup Management BR";
        [InDataSet]
        "Exch. Rate DestinationVisible": Boolean;
        [InDataSet]
        "Exch. Rate SourceVisible": Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        ReceivingTransferTypeEditable: Boolean;
        [InDataSet]
        RecieptResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Receiving AccountEditable": Boolean;
        [InDataSet]
        "Amount 2Editable": Boolean;
        [InDataSet]
        RemarksEditable: Boolean;
        [InDataSet]
        "Exch. Rate DestinationEditable": Boolean;
        [InDataSet]
        "Source Transfer TypeEditable": Boolean;
        [InDataSet]
        SendingResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Paying AccountEditable": Boolean;
        [InDataSet]
        AmountEditable: Boolean;
        [InDataSet]
        "Exch. Rate SourceEditable": Boolean;
        [InDataSet]
        "External Doc No.Editable": Boolean;
        [InDataSet]
        "Transfer Release DateEditable": Boolean;
        ApprovalEntries: Page "Approval Entries";
}
