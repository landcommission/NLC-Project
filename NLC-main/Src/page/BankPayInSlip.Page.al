#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193632 "Bank Pay In Slip"
{
    DeleteAllowed = false;
    PageType = Document;
    SourceTable = "Bank Slip";
    SourceTableView = where(Status = const(New),
                            Posted = const(false),
                            Vaulted = const(false));
    ApplicationArea = All;
    Caption = 'Bank Pay In Slip';
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
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Bank Slip No."; Rec."Bank Slip No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Slip No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                label(Control1102758031)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19044997;
                    Style = Standard;
                    StyleExpr = true;
                }
                field("Source Dimension 1 Code"; Rec."Source Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    trigger OnValidate()
                    begin
                        Rec."Source Dimension 1 Name" := GetDimensionName(Rec."Source Dimension 1 Code", 1);
                    end;
                }
                field("Source Dimension 1 Name"; Rec."Source Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Source Dimension 1 Name field.';
                }
                field("Source Dimension 2 Code"; Rec."Source Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                    trigger OnValidate()
                    begin
                        Rec."Source Dimension 2 Name" := GetDimensionName(Rec."Source Dimension 2 Code", 2);
                    end;
                }
                field("Source Dimension 2 Name"; Rec."Source Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Source Dimension 2 Name field.';
                }
                field("From Bank Code"; Rec."From Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Bank Code field.';
                }
                label(Control1102758032)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19029207;
                    Style = Standard;
                    StyleExpr = true;
                }
                field("From Account Name"; Rec."From Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the From Account Name field.';
                }
                field("Destination Dimension 1 Code"; Rec."Destination Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    trigger OnValidate()
                    begin
                        Rec."Destination Dimension 1 Name" := GetDimensionName(Rec."Destination Dimension 1 Code", 1);
                    end;
                }
                field("Destination Dimension 1 Name"; Rec."Destination Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Destination Dimension 1 Name field.';
                }
                field("Destination Dimension 2 Code"; Rec."Destination Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                    trigger OnValidate()
                    begin
                        Rec."Destination Dimension 2 Name" := GetDimensionName(Rec."Destination Dimension 2 Code", 2);
                    end;
                }
                label(Control1102755003)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19080001;
                    Style = Standard;
                    StyleExpr = true;
                }
                field("Return Remarks"; Rec."Return Remarks")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Return Remarks field.';
                }
                field("Destination Dimension 2 Name"; Rec."Destination Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Destination Dimension 2 Name field.';
                }
                field("To Bank Code"; Rec."To Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Bank Code field.';
                }
                field("To Account Name"; Rec."To Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the To Account Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
            part(Control1102758005; "Released Store Requisitions Li")
            {
                SubPageLink = "No." = field(No);
            }
            label(Control1102758006)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19005631;
                Style = Standard;
                StyleExpr = true;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("&Send for Confirmation")
            {
                ApplicationArea = Basic;
                Caption = '&Send for Confirmation';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Send for Confirmation action.';
                trigger OnAction()
                begin
                    if Confirm('Move Deposit details for Confirmation?', false) = false then
                        exit;
                    Rec.TestField(Rec.Date);
                    Rec.TestField(Rec."Source Dimension 1 Code");
                    Rec.TestField(Rec."Source Dimension 2 Code");
                    Rec.TestField(Rec."From Bank Code");
                    Rec.TestField(Rec."Destination Dimension 1 Code");
                    Rec.TestField(Rec."Destination Dimension 2 Code");
                    Rec.TestField(Rec."To Bank Code");
                    Rec.TestField(Rec.Amount);
                    //check if the accounts are the same
                    if Rec."From Bank Code" = Rec."To Bank Code" then
                        Error('Source and Receiving Account cannot be similar');
                    //check that the summation of the lines must be equal to the sum inserted
                    BPL.Reset();
                    BPL.SetRange(BPL.No, Rec.No);

                    LineAmount := 0;

                    if BPL.FindFirst() then
                        repeat
                            if BPL."Bank Slip No." = '' then
                                Error('Please ensure that all deposit lines have deposit slip numbers');
                            if BPL.Type = BPL.Type::Cheque then begin
                                BPL.TestField(BPL."Cheque No");
                                BPL.TestField(BPL."Drawers Name");
                                BPL.TestField(BPL."Cheque Date");
                            end;
                            LineAmount := LineAmount + BPL.Amount;
                        until BPL.Next() = 0;

                    if LineAmount <> Rec.Amount then
                        Error('Line Amount and Total Amount deposited do not Tally');

                    Rec.Status := Rec.Status::Confirmation;
                    Rec.Modify();
                    Message('Bank Deposit details move to Confirmation Level');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    if Rec.Amount = 0 then
                        Error('Please ensure Amount to Transfer is entered');

                    /*Check if the amount in the line is equal to the header amount*/
                    LineAmount := 0;
                    BPL.Reset();
                    BPL.SetRange(BPL.No, Rec.No);
                    if BPL.Find('-') then
                        repeat
                            LineAmount := LineAmount + BPL.Amount;
                        until BPL.Next() = 0;

                    if LineAmount <> Rec.Amount then
                        Error('Amount Must Be Equal to Deposit Details');

                    CashierLinks.Reset();
                    CashierLinks.SetRange(CashierLinks.UserID, UserId);
                    Rec."Pay In Bank Template Name" := CashierLinks."Bank Pay In Journal Template";
                    Rec."Pay In Bank Journal Batch" := CashierLinks."Bank Pay In Journal Batch";
                    /*Check if the user's batch has any records within it*/
                    GenJnlLine.Reset();
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", Rec."Pay In Bank Template Name");
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec."Pay In Bank Journal Batch");
                    GenJnlLine.DeleteAll();

                    LineNo := 1000;
                    BPL.Reset();
                    BPL.SetRange(BPL.No, Rec.No);
                    if BPL.Find('-') then begin
                        repeat
                            /*Insert the new lines to be updated*/
                            GenJnlLine.Init();
                            /*Insert the lines*/
                            GenJnlLine."Line No." := LineNo + 1;
                            GenJnlLine."Source Code" := 'PAYMENTJNL';
                            GenJnlLine."Journal Template Name" := Rec."Pay In Bank Template Name";
                            GenJnlLine."Journal Batch Name" := Rec."Pay In Bank Journal Batch";
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                            GenJnlLine."Account No." := Rec."To Bank Code";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine.Description := Format(BPL.Type) + ':' + BPL."Cheque No" + ':' + Format(BPL."Cheque Date");
                            GenJnlLine."Shortcut Dimension 1 Code" := Rec."Destination Dimension 1 Code";
                            GenJnlLine."Shortcut Dimension 2 Code" := Rec."Destination Dimension 2 Code";
                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                            GenJnlLine.Amount := BPL.Amount;
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine.Insert();
                            LineNo := LineNo + 1;

                            GenJnlLine.Init();
                            /*Insert the lines*/
                            GenJnlLine."Line No." := LineNo + 1;
                            GenJnlLine."Source Code" := 'PAYMENTJNL';
                            GenJnlLine."Journal Template Name" := Rec."Pay In Bank Template Name";
                            GenJnlLine."Journal Batch Name" := Rec."Pay In Bank Journal Batch";
                            GenJnlLine."Posting Date" := Rec.Date;
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                            GenJnlLine."Account No." := Rec."From Bank Code";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine.Description := Format(BPL.Type) + ':' + BPL."Cheque No" + ':' + Format(BPL."Cheque Date");
                            GenJnlLine."Shortcut Dimension 1 Code" := Rec."Source Dimension 1 Code";
                            GenJnlLine."Shortcut Dimension 2 Code" := Rec."Source Dimension 2 Code";
                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                            GenJnlLine.Amount := -BPL.Amount;
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine.Insert();

                            LineNo := LineNo + 1;
                        until BPL.Next() = 0;

                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnlLine);
                        Rec.Posted := true;
                        Rec."Date Posted" := Today;
                        Rec."Time Posted" := Time;
                        Rec."Posted By" := UserId;
                        Rec.Modify();
                        //MESSAGE('The Journal Has Been Posted Successfully');
                    end;

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        //check if the user has been setup as a cashier in relation to bank pay in slips
        CashierLinks.Reset();
        CashierLinks.SetRange(CashierLinks.UserID, UserId);
        if CashierLinks.Find('-') then begin
            if (CashierLinks."Bank Pay In Journal Template" = '') or (CashierLinks."Bank Pay In Journal Batch" = '') then
                Error('Sorry you have not been fully setup as a Pay In Bank Slip user. Contact the System Administrator');
        end
        else
            Error('Sorry you have not been setup as a Cash Office User');

        //***************************Ochieng***************************//
        Rec.SetRange(Rec."Created By", UserId);
        //***************************END ***************************//
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cash Office User Template";
        RecPayTypes: Record "Receipts and Payment Types";
        LineNo: Integer;
        LineAmount: Decimal;
        BPL: Record "Bank Slip Line";
        Text19044997: Label 'Source Details';
        Text19029207: Label 'Receiving Details';
        Text19080001: Label 'Receiving Details';
        Text19005631: Label 'Enter Deposit Details Below';


    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
    var
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
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
}
