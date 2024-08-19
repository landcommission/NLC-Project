#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193710 "Posted Bank & Cash Transfer"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancel,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "InterBank Transfers";
    SourceTableView = where(Posted = const(true));
    ApplicationArea = All;
    Caption = 'Posted Bank & Cash Transfer';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = DateEditable;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                label(Control1102758030)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19025618;
                    Style = Standard;
                    StyleExpr = true;
                }
                field("Receiving Transfer Type"; Rec."Receiving Transfer Type")
                {
                    ApplicationArea = Basic;
                    Editable = ReceivingTransferTypeEditable;
                    ToolTip = 'Specifies the value of the Receiving Transfer Type field.';
                }
                field("Reciept Responsibility Center"; Rec."Reciept Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = RecieptResponsibilityCenterEdi;
                    ToolTip = 'Specifies the value of the Reciept Responsibility Center field.';
                }
                field("Receipt Resp Centre"; Rec."Receipt Resp Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Resp Centre field.';
                }
                field("Receiving Account"; Rec."Receiving Account")
                {
                    ApplicationArea = Basic;
                    Editable = "Receiving AccountEditable";
                    ToolTip = 'Specifies the value of the Receiving Account field.';
                    trigger OnValidate()
                    begin
                        ReceivingAccountOnAfterValidat();
                    end;
                }
                field("Receiving Bank Account Name"; Rec."Receiving Bank Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Receiving Bank Account Name field.';
                }
                field("Currency Code Destination"; Rec."Currency Code Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code Destination field.';
                }
                field("Amount 2"; Rec."Amount 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount';
                    Editable = "Amount 2Editable";
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Exch. Rate Destination"; Rec."Exch. Rate Destination")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = "Exch. Rate DestinationVisible";
                    ToolTip = 'Specifies the value of the Exch. Rate Destination field.';
                }
                field("Request Amt LCY"; Rec."Request Amt LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Amt LCY field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Editable = RemarksEditable;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                label(Control1102758029)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19044997;
                    Style = Standard;
                    StyleExpr = true;
                }
                field("Source Transfer Type"; Rec."Source Transfer Type")
                {
                    ApplicationArea = Basic;
                    Editable = "Source Transfer TypeEditable";
                    ToolTip = 'Specifies the value of the Source Transfer Type field.';
                }
                field("Sending Responsibility Center"; Rec."Sending Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = SendingResponsibilityCenterEdi;
                    ToolTip = 'Specifies the value of the Sending Responsibility Center field.';
                }
                field("Sending Resp Centre"; Rec."Sending Resp Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sending Resp Centre field.';
                }
                field("Paying Account"; Rec."Paying Account")
                {
                    ApplicationArea = Basic;
                    Editable = "Paying AccountEditable";
                    ToolTip = 'Specifies the value of the Paying Account field.';
                    trigger OnValidate()
                    begin
                        PayingAccountOnAfterValidate();
                    end;
                }
                field("Paying  Bank Account Name"; Rec."Paying  Bank Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Paying  Bank Account Name field.';
                }
                field("Currency Code Source"; Rec."Currency Code Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code Source field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = AmountEditable;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Pay Amt LCY"; Rec."Pay Amt LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Amt LCY field.';
                }
                field("Exch. Rate Source"; Rec."Exch. Rate Source")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = "Exch. Rate SourceVisible";
                    ToolTip = 'Specifies the value of the Exch. Rate Source field.';
                }
                field("External Doc No."; Rec."External Doc No.")
                {
                    ApplicationArea = Basic;
                    Editable = "External Doc No.Editable";
                    ToolTip = 'Specifies the value of the External Doc No. field.';
                }
                field("Transfer Release Date"; Rec."Transfer Release Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Transfer Release DateEditable";
                    ToolTip = 'Specifies the value of the Transfer Release Date field.';
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
                    begin
                        DocumentType := DocumentType::Interbank;
                        ApprovalEntries.Setfilters(Database::"InterBank Transfers", DocumentType, Rec.No);
                        ApprovalEntries.Run();
                    end;
                }
                separator(Action1102756004) { }
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

                        //SendInterbankapprovalRequest(Rec) then;
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
                separator(Action1102756011) { }
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
                        Report.Run(39005888, true, true, Rec);
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
                Visible = false;
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

    trigger OnAfterGetCurrRecord()
    begin

        if Rec."Currency Code Source" <> '' then
            "Exch. Rate SourceVisible" := true
        else
            "Exch. Rate SourceVisible" := false;

        if Rec."Currency Code Destination" <> '' then
            "Exch. Rate DestinationVisible" := true
        else
            "Exch. Rate DestinationVisible" := false;

        UpdateControl();
    end;

    trigger OnInit()
    begin
        "Transfer Release DateEditable" := true;
        "External Doc No.Editable" := true;
        "Exch. Rate SourceEditable" := true;
        AmountEditable := true;
        "Paying AccountEditable" := true;
        SendingResponsibilityCenterEdi := true;
        "Source Transfer TypeEditable" := true;
        "Exch. Rate DestinationEditable" := true;
        RemarksEditable := true;
        "Amount 2Editable" := true;
        "Receiving AccountEditable" := true;
        RecieptResponsibilityCenterEdi := true;
        ReceivingTransferTypeEditable := true;
        DateEditable := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Date := Today;
        Rec."Inter Bank Template Name" := JTemplate;
        Rec."Inter Bank Journal Batch" := JBatch;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Reciept Responsibility Center" := UserMgt.GetPurchasesFilter();
        //VALIDATE( "Reciept Responsibility Center");
        Rec.Status := Rec.Status::Pending;
        Rec."Created By" := UserId;

        UpdateControl();
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Reciept Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;


        TempBatch.Reset();

        TempBatch.SetRange(TempBatch.UserID, UserId);
        if TempBatch.Find('-') then begin
            JTemplate := TempBatch."Inter Bank Template Name";
            JBatch := TempBatch."Inter Bank Batch Name";
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
        Text19025618: Label 'Requesting Details';
        Text19044997: Label 'Source Details';
        ApprovalEntries: Page "Approval Entries";


    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
    var
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        Text000: Label 'Are you sure you want to Cancel this Document?';
        Text001: Label 'You have selected not to Cancel this Document';
    begin
        /*Get the global dimension 1 and 2 from the database*/
        Name := '';

        GLSetup.Reset();
        GLSetup.Get();

        DimVal.Reset();
        DimVal.SetRange(DimVal.Code, Code);

        if DimNo = 1 then
            DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 1 Code")
        else
            if DimNo = 2 then
                DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 2 Code");
        if DimVal.Find('-') then
            Name := DimVal.Name;

    end;


    procedure UpdateControl()
    begin
        if Rec.Status <> Rec.Status::Pending then begin
            DateEditable := false;
            ReceivingTransferTypeEditable := false;
            RecieptResponsibilityCenterEdi := false;
            "Receiving AccountEditable" := false;
            "Amount 2Editable" := false;
            RemarksEditable := false;
            "Exch. Rate DestinationEditable" := false;

        end else begin
            DateEditable := true;
            ReceivingTransferTypeEditable := true;
            RecieptResponsibilityCenterEdi := true;
            "Receiving AccountEditable" := true;
            "Amount 2Editable" := true;
            RemarksEditable := true;
            "Exch. Rate DestinationEditable" := true;


        end;

        if Rec.Status = Rec.Status::Approved then begin
            "Source Transfer TypeEditable" := true;
            SendingResponsibilityCenterEdi := true;
            "Paying AccountEditable" := true;
            AmountEditable := true;
            "Paying AccountEditable" := true;
            "Exch. Rate SourceEditable" := true;
            "External Doc No.Editable" := true;
            "Transfer Release DateEditable" := true;
        end else begin
            "Source Transfer TypeEditable" := false;
            SendingResponsibilityCenterEdi := false;
            AmountEditable := false;
            "Paying AccountEditable" := false;
            "Exch. Rate SourceEditable" := false;
            "External Doc No.Editable" := false;
            "Transfer Release DateEditable" := false;
        end;
    end;

    local procedure ReceivingAccountOnAfterValidat()
    begin
        //check if the currency code field has been filled in
        "Exch. Rate DestinationVisible" := false;
        if Rec."Currency Code Destination" <> '' then
            "Exch. Rate DestinationVisible" := true;
    end;

    local procedure PayingAccountOnAfterValidate()
    begin
        //check if the currency code field has been filled in
        "Exch. Rate SourceVisible" := false;
        if Rec."Currency Code Source" <> '' then
            "Exch. Rate SourceVisible" := true;
    end;
}
