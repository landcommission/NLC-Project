#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193531 "PR Transfer To Journal"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR Transfer To Journal';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            RequestFilterFields = "Period Filter", "Employee Code";
            column(ReportForNavId_9285; 9285) { }

            trigger OnAfterGetRecord()
            var
                Text000: Label '@1@@@@@@@@@@';
            begin


                //For use when posting Pension and NSSF
                PostingGroup.Get('RCEA');
                PostingGroup.TestField("SSF Employer Account");
                PostingGroup.TestField("SSF Employee Account");
                PostingGroup.TestField("Pension Employer Acc");
                PostingGroup.TestField("Pension Employee Acc");

                //Get the staff details (header)
                objEmp.SetRange(objEmp."No.", "PR Salary Card"."Employee Code");
                if objEmp.Find('-') then begin
                    strEmpName := '[' + "PR Salary Card"."Employee Code" + '] ' + objEmp."Last Name" + ' ' + objEmp."First Name" + ' ' + objEmp."Middle Name";
                    GlobalDim1 := objEmp."Global Dimension 1 Code";
                    GlobalDim2 := objEmp."Global Dimension 2 Code";

                end;

                LineNumber := LineNumber + 10;


                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "PR Salary Card"."Employee Code");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    //MyDialog.OPEN(Text000,PeriodTrans."Employee Code");  //**
                    repeat
                        // MyDialog.UPDATE(); //**
                        if PeriodTrans."Journal Account Code" <> '' then begin
                            AmountToDebit := 0;
                            AmountToCredit := 0;
                            if PeriodTrans."Post As" = PeriodTrans."Post As"::Debit then
                                AmountToDebit := PeriodTrans.Amount;

                            if PeriodTrans."Post As" = PeriodTrans."Post As"::Credit then
                                AmountToCredit := PeriodTrans.Amount;

                            if PeriodTrans."Journal Account Type" = JAC::"G/L Account" then  //GL
                                IntegerPostAs := 0;   //0 debit
                            if PeriodTrans."Journal Account Type" = JAC::Customer then
                                IntegerPostAs := 1;  // 1 =
                            if PeriodTrans."Journal Account Type" = JAC::Vendor then
                                IntegerPostAs := 2;  // 1 =

                            SaccoTransactionType := SaccoTransactionType::" ";

                            if PeriodTrans."coop parameters" = PeriodTrans."coop parameters"::loan then
                                SaccoTransactionType := SaccoTransactionType::Repayment;

                            if PeriodTrans."coop parameters" = PeriodTrans."coop parameters"::"loan Interest" then
                                SaccoTransactionType := SaccoTransactionType::"Interest Paid";

                            if PeriodTrans."coop parameters" = PeriodTrans."coop parameters"::Welfare then
                                SaccoTransactionType := SaccoTransactionType::"Welfare Contribution";

                            if PeriodTrans."coop parameters" = PeriodTrans."coop parameters"::shares then
                                SaccoTransactionType := SaccoTransactionType::"Deposit Contribution";



                            CreateJnlEntry(IntegerPostAs, PeriodTrans."Journal Account Code",
                            GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Employee Code", AmountToDebit, AmountToCredit,
                            PeriodTrans."Post As", PeriodTrans."Loan Number", SaccoTransactionType);

                            //Pension
                            if PeriodTrans."coop parameters" = PeriodTrans."coop parameters"::Pension then begin
                                //Get from Employer Deduction
                                EmployerDed.Reset();
                                EmployerDed.SetRange(EmployerDed."Employee Code", PeriodTrans."Employee Code");
                                EmployerDed.SetRange(EmployerDed."Transaction Code", PeriodTrans."Transaction Code");
                                EmployerDed.SetRange(EmployerDed."Payroll Period", PeriodTrans."Payroll Period");
                                if EmployerDed.Find('-') then begin
                                    //Credit Payables
                                    CreateJnlEntry(0, PostingGroup."Pension Employee Acc",
                                    GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Employee Code", 0,
                                   EmployerDed.Amount, PeriodTrans."Post As", '', SaccoTransactionType);

                                    //Debit Staff Expense
                                    CreateJnlEntry(0, PostingGroup."Pension Employer Acc",
                                    GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Employee Code", EmployerDed.Amount, 0, 1, '',
                                    SaccoTransactionType);

                                end;
                            end;

                            //NSSF
                            if PeriodTrans."coop parameters" = PeriodTrans."coop parameters"::NSSF then begin
                                //Credit Payables
                                //Credit Payables

                                CreateJnlEntry(0, PostingGroup."SSF Employee Account",
                                GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Employee Code", 0, PeriodTrans.Amount,
                                PeriodTrans."Post As", '', SaccoTransactionType);

                                //Debit Staff Expense

                                CreateJnlEntry(0, PostingGroup."SSF Employer Account",
                                GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Employee Code", PeriodTrans.Amount, 0, 1, '',
                                SaccoTransactionType);


                            end;

                        end;

                    until PeriodTrans.Next() = 0;
            end;

            trigger OnPostDataItem()
            begin
                //MyDialog.CLOSE();
                Message('Payroll Journal Generated Succesfully');
            end;

            trigger OnPreDataItem()
            begin

                GenJournalLine.Reset();
                GenJournalLine.SetRange("Journal Template Name", 'GENERAL');
                GenJournalLine.SetRange("Journal Batch Name", 'SALARIES');
                if GenJournalLine.Find('-') then
                    //******************************* Check if journal journal has entries for a different period *******************************
                    if (GenJournalLine."Document No." <> UpperCase(PeriodName)) and (GenJournalLine.Count > 2) then
                        Error(Text10001, GenJournalLine.Count, GenJournalLine."Document No.")
                    else begin
                        //Journal Approval Status
                        GenJnlBatch.Reset();
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", 'GENERAL');
                        GenJnlBatch.SetRange(GenJnlBatch.Name, 'SALARIES');
                        if GenJnlBatch.Find('-') then begin
                            GenJnlBatch.Status := GenJnlBatch.Status::Open;
                            GenJnlBatch.Modify();
                        end;
                        //Clear journal
                        GenJournalLine.DeleteAll();
                    end;
                //******************************* Check if journal journal has entries for a different period *******************************


                LineNo := 10000;

                //Create batch*****************************************************************************
                //MESSAGE('get the journal batch');
                GenJnlBatch.Reset();
                GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", 'GENERAL');
                GenJnlBatch.SetRange(GenJnlBatch.Name, 'SALARIES');
                if GenJnlBatch.Find('-') = false then begin
                    GenJnlBatch.Init();
                    GenJnlBatch."Journal Template Name" := 'GENERAL';
                    GenJnlBatch.Name := 'SALARIES';
                    GenJnlBatch.Insert();
                end;
                // End Create Batch************************************************************************
                "Slip/Receipt No" := UpperCase(objPeriod."Period Name");
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        PeriodFilter := "PR Salary Card".GetFilter("Period Filter");
        if PeriodFilter = '' then
            Error('You must specify the period filter');

        SelectedPeriod := "PR Salary Card".GetRangeMin("Period Filter");
        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then
            PeriodName := objPeriod."Period Name";

        PostingDate := CalcDate('1M-1D', SelectedPeriod);
        //MESSAGE('get period filter');
        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        GenJournalLine: Record "Gen. Journal Line";
        PeriodTrans: Record "PR Period Transactions";
        NssfAmount: Decimal;
        TotNssfAmount: Decimal;
        objEmp: Record "HR Employees";
        EmployeeName: Text[30];
        NssfNo: Text[30];
        IDNumber: Text[30];
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        "Volume Amount": Decimal;
        "TotVolume Amount": Decimal;
        TotalAmount: Decimal;
        totTotalAmount: Decimal;
        CompanyInfo: Record "Company Information";
        ExcelBuf: Record "Excel Buffer" temporary;
        PrinttoExcel: Boolean;
        EmployerNSSFNo: Integer;
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentNo: Code[100];
        NHIfAmount: Decimal;
        totNHIFTotalAmount: Decimal;
        PAYEAmount: Decimal;
        totPAYETotalAmount: Decimal;
        PENSIONAmount: Decimal;
        totPENSIONTotalAmount: Decimal;
        totHELBTotalAmount: Decimal;
        HELBAMOUNT: Decimal;
        totGRATTotalAmount: Decimal;
        GRATAMOUNT: Decimal;
        ICEAAMOUNT: Decimal;
        totSACCOTotalAmount: Decimal;
        SACCOAMOUNT: Decimal;
        totICEATotalAmount: Decimal;
        Pension: Decimal;
        NssfAmountemployer: Decimal;
        TotalNssfAmountemployer: Decimal;
        totTotalNssfAmountemployer: Decimal;
        NssfAmountemployee: Decimal;
        TotalNssfAmountemployee: Decimal;
        totTotalNssfAmountemployee: Decimal;
        ICEATotalAmount: Decimal;
        GeneraljnlLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        gRATAMOUNT1: Decimal;
        prsalrycard: Record "PR Salary Card";
        amount: Decimal;
        TOTALamountGRAT: Decimal;
        nETPAY: Decimal;
        Finlemsacco: Decimal;
        csrcontribution: Decimal;
        sALARYaDVANCE: Decimal;
        CarLoanInt: Decimal;
        Staffloanint: Decimal;
        "prEmployee Transactions": Record "PR Employee Transactions";
        TotalAmountarrears: Decimal;
        GRATAMOUNTarrears: Decimal;
        totGRATTotalAmount1: Decimal;
        totGRATTotalAmounttot: Decimal;
        toGrossAmount: Decimal;
        "Slip/Receipt No": Code[50];
        PostingGroup: Record "prEmployee Posting Group";
        strEmpName: Text[150];
        AmountToDebit: Decimal;
        AmountToCredit: Decimal;
        IntegerPostAs: Integer;
        SaccoTransactionType: Option " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Welfare Contribution","Deposit Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","Shares Capital","Loan Adjustment",Dividend,"Withholding Tax","Administration Fee","Welfare Contribution 2";
        PostingDate: Date;
        GlobalDim1: Code[20];
        GlobalDim2: Code[20];
        EmployerDed: Record "PR Employer Deductions";
        TransCode: Record "PR Transaction Codes";
        LineNumber: Integer;
        MyDialog: Dialog;
        MyNext: Integer;
        JAC: Option " ","G/L Account",Customer,Vendor;
        Text10001: Label 'There are [%1] entries that exist in the Journal for Payroll Period [%2] Please post the before generating a new Journal';


    procedure CreateJnlEntry(AccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner"; AccountNo: Code[20]; GlobalDime1: Code[20]; GlobalDime2: Code[20]; Description: Text[150]; DebitAmount: Decimal; CreditAmount: Decimal; PostAs: Option " ",Debit,Credit; LoanNo: Code[20]; TransType: Option " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Benevolent Fund","Deposit Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","Shares Capital","Loan Adjustment",Dividend,"Withholding Tax","Administration Fee Due","Loan Guard",Prepayment,"Administration Fee Paid","Car Savings","SchFees Savings","Holiday Savings","CIC Fixed Deposit","Withdrawable Savings","Children Savings","KMA Investment","KMA Fixed Deposit","UAP Premiums","UAP Admin Fee","Direct Debit")
    begin


        LineNumber := LineNumber + 100;
        GeneraljnlLine.Init();
        GeneraljnlLine."Journal Template Name" := 'GENERAL';
        GeneraljnlLine."Journal Batch Name" := 'SALARIES';
        GeneraljnlLine."Line No." := LineNumber;
        GeneraljnlLine."Document No." := "Slip/Receipt No";
        //GeneraljnlLine."Loan No":=LoanNo;
        //GeneraljnlLine."Transaction Type":=TransType;
        GeneraljnlLine."Posting Date" := PostingDate;
        GeneraljnlLine."Account Type" := AccountType;
        GeneraljnlLine."Account No." := AccountNo;
        GeneraljnlLine.Validate(GeneraljnlLine."Account No.");
        GeneraljnlLine.Description := Description;
        if PostAs = PostAs::Debit then begin
            GeneraljnlLine."Debit Amount" := DebitAmount;
            GeneraljnlLine.Validate("Debit Amount");
        end else begin
            GeneraljnlLine."Credit Amount" := CreditAmount;
            GeneraljnlLine.Validate("Credit Amount");
        end;
        GeneraljnlLine."Shortcut Dimension 1 Code" := GlobalDime1;
        GeneraljnlLine.Validate(GeneraljnlLine."Shortcut Dimension 1 Code");
        GeneraljnlLine."Shortcut Dimension 2 Code" := GlobalDime2;
        GeneraljnlLine.Validate(GeneraljnlLine."Shortcut Dimension 2 Code");
        if GeneraljnlLine.Amount <> 0 then
            GeneraljnlLine.Insert();
    end;
}
