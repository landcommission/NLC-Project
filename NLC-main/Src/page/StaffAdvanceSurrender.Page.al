#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193665 "Staff Advance Surrender"
{
    Caption = 'Staff Advance Surrender';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Staff Advance Surrender Header";
    ApplicationArea = All;

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
                    Visible = DocNoVisible;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Surrender Date field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = "Account No.Editable";
                    ToolTip = 'Specifies the value of the Account No. field.';
                    trigger OnValidate()
                    begin
                        AccountName := GetCustName(Rec."Account No.");
                    end;
                }
                field(AccountName; AccountName)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the AccountName field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = "Imprest Issue Doc. NoEditable";
                    ToolTip = 'Specifies the value of the Advance Issue Doc. No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Difference; Rec.Difference)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Difference field.';
                }
                field("Imprest Issue Date"; Rec."Imprest Issue Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Issue Date';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Advance Issue Date field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    trigger OnValidate()
                    begin
                        DimName1 := GetDimensionName(Rec."Global Dimension 1 Code", 1);
                    end;
                }
                field(DimName1; DimName1)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DimName1 field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    trigger OnValidate()
                    begin
                        DimName2 := GetDimensionName(Rec."Global Dimension 2 Code", 2);
                    end;
                }
                field(DimName2; DimName2)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DimName2 field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Posted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Visible = PaymodeVisible;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Surrender Posting DateEditable";
                    Visible = PayingBankVisible;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Visible = ChequeNoVisible;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Visible = PostingDateVisible;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = "Responsibility CenterEditable";
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Surrender Posting Date"; Rec."Surrender Posting Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Retire Posting date';
                    Editable = "Surrender Posting DateEditable";
                    ToolTip = 'Specifies the value of the Retire Posting date field.';
                }
                field("Allow Overexpenditure"; Rec."Allow Overexpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Overexpenditure field.';
                }
                field("Open for Overexpenditure by"; Rec."Open for Overexpenditure by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open for Overexpenditure by field.';
                }
                field("Date opened for OvExpenditure"; Rec."Date opened for OvExpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date opened for OvExpenditure field.';
                }
            }
            part(ImprestLines; "Staff Advanc Surrender Details")
            {
                Editable = ImprestLinesEditable;
                SubPageLink = "Surrender Doc No." = field(No);
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
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        DocumentType := DocumentType::AdvanceSurrender;
                        ApprovalEntries.Setfilters(Database::"Staff Advance Surrender Header", DocumentType, Rec.No);
                        ApprovalEntries.Run();
                    end;
                }
                separator(Action1102756006) { }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Post action.';
                    trigger OnAction()
                    var
                        Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        Rec.TestField("Surrender Posting Date");


                        if Rec.Posted then
                            Error('The transaction has already been posted.');

                        //Ensure actual spent does not exceed the amount on original document
                        Rec.CalcFields("Actual Spent", "Cash Receipt Amount");
                        if (Rec."Actual Spent" + Rec."Cash Receipt Amount") < Rec.Amount then
                            Error('Please select the receipt used to receipt money not actually spent');

                        //test that any modifications to the document do not exceed the amount on origina document
                        Rec.CalcFields("Actual Spent");
                        //IF "Actual Spent"<>"Amount on Original Document" THEN ERROR('The amount on the original document differs from the current actual amount spent by  %1',("Actual Spent"-"Amount on Original Document"));

                        //Get the Cash office user template
                        Temp.Get(UserId);
                        SurrBatch := Temp."Advance Surr Batch";
                        SurrTemplate := Temp."Advance Surr Template";


                        //HOW ABOUT WHERE ONE RETURNS ALL THE AMOUNT??
                        //THERE SHOULD BE NO GENJNL ENTRIES BUT REVERSE THE COMMITTMENTS
                        Rec.CalcFields("Actual Spent");
                        if Rec."Actual Spent" = 0 then
                            if Confirm(Text000, true) then
                                UpdateforNoActualSpent()
                            else
                                Error(Text001);

                        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                        if GenledSetup.Get() then begin
                            GenJnlLine.Reset();
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", SurrTemplate);
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", SurrBatch);
                            GenJnlLine.DeleteAll();
                        end;

                        if DefaultBatch.Get(SurrTemplate, SurrBatch) then
                            DefaultBatch.Delete();

                        DefaultBatch.Reset();
                        DefaultBatch."Journal Template Name" := SurrTemplate;
                        DefaultBatch.Name := SurrBatch;
                        DefaultBatch.Insert();
                        LineNo := 0;

                        ImprestDetails.Reset();
                        ImprestDetails.SetRange(ImprestDetails."Surrender Doc No.", Rec.No);
                        if ImprestDetails.Find('-') then begin
                            repeat
                                //Post Surrender Journal
                                //Compare the amount issued =amount on cash reciecied.
                                //Created new field for zero spent
                                //

                                //ImprestDetails.TESTFIELD("Actual Spent");
                                //ImprestDetails.TESTFIELD("Actual Spent");
                                /*
                                IF (ImprestDetails."Cash Receipt Amount"+ImprestDetails."Actual Spent")<>ImprestDetails.Amount THEN
                                   ERROR(Txt0001);
                                       */
                                Rec.TestField("Global Dimension 1 Code");


                                LineNo := LineNo + 1000;
                                GenJnlLine.Init();
                                GenJnlLine."Journal Template Name" := SurrTemplate;
                                GenJnlLine."Journal Batch Name" := SurrBatch;
                                GenJnlLine."Line No." := LineNo;
                                GenJnlLine."Source Code" := 'PAYMENTJNL';
                                RecPayTypes.Get(ImprestDetails."Imprest Type", RecPayTypes.Type::Advance);
                                //GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                                GenJnlLine."Account Type" := RecPayTypes."Account Type";
                                GenJnlLine."Account No." := ImprestDetails."Account No:";
                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                //Set these fields to blanks
                                GenJnlLine."Posting Date" := Rec."Surrender Posting Date";
                                GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                                GenJnlLine.Validate("Gen. Posting Type");
                                GenJnlLine."Gen. Bus. Posting Group" := '';
                                GenJnlLine.Validate("Gen. Bus. Posting Group");
                                GenJnlLine."Gen. Prod. Posting Group" := '';
                                GenJnlLine.Validate("Gen. Prod. Posting Group");
                                GenJnlLine."VAT Bus. Posting Group" := '';
                                GenJnlLine.Validate("VAT Bus. Posting Group");
                                GenJnlLine."VAT Prod. Posting Group" := '';
                                GenJnlLine.Validate("VAT Prod. Posting Group");
                                GenJnlLine."Document No." := Rec.No;
                                GenJnlLine.Amount := ImprestDetails."Actual Spent";
                                GenJnlLine.Validate(GenJnlLine.Amount);
                                GenJnlLine."Job No." := ImprestDetails."Job No.";
                                GenJnlLine."Job Task No." := ImprestDetails."Job Task No.";
                                if GenJnlLine."Job No." <> '' then
                                    GenJnlLine."Job Quantity" := 1;
                                //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::Customer;
                                //GenJnlLine."Bal. Account No.":=ImprestDetails."Advance Holder";
                                GenJnlLine.Description := CopyStr('Advance Surrendered ' + ImprestDetails."Account Name", 1, 50);
                                //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                                GenJnlLine."Currency Code" := Rec."Currency Code";
                                GenJnlLine.Validate("Currency Code");
                                //Take care of Currency Factor
                                GenJnlLine."Currency Factor" := Rec."Currency Factor";
                                GenJnlLine.Validate("Currency Factor");

                                GenJnlLine."Shortcut Dimension 1 Code" := ImprestDetails."Shortcut Dimension 1 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                                GenJnlLine."Shortcut Dimension 2 Code" := ImprestDetails."Shortcut Dimension 2 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                                GenJnlLine."Dimension Set ID" := ImprestDetails."Dimension Set ID";

                                /*
                                //Application of Surrender entries
                                IF GenJnlLine."Bal. Account Type"=GenJnlLine."Bal. Account Type"::Customer THEN BEGIN
                                GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                                GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
                                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                                GenJnlLine."Applies-to ID":="Apply to ID";
                                END;
                                 */
                                //Application of Surrender entries
                                if GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Customer then begin
                                    //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                                    //GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
                                    PVHeader.Reset();
                                    PVHeader.SetRange(PVHeader."External Doc No", Rec."Imprest Issue Doc. No");
                                    PVHeader.SetRange(PVHeader.Status, PVHeader.Status::Posted);
                                    PVHeader.FindFirst();
                                    GenJnlLine."Applies-to Doc. No." := PVHeader."No.";
                                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                                    GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                                end;

                                if GenJnlLine.Amount <> 0 then
                                    GenJnlLine.Insert();

                                //insert balancing customer Entries

                                LineNo := LineNo + 1000;
                                GenJnlLine.Init();
                                GenJnlLine."Journal Template Name" := SurrTemplate;
                                GenJnlLine."Journal Batch Name" := SurrBatch;
                                GenJnlLine."Line No." := LineNo;
                                GenJnlLine."Source Code" := 'PAYMENTJNL';
                                GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
                                GenJnlLine."Account No." := ImprestDetails."Advance Holder";
                                ;
                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                //Set these fields to blanks
                                GenJnlLine."Posting Date" := Rec."Surrender Posting Date";
                                GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                                GenJnlLine.Validate("Gen. Posting Type");
                                GenJnlLine."Gen. Bus. Posting Group" := '';
                                GenJnlLine.Validate("Gen. Bus. Posting Group");
                                GenJnlLine."Gen. Prod. Posting Group" := '';
                                GenJnlLine.Validate("Gen. Prod. Posting Group");
                                GenJnlLine."VAT Bus. Posting Group" := '';
                                GenJnlLine.Validate("VAT Bus. Posting Group");
                                GenJnlLine."VAT Prod. Posting Group" := '';
                                GenJnlLine.Validate("VAT Prod. Posting Group");
                                GenJnlLine."Document No." := Rec.No;
                                Rec.CalcFields(Difference);
                                if Rec.Difference < 0 then
                                    GenJnlLine.Amount := -ImprestDetails.Amount
                                else
                                    GenJnlLine.Amount := -ImprestDetails."Actual Spent";
                                GenJnlLine.Validate(GenJnlLine.Amount);
                                //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::Customer;
                                //GenJnlLine."Bal. Account No.":=ImprestDetails."Advance Holder";
                                GenJnlLine.Description := CopyStr('Advance Surrendered ' + ImprestDetails."Account Name", 1, 50);
                                //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                                GenJnlLine."Currency Code" := Rec."Currency Code";
                                GenJnlLine.Validate("Currency Code");
                                //Take care of Currency Factor
                                GenJnlLine."Currency Factor" := Rec."Currency Factor";
                                GenJnlLine.Validate("Currency Factor");

                                GenJnlLine."Shortcut Dimension 1 Code" := ImprestDetails."Shortcut Dimension 1 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                                GenJnlLine."Shortcut Dimension 2 Code" := ImprestDetails."Shortcut Dimension 2 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                                GenJnlLine."Dimension Set ID" := ImprestDetails."Dimension Set ID";

                                //Application of Surrender entries
                                if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer then begin
                                    //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                                    //GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
                                    PVHeader.Reset();
                                    PVHeader.SetRange(PVHeader."External Doc No", Rec."Imprest Issue Doc. No");
                                    if PVHeader.FindLast() then
                                        GenJnlLine."Applies-to Doc. No." := PVHeader."No.";
                                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                                    GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                                end;

                                if GenJnlLine.Amount <> 0 then
                                    GenJnlLine.Insert();

                            until ImprestDetails.Next() = 0;

                            //insert balancing bank Entries
                            Rec.CalcFields(Difference);
                            if Rec.Difference < 0 then
                                InsertBankBalancing();

                            //Post Entries
                            GenJnlLine.Reset();
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", SurrTemplate);
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", SurrBatch);
                            //Adjust Gen Jnl Exchange Rate Rounding Balances
                            AdjustGenJnl.Run(GenJnlLine);
                            //End Adjust Gen Jnl Exchange Rate Rounding Balances

                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);
                        end;

                        if JournalPostSuccessful.PostedSuccessfully() then begin
                            Rec.Posted := true;
                            Rec.Status := Rec.Status::Posted;
                            Rec."Date Posted" := Today;
                            Rec."Time Posted" := Time;
                            Rec."Posted By" := UserId;
                            Rec.Modify();
                            //Tag the Source Imprest Requisition as Surrendered
                            ImprestReq.Reset();
                            ImprestReq.SetRange(ImprestReq."No.", Rec."Imprest Issue Doc. No");
                            if ImprestReq.Find('-') then begin
                                ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
                                ImprestReq.Modify();
                            end;

                            //End Tag
                            //Post Committment Reversals
                            Doc_Type := Doc_Type::StaffSurrender;
                            BudgetControl.ReverseEntries(Doc_Type, Rec.No);
                        end;

                    end;
                }
                separator(Action1102755014) { }
                action("Check Budgetary Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budgetary Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Check Budgetary Availability action.';
                    trigger OnAction()
                    begin
                        //Ensure actual spent does not exceed the amount on original document
                        Rec.CalcFields("Actual Spent", "Cash Receipt Amount");
                        if Rec."Actual Spent" + Rec."Cash Receipt Amount" > Rec.Amount then
                            Error('The actual Amount spent should not exceed the amount issued ');
                        if Rec."Actual Spent" = 0 then
                            Error('Specify the Actau Spent on the lines');

                        //Post Committment Reversals of the Staff Advance if it had not been reversed
                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::StaffAdvance);
                        Commitments.SetRange(Commitments."Document No.", Rec."Imprest Issue Doc. No");
                        Commitments.SetRange(Commitments.Committed, false);
                        if not Commitments.Find('-') then begin
                            Doc_Type := Doc_Type::StaffAdvance;
                            BudgetControl.ReverseEntries(Doc_Type, Rec."Imprest Issue Doc. No");
                        end;

                        //First Check whether other lines are already committed.
                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::StaffSurrender);
                        Commitments.SetRange(Commitments."Document No.", Rec.No);
                        if Commitments.Find('-') then begin
                            if Confirm('Lines in this Document appear to be committed do you want to re-commit?', false) = false then
                                exit;
                            Commitments.Reset();
                            Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::StaffSurrender);
                            Commitments.SetRange(Commitments."Document No.", Rec.No);
                            Commitments.DeleteAll();
                        end;

                        //Check the Budget here
                        CheckBudgetAvail.CheckStaffAdvSurr(Rec);
                    end;
                }
                action("Cancel Budgetary Allocation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budgetary Allocation';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Cancel Budgetary Allocation action.';
                    trigger OnAction()
                    begin
                        if Confirm('Do you Wish to Cancel the Commitment entries for this document', false) = false then
                            exit;

                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::StaffSurrender);
                        Commitments.SetRange(Commitments."Document No.", Rec.No);
                        Commitments.DeleteAll();

                        Payline.Reset();
                        Payline.SetRange(Payline."Surrender Doc No.", Rec.No);
                        if Payline.Find('-') then
                            repeat
                                Payline.Committed := false;
                                Payline.Modify();
                            until Payline.Next() = 0;
                    end;
                }
                separator(Action1102755012) { }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                        //ApprovalMgt: Codeunit "Export F/O Consolidation";
                        Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
                    begin
                        //Ensure actual spent does not exceed the amount on original document
                        Rec.CalcFields("Actual Spent", "Cash Receipt Amount", Difference);

                        Rec."Amount on Original Document" := Rec."Actual Spent";
                        Rec.Modify();

                        if Rec.Difference <> 0 then//"Actual Spent"+"Cash Receipt Amount" > Amount THEN
                            if not Confirm('The actual Amount spent differs with the amount issued by %1 ,do you want to continue ', false, Rec.Difference) then
                                exit;
                        /*
                              IF "Actual Spent"+"Cash Receipt Amount" > Amount THEN
                              ERROR('The actual Amount spent should not exceed the amount issued ');
                        */
                        /*
                        //First Check whether all amount entered tally
                        ImprestDetails.RESET;
                        ImprestDetails.SETRANGE(ImprestDetails."Surrender Doc No.",No);
                        IF ImprestDetails.FIND('-') THEN BEGIN
                        REPEAT
                          IF (ImprestDetails."Cash Receipt Amount"+ImprestDetails."Actual Spent")<>ImprestDetails.Amount THEN
                              ERROR(Txt0001);

                        UNTIL ImprestDetails.NEXT = 0;
                        END;
                        */
                        //Ensure No Items That should be committed that are not
                        if LinesCommitmentStatus() then
                            Error('There are some lines that have not been committed');

                        //ensure all key fileds are inserted.
                        if not CheckReqFields() then
                            Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT,("JOB NO.","JOB TASK NO.")FOR WIP] Have not been Entered please RECHECK your entries');

                        Rec.TestField(Status, Rec.Status::Pending);
                        //Release the ImprestSurrender for Approval
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendAdvanceSURRApprovalRequest(Rec) then;

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelAdvanceSUApprovalRequest(Rec, true, true) then;
                    end;
                }
                separator(Action1000000000) { }
                action("Cancel Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Document';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    Visible = PageActionsVisible;
                    ToolTip = 'Executes the Cancel Document action.';
                    trigger OnAction()
                    begin
                        //Post Committment Reversals
                        //TESTFIELD(Status,Status::Approved);
                        if Confirm(Text002, true) then begin
                            Doc_Type := Doc_Type::Imprest;
                            BudgetControl.ReverseEntries(Doc_Type, Rec."Imprest Issue Doc. No");
                            Rec.Status := Rec.Status::Cancelled;
                            Rec.Modify();
                        end;
                    end;
                }
                separator(Action1102755015) { }
                action("Open for OverExpenditure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open for OverExpenditure';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Open for OverExpenditure action.';
                    trigger OnAction()
                    begin
                        //Opening should only be for Pending Documents
                        //TESTFIELD(Status,Status::Pending);
                        //Open for Overexpenditure
                        Rec."Allow Overexpenditure" := true;
                        Rec."Open for Overexpenditure by" := UserId;
                        Rec."Date opened for OvExpenditure" := Today;
                        Rec.Modify();
                        //Open lines
                        Payline.Reset();
                        Payline.SetRange(Payline."Surrender Doc No.", Rec.No);
                        if Payline.Find('-') then
                            repeat
                                Payline."Allow Overexpenditure" := true;
                                Payline."Open for Overexpenditure by" := UserId;
                                Payline."Date opened for OvExpenditure" := Today;
                                Payline.Modify();
                            until Payline.Next() = 0;
                        //End open for Overexpenditure
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = PageActionsVisible;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter(No, Rec.No);
                        Report.Run(Report::"Petty Cash Surrender", true, true, Rec);
                        Rec.Reset();
                    end;
                }
                action(Upload)
                {
                    ApplicationArea = Basic;
                    Image = TransmitElectronicDoc;
                    Visible = PageActionsVisible;
                    ToolTip = 'Executes the Upload action.';
                    trigger OnAction()
                    var
                        vartest: Variant;
                        TestFile: File;
                        FilePath: Text;
                        FileName: Text;
                        DocNo: Code[20];
                        varLink: Text;
                        DocRecRef: RecordRef;
                        MyFieldRef: FieldRef;
                        LinkId: Integer;
                        CopyFrom: Text;
                        CopyTo: Text;
                    begin
                        if Upload('Upload file', 'C:\', 'Text file(*.txt)|*.txt|PDF file(*.pdf)|*.pdf|EXCEL File(*.xlsx)|*.xlsx|WORD File(*.docx)|*.docx|ALL Files(*.*)|*.*', 'Upload.txt', vartest) then begin
                            Message('File successfully uploaded to the server', vartest);
                            //TestFile.OPEN(vartest);
                            //FileName:=TestFile.NAME;
                            //MESSAGE('%1',FileName);

                            DocNo := Rec.No;
                            DocRecRef.Open(Database::"Staff Advance Surrender Header");
                            MyFieldRef := DocRecRef.Field(1);
                            MyFieldRef.Value := DocNo;
                            if DocRecRef.Find('=') then begin
                                LinkId := DocRecRef.AddLink(vartest);
                                RecordLinks.Get(LinkId);
                                RecordLinks.Validate(Type);
                                //  MESSAGE('link %1 added successfully',LinkId);
                                /*
                                //taken to record links table for server side processing
                                RecordLinks.GET(LinkId);
                                CopyFrom:=RecordLinks.URL1;
                                FileName:=GetFileName(RecordLinks.URL1);
                                CopyTo:='C:\NavAttachments\'+FileName;
                                FILE.COPY(CopyFrom,CopyTo);
                                RecordLinks.URL1:=CopyTo;
                                RecordLinks.Description:=FileName;
                                RecordLinks.MODIFY;
                                */
                            end
                            else
                                Message('Link not added');

                        end
                        else
                            Error('File not Successfully uploaded');

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CurrPageUpdate();
    end;

    trigger OnInit()
    begin
        ImprestLinesEditable := true;
        "Surrender Posting DateEditable" := true;
        "Responsibility CenterEditable" := true;
        "Imprest Issue Doc. NoEditable" := true;
        "Surrender DateEditable" := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        /*
    //check if the documenent has been added while another one is still pending
        TravAccHeader.RESET;
        TravAccHeader.SETRANGE(TravAccHeader.Cashier,USERID);
        TravAccHeader.SETRANGE(TravAccHeader.Status,Status::Pending);

        IF TravAccHeader.COUNT>0 THEN
          BEGIN
            ERROR('There are still some pending document(s) on your account. Please list & select the pending document to use.  ');
          END;
    //*********************************END ****************************************
             */
        Rec."User ID" := UserId;
        //CurrPage.UPDATE;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //OnAfterGetCurrRecord;
        //Add dimensions if set by default here
        Rec."Global Dimension 1 Code" := UserMgt.GetSetDimensions(UserId, 1);
        Rec.Validate("Global Dimension 1 Code");
        Rec."Global Dimension 2 Code" := UserMgt.GetSetDimensions(UserId, 2);
        Rec.Validate("Global Dimension 2 Code");
        Rec."Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(UserId, 3);
        Rec.Validate("Shortcut Dimension 3 Code");
        Rec."Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(UserId, 4);
        Rec.Validate("Shortcut Dimension 4 Code");

        UpdateControls();
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        //SETFILTER(Status,'<>Cancelled');
        /*
        IF Status=Status::"Pending Approval" THEN
        CurrPage.EDITABLE:=FALSE;
        */

        if Rec.Status = Rec.Status::Pending then begin
            PayingBankVisible := false;
            PostingDateVisible := false;
            PaymodeVisible := false;
            ChequeNoVisible := false;
            PageActionsVisible := false;
            PayingBankNameVisible := false
        end else
            if Rec.Status <> Rec.Status::Pending then begin
                PayingBankVisible := true;
                PayingBankNameVisible := true;
                PostingDateVisible := true;
                PaymodeVisible := true;
                ChequeNoVisible := true;
                PageActionsVisible := true;
            end;

        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */
        SetDocNoVisible();

    end;

    var
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cash Office User Template";
        LineNo: Integer;
        NextEntryNo: Integer;
        CommitNo: Integer;
        ImprestDetails: Record "Staff Advanc Surrender Details";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
        IsImprest: Boolean;
        ImprestRequestDet: Record "Payments-Users";
        GenledSetup: Record "Cash Office Setup";
        ImprestAmt: Decimal;
        DimName1: Text[250];
        DimName2: Text[250];
        CashPaymentLine: Record "Cash Payment Line";
        PaymentLine: Record "Staff Advance Lines";
        CurrSurrDocNo: Code[20];
        JournalPostSuccessful: Codeunit "Journal Post Successful";
        Commitments: Record Committment;
        BCSetup: Record "Budgetary Control Setup";
        BudgetControl: Codeunit "Budgetary Control";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance,StaffSurrender;
        ImprestReq: Record "Staff Advance Header";
        UserMgt: Codeunit "User Setup Management BR";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        AccountName: Text[100];
        Text000: Label 'You have not specified the Actual Amount Spent. This document will only reverse the committment and you will have to receipt the total amount returned.';
        Text001: Label 'Document Not Posted';
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        Text002: Label 'Are you sure you want to Cancel this Document?';
        TravAccHeader: Record "Staff Advance Surrender Header";
        CheckBudgetAvail: Codeunit "Budgetary Control";
        Payline: Record "Staff Advanc Surrender Details";
        Temp: Record "Cash Office User Template";
        SurrBatch: Code[10];
        SurrTemplate: Code[10];
        [InDataSet]
        "Surrender DateEditable": Boolean;
        [InDataSet]
        "Account No.Editable": Boolean;
        [InDataSet]
        "Imprest Issue Doc. NoEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Surrender Posting DateEditable": Boolean;
        [InDataSet]
        ImprestLinesEditable: Boolean;
        Text19053222: Label 'Enter Advance Accounting Details below';
        StatusEditable: Boolean;
        RecRef: RecordRef;
        RecordLinks: Record "Record Link";
        FileName: Text;
        PayingBankVisible: Boolean;
        PayingBankNameVisible: Boolean;
        PostingDateVisible: Boolean;
        PaymodeVisible: Boolean;
        ChequeNoVisible: Boolean;
        PageActionsVisible: Boolean;
        PVHeader: Record "Payments Header";
        DocNoVisible: Boolean;


    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[250]
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


    procedure UpdateControls()
    begin
        if Rec.Status <> Rec.Status::Pending then begin
            "Surrender DateEditable" := false;
            "Account No.Editable" := false;
            "Imprest Issue Doc. NoEditable" := false;
            "Responsibility CenterEditable" := true;
            "Surrender Posting DateEditable" := true;
            //   ImprestLinesEditable :=FALSE;
        end else begin
            "Surrender DateEditable" := true;
            "Account No.Editable" := true;
            "Imprest Issue Doc. NoEditable" := true;
            "Responsibility CenterEditable" := true;
            "Surrender Posting DateEditable" := false;
            //   ImprestLinesEditable :=TRUE;

        end;
    end;


    procedure GetCustName(No: Code[20]) Name: Text[100]
    var
        Cust: Record Customer;
    begin
        Name := '';
        if Cust.Get(No) then
            Name := Cust.Name;
        exit(Name);
    end;


    procedure UpdateforNoActualSpent()
    begin
        Rec.Posted := true;
        Rec.Status := Rec.Status::Posted;
        Rec."Date Posted" := Today;
        Rec."Time Posted" := Time;
        Rec."Posted By" := UserId;
        Rec.Modify();
        //Tag the Source Imprest Requisition as Surrendered
        ImprestReq.Reset();
        ImprestReq.SetRange(ImprestReq."No.", Rec."Imprest Issue Doc. No");
        if ImprestReq.Find('-') then begin
            ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
            ImprestReq.Modify();
        end;
        //End Tag
        //Post Committment Reversals
        Doc_Type := Doc_Type::StaffSurrender;
        BudgetControl.ReverseEntries(Doc_Type, Rec."Imprest Issue Doc. No");
    end;


    procedure CompareAllAmounts()
    begin
    end;


    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCsetup: Record "Budgetary Control Setup";
    begin
        if BCsetup.Get() then begin
            if not BCsetup.Mandatory then begin
                Exists := false;
                exit;
            end;
        end else begin
            Exists := false;
            exit;
        end;
        Exists := false;
        Payline.Reset();
        Payline.SetRange(Payline."Surrender Doc No.", Rec.No);
        Payline.SetRange(Payline.Committed, false);
        Payline.SetRange(Payline."Budgetary Control A/C", true);
        if Payline.Find('-') then
            Exists := true;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        /*
        xRec := Rec;
        //Update Controls as necessary
        //SETFILTER(Status,'<>Cancelled');
        UpdateControl;
        DimName1:=GetDimensionName("Global Dimension 1 Code",1);
        DimName2:=GetDimensionName("Shortcut Dimension 2 Code",2);
        AccountName:=GetCustName("Account No.");
        */

    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        AccountName := GetCustName(Rec."Account No.");
        DimName1 := GetDimensionName(Rec."Global Dimension 1 Code", 1);
        DimName2 := GetDimensionName(Rec."Global Dimension 2 Code", 2);
        CurrPage.Update();
    end;


    procedure InsertBalancing()
    begin
        //insert customer balancing
        LineNo := LineNo + 1000;
        GenJnlLine.Init();
        GenJnlLine."Journal Template Name" := SurrTemplate;
        GenJnlLine."Journal Batch Name" := SurrBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
        GenJnlLine."Account No." := Rec."Account No.";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        //Set these fields to blanks
        GenJnlLine."Posting Date" := Rec."Surrender Posting Date";
        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
        GenJnlLine.Validate("Gen. Posting Type");
        GenJnlLine."Gen. Bus. Posting Group" := '';
        GenJnlLine.Validate("Gen. Bus. Posting Group");
        GenJnlLine."Gen. Prod. Posting Group" := '';
        GenJnlLine.Validate("Gen. Prod. Posting Group");
        GenJnlLine."VAT Bus. Posting Group" := '';
        GenJnlLine.Validate("VAT Bus. Posting Group");
        GenJnlLine."VAT Prod. Posting Group" := '';
        GenJnlLine.Validate("VAT Prod. Posting Group");
        GenJnlLine."Document No." := Rec.No;
        //Rec.CALCFIELDS(Difference);
        GenJnlLine.Amount := -Rec.Amount;//ImprestDetails."Actual Spent";
        GenJnlLine.Validate(GenJnlLine.Amount);
        //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::Customer;
        //GenJnlLine."Bal. Account No.":=ImprestDetails."Advance Holder";
        GenJnlLine.Description := 'Advance Surrendered by staff';
        //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
        GenJnlLine."Currency Code" := Rec."Currency Code";
        GenJnlLine.Validate("Currency Code");
        //Take care of Currency Factor
        GenJnlLine."Currency Factor" := Rec."Currency Factor";
        GenJnlLine.Validate("Currency Factor");

        GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
        /*
        //Application of Surrender entries
        IF GenJnlLine."Account Type"=GenJnlLine."Account Type"::Customer THEN BEGIN
        GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
        GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
        GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
        GenJnlLine."Applies-to ID":="Apply to ID";
        END;
        */
        //Application of Surrender entries
        if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer then begin
            //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
            //GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
            PVHeader.Reset();
            PVHeader.SetRange(PVHeader."External Doc No", Rec."Imprest Issue Doc. No");
            PVHeader.SetRange(PVHeader.Status, PVHeader.Status::Posted);
            PVHeader.FindFirst();
            GenJnlLine."Applies-to Doc. No." := PVHeader."No.";
            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID" := Rec."Apply to ID";
        end;

        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert();

    end;


    procedure InsertBankBalancing()
    begin

        LineNo := LineNo + 1000;
        GenJnlLine.Init();
        GenJnlLine."Journal Template Name" := SurrTemplate;
        GenJnlLine."Journal Batch Name" := SurrBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        GenJnlLine."Account No." := Rec."Bank Code";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        //Set these fields to blanks
        GenJnlLine."Posting Date" := Rec."Surrender Posting Date";
        GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
        GenJnlLine.Validate("Gen. Posting Type");
        GenJnlLine."Gen. Bus. Posting Group" := '';
        GenJnlLine.Validate("Gen. Bus. Posting Group");
        GenJnlLine."Gen. Prod. Posting Group" := '';
        GenJnlLine.Validate("Gen. Prod. Posting Group");
        GenJnlLine."VAT Bus. Posting Group" := '';
        GenJnlLine.Validate("VAT Bus. Posting Group");
        GenJnlLine."VAT Prod. Posting Group" := '';
        GenJnlLine.Validate("VAT Prod. Posting Group");
        GenJnlLine."Document No." := Rec.No;
        GenJnlLine."External Document No." := ImprestDetails."Cash Receipt No";
        Rec.CalcFields(Difference);
        GenJnlLine.Amount := Rec.Difference;
        GenJnlLine.Validate(GenJnlLine.Amount);
        //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::Customer;
        //GenJnlLine."Bal. Account No.":=ImprestDetails."Advance Holder";
        GenJnlLine.Description := 'Advance Surrendered by staff';
        //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
        GenJnlLine."Currency Code" := Rec."Currency Code";
        GenJnlLine.Validate("Currency Code");
        //Take care of Currency Factor
        GenJnlLine."Currency Factor" := Rec."Currency Factor";
        GenJnlLine.Validate("Currency Factor");

        GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
        /*
        //Application of Surrender entries
        IF GenJnlLine."Bal. Account Type"=GenJnlLine."Bal. Account Type"::Customer THEN BEGIN
        GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
        GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
        GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
        GenJnlLine."Applies-to ID":="Apply to ID";
        END;
         */

        //Application of Surrender entries
        if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer then begin
            //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
            //GenJnlLine."Applies-to Doc. No.":="Imprest Issue Doc. No";
            PVHeader.Reset();
            PVHeader.SetRange(PVHeader."External Doc No", Rec."Imprest Issue Doc. No");
            PVHeader.SetRange(PVHeader.Status, PVHeader.Status::Posted);
            PVHeader.FindFirst();
            GenJnlLine."Applies-to Doc. No." := PVHeader."No.";
            GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
            GenJnlLine."Applies-to ID" := Rec."Apply to ID";
        end;

        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert();

    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility1400;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer;
    begin
        DocNoVisible := DocumentNoVisibility.FundsMgtDocumentNoIsVisible(DocType::AdvanceSurrender, Rec.No);
    end;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Staff Advanc Surrender Details";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Surrender Doc No.", Rec.No);
        if PayLines.Find('-') then
            repeat
                PayLines.TestField(PayLines."Amount LCY");
                HasLines := true;
                exit(HasLines);
            until PayLines.Next() = 0;
    end;


    procedure CheckReqFields(): Boolean
    var
        PayLines: Record "Staff Advanc Surrender Details";
        JobsSetup: Record "Jobs Setup";
        JobPostingGroup: Record "Job Posting Group";
    begin
        AllKeyFieldsEntered := true;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Surrender Doc No.", Rec.No);
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."Account No:" = '') or (PayLines."Actual Spent" <= 0) then
                    AllKeyFieldsEntered := false;

                if JobsSetup.Get() then
                    if JobPostingGroup.Get(JobsSetup."Default Job Posting Group") then
                        if PayLines."Account No:" = JobPostingGroup."WIP Costs Account" then
                            if (PayLines."Job No." = '') or (PayLines."Job Task No." = '') then
                                AllKeyFieldsEntered := false;

            until PayLines.Next() = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;
}

