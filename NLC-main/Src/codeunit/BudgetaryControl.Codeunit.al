#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193450 "Budgetary Control"
{


    var
        BCSetup: Record "Budgetary Control Setup";
        DimMgt: Codeunit DimensionManagement;
        ShortcutDimCode: array[8] of Code[20];
        BudgetGL: Code[20];
        Text0001: Label 'You Have exceeded the Budget by ';
        Text0002: Label ' Do you want to Continue?';
        Text0003: Label 'There is no Budget to Check against do you wish to continue?';
        objJobs: Record "HR Employee Qualifications";
        DimCode1: Code[20];
        DimCode2: Code[20];


    procedure CheckPurchase(var PurchHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "G/L Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
        dimSetEntry: Record "Dimension Set Entry";
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset();
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (PurchHeader."Document Date" < BCSetup."Current Budget Start Date") then
                Error('The Current Date %1 In The Order Does Not Fall Within Budget Dates %2 - %3', PurchHeader."Document Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date")
            else
                if (PurchHeader."Document Date" > BCSetup."Current Budget End Date") then
                    Error('The Current Date %1 In The Order Does Not Fall Within Budget Dates %2 - %3', PurchHeader."Document Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");
            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PurchLine.Reset();
            PurchLine.SetRange(PurchLine."Document Type", PurchHeader."Document Type");
            PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
            if PurchLine.FindFirst() then
                repeat

                    //Get the Dimension Here
                    //  if PurchLine."Line No." <> 0 then
                    //       DimMgt.ShowDocDim(
                    //         Database::"Purchase Line",PurchLine."Document Type",PurchLine."Dimension Set ID",
                    //         PurchLine."Line No.",ShortcutDimCode)
                    //     else
                    //      DimMgt.ShowTempDim(ShortcutDimCode);
                    //Had to be put here for the sake of Calculating Individual Line Entries

                    //check the type of account in the payments line
                    //Item
                    if PurchLine.Type = PurchLine.Type::Item then begin
                        Item.Reset();
                        if not Item.Get(PurchLine."No.") then
                            Error('Item Does not Exist');

                        Item.TestField("Item G/L Budget Account");
                        BudgetGL := Item."Item G/L Budget Account";
                    end;
                    //  MESSAGE('FOUND');
                    if PurchLine.Type = PurchLine.Type::"Fixed Asset" then begin
                        FixedAssetsDet.Reset();
                        FixedAssetsDet.SetRange(FixedAssetsDet."No.", PurchLine."No.");
                        if FixedAssetsDet.Find('-') then begin
                            FixedAssetsDet.CalcFields(FixedAssetsDet."FA Posting Group");
                            FAPostingGRP.Reset();
                            FAPostingGRP.SetRange(FAPostingGRP.Code, FixedAssetsDet."FA Posting Group");
                            if FAPostingGRP.Find('-') then
                                if PurchLine."FA Posting Type" = PurchLine."FA Posting Type"::Maintenance then begin
                                    BudgetGL := FAPostingGRP."Maintenance Expense Account";
                                    if BudgetGL = '' then
                                        Error('Ensure Fixed Asset No %1 has the Maintenance G/L Account', PurchLine."No.");
                                end else begin
                                    BudgetGL := FAPostingGRP."Acquisition Cost Account";
                                    if BudgetGL = '' then
                                        Error('Ensure Fixed Asset No %1 has the Acquisition G/L Account', PurchLine."No.");
                                end;
                        end;
                    end;

                    if PurchLine.Type = PurchLine.Type::"G/L Account" then begin
                        BudgetGL := PurchLine."No.";
                        if GLAcc.Get(PurchLine."No.") then
                            GLAcc.TestField(GLAcc."Budget Controlled", true);
                    end;

                    //End Checking Account in Payment Line

                    //For End Total Budgeting
                    if BCSetup."Use Totaling Account" then
                        if GLAcc.Get(BudgetGL) then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    //End (End Total Budget)

                    //check the votebook now
                    FirstDay := DMY2Date(1, Date2DMY(PurchHeader."Document Date", 2), Date2DMY(PurchHeader."Document Date", 3));
                    CurrMonth := Date2DMY(PurchHeader."Document Date", 2);
                    if CurrMonth = 12 then begin
                        LastDay := DMY2Date(1, 1, Date2DMY(PurchHeader."Document Date", 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := DMY2Date(1, CurrMonth, Date2DMY(PurchHeader."Document Date", 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset();
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PurchLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset();
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PurchLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;

                    //check if there is any budget
                    if (BudgetAmount <= 0) then
                        Error('No Budget To Check Against');

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PurchLine."Outstanding Amount (LCY)") > BudgetAmount) and
                    (BCSetup."Allow OverExpenditure" = false) then
                        Error('The Amount On Order No %1  %2 %3  Exceeds The Budget By %4',
                        PurchLine."Document No.", PurchLine.Type, PurchLine."No.",
                          Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PurchLine."Outstanding Amount (LCY)"))))
                    else begin
                        Commitments.Reset();
                        Commitments.Init();
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := PurchHeader."Document Date";
                        if PurchHeader.DocApprovalType = PurchHeader.DocApprovalType::Purchase then
                            Commitments."Document Type" := Commitments."Document Type"::LPO
                        else
                            Commitments."Document Type" := Commitments."Document Type"::Requisition;

                        if PurchHeader."Document Type" = PurchHeader."Document Type"::Invoice then
                            Commitments."Document Type" := Commitments."Document Type"::PurchInvoice;

                        Commitments."Document No." := PurchHeader."No.";
                        Commitments.Amount := PurchLine."Outstanding Amount (LCY)";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := PurchHeader."Document Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PurchLine."Shortcut Dimension 2 Code");
                        Commitments.Validate("Shortcut Dimension 3 Code", ShortcutDimCode[3]);
                        Commitments.Validate("Shortcut Dimension 4 Code", ShortcutDimCode[4]);
                        Commitments."Dimension Set ID" := PurchLine."Dimension Set ID";
                        Commitments.Committed := true;
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := Commitments.Type::Vendor;
                        Commitments."Vendor/Cust No." := PurchHeader."Buy-from Vendor No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PurchLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert();

                        //Tag the Purchase Line as Committed
                        PurchLine.Committed := true;
                        PurchLine.Modify();
                        //End Tagging PurchLines as Committed
                    end;

                until PurchLine.Next() = 0;
        end
        else//budget control not mandatory


            ;

    end;


    procedure CheckPayments(var PaymentHeader: Record "Payments Header")
    var
        PayLine: Record "Payment Line";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset();
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (PaymentHeader.Date < BCSetup."Current Budget Start Date") then
                Error('The Current Date %1 In The Payment Voucher Does Not Fall Within Budget Dates %2 - %3', PaymentHeader.Date,
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date")
            else
                if (PaymentHeader.Date > BCSetup."Current Budget End Date") then
                    Error('The Current Date %1 In The Payment Voucher Does Not Fall Within Budget Dates %2 - %3', PaymentHeader.Date,
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");


            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset();
            PayLine.SetRange(PayLine.No, PaymentHeader."No.");
            PayLine.SetRange(PayLine."Account Type", PayLine."Account Type"::"G/L Account");
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst() then
                repeat
                    //check the votebook now
                    FirstDay := DMY2Date(1, Date2DMY(PaymentHeader.Date, 2), Date2DMY(PaymentHeader.Date, 3));
                    CurrMonth := Date2DMY(PaymentHeader.Date, 2);
                    if CurrMonth = 12 then begin
                        LastDay := DMY2Date(1, 1, Date2DMY(PaymentHeader.Date, 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := DMY2Date(1, CurrMonth, Date2DMY(PaymentHeader.Date, 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    BudgetGL := PayLine."Account No.";

                    //For End Total Budgeting
                    if BCSetup."Use Totaling Account" then
                        if GLAcc.Get(BudgetGL) then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    //End (End Total Budget)


                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset();
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset();
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;

                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then
                        Error('No Budget To Check Against')
                    else
                        if (BudgetAmount <= 0) then
                            if not Confirm(Text0003, true) then
                                Error('Budgetary Checking Process Aborted');

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."NetAmount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine.No, PayLine.Type, PayLine."Line No.",
                          Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."NetAmount LCY"))))
                    else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."NetAmount LCY" + ActualsAmount) > BudgetAmount) then
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."NetAmount LCY")))
                            + Text0002, true) then
                                Error('Budgetary Checking Process Aborted');

                        Commitments.Reset();
                        Commitments.Init();
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := PaymentHeader.Date;
                        if PaymentHeader."Payment Type" = PaymentHeader."Payment Type"::Normal then
                            Commitments."Document Type" := Commitments."Document Type"::"Payment Voucher"
                        else
                            Commitments."Document Type" := Commitments."Document Type"::PettyCash;
                        Commitments."Document No." := PaymentHeader."No.";
                        Commitments.Amount := PayLine."NetAmount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := PaymentHeader.Date;
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //                        Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Global Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert();
                        // MESSAGE('Done');
                        //Tag the Payment Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify();
                        //End Tagging Payment Lines as Committed
                    end;

                until PayLine.Next() = 0;
        end
        else//budget control not mandatory


            ;
        Message('Budgetary Checking Completed Successfully');
    end;


    procedure CheckImprest(var ImprestHeader: Record "Imprest Header")
    var
        PayLine: Record "Imprest Lines";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset();
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (ImprestHeader.Date < BCSetup."Current Budget Start Date") then
                Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date")
            else
                if (ImprestHeader.Date > BCSetup."Current Budget End Date") then
                    Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset();
            PayLine.SetRange(PayLine.No, ImprestHeader."No.");
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst() then
                repeat
                    //check the votebook now
                    FirstDay := DMY2Date(1, Date2DMY(ImprestHeader.Date, 2), Date2DMY(ImprestHeader.Date, 3));
                    CurrMonth := Date2DMY(ImprestHeader.Date, 2);
                    if CurrMonth = 12 then begin
                        LastDay := DMY2Date(1, 1, Date2DMY(ImprestHeader.Date, 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := DMY2Date(1, CurrMonth, Date2DMY(ImprestHeader.Date, 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //The GL Account
                    BudgetGL := PayLine."Account No:";

                    //For End Total Budgeting
                    if BCSetup."Use Totaling Account" then
                        if GLAcc.Get(BudgetGL) then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset();
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset();
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;



                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then
                        Error('No Budget To Check Against')
                    else
                        if (BudgetAmount <= 0) then
                            if not Confirm(Text0003, true) then
                                Error('Budgetary Checking Process Aborted');

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine.No, 'Staff Imprest', PayLine.No,
                          Format(Abs(BudgetAmount - (CommitmentAmount + PayLine."Amount LCY"))))
                    else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount) then
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Amount LCY")))
                            + Text0002, true) then
                                Error('Budgetary Checking Process Aborted');

                        Commitments.Reset();
                        Commitments.Init();
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := ImprestHeader.Date;
                        Commitments."Document Type" := Commitments."Document Type"::Imprest;
                        Commitments."Document No." := ImprestHeader."No.";
                        Commitments.Amount := PayLine."Amount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := ImprestHeader.Date;
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //                        Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Global Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := ImprestHeader."Account Type";
                        Commitments."Vendor/Cust No." := ImprestHeader."Account No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert();
                        //Tag the Imprest Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify();
                        //End Tagging Imprest Lines as Committed
                    end;

                until PayLine.Next() = 0;
        end
        else//budget control not mandatory


            ;
        Message('Budgetary Checking Completed Successfully');
    end;


    procedure ReverseEntries(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance; DocNo: Code[20])
    var
        Commitments: Record Committment;
        EntryNo: Integer;
        CommittedLines: Record Committment;
    begin
        //Get Commitment Lines
        Commitments.Reset();
        if Commitments.Find('+') then
            EntryNo := Commitments."Line No.";

        CommittedLines.Reset();
        CommittedLines.SetRange(CommittedLines."Document Type", DocumentType);
        CommittedLines.SetRange(CommittedLines."Document No.", DocNo);
        CommittedLines.SetRange(CommittedLines.Committed, true);
        if CommittedLines.Find('-') then
            repeat
                Commitments.Reset();
                Commitments.Init();
                EntryNo += 1;
                Commitments."Line No." := EntryNo;
                Commitments."Commitment Date" := Today;
                Commitments."Posting Date" := CommittedLines."Posting Date";
                Commitments."Document Type" := CommittedLines."Document Type";
                Commitments."Document No." := CommittedLines."Document No.";
                Commitments.Amount := -CommittedLines.Amount;
                Commitments."Month Budget" := CommittedLines."Month Budget";
                Commitments."Month Actual" := CommittedLines."Month Actual";
                Commitments.Committed := false;
                Commitments."Committed By" := UserId;
                Commitments."Committed Date" := CommittedLines."Committed Date";
                Commitments."G/L Account No." := CommittedLines."G/L Account No.";
                Commitments."Committed Time" := Time;
                //     Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                Commitments."Shortcut Dimension 1 Code" := CommittedLines."Shortcut Dimension 1 Code";
                Commitments."Shortcut Dimension 2 Code" := CommittedLines."Shortcut Dimension 2 Code";
                Commitments."Shortcut Dimension 3 Code" := CommittedLines."Shortcut Dimension 3 Code";
                Commitments."Shortcut Dimension 4 Code" := CommittedLines."Shortcut Dimension 4 Code";
                Commitments."Dimension Set ID" := CommittedLines."Dimension Set ID";
                Commitments.Budget := CommittedLines.Budget;
                Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                Commitments."Actual Source" := BCSetup."Actual Source";
                Commitments."Document Line No." := CommittedLines."Line No.";
                //Added for Totalling Accounts
                Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                Commitments.Insert();

            until CommittedLines.Next() = 0;
    end;


    procedure CheckFundsAvailability(Payments: Record "Payments Header")
    var
        BankAcc: Record "Bank Account";
        "Current Source A/C Bal.": Decimal;
    begin
        //get the source account balance from the database table
        BankAcc.Reset();
        BankAcc.SetRange(BankAcc."No.", Payments."Paying Bank Account");
        BankAcc.SetRange(BankAcc."Bank Type", BankAcc."Bank Type"::Cash);
        if BankAcc.FindFirst() then begin
            BankAcc.CalcFields(BankAcc.Balance);
            "Current Source A/C Bal." := BankAcc.Balance;
            if ("Current Source A/C Bal." - Payments."Total Net Amount") < 0 then
                Error('The transaction will result in a negative balance in the BANK ACCOUNT. %1:%2', BankAcc."No.",
                BankAcc.Name);
        end;
    end;


    procedure UpdateAnalysisView()
    var
        UpdateAnalysisView: Codeunit "Update Analysis View410";
        BudgetaryControl: Record "Budgetary Control Setup";
        AnalysisView: Record "Analysis View";
    begin
        //Update Budget Lines
        if BudgetaryControl.Get() then begin
            if BudgetaryControl."Actual Source" = BudgetaryControl."Actual Source"::"Analysis View Entry" then
                if BudgetaryControl."Analysis View Code" = '' then
                    Error('The Analysis view code can not be blank in the budgetary control setup');
            if BudgetaryControl."Analysis View Code" <> '' then begin
                AnalysisView.Reset();
                AnalysisView.SetRange(AnalysisView.Code, BudgetaryControl."Analysis View Code");
                if AnalysisView.Find('-') then
                    UpdateAnalysisView.UpdateAnalysisView_Budget(AnalysisView);  //analysis not updating budget
                                                                                 //UpdateAnalysisView.RUN(AnalysisView);                      //updated 2015 correct analysis code
            end;
        end;
    end;


    procedure UpdateDim(DimCode: Code[20]; DimValueCode: Code[20])
    var
        GLBudgetDim: Integer;
    begin
        //In 2013 this is not applicable table 361 not supported
        /*IF DimCode = '' THEN
          EXIT;
        WITH GLBudgetDim DO BEGIN
          IF GET(Rec."Entry No.",DimCode) THEN
            DELETE;
          IF DimValueCode <> '' THEN BEGIN
            INIT;
            "Entry No." := Rec."Entry No.";
            "Dimension Code" := DimCode;
            "Dimension Value Code" := DimValueCode;
            INSERT;
          END;
        END; */

    end;


    procedure CheckIfBlocked(BudgetName: Code[20])
    var
        GLBudgetName: Record "G/L Budget Name";
    begin
        GLBudgetName.Get(BudgetName);
        GLBudgetName.TestField(Blocked, false);
    end;


    procedure CheckStaffClaim(var ImprestHeader: Record "Staff Claims Header")
    var
        PayLine: Record "Staff Claim Lines";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset();
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (ImprestHeader.Date < BCSetup."Current Budget Start Date") then
                Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date")
            else
                if (ImprestHeader.Date > BCSetup."Current Budget End Date") then
                    Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset();
            PayLine.SetRange(PayLine.No, ImprestHeader."No.");
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst() then
                repeat
                    //check the votebook now
                    FirstDay := DMY2Date(1, Date2DMY(ImprestHeader.Date, 2), Date2DMY(ImprestHeader.Date, 3));
                    CurrMonth := Date2DMY(ImprestHeader.Date, 2);
                    if CurrMonth = 12 then begin
                        LastDay := DMY2Date(1, 1, Date2DMY(ImprestHeader.Date, 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := DMY2Date(1, CurrMonth, Date2DMY(ImprestHeader.Date, 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //If Budget is annual then change the Last day
                    if BCSetup."Budget Check Criteria" = BCSetup."Budget Check Criteria"::"Whole Year" then
                        LastDay := BCSetup."Current Budget End Date";

                    //The GL Account
                    BudgetGL := PayLine."Account No:";

                    //For End Total Budgeting
                    if BCSetup."Use Totaling Account" then
                        if GLAcc.Get(BudgetGL) then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset();
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset();
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;

                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then
                        Error('No Budget To Check Against')
                    else
                        if (BudgetAmount <= 0) then
                            if not Confirm(Text0003, true) then
                                Error('Budgetary Checking Process Aborted');

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine.No, 'Staff Imprest', PayLine.No,
                          Format(Abs(BudgetAmount - (CommitmentAmount + PayLine."Amount LCY"))))
                    else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount) then
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Amount LCY")))
                            + Text0002, true) then
                                Error('Budgetary Checking Process Aborted');

                        Commitments.Reset();
                        Commitments.Init();
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := ImprestHeader.Date;
                        Commitments."Document Type" := Commitments."Document Type"::StaffClaim;
                        Commitments."Document No." := ImprestHeader."No.";
                        Commitments.Amount := PayLine."Amount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := ImprestHeader.Date;
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        // Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Global Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := ImprestHeader."Account Type";
                        Commitments."Vendor/Cust No." := ImprestHeader."Account No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert();
                        //Tag the Imprest Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify();
                        //End Tagging Imprest Lines as Committed
                    end;

                until PayLine.Next() = 0;
        end
        else//budget control not mandatory


            ;
        Message('Budgetary Checking Completed Successfully');
    end;


    procedure CheckStaffAdvance(var ImprestHeader: Record "Staff Advance Header")
    var
        PayLine: Record "Staff Advance Lines";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset();
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (ImprestHeader.Date < BCSetup."Current Budget Start Date") then
                Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date")
            else
                if (ImprestHeader.Date > BCSetup."Current Budget End Date") then
                    Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset();
            PayLine.SetRange(PayLine.No, ImprestHeader."No.");
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst() then
                repeat
                    //check the votebook now
                    FirstDay := DMY2Date(1, Date2DMY(ImprestHeader.Date, 2), Date2DMY(ImprestHeader.Date, 3));
                    CurrMonth := Date2DMY(ImprestHeader.Date, 2);
                    if CurrMonth = 12 then begin
                        LastDay := DMY2Date(1, 1, Date2DMY(ImprestHeader.Date, 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := DMY2Date(1, CurrMonth, Date2DMY(ImprestHeader.Date, 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //If Budget is annual then change the Last day
                    if BCSetup."Budget Check Criteria" = BCSetup."Budget Check Criteria"::"Whole Year" then
                        LastDay := BCSetup."Current Budget End Date";

                    //The GL Account
                    BudgetGL := PayLine."Account No:";

                    //For End Total Budgeting
                    if BCSetup."Use Totaling Account" then
                        if GLAcc.Get(BudgetGL) then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset();
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset();
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;



                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then
                        Error('No Budget To Check Against')
                    else
                        if (BudgetAmount <= 0) then
                            if not Confirm(Text0003, true) then
                                Error('Budgetary Checking Process Aborted');
                    /*
                    MESSAGE('BudgetAmount'+FORMAT(BudgetAmount));
                    MESSAGE('ActualsAmount'+FORMAT(ActualsAmount));
                    MESSAGE('CommitmentAmount'+FORMAT(CommitmentAmount));
                    MESSAGE('PayLine."Amount LCY"'+FORMAT(PayLine."Amount LCY"));
                     */
                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine.No, 'Staff Imprest', PayLine.No,
                          Format(Abs(BudgetAmount - (ActualsAmount + CommitmentAmount + PayLine."Amount LCY"))))
                    else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount) then
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Amount LCY")))
                            + Text0002, true) then
                                Error('Budgetary Checking Process Aborted');

                        Commitments.Reset();
                        Commitments.Init();
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := ImprestHeader.Date;
                        Commitments."Document Type" := Commitments."Document Type"::StaffAdvance;
                        Commitments."Document No." := ImprestHeader."No.";
                        Commitments.Amount := PayLine."Amount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := ImprestHeader.Date;
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //   Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Global Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := ImprestHeader."Account Type";
                        Commitments."Vendor/Cust No." := ImprestHeader."Account No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert();
                        //Tag the Imprest Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify();
                        //End Tagging Imprest Lines as Committed
                    end;

                until PayLine.Next() = 0;
        end
        else//budget control not mandatory


            ;
        Message('Budgetary Checking Completed Successfully');

    end;


    procedure CheckStaffAdvSurr(var ImprestHeader: Record "Staff Advance Surrender Header")
    var
        PayLine: Record "Staff Advanc Surrender Details";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset();
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (ImprestHeader."Surrender Date" < BCSetup."Current Budget Start Date") then
                Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader."Surrender Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date")
            else
                if (ImprestHeader."Surrender Date" > BCSetup."Current Budget End Date") then
                    Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader."Surrender Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset();
            PayLine.SetRange(PayLine."Surrender Doc No.", ImprestHeader.No);
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst() then
                repeat
                    //check the votebook now
                    FirstDay := DMY2Date(1, Date2DMY(ImprestHeader."Surrender Date", 2), Date2DMY(ImprestHeader."Surrender Date", 3));
                    CurrMonth := Date2DMY(ImprestHeader."Surrender Date", 2);
                    if CurrMonth = 12 then begin
                        LastDay := DMY2Date(1, 1, Date2DMY(ImprestHeader."Surrender Date", 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := DMY2Date(1, CurrMonth, Date2DMY(ImprestHeader."Surrender Date", 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //The GL Account
                    BudgetGL := PayLine."Account No:";

                    //For End Total Budgeting
                    if BCSetup."Use Totaling Account" then
                        if GLAcc.Get(BudgetGL) then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset();
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset();
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;



                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then
                        Error('No Budget To Check Against')
                    else
                        if (BudgetAmount <= 0) then
                            if not Confirm(Text0003, true) then
                                Error('Budgetary Checking Process Aborted');

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine."Surrender Doc No.", 'Staff Imprest', PayLine."Surrender Doc No.",
                          Format(Abs(BudgetAmount - (CommitmentAmount + PayLine."Amount LCY"))))
                    else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount) then
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Amount LCY")))
                            + Text0002, true) then
                                Error('Budgetary Checking Process Aborted');

                        Commitments.Reset();
                        Commitments.Init();
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := ImprestHeader."Surrender Date";
                        Commitments."Document Type" := Commitments."Document Type"::StaffSurrender;
                        Commitments."Document No." := ImprestHeader.No;
                        Commitments.Amount := PayLine."Amount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := ImprestHeader."Surrender Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //                        Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Shortcut Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := ImprestHeader."Account Type";
                        Commitments."Vendor/Cust No." := ImprestHeader."Account No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert();
                        //Tag the Imprest Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify();
                        //End Tagging Imprest Lines as Committed
                    end;

                until PayLine.Next() = 0;
        end
        else//budget control not mandatory


            ;
        Message('Budgetary Checking Completed Successfully');
    end;


    procedure CheckGrantSurr(var GrantHeader: Record "Grant Surrender Header")
    var
        GrantLine: Record "Grant Surrender Details";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        /*
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.RESET;
        BCSetup.GET();
        IF BCSetup.Mandatory THEN//budgetary control is mandatory
          BEGIN
            //check if the dates are within the specified range in relation to the payment header table
            IF (GrantHeader."Surrender Date"< BCSetup."Current Budget Start Date") THEN
              BEGIN
                ERROR('The Current Date %1 for the Grant Does Not Fall Within Budget Dates %2 - %3',GrantHeader."Surrender Date",
                BCSetup."Current Budget Start Date",BCSetup."Current Budget End Date");
              END
            ELSE IF (GrantHeader."Surrender Date">BCSetup."Current Budget End Date") THEN
              BEGIN
                ERROR('The Current Date %1 for the Grant Does Not Fall Within Budget Dates %2 - %3',GrantHeader."Surrender Date",
                BCSetup."Current Budget Start Date",BCSetup."Current Budget End Date");

              END;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
             IF Commitments.FIND('+') THEN
                EntryNo:=Commitments."Line No.";

            //get the lines related to the payment header
              GrantLine.RESET;
              GrantLine.SETRANGE(GrantLine."Surrender Doc No.",GrantHeader.No);
              GrantLine.SETRANGE(GrantLine."Budgetary Control A/C",TRUE);
              IF GrantLine.FINDFIRST THEN
                BEGIN
                  REPEAT
                            //check the votebook now
                            FirstDay:=DMY2DATE(1,DATE2DMY(GrantHeader."Surrender Date",2),DATE2DMY(GrantHeader."Surrender Date",3));
                            CurrMonth:=DATE2DMY(GrantHeader."Surrender Date",2);
                            IF CurrMonth=12 THEN
                             BEGIN
                               LastDay:=DMY2DATE(1,1,DATE2DMY(GrantHeader."Surrender Date",3) +1);
                               LastDay:=CALCDATE('-1D',LastDay);
                             END
                            ELSE
                             BEGIN
                               CurrMonth:=CurrMonth +1;
                               LastDay:=DMY2DATE(1,CurrMonth,DATE2DMY(GrantHeader."Surrender Date",3));
                               LastDay:=CALCDATE('-1D',LastDay);
                             END;

                            //The GL Account
                             BudgetGL:=GrantLine."Account No:";

                            //For End Total Budgeting
                            IF BCSetup."Use Totaling Account" THEN BEGIN
                                IF GLAcc.GET(BudgetGL) THEN
                                   BudgetGL:=GLAcc."Budget Control Account"
                                ELSE
                                      ERROR('G/L Account %1 is not mapped to a budget control account',BudgetGL);
                            END;
                            //End (End Total Budget)

                            //check the summation of the budget and actuals in the database
                            ActualsAmount:=0;
                            BudgetAmount:=0;

                            GLAcc.RESET;
                            GLAcc.SETRANGE("No.",BudgetGL);
                            GLAcc.SETRANGE("Date Filter",BCSetup."Current Budget Start Date",LastDay);
                            GLAcc.SETRANGE("Budget Filter",BCSetup."Current Budget Code");
                            GLAcc.SETRANGE("Dimension Set ID Filter",GrantLine."Dimension Set ID");
                            IF GLAcc.FIND('-') THEN BEGIN
                             GLAcc.CALCFIELDS("Budgeted Amount","Net Change");
                             ActualsAmount := GLAcc."Net Change";
                             BudgetAmount :=  GLAcc."Budgeted Amount";
                            END;

                          //get the committments
                            CommitmentAmount:=0;
                            Commitments.RESET;
                            Commitments.SETRANGE(Commitments.Budget,BCSetup."Current Budget Code");
                            Commitments.SETRANGE(Commitments."G/L Account No.",BudgetGL);
                            Commitments.SETRANGE(Commitments."Posting Date",BCSetup."Current Budget Start Date",LastDay);
                            Commitments.SETRANGE(Commitments."Dimension Set ID",GrantLine."Dimension Set ID");
                               Commitments.CALCSUMS(Commitments.Amount);
                               CommitmentAmount:= Commitments.Amount;


                           //check if there is any budget
                           IF (BudgetAmount<=0) AND NOT (BCSetup."Allow OverExpenditure") THEN  BEGIN
                              ERROR('No Budget To Check Against');
                           END ELSE BEGIN
                            IF (BudgetAmount<=0) THEN BEGIN
                             IF NOT CONFIRM(Text0003,TRUE) THEN BEGIN
                                ERROR('Budgetary Checking Process Aborted');
                             END;
                            END;
                           END;

                           //check if the actuals plus the amount is greater then the budget amount
                           IF ((CommitmentAmount + GrantLine."Amount LCY"+ActualsAmount)>BudgetAmount )
                           AND NOT ( BCSetup."Allow OverExpenditure") THEN  BEGIN
                              ERROR('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                              GrantLine."Surrender Doc No.",'Grant' ,GrantLine."Surrender Doc No.",
                                FORMAT(ABS(BudgetAmount-(CommitmentAmount + GrantLine."Amount LCY"))));
                            END ELSE BEGIN
                            //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                                IF ((CommitmentAmount + GrantLine."Amount LCY"+ ActualsAmount)>BudgetAmount) THEN BEGIN
                                    IF NOT CONFIRM(Text0001+
                                    FORMAT(ABS(BudgetAmount-(CommitmentAmount + ActualsAmount+GrantLine."Amount LCY")))
                                    +Text0002,TRUE) THEN BEGIN
                                       ERROR('Budgetary Checking Process Aborted');
                                    END;
                                END;

                                Commitments.RESET;
                                Commitments.INIT;
                                EntryNo+=1;
                                Commitments."Line No.":=EntryNo;
                                Commitments."Commitment Date":=TODAY;
                                Commitments."Posting Date":=GrantHeader."Surrender Date";
                                Commitments."Document Type":=Commitments."Document Type"::StaffSurrender;
                                Commitments."Document No.":=GrantHeader.No;
                                Commitments.Amount:=GrantLine."Amount LCY";
                                Commitments."Month Budget":=BudgetAmount;
                                Commitments."Month Actual":=ActualsAmount;
                                Commitments.Committed:=TRUE;
                                Commitments."Committed By":=USERID;
                                Commitments."Committed Date":=GrantHeader."Surrender Date";
                                Commitments."G/L Account No.":=BudgetGL;
                                Commitments."Committed Time":=TIME;
                                //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                                Commitments.VALIDATE("Shortcut Dimension 1 Code",GrantLine."Shortcut Dimension 1 Code");
                                Commitments.VALIDATE("Shortcut Dimension 2 Code",GrantLine."Shortcut Dimension 2 Code");
                                Commitments."Dimension Set ID" := GrantLine."Dimension Set ID";
                                Commitments.Budget:=BCSetup."Current Budget Code";
                                Commitments.Type:=GrantHeader."Account Type";
                                Commitments."Vendor/Cust No.":=GrantHeader."Account No.";
                                Commitments."Budget Check Criteria":=BCSetup."Budget Check Criteria";
                                Commitments."Actual Source":=BCSetup."Actual Source";
                                Commitments."Document Line No.":=GrantLine."Line No.";
                                //Added for Totalling Accounts
                                Commitments."Based on Totaling Account":=BCSetup."Use Totaling Account";
                                Commitments.INSERT;
                                //Tag the Grant Surrender Line as Committed
                                  GrantLine.Committed:=TRUE;
                                  GrantLine.MODIFY;
                                //End Tagging Grant Surrender Lines as Committed
                            END;

                  UNTIL GrantLine.NEXT=0;
                END;
          END
        ELSE//budget control not mandatory
          BEGIN

          END;
        MESSAGE('Budgetary Checking Completed Successfully');
        */

    end;


    procedure CheckGrantsBudget(var PaymentHeader: Record Jobs)
    var
        PayLine: Record "Job-Planning Line";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        JobTaskLine: Record "HR Leave Journal Template";
        GLAccount: Record "G/L Account";
    begin
        /*
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.RESET;
        BCSetup.GET();
        IF BCSetup.Mandatory THEN//budgetary control is mandatory
          BEGIN
            //check if the dates are within the specified range in relation to the payment header table
            IF (PaymentHeader."Starting Date"< BCSetup."Current Budget Start Date") THEN
              BEGIN
                ERROR('The Current Date %1 In The Grant Does Not Fall Within Budget Dates %2 - %3',PaymentHeader."Starting Date",
                BCSetup."Current Budget Start Date",BCSetup."Current Budget End Date");
              END
            ELSE IF (PaymentHeader."Starting Date">BCSetup."Current Budget End Date") THEN
              BEGIN
                ERROR('The Current Date %1 In TheGrant Does Not Fall Within Budget Dates %2 - %3',PaymentHeader."Starting Date",
                BCSetup."Current Budget Start Date",BCSetup."Current Budget End Date");

              END;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
             IF Commitments.FIND('+') THEN
                EntryNo:=Commitments."Line No.";

            //get the lines related to the payment header
              PayLine.RESET;
              PayLine.SETRANGE(PayLine."Grant No.",PaymentHeader."No.");
              PayLine.SETRANGE(PayLine.Type,PayLine.Type::"G/L Account");
              PayLine.SETRANGE(PayLine."Budget Controlled",TRUE);
              IF PayLine.FINDFIRST THEN
                BEGIN
                  REPEAT
                            //Get Dimensions from Job Tasks
                            DimCode1:=''; DimCode2:='';
                            JobTaskLine.RESET;
                            JobTaskLine.SETRANGE(JobTaskLine."Grant No.",PayLine."Grant No.");
                            JobTaskLine.SETRANGE(JobTaskLine."Grant Task No.",PayLine."Grant Task No.");
                            IF JobTaskLine.FIND('-') THEN BEGIN
                              DimCode1:=JobTaskLine."Global Dimension 1 Code"; DimCode2:=JobTaskLine."Global Dimension 2 Code";
                            END;
                            //End;
                            //check the votebook now
                            FirstDay:=DMY2DATE(1,DATE2DMY(PaymentHeader."Starting Date",2),DATE2DMY(PaymentHeader."Starting Date",3));
                            CurrMonth:=DATE2DMY(PaymentHeader."Starting Date",2);
                            IF CurrMonth=12 THEN
                             BEGIN
                               LastDay:=DMY2DATE(1,1,DATE2DMY(PaymentHeader."Starting Date",3) +1);
                               LastDay:=CALCDATE('-1D',LastDay);
                             END
                            ELSE
                             BEGIN
                               CurrMonth:=CurrMonth +1;
                               LastDay:=DMY2DATE(1,CurrMonth,DATE2DMY(PaymentHeader."Starting Date",3));
                               LastDay:=CALCDATE('-1D',LastDay);
                             END;

                            //If Budget is annual then change the Last day
                            IF BCSetup."Budget Check Criteria"=BCSetup."Budget Check Criteria"::"Whole Year" THEN
                                LastDay:=BCSetup."Current Budget End Date";

                            BudgetGL:=PayLine."No.";

                            //For End Total Budgeting
                            IF BCSetup."Use Totaling Account" THEN BEGIN
                                IF GLAcc.GET(BudgetGL) THEN
                                   BudgetGL:=GLAcc."Budget Control Account"
                                ELSE
                                      ERROR('G/L Account %1 is not mapped to a budget control account',BudgetGL);
                            END;
                            //End (End Total Budget)

                            //check the summation of the budget and actuals in the database
                            ActualsAmount:=0;
                            BudgetAmount:=0;

                            GLAcc.RESET;
                            GLAcc.SETRANGE("No.",BudgetGL);
                            GLAcc.SETRANGE("Date Filter",BCSetup."Current Budget Start Date",LastDay);
                            GLAcc.SETRANGE("Budget Filter",BCSetup."Current Budget Code");
                            GLAcc.SETRANGE("Dimension Set ID Filter",JobTaskLine."Dimension Set ID");
                            IF GLAcc.FIND('-') THEN BEGIN
                             GLAcc.CALCFIELDS("Budgeted Amount","Net Change");
                             ActualsAmount := GLAcc."Net Change";
                             BudgetAmount :=  GLAcc."Budgeted Amount";
                            END;

                          //get the committments
                            CommitmentAmount:=0;
                            Commitments.RESET;
                            Commitments.SETRANGE(Commitments.Budget,BCSetup."Current Budget Code");
                            Commitments.SETRANGE(Commitments."G/L Account No.",BudgetGL);
                            Commitments.SETRANGE(Commitments."Posting Date",BCSetup."Current Budget Start Date",LastDay);
                            Commitments.SETRANGE(Commitments."Dimension Set ID",JobTaskLine."Dimension Set ID");
                               Commitments.CALCSUMS(Commitments.Amount);
                               CommitmentAmount:= Commitments.Amount;


                           //check if there is any budget
                           IF (BudgetAmount<=0) AND NOT (BCSetup."Allow OverExpenditure") THEN  BEGIN
                              ERROR('No Budget To Check Against');
                           END ELSE BEGIN
                            IF (BudgetAmount<=0) THEN BEGIN
                             IF NOT CONFIRM(Text0003,TRUE) THEN BEGIN
                                ERROR('Budgetary Checking Process Aborted');
                             END;
                            END;
                           END;

                           //check if the actuals plus the amount is greater then the budget amount
                           IF ((CommitmentAmount + PayLine."Total Cost (LCY)"+ActualsAmount)>BudgetAmount )
                           AND NOT ( BCSetup."Allow OverExpenditure") THEN  BEGIN
                              ERROR('The Amount in Grant No %1  %2 %3  Exceeds The Budget By %4',
                              PayLine."Grant No.",PayLine.Type ,PayLine."No.",
                                FORMAT(ABS(BudgetAmount-(CommitmentAmount + ActualsAmount+PayLine."Total Cost (LCY)"))));
                            END ELSE BEGIN
                            //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                                IF ((CommitmentAmount + PayLine."Total Cost (LCY)"+ ActualsAmount)>BudgetAmount) THEN BEGIN
                                    IF NOT CONFIRM(Text0001+
                                    FORMAT(ABS(BudgetAmount-(CommitmentAmount + ActualsAmount+PayLine."Total Cost (LCY)")))
                                    +Text0002,TRUE) THEN BEGIN
                                       ERROR('Budgetary Checking Process Aborted');
                                    END;
                                END;

                                //Tag the Payment Line as Committed
                                  PayLine."Budget Availability Checked":=TRUE;
                                  PayLine."Budget Available":=BudgetAmount-(CommitmentAmount + ActualsAmount);
                                  PayLine.MODIFY;


                                //End Tagging Payment Lines as Committed
                            END;

                  UNTIL PayLine.NEXT=0;
                END;
          END
        ELSE//budget control not mandatory
          BEGIN

          END;
        MESSAGE('Budgetary Checking Completed Successfully');
        */

    end;


    procedure GetLineAmountToReverse(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance,StaffSurrender; DocNo: Code[20]; DocLineNo: Integer) TotalAmount: Decimal
    var
        LPO: Record "Purchase Line";
        QtyToInvoice: Decimal;
    begin
        if DocumentType = DocumentType::LPO then begin
            LPO.Reset();
            LPO.SetRange(LPO."Document Type", LPO."Document Type"::Order);
            LPO.SetRange(LPO."Document No.", DocNo);
            LPO.SetRange(LPO."Line No.", DocLineNo);
            if LPO.Find('-') then begin
                //Take care of reversal which might not
                if LPO."Qty. to Invoice" <> 0 then
                    QtyToInvoice := LPO."Qty. to Invoice"
                else
                    QtyToInvoice := LPO."Outstanding Quantity";

                if LPO."VAT %" = 0 then
                    TotalAmount := QtyToInvoice * LPO."Direct Unit Cost"
                else
                    TotalAmount := Round((QtyToInvoice * LPO."Direct Unit Cost") * ((LPO."VAT %" + 100) / 100), 0.00001)

            end;
        end;
    end;


    procedure ReverseOrderEntriesFromInvoice(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance; DocNo: Code[20]; LineNo: Integer; Amount: Decimal)
    var
        Commitments: Record Committment;
        EntryNo: Integer;
        CommittedLines: Record Committment;
    begin
        //Get Commitment Lines
        Commitments.Reset();
        if Commitments.Find('+') then
            EntryNo := Commitments."Line No.";

        CommittedLines.Reset();
        CommittedLines.SetRange(CommittedLines."Document Type", DocumentType);
        CommittedLines.SetRange(CommittedLines."Document No.", DocNo);
        CommittedLines.SetRange(CommittedLines."Document Line No.", LineNo);
        CommittedLines.SetRange(CommittedLines.Committed, true);
        if CommittedLines.Find('-') then
            repeat
                Commitments.Reset();
                Commitments.Init();
                EntryNo += 1;
                Commitments."Line No." := EntryNo;
                Commitments."Commitment Date" := Today;
                Commitments."Posting Date" := CommittedLines."Posting Date";
                Commitments."Document Type" := CommittedLines."Document Type";
                Commitments."Document No." := CommittedLines."Document No.";
                Commitments.Amount := -Amount;
                Commitments."Month Budget" := CommittedLines."Month Budget";
                Commitments."Month Actual" := CommittedLines."Month Actual";
                Commitments.Committed := false;
                Commitments."Committed By" := UserId;
                Commitments."Committed Date" := CommittedLines."Committed Date";
                Commitments."G/L Account No." := CommittedLines."G/L Account No.";
                Commitments."Committed Time" := Time;
                //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                Commitments."Shortcut Dimension 1 Code" := CommittedLines."Shortcut Dimension 1 Code";
                Commitments."Shortcut Dimension 2 Code" := CommittedLines."Shortcut Dimension 2 Code";
                Commitments."Shortcut Dimension 3 Code" := CommittedLines."Shortcut Dimension 3 Code";
                Commitments."Shortcut Dimension 4 Code" := CommittedLines."Shortcut Dimension 4 Code";
                Commitments."Dimension Set ID" := CommittedLines."Dimension Set ID";
                Commitments.Budget := CommittedLines.Budget;
                Commitments."Document Line No." := CommittedLines."Document Line No.";
                Commitments."Budget Check Criteria" := CommittedLines."Budget Check Criteria";
                Commitments."Actual Source" := CommittedLines."Actual Source";
                //Added for Totalling Accounts
                Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                Commitments.Insert();

            until CommittedLines.Next() = 0;
    end;


    procedure ReverseOrdersReversal("No.": Code[20])
    var
        PurchLines: Record "Purchase Line";
        DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance;
        PurchRecptLines: Record "Purch. Rcpt. Line";
        DeleteCommitment: Record Committment;
    begin
        PurchLines.Reset();
        PurchLines.SetRange(PurchLines."Document Type", PurchLines."Document Type"::Invoice);
        PurchLines.SetRange(PurchLines."Document No.", "No.");
        if PurchLines.Find('-') then
            repeat
                if PurchLines.Type <> PurchLines.Type::" " then begin
                    //Get Details of Order from Receipt lines
                    PurchRecptLines.Reset();
                    PurchRecptLines.SetRange(PurchRecptLines."Document No.", PurchLines."Receipt No.");
                    PurchRecptLines.SetRange(PurchRecptLines."Line No.", PurchLines."Receipt Line No.");
                    if PurchRecptLines.Find('-') then begin
                        DeleteCommitment.Reset();
                        DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", PurchRecptLines."Order No.");
                        DeleteCommitment.SetRange(DeleteCommitment."Document Line No.", PurchRecptLines."Order Line No.");
                        DeleteCommitment.SetRange(DeleteCommitment.Committed, false);
                        DeleteCommitment.DeleteAll();

                    end;
                end;
            until PurchLines.Next() = 0;
    end;


    procedure OrderCommittmentTMEA(var PurchHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
        Commitments: Record Committment;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset();
        BCSetup.Get();

        begin
            //check if the dates are within the specified range in relation to the payment header table
            if (PurchHeader."Document Date" < BCSetup."Current Budget Start Date") then
                Error('The Current Date %1 In The Order Does Not Fall Within Budget Dates %2 - %3', PurchHeader."Document Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date")
            else
                if (PurchHeader."Document Date" > BCSetup."Current Budget End Date") then
                    Error('The Current Date %1 In The Order Does Not Fall Within Budget Dates %2 - %3', PurchHeader."Document Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");
            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PurchLine.Reset();
            PurchLine.SetRange(PurchLine."Document Type", PurchHeader."Document Type");
            PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
            if PurchLine.FindFirst() then
                repeat
                    if PurchLine.Type <> PurchLine.Type::" " then begin

                        //Get the Dimension Here mkirema (dif data type) replaced PurchLine."Document No." to 0
                        //  if PurchLine."Line No." <> 0 then
                        //       DimMgt.ShowDocDim(
                        //         Database::"Purchase Line",PurchLine."Document Type",0,
                        //         PurchLine."Line No.",ShortcutDimCode)
                        //     else
                        //       DimMgt.ShowTempDim(ShortcutDimCode);
                        //Had to be put here for the sake of Calculating Individual Line Entries

                        //check the type of account in the payments line
                        //Item
                        if PurchLine.Type = PurchLine.Type::Item then begin
                            Item.Reset();
                            if not Item.Get(PurchLine."No.") then
                                Error('Item Does not Exist');

                            Item.TestField("Item G/L Budget Account");
                            BudgetGL := Item."Item G/L Budget Account";
                        end;

                        if PurchLine.Type = PurchLine.Type::"Fixed Asset" then begin
                            FixedAssetsDet.Reset();
                            FixedAssetsDet.SetRange(FixedAssetsDet."No.", PurchLine."No.");
                            if FixedAssetsDet.Find('-') then begin
                                FAPostingGRP.Reset();
                                FAPostingGRP.SetRange(FAPostingGRP.Code, FixedAssetsDet."FA Posting Group");
                                if FAPostingGRP.Find('-') then
                                    if PurchLine."FA Posting Type" = PurchLine."FA Posting Type"::Maintenance then begin
                                        BudgetGL := FAPostingGRP."Maintenance Expense Account";
                                        if BudgetGL = '' then
                                            Error('Ensure Fixed Asset No %1 has the Maintenance G/L Account', PurchLine."No.");
                                    end else begin
                                        if PurchLine."FA Posting Type" = PurchLine."FA Posting Type"::"Acquisition Cost" then begin
                                            BudgetGL := FAPostingGRP."Acquisition Cost Account";
                                            if BudgetGL = '' then
                                                Error('Ensure Fixed Asset No %1 has the Acquisition G/L Account', PurchLine."No.");
                                        end;
                                        //To Accomodate any Additional Item under Custom 1 and Custom 2
                                        if PurchLine."FA Posting Type" = PurchLine."FA Posting Type"::"Custom 1" then begin
                                            BudgetGL := FAPostingGRP."Custom 2 Account";
                                            if BudgetGL = '' then
                                                Error('Ensure Fixed Asset No %1 has the %2 G/L Account', PurchLine."No.",
                                                FAPostingGRP."Custom 1 Account");
                                        end;

                                        if PurchLine."FA Posting Type" = PurchLine."FA Posting Type"::"Custom 2" then begin
                                            BudgetGL := FAPostingGRP."Custom 2 Account";
                                            if BudgetGL = '' then
                                                Error('Ensure Fixed Asset No %1 has the %2 G/L Account', PurchLine."No.",
                                                FAPostingGRP."Custom 1 Account");
                                        end;
                                        //To Accomodate any Additional Item under Custom 1 and Custom 2

                                    end;
                            end;
                        end;

                        if PurchLine.Type = PurchLine.Type::"G/L Account" then begin
                            BudgetGL := PurchLine."No.";
                            if GLAcc.Get(PurchLine."No.") then
                                GLAcc.TestField("Budget Controlled", true);
                        end;

                        //For End Total Budgeting
                        if BCSetup."Use Totaling Account" then
                            if GLAcc.Get(BudgetGL) then
                                BudgetGL := GLAcc."Budget Control Account"
                            else
                                Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                        //End (End Total Budget)

                        //End Checking Account in Payment Line

                        //END ADDING CONFIRMATION
                        Commitments.Reset();
                        Commitments.Init();
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := PurchHeader."Document Date";
                        if PurchHeader.DocApprovalType = PurchHeader.DocApprovalType::Purchase then
                            Commitments."Document Type" := Commitments."Document Type"::LPO
                        else
                            Commitments."Document Type" := Commitments."Document Type"::Requisition;

                        if PurchHeader."Document Type" = PurchHeader."Document Type"::Invoice then
                            Commitments."Document Type" := Commitments."Document Type"::PurchInvoice;

                        Commitments."Document No." := PurchHeader."No.";
                        Commitments.Amount := PurchLine."Outstanding Amount (LCY)";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := PurchHeader."Document Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments."Shortcut Dimension 1 Code" := PurchLine."Shortcut Dimension 1 Code";
                        Commitments."Shortcut Dimension 2 Code" := PurchLine."Shortcut Dimension 2 Code";
                        Commitments."Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                        Commitments."Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                        Commitments."Dimension Set ID" := PurchLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := Commitments.Type::Vendor;
                        Commitments."Vendor/Cust No." := PurchHeader."Buy-from Vendor No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PurchLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert();
                        //Tag the Purchase Line as Committed
                        PurchLine.Committed := true;
                        PurchLine.Modify();
                        //End Tagging PurchLines as Committed
                    end;

                until PurchLine.Next() = 0;
        end
    end;


    procedure OrderCommittmentReversalTMEA(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance; DocNo: Code[20])
    var
        Commitments: Record Committment;
        EntryNo: Integer;
        CommittedLines: Record Committment;
    begin
        //Get Commitment Lines
        Commitments.Reset();
        if Commitments.Find('+') then
            EntryNo := Commitments."Line No.";

        CommittedLines.Reset();
        CommittedLines.SetRange(CommittedLines."Document Type", DocumentType);
        CommittedLines.SetRange(CommittedLines."Document No.", DocNo);
        CommittedLines.SetRange(CommittedLines.Committed, true);
        if CommittedLines.Find('-') then
            repeat
                Commitments.Reset();
                Commitments.Init();
                EntryNo += 1;
                Commitments."Line No." := EntryNo;
                Commitments."Commitment Date" := Today;
                Commitments."Posting Date" := CommittedLines."Posting Date";
                Commitments."Document Type" := CommittedLines."Document Type";
                Commitments."Document No." := CommittedLines."Document No.";
                Commitments.Amount := -CommittedLines.Amount;
                Commitments."Month Budget" := CommittedLines."Month Budget";
                Commitments."Month Actual" := CommittedLines."Month Actual";
                Commitments.Committed := false;
                Commitments."Committed By" := UserId;
                Commitments."Committed Date" := CommittedLines."Committed Date";
                Commitments."G/L Account No." := CommittedLines."G/L Account No.";
                Commitments."Committed Time" := Time;
                //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                Commitments."Shortcut Dimension 1 Code" := CommittedLines."Shortcut Dimension 1 Code";
                Commitments."Shortcut Dimension 2 Code" := CommittedLines."Shortcut Dimension 2 Code";
                Commitments."Shortcut Dimension 3 Code" := CommittedLines."Shortcut Dimension 3 Code";
                Commitments."Shortcut Dimension 4 Code" := CommittedLines."Shortcut Dimension 4 Code";
                Commitments."Dimension Set ID" := CommittedLines."Dimension Set ID";
                Commitments.Budget := CommittedLines.Budget;
                Commitments."Document Line No." := CommittedLines."Document Line No.";
                Commitments."Budget Check Criteria" := CommittedLines."Budget Check Criteria";
                Commitments."Actual Source" := CommittedLines."Actual Source";
                //Added for Totalling Accounts
                Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                Commitments.Insert();

            until CommittedLines.Next() = 0;
    end;
}
