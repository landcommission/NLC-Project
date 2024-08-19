#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193790 "Investment Card"
{
    PageType = Card;
    SourceTable = "Investment Header";
    SourceTableView = where("Investment Rollover Status" = filter(<> Closed));
    ApplicationArea = All;
    Caption = 'Investment Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Archived Versions"; Rec."Archived Versions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Archived Versions field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Investment Start Date"; Rec."Investment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Start Date field.';
                }
                field("Investment End Date"; Rec."Investment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment End Date field.';
                }
                field("Investment Duration"; Rec."Investment Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Duration field.';
                }
                field("Investment Firm Code"; Rec."Investment Firm Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Company Code field.';
                }
                field("Investment Firm Name"; Rec."Investment Firm Name")
                {
                    ApplicationArea = Basic;
                    Caption = '<Investment Company Name>';
                    ToolTip = 'Specifies the value of the <Investment Company Name> field.';
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type field.';
                }
                field("Paying Document No."; Rec."Paying Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying Document No. field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        PaymentHeader: Record "Payments Header" temporary;
                        PaymentLines: Record "Payment Line";
                    begin

                        PaymentLines.Reset();
                        PaymentLines.SetRange(PaymentLines.Type, 'INVESTMENT');     //INVESTMENT
                        if PaymentLines.Find('-') then begin
                            //Popultate payment table with investment pvs
                            PaymentHeader.Reset();
                            PaymentHeader.DeleteAll();

                            repeat
                                Payments.Get(PaymentLines.No);
                                PaymentHeader.SetRange(PaymentHeader."No.", PaymentLines.No);
                                if not PaymentHeader.Find('-') then begin
                                    PaymentHeader.TransferFields(Payments);
                                    PaymentHeader.Insert();
                                end;


                            until PaymentLines.Next() = 0;
                            //PAGE.RUN(PAGE::"Payment Vouchers List",PaymentHeader);
                        end;
                        PaymentHeader.Reset();
                        if Page.RunModal(Page::"Posted Payment Vouchers List", PaymentHeader) = Action::LookupOK then
                            Rec."Paying Document No." := PaymentHeader."No.";
                    end;
                }
                field("Investment Principal"; Rec."Investment Principal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Principal field.';
                }
                field("Investment Rate"; Rec."Investment Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Rate field.';
                }
                field("Expected Interest"; Rec."Expected Interest")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Expected Interest field.';
                }
                field("Interest Earned"; Rec."Interest Earned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Earned field.';
                }
                field("Withholding Tax Rate"; Rec."Withholding Tax Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Rate field.';
                }
                field("Investment Withholding Tax"; Rec."Investment Withholding Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Withholding Tax field.';
                }
                field("Investment Rollover Status"; Rec."Investment Rollover Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Rollover Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control18; Links) { }
            systempart(Control19; MyNotes) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    if Confirm('Do you want to send this document for approval?', false) then;
                    //if ApprovalMgt.SendInvestmentApprovalReq(Rec) then;
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to cancel approval request?', false) then;
                    //if ApprovalMgt.CancelInvestmentAppRequest(Rec,true,true) then;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,"Master Record",Investment;
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocumentType := DocumentType::Investment;
                    ApprovalEntries.Setfilters(Database::"Investment Header", DocumentType, Rec."No.");
                    ApprovalEntries.Run();
                end;
            }
            action("Post Investment")
            {
                ApplicationArea = Basic;
                Caption = 'Post Investment';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Investment action.';
                trigger OnAction()
                var
                    LineNo: Integer;
                    Text000: Label 'Post and Close Investment,Post and Rollover';
                    Selection: Integer;
                begin

                    if Today < Rec."Investment End Date" then
                        Error('Investment Cannot be posted before maturity');

                    Selection := StrMenu(Text000, 2);
                    if Selection = 0 then
                        exit;
                    if Selection = 1 then begin  //Post and Close

                        Rec.TestField(Rec.Status, Rec.Status::Approved);

                        if Confirm('Are you sure you want to post investment?', false) then;

                        Rec.TestField(Rec."Interest Earned");

                        InvestmentSetup.Get();
                        InvestmentSetup.TestField(InvestmentSetup."Investment Template");
                        InvestmentSetup.TestField(InvestmentSetup."Investment Batch");
                        InvestmentSetup.TestField(InvestmentSetup."Investment G/L Account");

                        Batch := InvestmentSetup."Investment Batch";
                        Template := InvestmentSetup."Investment Template";
                        InvestmentGL := InvestmentSetup."Investment G/L Account";
                        LineNo := 0;


                        GenJnl.Reset();
                        GenJnl.SetRange(GenJnl."Journal Template Name", Template);
                        GenJnl.SetRange(GenJnl."Journal Batch Name", Batch);
                        if GenJnl.Find('-') then
                            GenJnl.DeleteAll();
                        //Create Surrender entry -->CR investment account DR bank
                        LineNo += 1;
                        GenJnl."Journal Template Name" := Template;
                        GenJnl."Journal Batch Name" := Batch;
                        GenJnl."Line No." := LineNo;
                        GenJnl."Document No." := Rec."No.";
                        GenJnl."Account Type" := GenJnl."Account Type"::"Bank Account";
                        //******Get the G/L Account that was used to make the investment
                        Rec.TestField(Rec."Paying Document No.");
                        PV.Get(Rec."Paying Document No.");
                        PV.TestField(PV."Paying Bank Account");
                        Bank.Get(PV."Paying Bank Account");
                        //BankPostingGrps.GET(Bank."Bank Acc. Posting Group");
                        //*********End Get the G/L Account that was used to make the investment
                        GenJnl.Validate(GenJnl."Account No.", PV."Paying Bank Account");
                        GenJnl.Amount := Rec."Investment Principal";
                        GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";

                        GenJnl.Validate(GenJnl."Bal. Account No.", InvestmentGL);
                        GenJnl."Posting Date" := Today;
                        GenJnl.Insert();


                        //Create Interest Entry
                        LineNo += 1;
                        GenJnl."Journal Template Name" := Template;
                        GenJnl."Journal Batch Name" := Batch;
                        GenJnl."Line No." := LineNo;
                        GenJnl."Document No." := Rec."No.";
                        GenJnl."Account Type" := GenJnl."Account Type"::"G/L Account";
                        GenJnl.Validate(GenJnl."Account No.", InvestmentGL);
                        GenJnl.Amount := Rec."Interest Earned";
                        GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";
                        GenJnl.Validate(GenJnl."Bal. Account No.", InvestmentSetup."Interest G/L Account");
                        GenJnl."Posting Date" := Today;
                        GenJnl.Insert();

                        //Create Withholding tax entry
                        LineNo += 1;
                        GenJnl."Journal Template Name" := Template;
                        GenJnl."Journal Batch Name" := Batch;
                        GenJnl."Line No." := LineNo;
                        GenJnl."Document No." := Rec."No.";
                        GenJnl."Account Type" := GenJnl."Account Type"::"G/L Account";
                        GenJnl.Validate(GenJnl."Account No.", InvestmentSetup."Interest G/L Account");
                        GenJnl.Amount := Rec."Investment Withholding Tax";
                        GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";
                        GenJnl.Validate(GenJnl."Bal. Account No.", InvestmentSetup."Withholding Tax G/L Account");
                        GenJnl."Posting Date" := Today;
                        GenJnl.Insert();


                        Commit();
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnl);
                        Rec."Investment Rollover Status" := Rec."Investment Rollover Status"::Closed;

                        Rec.Modify();
                        Message('Investment posted Successfully!');

                    end else
                        if
               Selection = 2 then begin   //Post and Rollover

                            Rec.TestField(Rec.Status, Rec.Status::Approved);

                            if Confirm('Are you sure you want to post investment?', false) then;

                            Rec.TestField(Rec."Interest Earned");

                            InvestmentSetup.Get();
                            InvestmentSetup.TestField(InvestmentSetup."Investment Template");
                            InvestmentSetup.TestField(InvestmentSetup."Investment Batch");
                            InvestmentSetup.TestField(InvestmentSetup."Investment G/L Account");

                            Batch := InvestmentSetup."Investment Batch";
                            Template := InvestmentSetup."Investment Template";
                            InvestmentGL := InvestmentSetup."Investment G/L Account";
                            LineNo := 0;

                            GenJnl.Reset();
                            GenJnl.SetRange(GenJnl."Journal Template Name", Template);
                            GenJnl.SetRange(GenJnl."Journal Batch Name", Batch);
                            if GenJnl.Find('-') then
                                GenJnl.DeleteAll();
                            //Create Interest Entry
                            LineNo += 1;
                            GenJnl."Journal Template Name" := Template;
                            GenJnl."Journal Batch Name" := Batch;
                            GenJnl."Line No." := LineNo;
                            GenJnl."Document No." := Rec."No.";
                            GenJnl."Account Type" := GenJnl."Account Type"::"G/L Account";
                            GenJnl.Validate(GenJnl."Account No.", InvestmentGL);
                            GenJnl.Amount := Rec."Interest Earned";
                            GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";
                            GenJnl.Validate(GenJnl."Bal. Account No.", InvestmentSetup."Interest G/L Account");
                            GenJnl."Posting Date" := Today;
                            GenJnl.Insert();

                            //Create Withholding tax entry
                            LineNo += 1;
                            GenJnl."Journal Template Name" := Template;
                            GenJnl."Journal Batch Name" := Batch;
                            GenJnl."Line No." := LineNo;
                            GenJnl."Document No." := Rec."No.";
                            GenJnl."Account Type" := GenJnl."Account Type"::"G/L Account";
                            GenJnl.Validate(GenJnl."Account No.", InvestmentSetup."Interest G/L Account");
                            GenJnl.Amount := Rec."Investment Withholding Tax";
                            GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::"G/L Account";
                            GenJnl.Validate(GenJnl."Bal. Account No.", InvestmentSetup."Withholding Tax G/L Account");
                            GenJnl."Posting Date" := Today;
                            GenJnl.Insert();


                            Commit();
                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnl); //THEN  BEGIN
                                                                              //Archive copy of this document if possible
                                                                              //END;
                            InvestmentArchive.SetRange(InvestmentArchive."No.", Rec."No.");
                            if InvestmentArchive.Find('+') then
                                Version := InvestmentArchive."Version No."
                            else
                                Version := 0;
                            Version += 1;
                            InvestmentArchive.TransferFields(Rec);
                            InvestmentArchive."Version No." := Version;
                            InvestmentArchive."Rollover Date" := Today;
                            InvestmentArchive.Insert();

                            //Change document fields to default for new rollover period
                            Rec.Status := Rec.Status::Open;
                            Rec."Interest Earned" := 0;
                            Rec."Investment Withholding Tax" := 0;
                            Rec."Investment Rollover Status" := Rec."Investment Rollover Status"::"First Rollover";

                            Rec.Modify();

                            Message('Investment posted Successfully!');
                        end;
                    //MESSAGE('Investment posted Successfully!');
                end;
            }
            action("Calculate Interest")
            {
                ApplicationArea = Basic;
                Caption = 'Calculate Interest';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Calculate Interest action.';
                trigger OnAction()
                begin
                    if Rec."Investment End Date" > Today then
                        Error('You can only calculate interest on maturity');
                    if Rec."Interest Earned" = 0 then
                        Error('Enter interest earned');
                    if Rec."Investment Principal" <> 0 then begin
                        Rec.TestField(Rec."Investment Rate");
                        Rec.TestField(Rec."Withholding Tax Rate");
                        Rec.CalcFields(Rec."Investment Principal");
                        Rec."Expected Interest" := (Rec."Investment Rate" / 100) * Rec."Investment Principal";


                    end else
                        Rec."Expected Interest" := 0;
                    Message('Complete!');
                end;
            }
        }
    }


    var
        GenJnl: Record "Gen. Journal Line";
        InvestmentSetup: Record "Investment Setup";
        Batch: Code[10];
        Template: Code[10];
        PV: Record "Payments Header";
        Bank: Record "Bank Account";
        BankPostingGrps: Record "Bank Account Posting Group";
        InvestmentGL: Code[10];
        Payments: Record "Payments Header";
        InvestmentArchive: Record "Archived Investment Header";
        Version: Integer;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //ApprovalMgt: Codeunit "Export F/O Consolidation";

    local procedure Close()
    begin
    end;

    local procedure Rollover()
    begin
    end;
}
