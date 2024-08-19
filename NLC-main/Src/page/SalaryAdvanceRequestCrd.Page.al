#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 52193571 "Salary Advance Request Crd"
{
    Caption = 'Salary Advance Request';
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Workflow Process,Budgetary Control,Hr Comments,Hr Comments4,Category8_caption,Category9_caption,Category10_caption,Hr Comments';
    SourceTable = "Staff Advance Headers";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group("General Details")
            {
                Editable = CheckEdits;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Loan Type"; Rec."Loan Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Loan Type field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requestor ID';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Requestor ID field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Eligible; Rec.Eligible)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Eligible field.';
                }
                field("Payroll Deduction Month"; Rec."Payroll Deduction Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Deduction Month field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Reasons for Advance Amount"; Rec."Reasons for Advance Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reasons for Advance';
                    ToolTip = 'Specifies the value of the Reasons for Advance field.';
                }
                field(MyRecId; Rec.MyRecId)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MyRecId field.';
                    //Visible = false;
                }
            }
            part("Salary advance Lines"; "Salary Advance Line")
            {
                SubPageLink = No = field("No."), "Employee No" = field("Employee No");
                Editable = CheckEdits;
            }
            systempart(Control7; Links)
            {
                Visible = true;
            }
            systempart(Control5; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Workflow Process")
            {
                Caption = 'Workflow Process';
                action(SendApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        Rec.TestField(Status, Rec.Status::Pending);

                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        //Release the Imprest for Approval
                        if Confirm('Send this Salary Advance for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        AppraisaComme.Reset();
                        AppraisaComme.SetRange(AppraisaComme."Sal No.", Rec."No.");
                        AppraisaComme.SetRange(Commented, false);
                        if AppraisaComme.FindFirst() then begin
                            repeat
                                AppraisaComme.Commented := true;
                                AppraisaComme.Modify();
                            until AppraisaComme.next = 0;
                        end;
                    end;
                }
                action(CancelApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";

                    begin
                        if Rec.Status = Rec.Status::Pending then
                            Error('Status should not be %1', Rec.Status);
                        AppraisaComme.Reset();
                        AppraisaComme.SetRange(AppraisaComme."Sal No.", Rec."No.");
                        AppraisaComme.SetRange(Commented, false);
                        if not AppraisaComme.FindFirst() then
                            Error('Appraisal Comments Must have a value');
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        AppraisaComme.Reset();
                        AppraisaComme.SetRange(AppraisaComme."Sal No.", Rec."No.");
                        AppraisaComme.SetRange(Commented, false);
                        if AppraisaComme.FindFirst() then begin
                            repeat
                                AppraisaComme.Commented := true;
                                AppraisaComme.Modify();
                            until AppraisaComme.next = 0;
                        end;


                    end;

                }
                action("Reject Approval")
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    ToolTip = 'Executes the &Reject Approval Request action.';
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        AppraisaComme: Record "HR Appraisal Comments";
                    begin
                        AppraisaComme.Reset();
                        AppraisaComme.SetRange(AppraisaComme."Sal No.", Rec."No.");
                        AppraisaComme.SetRange(Commented, false);
                        if not AppraisaComme.FindFirst() then
                            Error('Appraisal Comments Must have a value');
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                        AppraisaComme.Reset();
                        AppraisaComme.SetRange(AppraisaComme."Sal No.", Rec."No.");
                        AppraisaComme.SetRange(Commented, false);
                        if AppraisaComme.FindFirst() then begin
                            repeat
                                AppraisaComme.Commented := true;
                                AppraisaComme.Modify();
                            until AppraisaComme.next = 0;
                        end;
                        rec.Status := Rec.Status::Rejected;
                        Rec.Modify();
                        Message('Document have been rejected');
                        CurrPage.Close();
                    end;
                }
                action(PrintPreview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter("No.", Rec."No.");
                        Report.Run(Report::"Staff Advance Voucher", true, true, Rec);
                        Rec.Reset();

                    end;
                }
                action("HR Appraisal Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'Hr Appraisal Comments';
                    Promoted = true;
                    PromotedCategory = Category11;
                    PromotedIsBig = true;
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field("No.");
                }
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
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CurrPageUpdate();
    end;


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Payment Type" := Rec."Payment Type"::Imprest;
        Rec."Account Type" := Rec."Account Type"::Customer;

    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        UpdateControls();

    end;


    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls();
    end;


    var
        PayLine: Record "Staff Advance Lines";
        PVUsers: Record "W/P Budget Buffer";
        strFilter: Text[250];
        IntC: Integer;
        IntCount: Integer;
        Payments: Record "Payments Header";
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cash Office User Template";
        LineNo: Integer;
        Temp: Record "Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        strText: Text[100];
        PVHead: Record "Payments Header";
        BankAcc: Record "Bank Account";
        AppraisaComme: Record "HR Appraisal Comments";
        CheckBudgetAvail: Codeunit "Budgetary Control";
        Commitments: Record Committment;
        UserMgt: Codeunit "User Setup Management BR";
        JournlPosted: Codeunit "Journal Post Successful";
        //DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash;
        BudgetControl: Codeunit "Budgetary Control";
        TravReqHeader: Record "Staff Advance Header";
        [InDataSet]
        "Payment Release DateEditable": Boolean;
        [InDataSet]
        "Paying Bank AccountEditable": Boolean;
        [InDataSet]
        "Pay ModeEditable": Boolean;
        [InDataSet]
        "Cheque No.Editable": Boolean;
        [InDataSet]
        GlobalDimension1CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension2CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension3CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension4CodeEditable: Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        "Currency CodeEditable": Boolean;
        StatusEditable: Boolean;
        RespEditable: Boolean;
        AccountEditable: Boolean;
        PurposeEditable: Boolean;
        PayingBankVisible: Boolean;
        PayingBankNameVisible: Boolean;
        PostingDateVisible: Boolean;
        PaymodeVisible: Boolean;
        ChequeNoVisible: Boolean;
        PageActionsVisible: Boolean;
        DocNoVisible: Boolean;
        CheckEdits: Boolean;
        StaffAdvance: Record "Staff Advance Header";
        ApprovalEntries: Page "Approval Entries";

        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;

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
        PayLine.Reset();
        PayLine.SetRange(PayLine.No, Rec."No.");
        PayLine.SetRange(PayLine.Committed, false);
        PayLine.SetRange(PayLine."Budgetary Control A/C", true);
        if PayLine.Find('-') then
            Exists := true;
    end;


    procedure PostImprest(rec: Record "Staff Advance Header")
    begin

        if Temp.Get(UserId) then begin
            GenJnlLine.Reset();
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll();
        end;

        LineNo := LineNo + 1000;
        GenJnlLine.Init();
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := rec."Payment Release Date";
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Invoice;
        GenJnlLine."Document No." := rec."No.";
        GenJnlLine."External Document No." := rec."Cheque No.";
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
        GenJnlLine."Account No." := rec."Account No.";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        GenJnlLine.Description := 'Advance: ' + rec."Account No." + ':' + rec.Payee;
        rec.CalcFields("Total Net Amount");
        GenJnlLine.Amount := rec."Total Net Amount";
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
        GenJnlLine."Bal. Account No." := rec."Paying Bank Account";
        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
        //Added for Currency Codes
        GenJnlLine."Currency Code" := rec."Currency Code";
        GenJnlLine.Validate("Currency Code");
        GenJnlLine."Currency Factor" := rec."Currency Factor";
        GenJnlLine.Validate("Currency Factor");
        /*
        GenJnlLine."Currency Factor":=Payments."Currency Factor";
        GenJnlLine.VALIDATE("Currency Factor");
        */
        GenJnlLine."Shortcut Dimension 1 Code" := rec."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := rec."Shortcut Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, rec."Shortcut Dimension 4 Code");

        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert();


        GenJnlLine.Reset();
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

        Post := false;
        Post := JournlPosted.PostedSuccessfully();
        if Post then begin
            rec.Posted := true;
            rec."Date Posted" := Today;
            rec."Time Posted" := Time;
            rec."Posted By" := UserId;
            rec.Status := rec.Status::Posted;
            rec.Modify();
        end;

    end;


    procedure CheckImprestRequiredItems(rec: Record "Staff Advance Header")
    begin

        rec.TestField("Payment Release Date");
        rec.TestField("Paying Bank Account");
        rec.TestField("Account No.");
        rec.TestField("Account Type", rec."Account Type"::Customer);

        if rec.Posted then
            Error('The Document has already been posted');

        rec.TestField(Status, rec.Status::Approved);

        /*Check if the user has selected all the relevant fields*/

        Temp.Get(UserId);
        JTemplate := Temp."Advance Template";
        JBatch := Temp."Advance  Batch";

        if JTemplate = '' then
            Error('Ensure the Staff Advance Template is set up in Cash Office Setup');

        if JBatch = '' then
            Error('Ensure the Staff Advance Batch is set up in the Cash Office Setup');

        if not LinesExists() then
            Error('There are no Lines created for this Document');

    end;


    procedure UpdateControls()
    begin
        // if rec.Status <> rec.Status::Pending then
        //     CurrPage.Editable := false
        // else
        //     CurrPage.Editable := true;

        if Rec.Status <> Rec.Status::Approved then begin
            "Payment Release DateEditable" := false;
            "Paying Bank AccountEditable" := false;
            "Pay ModeEditable" := false;
            //CurrForm."Currency Code".EDITABLE:=FALSE;
            "Cheque No.Editable" := false;
            //CurrPage.UpdateControls();
        end else begin
            "Payment Release DateEditable" := true;
            "Paying Bank AccountEditable" := true;
            "Pay ModeEditable" := true;
            "Cheque No.Editable" := true;
            //CurrForm."Currency Code".EDITABLE:=TRUE;
            //CurrPage.UpdateControls();
        end;

        if Rec.Status = Rec.Status::Pending then begin
            GlobalDimension1CodeEditable := true;
            ShortcutDimension2CodeEditable := true;
            //CurrForm.Payee.EDITABLE:=TRUE;
            ShortcutDimension3CodeEditable := true;
            ShortcutDimension4CodeEditable := true;
            DateEditable := true;
            //CurrForm."Account No.".EDITABLE:=TRUE;
            "Currency CodeEditable" := true;
            //CurrForm."Paying Bank Account".EDITABLE:=FALSE;
            //CurrPage.UpdateControls();
        end else begin
            GlobalDimension1CodeEditable := false;
            ShortcutDimension2CodeEditable := false;
            //CurrForm.Payee.EDITABLE:=FALSE;
            ShortcutDimension3CodeEditable := false;
            ShortcutDimension4CodeEditable := false;
            DateEditable := false;
            //CurrForm."Account No.".EDITABLE:=FALSE;
            "Currency CodeEditable" := false;
            //CurrForm."Paying Bank Account".EDITABLE:=TRUE;
            //CurrPage.UpdateControls();
        end;

        if (Rec.Status = Rec.Status::Posted) or (Rec.Status = Rec.Status::Cancelled) then begin
            "Payment Release DateEditable" := false;
            "Paying Bank AccountEditable" := false;
            "Pay ModeEditable" := false;
            //CurrForm."Currency Code".EDITABLE:=FALSE;
            "Cheque No.Editable" := false;
            "Payment Release DateEditable" := false;
            "Paying Bank AccountEditable" := false;
            "Pay ModeEditable" := false;
            "Cheque No.Editable" := false;
            RespEditable := false;
            AccountEditable := false;
            PurposeEditable := false;
            //CurrForm."Currency Code".EDITABLE:=TRUE;
            //CurrPage.UpdateControls();
        end;
        if rec.Status <> rec.Status::Pending then
            CheckEdits := false
        else
            CheckEdits := true;

    end;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Staff Advance Line";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines.No, Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "Staff Advance Lines";
    begin

        /*AllKeyFieldsEntered:=TRUE;
         PayLines.RESET;
         PayLines.SETRANGE(PayLines.No,"No.");
          IF PayLines.FIND('-') THEN BEGIN
          REPEAT
             IF (PayLines."Employee No"='') OR (PayLines.Amount<=0) THEN
             AllKeyFieldsEntered:=FALSE;
          UNTIL PayLines.NEXT=0;
             EXIT(AllKeyFieldsEntered);
          END;
             */

    end;

    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        CurrPage.Update();
    end;


    procedure CheckIfIsAboveCashLimit()
    var
        CashOfficeSetup: Record "Cash Office Setup";
    begin
        //if above cash limit then pay mode must be cheque
        if Rec."Pay Mode" <> Rec."Pay Mode"::Cash then
            exit;
        Rec.CalcFields("Total Net Amount");
        CashOfficeSetup.Get();
        if Rec."Total Net Amount" >= CashOfficeSetup."Minimum Cheque Creation Amount" then
            Error('The specified amount %1 should be created as a cheque.', Rec."Total Net Amount");
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility1400;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer;
    begin
        DocNoVisible := DocumentNoVisibility.FundsMgtDocumentNoIsVisible(DocType::"Staff Advance", Rec."No.");
    end;
}

#pragma implicitwith restore

