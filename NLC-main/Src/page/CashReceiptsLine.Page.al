#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193653 "Cash Receipts Line"
{
    PageType = ListPart;
    SourceTable = "Receipt Line";
    ApplicationArea = All;
    Caption = 'Cash Receipts Line';
    layout
    {
        area(Content)
        {
            repeater(Control1102760083)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                    trigger OnValidate()
                    begin
                        RecPayTypes.Reset();
                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Receipt);
                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                        if RecPayTypes.Find('-') then
                            if RecPayTypes."Account Type" = RecPayTypes."Account Type"::"G/L Account" then
                                "Account No.Editable" := false
                            else
                                "Account No.Editable" := true;
                    end;
                }
                field(Grouping; Rec.Grouping)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grouping field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = "Account No.Editable";
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                    trigger OnValidate()
                    begin
                        PayModeOnAfterValidate();
                    end;
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = Basic;
                    Visible = "Bank AccountVisible";
                    ToolTip = 'Specifies the value of the Bank Account field.';
                }
                field("Cheque/Deposit Slip Bank"; Rec."Cheque/Deposit Slip Bank")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque/Deposit Slip Bank field.';
                }
                field("Cheque/Deposit Slip Type"; Rec."Cheque/Deposit Slip Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque/Deposit Slip Type field.';
                }
                field("Cheque/Deposit Slip Date"; Rec."Cheque/Deposit Slip Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque/Deposit Slip Date field.';
                }
                field("Deposit Slip Time"; Rec."Deposit Slip Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Deposit Slip Time field.';
                }
                field("Cheque/Deposit Slip No"; Rec."Cheque/Deposit Slip No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque/Deposit Slip No field.';
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transaction No. field.';
                }
                field("Teller ID"; Rec."Teller ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Teller ID field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount Exclusive VAT';
                    ToolTip = 'Specifies the value of the Amount Exclusive VAT field.';
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
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-to ID field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    if Rec.Posted then
                        Error('The transaction has already been posted.');

                    if Rec."Transaction Name" = '' then
                        Error('Please enter the transaction description under transaction name.');

                    if Rec.Amount = 0 then
                        Error('Please enter amount.');

                    if Rec.Amount < 0 then
                        Error('Amount cannot be less than zero.');

                    if Rec."Global Dimension 1 Code" = '' then
                        Error('Please enter the Function code');

                    if Rec."Shortcut Dimension 2 Code" = '' then
                        Error('Please enter the source of funds.');

                    /*
                    CashierLinks.RESET;
                    CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                    IF CashierLinks.FIND('-') THEN BEGIN
                    END
                    ELSE BEGIN
                    ERROR('Please link the user/cashier to a collection account before proceeding.');
                    END;
                    */

                    // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                    GenJnlLine.Reset();
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'CASH RECEI');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec.No);
                    GenJnlLine.DeleteAll();

                    if DefaultBatch.Get('CASH RECEI', Rec.No) then
                        DefaultBatch.Delete();

                    DefaultBatch.Reset();
                    DefaultBatch."Journal Template Name" := 'CASH RECEI';
                    DefaultBatch.Name := Rec.No;
                    DefaultBatch.Insert();

                    GenJnlLine.Init();
                    GenJnlLine."Journal Template Name" := 'CASH RECEI';
                    GenJnlLine."Journal Batch Name" := Rec.No;
                    GenJnlLine."Line No." := 10000;
                    GenJnlLine."Account Type" := Rec."Account Type";
                    GenJnlLine."Account No." := Rec."Account No.";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Rec.Date;
                    GenJnlLine."Document No." := Rec.No;
                    GenJnlLine."External Document No." := Rec."Cheque/Deposit Slip No";
                    GenJnlLine.Amount := -Rec."Total Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);

                    GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                    GenJnlLine."Applies-to Doc. No." := Rec."Apply to";
                    //GenJnlLine."Bal. Account No.":=CashierLinks."Bank Account No";
                    if Rec."Bank Code" = '' then
                        Error('Select the Bank Code');


                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    GenJnlLine.Description := Rec."Transaction Name";
                    GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert();


                    GenJnlLine.Init();
                    GenJnlLine."Journal Template Name" := 'CASH RECEI';
                    GenJnlLine."Journal Batch Name" := Rec.No;
                    GenJnlLine."Line No." := 10001;
                    GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                    GenJnlLine."Account No." := Rec."Bank Code";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Rec.Date;
                    GenJnlLine."Document No." := Rec.No;
                    GenJnlLine."External Document No." := Rec."Cheque/Deposit Slip No";
                    GenJnlLine.Amount := Rec."Total Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);




                    GenJnlLine.Description := Rec."Transaction Name";
                    GenJnlLine."Shortcut Dimension 1 Code" := Rec."Dest Global Dimension 1 Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Dest Shortcut Dimension 2 Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert();

                    GenJnlLine.Reset();
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'CASH RECEI');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec.No);
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", GenJnlLine);

                    GenJnlLine.Reset();
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'CASH RECEI');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec.No);
                    if GenJnlLine.Find('-') then
                        exit;

                    Rec.Posted := true;
                    Rec."Date Posted" := Today;
                    Rec."Time Posted" := Time;
                    Rec."Posted By" := UserId;
                    Rec.Modify();

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    if Rec.Posted = false then
                        Error('Post the receipt before printing.');
                    Rec.Reset();
                    Rec.SetFilter(Rec.No, Rec.No);
                    Report.Run(52015, true, true, Rec);
                    Rec.Reset();
                end;
            }
            action("Direct Printing")
            {
                ApplicationArea = Basic;
                Caption = 'Direct Printing';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Direct Printing action.';
                trigger OnAction()
                begin
                    if Rec.Posted = false then
                        Error('Post the receipt before printing.');
                    Rec.Reset();
                    Rec.SetFilter(Rec.No, Rec.No);
                    Report.Run(52015, false, true, Rec);
                    Rec.Reset();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        "Account No.Editable" := true;
        "Bank AccountVisible" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Pay Mode" := Rec."Pay Mode"::Cash
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cashier Link";
        RecPayTypes: Record "Receipts and Payment Types";
        DimName1: Text[100];
        rdimname1: Text[100];
        rdimname2: Text[100];
        DImName2: Text[100];
        Custledger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        ApplyEntry: Codeunit "Sales Header Apply";
        AppliedEntries: Record "Workplan Activities";
        CustEntries: Record "Cust. Ledger Entry";
        LineNo: Integer;
        [InDataSet]
        "Bank AccountVisible": Boolean;
        [InDataSet]
        "Account No.Editable": Boolean;

    local procedure PayModeOnAfterValidate()
    begin
        if Rec."Pay Mode" = Rec."Pay Mode"::"Deposit Slip" then
            "Bank AccountVisible" := true
        else
            "Bank AccountVisible" := false;
    end;
}
