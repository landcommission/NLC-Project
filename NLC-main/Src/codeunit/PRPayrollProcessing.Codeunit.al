#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 50001 "PR Payroll Processing"
{
    var
        Text020: Label 'Because of circular references, the program cannot calculate a formula.';
        Text012: Label 'You have entered an illegal value or a nonexistent row number.';
        Text013: Label 'You have entered an illegal value or a nonexistent column number.';
        Text017: Label 'The error occurred when the program tried to calculate:\';
        Text018: Label 'Acc. Sched. Line: Row No. = %1, Line No. = %2, Totaling = %3\';
        Text019: Label 'Acc. Sched. Column: Column No. = %4, Line No. = %5, Formula  = %6';
        Text023: Label 'Formulas ending with a percent sign require %2 %1 on a line before it.';
        VitalSetup: Record "PR Vital Setup Info";
        curReliefPersonal: Decimal;
        curReliefInsurance: Decimal;
        curReliefMorgage: Decimal;
        curMaximumRelief: Decimal;
        currMinRelief: Decimal;
        curNssfEmployee: Decimal;
        curNssf_Employer_Factor: Decimal;
        curProrationStartDate: Integer;
        intNHIF_BasedOn: Option Gross,Basic,"Taxable Pay";
        intNSSF_BasedOn: Option Gross,Basic;
        curDisabledLimit: Decimal;
        curMaxPensionContrib: Decimal;
        curRateTaxExPension: Decimal;
        curOOIMaxMonthlyContrb: Decimal;
        curOOIDecemberDedc: Decimal;
        curLoanMarketRate: Decimal;
        curLoanCorpRate: Decimal;
        curReliefPension: Decimal;
        TaxAccount: Code[20];
        salariesAcc: Code[20];
        PayablesAcc: Code[20];
        NSSFEMPyer: Code[20];
        PensionEMPyer: Code[20];
        NSSFEMPyee: Code[20];
        NHIFEMPyer: Code[20];
        NHIFEMPyee: Code[20];
        HREmployee: Record "HR Employees";
        CoopParameters: Option none,shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,NITA,HOUSE;
        PostingGroup: Record "prEmployee Posting Group";
        AccSchedMgt: Codeunit AccSchedManagement;
        HREmp2: Record "HR Employees";
        PRTransCode: Record "PR Transaction Codes";
        HREmployes: Record "HR Employees";
        Cust2: Record Customer;
        curTransSubledger: Option " ",Customer,Vendor;
        curTransSubledgerAccount: Code[20];
        PRSalCard: Record "PR Salary Card";
        HRBankSummary: Record "Bank Payment List";
        PRSalCard_2: Record "PR Salary Card";
        EmployeeInterestRate: Decimal;
        curMorgageRelief: Decimal;
        PRTransCode_2: Record "PR Transaction Codes";
        PRTransCode_3: Record "PR Transaction Codes";
        CurrDayOfMonth: Integer;
        ProrateAllowance: Boolean;
        ProrateBasicPay: Boolean;
        HREmp: Record "HR Employees";
        TaxCharged_1: Decimal;
        PersonalRelief_1: Decimal;
        PRPeriodTrans2: Record "PR Period Transactions";
        CurrTotalStatutoryDeductions: Decimal;
        PRPayrollPeriiod: Record "PR Payroll Periods";
        dtCurrentPeriod: Date;
        BankCode: Code[100];
        CurrNITAEmployerRelief: Decimal;
        CUrrHSEEmployee: Decimal;
        CUrrHSEEmployer: Decimal;


    procedure fnInitialize()
    var
        strTableName: Text[50];
        curTransAmount: Decimal;
        curTransBalance: Decimal;
        strTransDescription: Text[50];
        TGroup: Text[30];
        TGroupOrder: Integer;
        TSubGroupOrder: Integer;
        curSalaryArrears: Decimal;
        curPayeArrears: Decimal;
        curGrossPay: Decimal;
        curTotAllowances: Decimal;
        curExcessPension: Decimal;
        curNSSF: Decimal;
        curDefinedContrib: Decimal;
        curPensionStaff: Decimal;
        curNonTaxable: Decimal;
        curGrossTaxable: Decimal;
        curBenefits: Decimal;
        curValueOfQuarters: Decimal;
        curUnusedRelief: Decimal;
        curInsuranceReliefAmount: Decimal;
        curMorgageReliefAmount: Decimal;
        curTaxablePay: Decimal;
        curTaxCharged: Decimal;
        curPAYE: Decimal;
        prPeriodTransactions: Record "PR Period Transactions";
        intYear: Integer;
        intMonth: Integer;
        LeapYear: Boolean;
        CountDaysofMonth: Integer;
        DaysWorked: Integer;
        prSalaryArrears: Record "PR Salary Arrears";
        prEmployeeTransactions: Record "PR Employee Transactions";
        prTransactionCodes: Record "PR Transaction Codes";
        strExtractedFrml: Text[250];
        SpecialTransType: Option Ignore,"Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan","Value of Quarters",Morgage;
        TransactionType: Option Income,Deduction;
        curPensionCompany: Decimal;
        curTaxOnExcessPension: Decimal;
        prUnusedRelief: Record "prUnused Relief";
        curNhif_Base_Amount: Decimal;
        curNHIF: Decimal;
        curTotalDeductions: Decimal;
        curNetRnd_Effect: Decimal;
        curNetPay: Decimal;
        curTotCompanyDed: Decimal;
        curOOI: Decimal;
        curHOSP: Decimal;
        curLoanInt: Decimal;
        strTransCode: Text[250];
        fnCalcFringeBenefit: Decimal;
        prEmployerDeductions: Record "PR Employer Deductions";
        JournalPostingType: Option " ","G/L Account",Customer,Vendor;
        JournalAcc: Code[20];
        Customer: Record Customer;
        JournalPostAs: Option " ",Debit,Credit;
    begin
        //Initialize Global Setup Items
        VitalSetup.FindFirst();
        begin
            curReliefPersonal := VitalSetup."Tax Relief";
            curReliefInsurance := VitalSetup."Insurance Relief";
            curReliefMorgage := VitalSetup."Mortgage Relief"; //Same as HOSP
            curMaximumRelief := VitalSetup."Max Relief";

            /*{
            //Commented GreenCom
            curNssfEmployee := "NSSF Employee";
            curNssf_Employer_Factor:= "NSSF Employer Factor";
            //End Commented GreenCom
             }*/

            intNHIF_BasedOn := VitalSetup."NHIF Based on";
            curMaxPensionContrib := VitalSetup."Max Pension Contribution";
            curRateTaxExPension := VitalSetup."Tax On Excess Pension";
            curOOIMaxMonthlyContrb := VitalSetup."OOI Deduction";
            curOOIDecemberDedc := VitalSetup."OOI December";
            curLoanMarketRate := VitalSetup."Loan Market Rate";
            curLoanCorpRate := VitalSetup."Loan Corporate Rate";
            currMinRelief := VitalSetup."Minimum Relief Amount";
            curDisabledLimit := VitalSetup."Disbled Tax Limit";

            //Added GreenCom
            CurrNITAEmployerRelief := VitalSetup."NITA Employer Contribution";
            CUrrHSEEmployee := VitalSetup."HseLevy Percentage Employee";
            CUrrHSEEmployer := VitalSetup."HseLevy Percentage Employer";
            //End Added GreenCom

            //Added Dan for NLC (Prorate ALLOWANCES & BASIC PAY after the 15th day of the month)
            //curProrationStartDate:="Prorate Allowances";
            //For NLC
            PersonalRelief_1 := 0;
            TaxCharged_1 := 0;

        end;

    end;


    procedure fnProcesspayroll(strEmpCode: Code[20]; dtDOE: Date; curBasicPay: Decimal; blnPaysPaye: Boolean; blnPaysNssf: Boolean; blnPaysNhif: Boolean; SelectedPeriod: Date; dtOpenPeriod: Date; Membership: Text[30]; ReferenceNo: Text[30]; dtTermination: Date; blnGetsPAYERelief: Boolean; Dept: Code[20]; blnInsuranceCertificate: Boolean)
    var
        strTableName: Text[50];
        curTransAmount: Decimal;
        curTransBalance: Decimal;
        strTransDescription: Text[50];
        TGroup: Text[30];
        TGroupOrder: Integer;
        TSubGroupOrder: Integer;
        curSalaryArrears: Decimal;
        curPayeArrears: Decimal;
        curGrossPay: Decimal;
        curTotAllowances: Decimal;
        curExcessPension: Decimal;
        curNSSF: Decimal;
        curDefinedContrib: Decimal;
        curPensionStaff: Decimal;
        curNonTaxable: Decimal;
        curGrossTaxable: Decimal;
        curBenefits: Decimal;
        curValueOfQuarters: Decimal;
        curNHIFReliefAmount: Decimal;
        curUnusedRelief: Decimal;
        curInsuranceReliefAmount: Decimal;
        curMorgageReliefAmount: Decimal;
        curTaxablePay: Decimal;
        curTaxCharged: Decimal;
        curPAYE: Decimal;
        prPeriodTransactions: Record "PR Period Transactions";
        intYear: Integer;
        intMonth: Integer;
        LeapYear: Boolean;
        CountDaysofMonth: Integer;
        DaysWorked: Integer;
        prSalaryArrears: Record "PR Salary Arrears";
        prEmployeeTransactions: Record "PR Employee Transactions";
        prTransactionCodes: Record "PR Transaction Codes";
        strExtractedFrml: Text[250];
        SpecialTransType: Option Ignore,"Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan","Value of Quarters",Mortgage,Pension,"Mortgage Relief";
        TransactionType: Option Income,Deduction;
        curPensionCompany: Decimal;
        curTaxOnExcessPension: Decimal;
        prUnusedRelief: Record "prUnused Relief";
        curNhif_Base_Amount: Decimal;
        curNHIF: Decimal;
        curTotalDeductions: Decimal;
        curNetRnd_Effect: Decimal;
        curNetPay: Decimal;
        curTotCompanyDed: Decimal;
        curOOI: Decimal;
        curHOSP: Decimal;
        curLoanInt: Decimal;
        strTransCode: Text[250];
        fnCalcFringeBenefit: Decimal;
        prEmployerDeductions: Record "PR Employer Deductions";
        salCard: Record "PR Salary Card";
        curBPAYBal: Decimal;
        curPensionReliefAmount: Decimal;
        curIncludeinNet: Decimal;
        JournalPostAs: Option ,Debit,Credit;
        JournalPostingType: Option " ","G/L Account",Customer,Vendor;
        JournalAc: Code[20];
        Customer: Record Customer;
        curIncludeGross: Decimal;
        IsCashbenefit: Decimal;
        curNssf_Base_Amount: Decimal;
        PRPeriodTrans: Record "PR Period Transactions";
        PRPivotal: Record "PR Vital Setup Info";
        curNITA_Base_Amount: Decimal;
        CurrNITA: Decimal;
        CurNSSFAmt: Decimal;
        CurNSSFEmpAmt: Decimal;
        CurrHSE: Decimal;
        curHSE_Base_Amount: Decimal;
        HSELevyArrears: Decimal;
        ExcludedHseLevyAmt: Decimal;
        CurrHSELevyGrossAmt: Decimal;
    begin

        //Nathan Added
        PRPivotal.Get();
        //End Nathan Added

        dtOpenPeriod := fnGetOpenPeriod();

        //Initialize
        fnInitialize();

        //Get Payroll Posting Accountss
        fnGetJournalDet(strEmpCode);


        //check if the period selected=current period. If not, do NOT run this function
        if SelectedPeriod <> dtOpenPeriod then
            exit;
        intMonth := Date2DMY(SelectedPeriod, 2);
        intYear := Date2DMY(SelectedPeriod, 3);

        //Delete all Records from the prPeriod Transactions for Reprocessing
        prPeriodTransactions.Reset();
        prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", strEmpCode);
        prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", dtOpenPeriod);
        if prPeriodTransactions.Find('-') then
            prPeriodTransactions.DeleteAll();

        //Delete all Records from prEmployer Deductions
        prEmployerDeductions.Reset();
        prEmployerDeductions.SetRange(prEmployerDeductions."Employee Code", strEmpCode);
        prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Period", dtOpenPeriod);
        if prEmployerDeductions.Find('-') then
            prEmployerDeductions.DeleteAll();

        //Delete all records from HRBankSummary
        HRBankSummary.Reset();
        HRBankSummary.SetRange(HRBankSummary."Payroll Period", dtOpenPeriod);
        HRBankSummary.SetRange(HRBankSummary."Staff No.", strEmpCode);
        if HRBankSummary.Find('-') then
            HRBankSummary.DeleteAll();

        ////MESSAGE(FORMAT(dtDOE));


        //IF curBasicPay >0 THEN
        begin
            //Get the Basic Salary (prorate basc pay if needed) //Termination Remaining
            if (Date2DMY(dtDOE, 2) = Date2DMY(dtOpenPeriod, 2)) and (Date2DMY(dtDOE, 3) = Date2DMY(dtOpenPeriod, 3)) then begin
                CountDaysofMonth := fnDaysInMonth(dtDOE);
                DaysWorked := fnDaysWorked(dtDOE, false);
                curBasicPay := fnBasicPayProrated(strEmpCode, intMonth, intYear, curBasicPay, DaysWorked, CountDaysofMonth)
            end;

            //Prorate Basic Pay on    {What if someone leaves within the same month they are employed}

            ////MESSAGE(FORMAT(dtTermination));


            if dtTermination <> 0D then
                if (Date2DMY(dtTermination, 2) = Date2DMY(dtOpenPeriod, 2)) and (Date2DMY(dtTermination, 3) = Date2DMY(dtOpenPeriod, 3)) then begin
                    CountDaysofMonth := fnDaysInMonth(dtTermination);
                    DaysWorked := fnDaysWorked(dtTermination, true);
                    curBasicPay := fnBasicPayProrated(strEmpCode, intMonth, intYear, curBasicPay, DaysWorked, CountDaysofMonth)
                end;


            //basic pay balance
            curBPAYBal := 0;
            salCard.Reset();
            salCard.SetRange(salCard."Employee Code", strEmpCode);
            //salCard.CALCFIELDS(salCard."Cumm BasicPay");
            if salCard.Find('-') then
                curBPAYBal := curBasicPay;


            curTransAmount := curBasicPay;
            strTransDescription := 'Basic Pay';
            TGroup := 'BASIC SALARY';
            TGroupOrder := 1;
            TSubGroupOrder := 1;
            fnUpdatePeriodTrans(strEmpCode, 'BPAY', TGroup, TGroupOrder,
                               TSubGroupOrder, strTransDescription, curTransAmount, curBPAYBal,
                               intMonth, intYear, Membership, ReferenceNo, SelectedPeriod, Dept,
                               salariesAcc, JournalPostAs::Debit, JournalPostingType::"G/L Account", ''
                               , CoopParameters::none);


            //Extended Dann
            curSalaryArrears := 0;
            curPayeArrears := 0;

            //Basic Salary Arrears & Allowance Arrears
            prSalaryArrears.Reset();
            prSalaryArrears.SetRange(prSalaryArrears."Employee Code", strEmpCode);
            prSalaryArrears.SetRange(prSalaryArrears."Period Month", intMonth);
            prSalaryArrears.SetRange(prSalaryArrears."Period Year", intYear);
            if prSalaryArrears.Find('-') then begin
                repeat
                    //Calculate ALL SALARY ARREARS
                    //curSalaryArrears := prSalaryArrears."Salary Arrears";
                    //curPayeArrears := prSalaryArrears."PAYE Arrears";
                    curSalaryArrears += prSalaryArrears.Amount;

                    //Insert [Salary Arrears] into period trans [ARREARS]
                    curTransAmount := curSalaryArrears;
                    strTransDescription := prSalaryArrears."Transaction Name";
                    TGroup := 'ARREARS';
                    TGroupOrder := 1;
                    TSubGroupOrder := 2;
                    fnUpdatePeriodTrans(strEmpCode, prSalaryArrears."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                      strTransDescription, curTransAmount, 0, intMonth, intYear, Membership, ReferenceNo, SelectedPeriod, Dept,
                      salariesAcc, JournalPostAs::Debit, JournalPostingType::"G/L Account", '', CoopParameters::none);
                until prSalaryArrears.Next() = 0;

                //Calulate PAYE Arrears Due
                curPayeArrears :=
                fnGetEmployeePaye(curSalaryArrears) - curReliefPersonal;   //Less Personal Relief

                curTransAmount := curPayeArrears;
                strTransDescription := 'P.A.Y.E Arrears';
                TGroup := 'STATUTORY DEDUCTIONS';
                TGroupOrder := 7;
                TSubGroupOrder := 4;
                fnUpdatePeriodTrans(strEmpCode, 'PYAR', TGroup, TGroupOrder, TSubGroupOrder,
                   strTransDescription, curTransAmount, 0, intMonth, intYear, Membership, ReferenceNo, SelectedPeriod, Dept
                   , salariesAcc, JournalPostAs::Debit, JournalPostingType::"G/L Account", '', CoopParameters::none)
            end;
            //End - Extended Dann


            //Get Amount for Earnings Excluded from Housing Levy:
            prEmployeeTransactions.Reset();
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
            prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false);
            if prEmployeeTransactions.Find('-') then
                repeat
                    prTransactionCodes.Reset();
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Code", prEmployeeTransactions."Transaction Code");
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Type", prTransactionCodes."Transaction Type"::Income);
                    prTransactionCodes.SetRange(prTransactionCodes."Exclude Housing Levy", true);
                    if prTransactionCodes.Find('-') then
                        ExcludedHseLevyAmt := prEmployeeTransactions.Amount;
                until prEmployeeTransactions.Next() = 0;
            //MESSAGE(FORMAT(ExcludedHseLevyAmt));



            //Get Earnings
            prEmployeeTransactions.Reset();
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
            prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added DW to not process Stopped Transactions
            if prEmployeeTransactions.Find('-') then begin
                curTotAllowances := 0;
                repeat
                    prTransactionCodes.Reset();
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Code", prEmployeeTransactions."Transaction Code");
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Type", prTransactionCodes."Transaction Type"::Income);
                    if prTransactionCodes.Find('-') then begin

                        curTransAmount := 0;
                        curTransBalance := 0;
                        strTransDescription := '';
                        strExtractedFrml := '';
                        curIncludeinNet := 0;
                        if prTransactionCodes."Is Formula" then begin
                            strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes.Formula);
                            //greencom
                            curTransAmount := Round(fnFormulaResult(strExtractedFrml), 1, '<'); //Get the calculated amount
                                                                                                ////curTransAmount := (fnFormulaResult(strExtractedFrml)); //Get the calculated amount
                                                                                                //message('%1',curTransAmount);

                        end else
                            curTransAmount := prEmployeeTransactions.Amount;

                        if prTransactionCodes."Balance Type" = prTransactionCodes."Balance Type"::None then //[0=None, 1=Increasing, 2=Reducing]
                            curTransBalance := 0;
                        if prTransactionCodes."Balance Type" = prTransactionCodes."Balance Type"::Increasing then
                            curTransBalance := prEmployeeTransactions.Balance + curTransAmount;
                        if prTransactionCodes."Balance Type" = prTransactionCodes."Balance Type"::Reducing then
                            curTransBalance := prEmployeeTransactions.Balance - curTransAmount;
                        if prTransactionCodes."Include in Net" = true then
                            curIncludeinNet := curTransAmount;


                        //Prorate Allowances Here

                        PRPayrollPeriiod.Reset();
                        PRPayrollPeriiod.SetRange(PRPayrollPeriiod."Date Opened", SelectedPeriod);
                        if PRPayrollPeriiod.Find('-') then
                            if not PRPayrollPeriiod.Prorated then
                                if prTransactionCodes."Exclude Proration?" <> true then
                                    if (Date2DMY(dtDOE, 2) = Date2DMY(dtOpenPeriod, 2)) and (Date2DMY(dtDOE, 3) = Date2DMY(dtOpenPeriod, 3)) then begin
                                        CountDaysofMonth := fnDaysInMonth(dtDOE);
                                        DaysWorked := fnDaysWorked(dtDOE, false);
                                        CurrDayOfMonth := Date2DMY(dtDOE, 1);
                                        if curProrationStartDate < CurrDayOfMonth then
                                            curTransAmount := fnBasicPayProrated(strEmpCode, intMonth, intYear, curTransAmount, DaysWorked, CountDaysofMonth);
                                    end;
                        //Prorate Allowances Here

                        //Add Non Taxable Here
                        if (not prTransactionCodes.Taxable) and (prTransactionCodes."Special Transactions" =
                        prTransactionCodes."Special Transactions"::Ignore) then
                            curNonTaxable := curNonTaxable + curTransAmount;

                        //Added to ensure special transaction that are not taxable are not inlcuded in list of Allowances
                        if (not prTransactionCodes.Taxable) and (prTransactionCodes."Special Transactions" <>
                        prTransactionCodes."Special Transactions"::Ignore) then
                            curTransAmount := 0;

                        curTotAllowances := curTotAllowances + curTransAmount; //Sum-up all the allowances
                        curTransAmount := curTransAmount;
                        curTransBalance := curTransBalance;
                        strTransDescription := prTransactionCodes."Transaction Name";
                        //jnlcode:=prTransactionCodes."GL Account";
                        TGroup := 'ALLOWANCE';
                        TGroupOrder := 3;
                        TSubGroupOrder := 0;
                        //MESSAGE(FORMAT(JournalAc));

                        //Get the posting Details
                        JournalPostingType := JournalPostingType::" ";
                        JournalAc := '';
                        if prTransactionCodes.Subledger <> prTransactionCodes.Subledger::" " then begin
                            //FOR CUSTOMER
                            //***********************************

                            if prTransactionCodes.Subledger = prTransactionCodes.Subledger::Customer then begin
                                //HrEmployee.GET(strEmpCode);
                                Customer.Reset();
                                Customer.SetRange(Customer."No.", strEmpCode);
                                if Customer.Find('-') then begin
                                    JournalAc := strEmpCode;
                                    JournalPostingType := JournalPostingType::Customer;
                                end;
                            end;

                            //FOR VENDOR
                            //***********************************
                            if prTransactionCodes.Subledger = prTransactionCodes.Subledger::Vendor then begin
                                HREmployes.Reset();
                                HREmployes.SetRange(HREmployes."No.", strEmpCode);
                                if HREmployes.Find('-') then begin
                                    JournalAc := prEmployeeTransactions."Subledger Account";
                                    JournalPostingType := JournalPostingType::Vendor;
                                end;
                            end;

                        end else begin
                            //JournalAc:=jnlcode;
                            JournalPostingType := JournalPostingType::"G/L Account";
                            JournalAc := prTransactionCodes."GL Account";

                        end;
                        //End posting Details

                        fnUpdatePeriodTrans(strEmpCode, prTransactionCodes."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                        strTransDescription, curTransAmount, curTransBalance, intMonth, intYear, prEmployeeTransactions.Membership,
                        prEmployeeTransactions."Reference No", SelectedPeriod, Dept, JournalAc, JournalPostAs::Debit, JournalPostingType, '',
                        prTransactionCodes."coop parameters");
                    end;
                until prEmployeeTransactions.Next() = 0;
                PRPayrollPeriiod.Prorated := true;
                PRPayrollPeriiod.Modify();

            end;

            //Calc GrossPay = (BasicSalary + Allowances + SalaryArrears) [Group Order = 4]
            curGrossPay := (curBasicPay + curTotAllowances + curSalaryArrears + curIncludeGross);
            //greencom
            curTransAmount := Round(curGrossPay, 0.01, '>'); //curGrossPay;
                                                             //curTransAmount :=curGrossPay; //curGrossPay;


            strTransDescription := 'Gross Pay';
            TGroup := 'GROSS PAY';
            TGroupOrder := 4;
            TSubGroupOrder := 0;
            fnUpdatePeriodTrans(strEmpCode, 'GPAY', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription, curTransAmount, 0, intMonth,
             intYear, '', '', SelectedPeriod, Dept, '', JournalPostAs::Debit, JournalPostingType::" ", '', CoopParameters::none);


            /*
            //************************************************************************************************************************************
                      //Get the NSSF amount
                      IF blnPaysNssf THEN
                        curNSSF := curNssfEmployee;
                      curTransAmount := curNSSF;
                      strTransDescription := 'N.S.S.F';
                      TGroup := 'STATUTORY DEDUCTIONS'; TGroupOrder := 7; TSubGroupOrder := 1;
                      fnUpdatePeriodTrans (strEmpCode, 'NSSF', TGroup, TGroupOrder, TSubGroupOrder,
                      strTransDescription, curTransAmount, 0, intMonth, intYear,'','',SelectedPeriod,Dept,
                      NSSFEMPyee,JournalPostAs::Credit,JournalPostingType::"G/L Account",'',CoopParameters::NSSF);
            //************************************************************************************************************************************
            */

            //************************************************************************************************************************************
            //NEW NSSF CODE HERE
            //Get the N.S.S.F amount for the month GBT
            curNssf_Base_Amount := 0;
            if intNSSF_BasedOn = intNSSF_BasedOn::Gross then //>NSSF calculation can be based on:
                curNssf_Base_Amount := curGrossPay;
            if intNSSF_BasedOn = intNSSF_BasedOn::Basic then
                curNssf_Base_Amount := curBasicPay;

            //Get the  Empployee NSSF amount
            if blnPaysNssf then
                CurNSSFAmt := VitalSetup."NSSF Employee Percentage" / 100 * curGrossPay;
            if CurNSSFAmt > VitalSetup."Maximum NSSF Employee" then
                curNSSF := VitalSetup."Maximum NSSF Employee"
            else
                curNSSF := Round(CurNSSFAmt, 0.01, '>');
            curTransAmount := Round(curNSSF, 0.01, '>');
            strTransDescription := 'N.S.S.F';
            TGroup := 'STATUTORY DEDUCTIONS';
            TGroupOrder := 7;
            TSubGroupOrder := 1;
            fnUpdatePeriodTrans(strEmpCode, 'NSSF', TGroup, TGroupOrder, TSubGroupOrder,
            strTransDescription, curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept, NSSFEMPyee,
            JournalPostAs::Credit, JournalPostingType::"G/L Account", '', CoopParameters::NSSF);

            //Update Employer deductions
            if blnPaysNssf then
                CurNSSFEmpAmt := VitalSetup."NSSF Employer Percentage" / 100 * curGrossPay;
            if CurNSSFEmpAmt > VitalSetup."Maximum NSSF Employer" then
                curNSSF := VitalSetup."Maximum NSSF Employer"
            else
                curNSSF := Round(CurNSSFEmpAmt, 0.01, '>');
            curTransAmount := Round(curNSSF, 0.01, '>');
            fnUpdateEmployerDeductions(strEmpCode, 'NSSF',
             'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
              prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod);
            //***************************************************************************************************************************



            /*{
            //**************************************************************************************************************************
            //commented GreenCOM
            //OLD NSSF CODE
            //Get the N.S.S.F amount for the month GBT
             curNssf_Base_Amount :=0;
             IF intNSSF_BasedOn =intNSSF_BasedOn::Gross THEN //>NSSF calculation can be based on:
                     curNssf_Base_Amount := curGrossPay;
             IF intNSSF_BasedOn = intNSSF_BasedOn::Basic THEN
                    curNssf_Base_Amount := curBasicPay;

             //Get the NSSF amount
             IF blnPaysNssf THEN
              curNSSF:=fnGetEmployerNSSF(curNssf_Base_Amount);
              curTransAmount := curNSSF;
             strTransDescription := 'N.S.S.F';
             TGroup := 'STATUTORY DEDUCTIONS'; TGroupOrder := 7; TSubGroupOrder := 1;
             fnUpdatePeriodTrans (strEmpCode, 'NSSF', TGroup, TGroupOrder, TSubGroupOrder,
             strTransDescription, curTransAmount, 0, intMonth, intYear,'','',SelectedPeriod,Dept,NSSFEMPyee,
             JournalPostAs::Credit,JournalPostingType::"G/L Account",'',CoopParameters::NSSF);

            //Update Employer deductions
             IF blnPaysNssf THEN
              curNSSF:=fnGetEmployerNSSF(curNssf_Base_Amount);
              curTransAmount := curNSSF;
              fnUpdateEmployerDeductions(strEmpCode, 'NSSF',
               'EMP', TGroupOrder, TSubGroupOrder,'', curTransAmount, 0, intMonth, intYear,
                prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No",SelectedPeriod);
             //End Commented GreenCom
             //*************************************************************************************************************************
            }*/

            /*{
           //NITA Employer Contribution
           //Update Employer NITA deductions
           curNITA_Base_Amount:=0;
            //Get the NITA amount
            IF blnPaysNssf THEN
             CurrNITA:=fnGetEmployeeNITA(curNITA_Base_Amount);
             curTransAmount := CurrNITA;
            strTransDescription :='NITA';
            TGroup := 'STATUTORY DEDUCTIONS'; TGroupOrder := 7; TSubGroupOrder := 1;
            fnUpdatePeriodTrans (strEmpCode, 'NITA', TGroup, TGroupOrder, TSubGroupOrder,
            strTransDescription, curTransAmount, 0, intMonth, intYear,'','',SelectedPeriod,Dept,NSSFEMPyee,
            JournalPostAs::Credit,JournalPostingType::"G/L Account",'',CoopParameters::NITA);
            }*/

            //Update Employer deductions
            if blnPaysPaye then
                CurrNITA := fnGetEmployeeNITA(curNITA_Base_Amount);
            curTransAmount := CurrNITA;
            fnUpdateEmployerDeductions(strEmpCode, 'NITA',
             'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
              prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod);

            CurrHSELevyGrossAmt := curGrossPay - ExcludedHseLevyAmt;
            //MESSAGE(FORMAT(CurrHSELevyGrossAmt));

            //Update Employee Housing Levy
            if blnPaysPaye then
                CurrHSE := Round(CUrrHSEEmployee / 100 * CurrHSELevyGrossAmt, 0.01, '>');
            curTransAmount := CurrHSE;
            strTransDescription := 'Housing Levy';
            TGroup := 'STATUTORY DEDUCTIONS';
            TGroupOrder := 7;
            TSubGroupOrder := 1;
            fnUpdatePeriodTrans(strEmpCode, 'HOUSING LEVY', TGroup, TGroupOrder, TSubGroupOrder,
            strTransDescription, curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept, NSSFEMPyee,
            JournalPostAs::Credit, JournalPostingType::"G/L Account", '', CoopParameters::HOUSE);

            //Update Employer Housing Levy
            if blnPaysPaye then
                CurrHSE := Round(CUrrHSEEmployer / 100 * CurrHSELevyGrossAmt, 0.01, '>');
            curTransAmount := CurrHSE;
            fnUpdateEmployerDeductions(strEmpCode, 'HOUSING LEVY',
             'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
              prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod);


            //Update Employer Housing Levy Arrears for July 2023
            if blnPaysPaye then begin
                prEmployeeTransactions.Reset();
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Payroll Period", SelectedPeriod);
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Transaction Code", 'D433');
                prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false);
                if prEmployeeTransactions.Find('-') then begin
                    HSELevyArrears := prEmployeeTransactions.Amount;
                    curTransAmount := HSELevyArrears;
                    fnUpdateEmployerDeductions(strEmpCode, 'HOUSING LEVY ARREARS',
                     'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
                      prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod);
                end;
            end;
            //************************************************************************************************************************




            //Get the Defined contribution to post based on the Max Def contrb allowed   ****************All Defined Contributions not included
            curDefinedContrib := curNSSF; //(curNSSF + curPensionStaff + curNonTaxable) - curMorgageReliefAmount
            curTransAmount := curDefinedContrib;
            //error('%1',curTransAmount);
            strTransDescription := 'Defined Contributions';
            TGroup := UpperCase('TAX CALCULATIONS');
            TGroupOrder := 6;
            TSubGroupOrder := 1;
            fnUpdatePeriodTrans(strEmpCode, 'DEFCON', TGroup, TGroupOrder, TSubGroupOrder,
             strTransDescription, curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
             '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);

            //Get the Gross taxable amount
            //>GrossTaxable = Gross + Benefits + nValueofQuarters  ******Confirm CurValueofQuaters
            curGrossTaxable := curGrossPay + curBenefits + curValueOfQuarters;

            //>If GrossTaxable = 0 Then TheDefinedToPost = 0
            if curGrossTaxable = 0 then
                curDefinedContrib := 0;

            //Personal Relief
            // if get relief is ticked  - DENNO ADDED


            //Added for auto relief calculation
            if (curGrossPay - curNSSF) <= currMinRelief then
                blnGetsPAYERelief := false
            else begin
                blnGetsPAYERelief := true;
                //If employee is marked on salary card as not entitle to personal relief
                PRSalCard_2.Reset();
                if PRSalCard_2.Get(strEmpCode) then
                    if PRSalCard_2."Disable Personal Relief?" then
                        blnGetsPAYERelief := false;

            end;

            if blnGetsPAYERelief then begin
                curReliefPersonal := curReliefPersonal + curUnusedRelief; //*****Get curUnusedRelief
                curTransAmount := curReliefPersonal;

                //Added
                PersonalRelief_1 := curTransAmount;
                //Added

                strTransDescription := 'Personal Relief';
                TGroup := 'TAX CALCULATIONS';
                TGroupOrder := 6;
                TSubGroupOrder := 9;
                fnUpdatePeriodTrans(strEmpCode, 'PSNR', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                 curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                 '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);
            end
            else
                curReliefPersonal := 0;

            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //>Pension Contribution [self] relief
            curPensionStaff := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
            SpecialTransType::"Defined Contribution", false);//Self contrib Pension is 1 on [Special Transaction]
            if curPensionStaff > 0 then begin
                if curPensionStaff > curMaxPensionContrib then
                    //greencom
                    curTransAmount := Round(curMaxPensionContrib, 1, '<')
                ////curTransAmount :=curMaxPensionContrib
                else
                    ////curTransAmount :=ROUND(curPensionStaff,1,'<');
                    curTransAmount := curPensionStaff;

                strTransDescription := 'Pension Relief';
                TGroup := 'TAX CALCULATIONS';
                TGroupOrder := 6;
                TSubGroupOrder := 2;
                fnUpdatePeriodTrans(strEmpCode, 'PNSR', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none)
            end;

            //if he PAYS paye only*******************I
            if blnPaysPaye and blnGetsPAYERelief then begin
                //Get Insurance Relief
                curInsuranceReliefAmount := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                SpecialTransType::"Life Insurance", false); //Insurance is 3 on [Special Transaction]

                //********************************************************************************************************************************************************
                //Added DW - for employees who have brought the Insurance certificate, they are entitled to Insurance relief, Otherwise NO
                //Place a check mark on the Salary Card to YES
                if (curInsuranceReliefAmount > 0) and (blnInsuranceCertificate) then begin
                    //greencom
                    //// curTransAmount := curInsuranceReliefAmount;
                    curTransAmount := Round(curInsuranceReliefAmount, 0.01, '=');

                    strTransDescription := 'Insurance Relief';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 8;
                    fnUpdatePeriodTrans(strEmpCode, 'INSR', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);
                end;
                //********************************************************************************************************************************************************
                //Get Pension Relief
                curPensionReliefAmount := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                SpecialTransType::Pension, false); //Insurance is 3 on [Special Transaction]
                if curPensionReliefAmount > 0 then begin
                    curTransAmount := curPensionReliefAmount;
                    strTransDescription := 'Insurance Pension Relief';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 8;
                    fnUpdatePeriodTrans(strEmpCode, 'IPR', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);

                end;

                //>OOI
                curOOI := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                SpecialTransType::"Owner Occupier Interest", false); //Morgage is LAST on [Special Transaction]
                if curOOI > 0 then begin
                    if curOOI <= curOOIMaxMonthlyContrb then
                        curTransAmount := curOOI
                    else
                        curTransAmount := curOOIMaxMonthlyContrb;

                    strTransDescription := 'Owner Occupier Interest';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 3;
                    fnUpdatePeriodTrans(strEmpCode, 'OOI', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);
                end;

                //HOSP
                curHOSP := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                SpecialTransType::"Home Ownership Savings Plan", false); //Home Ownership Savings Plan
                if curHOSP > 0 then begin
                    if curHOSP <= curReliefMorgage then
                        curTransAmount := curHOSP
                    else
                        curTransAmount := curReliefMorgage;

                    strTransDescription := 'Home Ownership Savings Plan';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 4;
                    fnUpdatePeriodTrans(strEmpCode, 'HOSP', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);
                end;

                /*{{
                //Dann
                //Mortage Relief
                  curMorgageRelief := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                  SpecialTransType::Mortgage,FALSE);
                  IF curMorgageRelief > 0 THEN BEGIN
                      curTransAmount:=curMorgageRelief;
                     strTransDescription := 'Mortgage Relief';
                     TGroup := 'TAX CALCULATIONS'; TGroupOrder := 6; TSubGroupOrder :=9;
                     fnUpdatePeriodTrans (strEmpCode, 'MORG-RL', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                     curTransAmount, 0, intMonth, intYear,'','',SelectedPeriod,Dept,
                     '',JournalPostAs::Credit,JournalPostingType::" ",'',CoopParameters::none)
                  END;
                }}*/

                //Nathan Added
                //Mortage Relief
                curMorgageRelief := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear,
                SpecialTransType::Mortgage, false);
                if curMorgageRelief > 0 then begin
                    curTransAmount := curMorgageRelief;
                    strTransDescription := 'Mortgage Relief';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 9;
                    fnUpdatePeriodTrans(strEmpCode, 'MORG-RL', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);
                end;
                //End Added

                //Nathan Added
                //Get the N.H.I.F amount for the month GBT
                curNhif_Base_Amount := 0;
                if intNHIF_BasedOn = intNHIF_BasedOn::Gross then //>NHIF calculation can be based on:
                    curNhif_Base_Amount := curGrossPay;
                if intNHIF_BasedOn = intNHIF_BasedOn::Basic then
                    curNhif_Base_Amount := curBasicPay;
                if intNHIF_BasedOn = intNHIF_BasedOn::"Taxable Pay" then
                    curNhif_Base_Amount := curTaxablePay;


                //Enter NonTaxable Amount
                if curNonTaxable > 0 then begin
                    strTransDescription := 'Other Non-Taxable Benefits';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 5;
                    fnUpdatePeriodTrans(strEmpCode, 'NONTAX', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curNonTaxable, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                    '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);
                end;

            end;

            //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            /*
            //>Company pension, Excess pension, Tax on excess pension
            curPensionCompany := fnGetSpecialTransAmount(strEmpCode, intMonth, intYear, SpecialTransType::"Defined Contribution",
            TRUE); //Self contrib Pension is 1 on [Special Transaction]
            IF curPensionCompany > 0 THEN BEGIN
                curTransAmount := curPensionCompany;
                strTransDescription := 'Pension (Company)';
                //Update the Employer deductions table

                curExcessPension:= curPensionCompany - curMaxPensionContrib;
                IF curExcessPension > 0 THEN BEGIN
                    curTransAmount := curExcessPension;
                    strTransDescription := 'Excess Pension';
                    TGroup := 'STATUTORY DEDUCTIONS'; TGroupOrder := 7; TSubGroupOrder := 5;
                    fnUpdatePeriodTrans (strEmpCode, 'EXCP', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription, curTransAmount, 0,
                     intMonth,intYear,'','',SelectedPeriod,Dept,costc);

                    curTaxOnExcessPension := (curRateTaxExPension / 100) * curExcessPension;
                    curTransAmount := curTaxOnExcessPension;
                    strTransDescription := 'Tax on ExPension';
                    TGroup := 'STATUTORY DEDUCTIONS'; TGroupOrder := 7; TSubGroupOrder := 6;
                    fnUpdatePeriodTrans (strEmpCode, 'TXEP', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription, curTransAmount, 0,
                     intMonth,intYear,'','',SelectedPeriod,Dept,costc);
                END;
            END;
             */

            //Get the Taxable amount for calculation of PAYE
            //>prTaxablePay = (GrossTaxable - SalaryArrears) - (TheDefinedToPost + curSelfPensionContrb + MorgageRelief)


            //Add HOSP and MORTGAGE KIM{}

            /*
           //********MM July
            IF curPensionStaff > curMaxPensionContrib THEN
              curTaxablePay:= curGrossTaxable - (curSalaryArrears + curDefinedContrib +curMaxPensionContrib+curOOI+curHOSP+curNonTaxable
                               +curPensionReliefAmount + curMorgageRelief )
            ELSE
                curTaxablePay:= curGrossTaxable - (curSalaryArrears + curDefinedContrib +curPensionStaff+curOOI+curHOSP+curNonTaxable
                               +curPensionReliefAmount + curMorgageRelief);
                               //********MM July
            */

            /*{
             IF curPensionStaff+ curDefinedContrib > curMaxPensionContrib THEN
               curTaxablePay:= curGrossTaxable - (curSalaryArrears  +curMaxPensionContrib+curOOI+curHOSP+curNonTaxable
                                +curPensionReliefAmount + curMorgageRelief )
             ELSE
                 curTaxablePay:= curGrossTaxable - (curSalaryArrears + curDefinedContrib +curPensionStaff+curOOI+curHOSP+curNonTaxable
                                +curPensionReliefAmount + curMorgageRelief);
            }*/

            //Nathan Modified
            if curPensionStaff + curDefinedContrib > curMaxPensionContrib then
                curTaxablePay := curGrossTaxable - (curSalaryArrears + curMaxPensionContrib + curOOI + curHOSP + curNonTaxable
                                 + curPensionReliefAmount + curMorgageRelief)
            else
                curTaxablePay := curGrossTaxable - (curSalaryArrears + curDefinedContrib + curPensionStaff + curOOI + curHOSP + curNonTaxable
                               + curPensionReliefAmount + curMorgageRelief);
            //End Modified


            //If Employee is disabled and Tax Pay > 150,000 then tax excess of 150,000 else do not tax anything
            HREmp.Get(strEmpCode);
            if HREmp.Disabled = HREmp.Disabled::Yes then
                //If TP > 150,000
                if curTaxablePay >= VitalSetup."Disbled Tax Limit" then
                    curTaxablePay := curTaxablePay - VitalSetup."Disbled Tax Limit";
            /*
            // If TP < 150,000
             IF curTaxablePay < VitalSetup."Disbled Tax Limit" THEN
             BEGIN
                 curTaxablePay:=0;
             END;
             */
            // ERROR(FORMAT(curTaxablePay)) ;

            //greencom
            curTaxablePay := Round(curTaxablePay, 1, '<');
            ////curTaxablePay:=curTaxablePay;

            curTransAmount := curTaxablePay;
            strTransDescription := 'Taxable Pay';
            TGroup := 'TAX CALCULATIONS';
            TGroupOrder := 6;
            TSubGroupOrder := 6;
            fnUpdatePeriodTrans(strEmpCode, 'TXBP', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
             curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
             '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);

            //Get the Tax charged for the month
            ////Added for auto relief calculation
            //IF  (curGrossPay-curNSSF)  <= currMinRelief THEN
            //BEGIN
            //    blnPaysPaye:=FALSE;
            //END ELSE
            //BEGIN
            //    blnPaysPaye:=TRUE;
            //END;



            if blnPaysPaye then begin
                //Added:: Dann....Special Tax for Deployed Staff
                HREmp2.Reset();
                if HREmp2.Get(strEmpCode) then
                    if HREmp2."Employee Type" = HREmp2."Employee Type"::Deployed then begin
                        curTaxCharged := curTaxablePay * 0.3;
                        //greencom
                        ////curTransAmount :=curTaxCharged;
                        curTransAmount := Round(curTaxCharged, 0.5, '>');

                        //Added
                        TaxCharged_1 := curTransAmount;
                        //Added

                        strTransDescription := 'Tax Charged';
                        TGroup := 'TAX CALCULATIONS';
                        TGroupOrder := 6;
                        TSubGroupOrder := 7;
                        fnUpdatePeriodTrans(strEmpCode, 'TXCHRG', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                        curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                        '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);

                    end else begin
                        //Tax for normal staff
                        if curTaxablePay < 12298 then //initial ammount was 10164,changed by MORRIS


                            curTaxCharged := curTaxablePay * 0.1
                        else
                            curTaxCharged := fnGetEmployeePaye(curTaxablePay);
                        //greencom
                        curTransAmount := Round(curTaxCharged, 0.5, '>');
                        ////curTransAmount := curTaxCharged;

                        //Added
                        TaxCharged_1 := curTransAmount;
                        //Added

                        strTransDescription := 'Tax Charged';
                        TGroup := 'TAX CALCULATIONS';
                        TGroupOrder := 6;
                        TSubGroupOrder := 7;
                        fnUpdatePeriodTrans(strEmpCode, 'TXCHRG', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                        curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                       '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);

                    end;
            end;

            //Get the Net PAYE amount to post for the month
            if (curReliefPersonal + curInsuranceReliefAmount) > curMaximumRelief then
                curPAYE := curTaxCharged - curMaximumRelief
            else
                //Modified Nathan
                //******************************************************************************************************************************************
                //Added DW: Only for Employees who have brought their insurance Certificate are entitled to Insurance Relief Otherwise NO
                //Place a check mark on the Salary Card to YES
                if (blnInsuranceCertificate) then
                    curPAYE := curTaxCharged - (curReliefPersonal + curInsuranceReliefAmount + curNHIFReliefAmount)
                else
                    curPAYE := curTaxCharged - (curReliefPersonal);
            //******************************************************************************************************************************************
            //End Modified

            /*{
               //******************************************************************************************************************************************
               //Added DW: Only for Employees who have brought their insurance Certificate are entitled to Insurance Relief Otherwise NO
               //Place a check mark on the Salary Card to YES
               IF (blnInsuranceCertificate) THEN
               BEGIN
                   curPAYE := curTaxCharged - (curReliefPersonal + curInsuranceReliefAmount + curMorgageRelief);
               END ELSE BEGIN
                   curPAYE := curTaxCharged - (curReliefPersonal + curMorgageRelief);
               END;
               //******************************************************************************************************************************************
             END;
             }*/



            //Added for auto PAYE calculation
            if (curGrossPay - curNSSF) <= currMinRelief then
                blnPaysPaye := false
            else
                blnPaysPaye := true;


            if not blnPaysPaye then
                curPAYE := 0; //Get statutory Exemption for the staff. If exempted from tax, set PAYE=0
                              //greencom
            curTransAmount := Round(curPAYE, 0.5, '>');
            //// curTransAmount := curPAYE;

            if curPAYE < 0 then
                curTransAmount := 0;
            strTransDescription := 'P.A.Y.E';
            TGroup := 'STATUTORY DEDUCTIONS';
            TGroupOrder := 7;
            TSubGroupOrder := 3;
            fnUpdatePeriodTrans(strEmpCode, 'PAYE', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
             curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
             TaxAccount, JournalPostAs::Credit, JournalPostingType::"G/L Account", '', CoopParameters::none);

            //Store the unused relief for the current month
            //>If Paye<0 then "Insert into tblprUNUSEDRELIEF
            if curPAYE < 0 then begin
                prUnusedRelief.Reset();
                prUnusedRelief.SetRange(prUnusedRelief."Employee Code", strEmpCode);
                prUnusedRelief.SetRange(prUnusedRelief."Period Month", intMonth);
                prUnusedRelief.SetRange(prUnusedRelief."Period Year", intYear);
                if prUnusedRelief.Find('-') then
                    prUnusedRelief.Delete();

                prUnusedRelief.Reset();
                begin
                    prUnusedRelief.Init();
                    prUnusedRelief."Employee Code" := strEmpCode;
                    prUnusedRelief."Unused Relief" := curPAYE;
                    prUnusedRelief."Period Month" := intMonth;
                    prUnusedRelief."Period Year" := intYear;
                    prUnusedRelief.Insert();
                end;
            end;

            //Deductions: get all deductions for the month
            //Loans: calc loan deduction amount, interest, fringe benefit (employer deduction), loan balance
            //>Balance = (Openning Bal + Deduction)...//Increasing balance
            //>Balance = (Openning Bal - Deduction)...//Reducing balance
            //>NB: some transactions (e.g Sacco shares) can be made by cheque or cash. Allow user to edit the outstanding balance

            //Get the N.H.I.F amount for the month GBT
            curNhif_Base_Amount := 0;

            if intNHIF_BasedOn = intNHIF_BasedOn::Gross then //>NHIF calculation can be based on:
                curNhif_Base_Amount := curGrossPay;
            if intNHIF_BasedOn = intNHIF_BasedOn::Basic then
                curNhif_Base_Amount := curBasicPay;
            if intNHIF_BasedOn = intNHIF_BasedOn::"Taxable Pay" then
                curNhif_Base_Amount := curTaxablePay;

            //GET NHIF Amount
            if blnPaysNhif then begin
                curNHIF := fnGetEmployeeNHIF(curNhif_Base_Amount);
                curTransAmount := curNHIF;
                strTransDescription := 'N.H.I.F';
                TGroup := 'STATUTORY DEDUCTIONS';
                TGroupOrder := 7;
                TSubGroupOrder := 2;
                fnUpdatePeriodTrans(strEmpCode, 'NHIF', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                 curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                 NHIFEMPyee, JournalPostAs::Credit, JournalPostingType::"G/L Account", '', CoopParameters::none);
            end;

            //Get NHIF Relief
            if blnPaysNhif then begin
                curNHIF := fnGetEmployeeNHIF(curNhif_Base_Amount);
                if curNHIF > 0 then begin
                    //MESSAGE(strEmpCode);
                    curNHIFReliefAmount := (PRPivotal."Insurance Relief" / 100) * (curNHIF);
                    curTransAmount := curNHIFReliefAmount;
                    strTransDescription := 'N.H.I.F Relief';
                    TGroup := 'TAX CALCULATIONS';
                    TGroupOrder := 6;
                    TSubGroupOrder := 10;
                    fnUpdatePeriodTrans(strEmpCode, 'N.H.I.F Relief', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
                    curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept,
                   '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);
                end;
            end;
            //End Added


            prEmployeeTransactions.Reset();
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
            prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
            prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added DW to not process Stopped Transactions
            if prEmployeeTransactions.Find('-') then begin
                //curTotalDeductions:= 0;
                repeat
                    prTransactionCodes.Reset();
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Code", prEmployeeTransactions."Transaction Code");
                    prTransactionCodes.SetRange(prTransactionCodes."Transaction Type", prTransactionCodes."Transaction Type"::Deduction);
                    if prTransactionCodes.Find('-') then begin
                        curTransAmount := 0;
                        curTransBalance := 0;
                        strTransDescription := '';
                        strExtractedFrml := '';

                        if prTransactionCodes."Is Formula" then begin
                            strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes.Formula);
                            curTransAmount := fnFormulaResult(strExtractedFrml); //Get the calculated amount

                        end else
                            //greencom
                            curTransAmount := Round(prEmployeeTransactions.Amount, 0.01, '>');
                        //// curTransAmount := prEmployeeTransactions.Amount;
                        /////////morris
                        if prTransactionCodes."Balance Type" = prTransactionCodes."Balance Type"::None then //[0=None, 1=Increasing, 2=Reducing]
                            curTransBalance := 0;
                        if prTransactionCodes."Balance Type" = prTransactionCodes."Balance Type"::Increasing then
                            curTransBalance := prEmployeeTransactions.Balance + curTransAmount;
                        if prTransactionCodes."Balance Type" = prTransactionCodes."Balance Type"::Reducing then
                            curTransBalance := prEmployeeTransactions.Balance - curTransAmount;
                        ///////////morris

                        //**************************If "deduct Premium" is not ticked and the type is insurance- Dennis*****
                        if (prTransactionCodes."Special Transactions" = prTransactionCodes."Special Transactions"::"Life Insurance")
                          and (prTransactionCodes."Deduct Premium" = false) then
                            curTransAmount := 0;

                        //**************************If "deduct Premium" is not ticked and the type is mortgage- Dennis*****
                        if (prTransactionCodes."Special Transactions" = prTransactionCodes."Special Transactions"::Mortgage)
                         and (prTransactionCodes."Deduct Mortgage" = false) then
                            curTransAmount := 0;


                        //**************************If "deduct Premium" is not ticked and the type is mortgage- Dennis*****
                        if (prTransactionCodes."Special Transactions" = prTransactionCodes."Special Transactions"::Pension)
                         and (prTransactionCodes.Welfare = false) then
                            curTransAmount := 0;

                        //Get the posting Details
                        JournalPostingType := JournalPostingType::" ";
                        JournalAc := '';
                        if prTransactionCodes.Subledger <> prTransactionCodes.Subledger::" " then begin
                            //IF prTransactionCodes.Subledger=prTransactionCodes.Subledger::Customer THEN BEGIN
                            ////Customer.RESET;
                            // HrEmployee.GET(strEmpCode);
                            //   {
                            //Customer
                            if prTransactionCodes.Subledger = prTransactionCodes.Subledger::Customer then begin
                                //HrEmployee.GET(strEmpCode);
                                Customer.Reset();
                                Customer.SetRange(Customer."No.", strEmpCode);
                                if Customer.Find('-') then begin
                                    JournalAc := strEmpCode;
                                    JournalPostingType := JournalPostingType::Customer;
                                end;
                            end;

                            //FOR VENDOR
                            //***********************************
                            if prTransactionCodes.Subledger = prTransactionCodes.Subledger::Vendor then begin
                                HREmployes.Reset();
                                HREmployes.SetRange(HREmployes."No.", strEmpCode);
                                if HREmployes.Find('-') then begin
                                    JournalAc := prEmployeeTransactions."Subledger Account";
                                    JournalPostingType := JournalPostingType::Vendor;
                                end;
                            end;

                        end else begin
                            JournalAc := prTransactionCodes."GL Account";
                            JournalPostingType := JournalPostingType::"G/L Account";
                        end;

                        //End posting Details


                        //Loan Calculation is Amortized do Calculations here -Monthly Principal and Interest Keeps on Changing
                        if (prTransactionCodes."Special Transactions" = prTransactionCodes."Special Transactions"::"Staff Loan") and
                           (prTransactionCodes."Repayment Method" = prTransactionCodes."Repayment Method"::Reducing) then begin
                            curTransAmount := 0;
                            curLoanInt := 0;

                            prTransactionCodes.TestField(prTransactionCodes."Interest Rate");

                            curLoanInt := fnCalcLoanInterest(strEmpCode, prEmployeeTransactions."Transaction Code",
                            prTransactionCodes."Interest Rate", prTransactionCodes."Repayment Method",
                               prEmployeeTransactions."Original Amount", prEmployeeTransactions.Balance, SelectedPeriod);
                            //Post the Interest
                            if (curLoanInt <> 0) then begin
                                curTransAmount := curLoanInt;
                                curTotalDeductions := curTotalDeductions + curTransAmount; //Sum-up all the deductions
                                curTransBalance := 0;
                                strTransCode := prTransactionCodes."Transaction Code" + '-INT';
                                strTransDescription := prTransactionCodes."Transaction Name" + ' Interest';
                                TGroup := 'OTHER DEDUCTIONS';
                                TGroupOrder := 8;
                                TSubGroupOrder := 1;

                                fnUpdatePeriodTrans(strEmpCode, strTransCode, TGroup, TGroupOrder, TSubGroupOrder,
                                  strTransDescription, curTransAmount, curTransBalance, intMonth, intYear,
                                  prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod, Dept,
                                  JournalAc, JournalPostAs::Credit, JournalPostingType, prEmployeeTransactions."Loan Number",
                                  CoopParameters::"loan Interest")
                            end;
                            //Added Dan - Create intrest transaction code in PR Trans Codes table
                            PRTransCode_2.Reset();
                            PRTransCode_2.SetRange(PRTransCode_2."Transaction Code", strTransCode);
                            if not PRTransCode_2.Find('-') then begin
                                PRTransCode_3.Reset();
                                PRTransCode_3.Init();
                                PRTransCode_3."Transaction Code" := strTransCode;
                                PRTransCode_3."Transaction Name" := strTransDescription;
                                PRTransCode_3."Transaction Type" := PRTransCode_3."Transaction Type"::Deduction;
                                PRTransCode_3.Insert();
                            end;
                            //Added Dan
                        end;
                        //Loan Calculation Amortized

                        case prTransactionCodes."Balance Type" of //[0=None, 1=Increasing, 2=Reducing]
                            prTransactionCodes."Balance Type"::None:
                                curTransBalance := 0;
                            prTransactionCodes."Balance Type"::Increasing:
                                begin
                                    //Added Dann
                                    curTransAmount := prEmployeeTransactions.Amount;
                                    //Added Dann

                                    curTransBalance := prEmployeeTransactions.Balance + curTransAmount;

                                    //here mm start
                                    if prTransactionCodes."Is Formula" then begin
                                        strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes.Formula);
                                        //greencom
                                        //// curTransAmount :=fnFormulaResult(strExtractedFrml); //Get the calculated amount
                                        curTransAmount := Round(fnFormulaResult(strExtractedFrml), 1, '<'); //Get the calculated amount
                                    end; //here mm end

                                end;
                            prTransactionCodes."Balance Type"::Reducing:
                                begin
                                    //curTransBalance := prEmployeeTransactions.Balance - curTransAmount;
                                    if prEmployeeTransactions.Balance < prEmployeeTransactions.Amount then begin
                                        curTransAmount := prEmployeeTransactions.Balance;
                                        curTransBalance := 0;
                                    end else begin
                                        //Added Dann
                                        curTransAmount := prEmployeeTransactions.Amount;
                                        //Added Dann

                                        curTransBalance := prEmployeeTransactions.Balance - curTransAmount;
                                    end;
                                    if curTransBalance < 0 then begin
                                        curTransAmount := 0;
                                        curTransBalance := 0;
                                    end;
                                end
                        end;

                        //greencom
                        curTotalDeductions := Round(curTotalDeductions + curTransAmount, 0.01, '>'); //Sum-up all the deductions
                                                                                                     /////curTotalDeductions :=curTotalDeductions + curTransAmount; //Sum-up all the deductions
                                                                                                     //curTotalDeductions +=  curNSSF + curNHIF + curPAYE + curPayeArrears ; //hosea
                                                                                                     //error('%1',curTotalDeductions);
                                                                                                     ////curTransAmount :=curTransAmount;
                                                                                                     ////curTransBalance :=curTransBalance;
                        curTransAmount := Round(curTransAmount, 0.01, '>');
                        curTransBalance := Round(curTransBalance, 0.01, '>');

                        strTransDescription := prTransactionCodes."Transaction Name";


                        TGroup := 'OTHER DEDUCTIONS';
                        TGroupOrder := 8;
                        TSubGroupOrder := 0;
                        fnUpdatePeriodTrans(strEmpCode, prEmployeeTransactions."Transaction Code", TGroup, TGroupOrder, TSubGroupOrder,
                         strTransDescription, curTransAmount, curTransBalance, intMonth,
                         intYear, prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod, Dept,
                         JournalAc, JournalPostAs::Credit, JournalPostingType, prEmployeeTransactions."Loan Number",
                         prTransactionCodes."coop parameters");

                        //Fringe Benefits and Low interest Benefits
                        if prTransactionCodes."Fringe Benefit" = true then begin
                            if prTransactionCodes."Interest Rate" < curLoanMarketRate then
                                fnCalcFringeBenefit := (((curLoanMarketRate - prTransactionCodes."Interest Rate") * curLoanCorpRate) / 1200)
                                 * prEmployeeTransactions.Balance;
                        end else
                            fnCalcFringeBenefit := 0;
                        if fnCalcFringeBenefit > 0 then
                            fnUpdateEmployerDeductions(strEmpCode, prEmployeeTransactions."Transaction Code" + '-FRG',
                             'EMP', TGroupOrder, TSubGroupOrder, 'Fringe Benefit Tax', fnCalcFringeBenefit, 0, intMonth, intYear,
                              prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod);
                        //End Fringe Benefits

                        //corrected employer deduction
                        //Create Employer Deduction
                        if (prTransactionCodes."Employer Deduction") or prTransactionCodes."Include Employer Deduction" then begin
                            if prTransactionCodes."Is Formula for employer" <> '' then begin
                                strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes."Is Formula for employer");
                                curTransAmount := fnFormulaResult(strExtractedFrml); //Get the calculated amount
                                                                                     //curTransAmount := prEmployeeTransactions."Employer Amount";
                            end else
                                curTransAmount := prEmployeeTransactions."Employer Amount";
                            if curTransAmount > 0 then
                                fnUpdateEmployerDeductions(strEmpCode, prEmployeeTransactions."Transaction Code",
                                 'EMP', TGroupOrder, TSubGroupOrder, '', curTransAmount, 0, intMonth, intYear,
                                  prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod);

                            //Added Dann <<< pENSION
                            //Update Balance on PR Period Transaction Table with Pension Contributed from Employer

                            PRPeriodTrans.Reset();
                            PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", strEmpCode);
                            PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", prEmployeeTransactions."Transaction Code");
                            PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
                            if PRPeriodTrans.Find('-') then begin
                                PRPeriodTrans2.Reset();
                                PRPeriodTrans2.SetCurrentKey("Employee Code", "Period Month", "Period Year", "Group Order", "Sub Group Order", "Payslip Order", Membership, "Reference No");
                                PRPeriodTrans2.SetRange(PRPeriodTrans2."Transaction Code", 'D162');
                                PRPeriodTrans2.SetRange(PRPeriodTrans2."Employee Code", strEmpCode);
                                if PRPeriodTrans2.Find('-') then begin
                                    PRPeriodTrans2.CalcSums(PRPeriodTrans2.Amount);
                                    PRPeriodTrans.Balance := PRPeriodTrans2.Amount;
                                    PRPeriodTrans.Modify();
                                end;
                            end;
                            //Added Dann

                        end;
                    end;

                until prEmployeeTransactions.Next() = 0;

                //GET TOTAL DEDUCTIONS
                //error('%1',curPAYE + curNSSF + curNHIF+curTotalDeductions);
                curTransBalance := 0;
                strTransCode := 'TOT-DED';
                strTransDescription := 'TOTAL DEDUCTION';
                TGroup := 'DEDUCTIONS';
                TGroupOrder := 8;
                TSubGroupOrder := 9;
                fnUpdatePeriodTrans(strEmpCode, strTransCode, TGroup, TGroupOrder, TSubGroupOrder,
                  strTransDescription, (curTotalDeductions + curPAYE + curNSSF + curNHIF + CurrHSE), curTransBalance, intMonth, intYear,
                  prEmployeeTransactions.Membership, prEmployeeTransactions."Reference No", SelectedPeriod, Dept,
                  '', JournalPostAs::Credit, JournalPostingType::" ", '', CoopParameters::none);

                //END GET TOTAL DEDUCTIONS


            end;





            //Net Pay: calculate the Net pay for the month in the following manner:
            //>Nett = Gross - (xNssfAmount + curMyNhifAmt + PAYE + PayeArrears + prTotDeductions)
            //...Tot Deductions also include (SumLoan + SumInterest)
            curNetPay := curGrossPay - (curNSSF + curNHIF + curPAYE + CurrHSE + curPayeArrears + curTotalDeductions);//-curIncludeinNet;
                                                                                                                     //curNetPay:=curNetPay+curIncludeinNet;
                                                                                                                     //>Nett = Nett - curExcessPension
                                                                                                                     //...Excess pension is only used for tax. Staff is not paid the amount hence substract it
            curNetPay := curNetPay; //- curExcessPension

            //>Nett = Nett - cSumEmployerDeductions
            //...Employer Deductions are used for reporting as cost to company BUT dont affect Net pay
            curNetPay := curNetPay - curTotCompanyDed; //******Get Company Deduction*****
                                                       //Added for NLC                                                                         strEmpCodestrEmpCode
            if PersonalRelief_1 > TaxCharged_1 then
                curNetPay := curNetPay - (PersonalRelief_1 - TaxCharged_1);
            //Added for NLC

            /*
             //to ensure the netpay does not go below the athird rule hk
             //Third Rule here;
            IF   curNetPay <(1/3* curBasicPay)   THEN
             ERROR('Total deductions must not be more than 1/3 of basic pay %1',(FORMAT( 1/3* curBasicPay))+' '+'for employee'+' '+strEmpCode);
            */

            curNetRnd_Effect := curNetPay - curNetPay;
            ////curNetRnd_Effect := curNetPay - ROUND(curNetPay);
            //greencom
            curNetPay := Round(curNetPay, 1, '>');
            ////curNetPay:=curNetPay;
            curTransAmount := curNetPay;
            strTransDescription := 'Net Pay';
            TGroup := 'NET PAY';
            TGroupOrder := 9;
            TSubGroupOrder := 0;

            //IF curNetPay < 0 THEN ERROR('Net Pay for Employee No. %1 is %2',strEmpCode, curNetPay);

            fnUpdatePeriodTrans(strEmpCode, 'NPAY', TGroup, TGroupOrder, TSubGroupOrder, strTransDescription,
            curTransAmount, 0, intMonth, intYear, '', '', SelectedPeriod, Dept, PayablesAcc, JournalPostAs::Credit, JournalPostingType::"G/L Account", '', CoopParameters::none);

            //  //*************************************************************************************************************
            //  //Added: DW. To Update PR Staff Bank Transactions with Net Pay Amounts that are transfered to Individual Banks

            //  fnUpdateStaffBankTrans(strEmpCode, 'NPAY',strTransDescription,curTransAmount,
            //                        intMonth, intYear,SelectedPeriod,Dept);


            //  //*************************************************************************************************************
        end;

    end;


    procedure fnBasicPayProrated(strEmpCode: Code[20]; Month: Integer; Year: Integer; BasicSalary: Decimal; DaysWorked: Integer; DaysInMonth: Integer) ProratedAmt: Decimal
    begin
        ProratedAmt := Round((DaysWorked / DaysInMonth) * BasicSalary, 1, '<');
    end;


    procedure fnDaysInMonth(dtDate: Date) DaysInMonth: Integer
    var
        Day: Integer;
        SysDate: Record Date;
        Expr1: Text[30];
        FirstDay: Date;
        LastDate: Date;
        TodayDate: Date;
    begin
        TodayDate := dtDate;

        Day := Date2DMY(TodayDate, 1);
        Expr1 := Format(-Day) + 'D+1D';
        FirstDay := CalcDate(Expr1, TodayDate);
        LastDate := CalcDate('1M-1D', FirstDay);

        SysDate.Reset();
        SysDate.SetRange(SysDate."Period Type", SysDate."Period Type"::Date);
        SysDate.SetRange(SysDate."Period Start", FirstDay, LastDate);
        SysDate.SetFilter(SysDate."Period No.", '1..7');
        if SysDate.Find('-') then
            DaysInMonth := SysDate.Count;
    end;


    procedure fnUpdatePeriodTrans(EmpCode: Code[20]; TCode: Code[20]; TGroup: Code[20]; GroupOrder: Integer; SubGroupOrder: Integer; Description: Text[50]; curAmount: Decimal; curBalance: Decimal; Month: Integer; Year: Integer; mMembership: Text[30]; ReferenceNo: Text[30]; dtOpenPeriod: Date; Department: Code[50]; JournalAC: Code[20]; PostAs: Option " ",Debit,Credit; JournalACType: Option " ","G/L Account",Customer,Vendor; LoanNo: Code[10]; CoopParam: Option none,shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension)
    var
        PRPeriodTransactions: Record "PR Period Transactions";
        HRBankAccounts: Record "HR Employee Bank Accounts";
    begin
        //******************************************************************************************************************************************
        // Added Dann. for Multiple bank A/Cs
        //******************************************************************************************************************************************
        if TCode = 'NPAY' then begin
            //HOSEA
            HRBankAccounts.Reset();
            HRBankAccounts.SetRange(HRBankAccounts."Employee Code", EmpCode);
            if HRBankAccounts.Find('-') then
                repeat
                    /*
                     HRBankAccounts.TESTFIELD(HRBankAccounts."Bank  Code");
                     HRBankAccounts.TESTFIELD(HRBankAccounts."Branch Code");
                     HRBankAccounts.TESTFIELD(HRBankAccounts."Percentage to Transfer");
                     HRBankAccounts.TESTFIELD(HRBankAccounts."A/C  Number");
                      */
                    if HRBankAccounts."Bank  Code" <> '' then begin
                        HRBankSummary.Reset();
                        HRBankSummary.Init();

                        HRBankSummary."Line No." := GetLastEntryNo();
                        HRBankSummary."Bank Code" := HRBankAccounts."Bank  Code";
                        HRBankSummary."Branch Code" := HRBankAccounts."Branch Code";
                        HRBankSummary."Payroll Period" := dtOpenPeriod;
                        //greencom
                        ////HRBankSummary.Amount:=(curAmount * HRBankAccounts."Percentage to Transfer"/100);
                        HRBankSummary.Amount := Round((curAmount * HRBankAccounts."Percentage to Transfer" / 100), 0.05, '=');

                        HRBankSummary."Transaction Code" := 'NPAY';
                        HRBankSummary."Staff No." := EmpCode;
                        HRBankSummary."A/C Number" := HRBankAccounts."A/C  Number";
                        HRBankSummary."Bank Name" := HRBankAccounts."Bank Name";
                        HRBankSummary."Branch Name" := HRBankAccounts."Branch Name";
                        HRBankSummary."Posting Date" := Today;
                        HRBankSummary."% NPAY" := HRBankAccounts."Percentage to Transfer";
                        if HRBankSummary.Amount <> 0 then
                            HRBankSummary.Insert();
                    end;
                until HRBankAccounts.Next() = 0
            else// HOSEA


                ;
            //ERROR('No Bank A/C has been specified for [Employee No %1]',EmpCode);
        end;
        //******************************************************************************************************************************************
        //******************************************************************************************************************************************

        if curAmount = 0 then
            exit;
        begin
            PRPeriodTransactions.Init();
            PRPeriodTransactions."Employee Code" := EmpCode;
            PRPeriodTransactions."Transaction Code" := TCode;
            PRPeriodTransactions."Group Text" := TGroup;
            PRPeriodTransactions."Transaction Name" := Description;
            PRPeriodTransactions.Amount := curAmount;
            PRPeriodTransactions.Balance := curBalance;
            PRPeriodTransactions."Original Amount" := PRPeriodTransactions.Balance;

            PRPeriodTransactions."Group Order" := GroupOrder;
            PRPeriodTransactions."Sub Group Order" := SubGroupOrder;
            PRPeriodTransactions.Membership := mMembership;
            PRPeriodTransactions."Reference No" := ReferenceNo;
            PRPeriodTransactions."Period Month" := Month;
            PRPeriodTransactions."Period Year" := Year;
            PRPeriodTransactions."Payroll Period" := dtOpenPeriod;
            PRPeriodTransactions."Department Code" := PRPeriodTransactions.Department;
            PRPeriodTransactions."Journal Account Type" := JournalACType;
            PRPeriodTransactions."Post As" := PostAs;
            PRPeriodTransactions."Journal Account Code" := JournalAC;
            PRPeriodTransactions."Loan Number" := LoanNo;
            PRPeriodTransactions."coop parameters" := CoopParam;
            //DW
            //Insert Scheme Code and Contract Type for each Trans Being Updated
            HREmp2.Reset();
            if HREmp2.Get(EmpCode) then begin
                PRPeriodTransactions."Global Dimension 1 Code" := HREmp2."Global Dimension 1 Code";
                PRPeriodTransactions."Contract Type" := HREmp2."Contract Type";
            end;
            //Insert Transaction Type (Either "Income or Deduction") for each Trans Being Updated
            if PRTransCode.Get(TCode) then
                PRPeriodTransactions."Transaction Type" := PRTransCode."Transaction Type";

            PRPeriodTransactions.Insert();

            //Update the prEmployee Transactions  with the Amount
            fnUpdateEmployeeTrans(PRPeriodTransactions."Employee Code", PRPeriodTransactions."Transaction Code", PRPeriodTransactions.Amount, PRPeriodTransactions."Period Month", PRPeriodTransactions."Period Year", PRPeriodTransactions."Payroll Period");
        end;

    end;


    procedure fnGetSpecialTransAmount(strEmpCode: Code[20]; intMonth: Integer; intYear: Integer; intSpecTransID: Option Ignore,"Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan","Value of Quarters",Mortgage,Pension,"Mortgage Relief"; blnCompDedc: Boolean) SpecialTransAmount: Decimal
    var
        prEmployeeTransactions: Record "PR Employee Transactions";
        prTransactionCodes: Record "PR Transaction Codes";
        strExtractedFrml: Text[250];
        MortgageInterest: Decimal;
        MortgageRelief: Decimal;
    begin
        SpecialTransAmount := 0;
        prTransactionCodes.Reset();
        prTransactionCodes.SetRange(prTransactionCodes."Special Transactions", intSpecTransID);
        if prTransactionCodes.Find('-') then
            repeat
                prEmployeeTransactions.Reset();
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Transaction Code", prTransactionCodes."Transaction Code");
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
                prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
                prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added DW to not process Stopped Transactions
                if prEmployeeTransactions.Find('-') then

                    //Ignore,Defined Contribution,Home Ownership Savings Plan,Life Insurance,
                    //Owner Occupier Interest,Prescribed Benefit,Salary Arrears,Staff Loan,Value of Quarters
                    case intSpecTransID of
                        intSpecTransID::"Defined Contribution":
                            if prTransactionCodes."Is Formula" then begin
                                strExtractedFrml := '';
                                strExtractedFrml := fnPureFormula(strEmpCode, intMonth, intYear, prTransactionCodes.Formula);
                                SpecialTransAmount := SpecialTransAmount + (fnFormulaResult(strExtractedFrml)); //Get the calculated amount for the Special Transaction
                            end else
                                SpecialTransAmount := SpecialTransAmount + prEmployeeTransactions.Amount;

                        intSpecTransID::"Life Insurance":
                            SpecialTransAmount := SpecialTransAmount + ((curReliefInsurance / 100) * prEmployeeTransactions.Amount);
                        intSpecTransID::"Owner Occupier Interest":
                            SpecialTransAmount := SpecialTransAmount + prEmployeeTransactions.Amount;


                        intSpecTransID::"Home Ownership Savings Plan":
                            begin
                                SpecialTransAmount := SpecialTransAmount + prEmployeeTransactions.Amount;
                                //Modified Dann
                                if SpecialTransAmount > 4000 then
                                    SpecialTransAmount := 4000;
                            end;
                        intSpecTransID::Pension:
                            begin
                                SpecialTransAmount := SpecialTransAmount + ((curReliefPension / 100) * prEmployeeTransactions.Amount);
                                if SpecialTransAmount > curMaxPensionContrib then
                                    SpecialTransAmount := curMaxPensionContrib
                            end;


                        intSpecTransID::Mortgage:
                            begin

                                //Nathan Mortgage
                                SpecialTransAmount := SpecialTransAmount + prEmployeeTransactions.Amount;

                                //SpecialTransAmount :=SpecialTransAmount+ curReliefMorgage;

                                if SpecialTransAmount > curReliefMorgage then
                                    SpecialTransAmount := curReliefMorgage;
                            end;

                        //Dann
                        intSpecTransID::"Mortgage Relief":
                            begin
                                //Intrest = 6%/12 * Curr Balance
                                MortgageInterest := (0.06 / 12) * prEmployeeTransactions.Balance;

                                if MortgageInterest < curReliefMorgage then
                                    // MortgageRelief:=0.3 * MortgageInterest;
                                    MortgageRelief := MortgageInterest;

                                if MortgageInterest > curReliefMorgage then
                                    //MortgageRelief:=0.3 * curReliefMorgage;
                                    MortgageRelief := curReliefMorgage;

                                SpecialTransAmount := MortgageRelief;
                            end;
                    //Dann

                    end;
            until prTransactionCodes.Next() = 0;
    end;


    procedure fnGetEmployeePaye(curTaxablePay: Decimal) PAYE: Decimal
    var
        prPAYE: Record "PR PAYE";
        curTempAmount: Decimal;
        KeepCount: Integer;
    begin
        KeepCount := 0;
        prPAYE.Reset();
        if prPAYE.FindFirst() then begin
            if curTaxablePay < prPAYE."PAYE Tier" then
                exit;
            repeat
                KeepCount += 1;
                curTempAmount := curTaxablePay;
                if curTaxablePay = 0 then
                    exit;
                if KeepCount = prPAYE.Count then   //this is the last record or loop
                    curTaxablePay := curTempAmount
                else
                    if curTempAmount >= prPAYE."PAYE Tier" then
                        curTempAmount := prPAYE."PAYE Tier"
                    else
                        curTempAmount := curTempAmount;

                PAYE := PAYE + (curTempAmount * (prPAYE.Rate / 100));
                curTaxablePay := curTaxablePay - curTempAmount;

            until prPAYE.Next() = 0;
        end;
    end;


    procedure fnGetEmployeeNHIF(curBaseAmount: Decimal) NHIF: Decimal
    var
        prNHIF: Record "PR NHIF";
    begin
        prNHIF.Reset();
        prNHIF.SetCurrentKey(prNHIF."Tier Code");
        if prNHIF.FindFirst() then
            repeat
                if ((curBaseAmount >= prNHIF."Lower Limit") and (curBaseAmount <= prNHIF."Upper Limit")) then
                    NHIF := prNHIF.Amount;
            until prNHIF.Next() = 0;
    end;


    procedure fnPureFormula(strEmpCode: Code[20]; intMonth: Integer; intYear: Integer; strFormula: Text[250]) Formula: Text[250]
    var
        Where: Text[30];
        Which: Text[30];
        i: Integer;
        TransCode: Code[20];
        Char: Text[1];
        FirstBracket: Integer;
        StartCopy: Boolean;
        FinalFormula: Text[250];
        TransCodeAmount: Decimal;
        AccSchedLine: Record "Acc. Schedule Line";
        ColumnLayout: Record "Column Layout";
        CalcAddCurr: Boolean;
        AccSchedMgt: Codeunit AccSchedManagement;
    begin
        TransCode := '';
        for i := 1 to StrLen(strFormula) do begin
            Char := CopyStr(strFormula, i, 1);
            if Char = '[' then
                StartCopy := true;

            if StartCopy then
                TransCode := TransCode + Char;
            //Copy Characters as long as is not within []
            if not StartCopy then
                FinalFormula := FinalFormula + Char;
            if Char = ']' then begin
                StartCopy := false;
                //Get Transcode
                Where := '=';
                Which := '[]';
                TransCode := DelChr(TransCode, Where, Which);
                //Get TransCodeAmount
                TransCodeAmount := fnGetTransAmount(strEmpCode, TransCode, intMonth, intYear);
                //Reset Transcode
                TransCode := '';
                //Get Final Formula
                FinalFormula := FinalFormula + Format(TransCodeAmount);
                //End Get Transcode
            end;
        end;
        Formula := FinalFormula;
    end;


    procedure fnGetTransAmount(strEmpCode: Code[20]; strTransCode: Code[20]; intMonth: Integer; intYear: Integer) TransAmount: Decimal
    var
        prEmployeeTransactions: Record "PR Employee Transactions";
        prPeriodTransactions: Record "PR Period Transactions";
    begin
        prEmployeeTransactions.Reset();
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Employee Code", strEmpCode);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Transaction Code", strTransCode);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
        prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added DW to not process Stopped Transactions
        if prEmployeeTransactions.FindFirst() then
            TransAmount := prEmployeeTransactions.Amount;

        if TransAmount = 0 then begin
            prPeriodTransactions.Reset();
            prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", strEmpCode);
            prPeriodTransactions.SetRange(prPeriodTransactions."Transaction Code", strTransCode);
            prPeriodTransactions.SetRange(prPeriodTransactions."Period Month", intMonth);
            prPeriodTransactions.SetRange(prPeriodTransactions."Period Year", intYear);
            if prPeriodTransactions.FindFirst() then
                TransAmount := prPeriodTransactions.Amount;
        end;
    end;


    procedure fnFormulaResult(strFormula: Text[250]) Results: Decimal
    var
        AccSchedLine: Record "Acc. Schedule Line";
        ColumnLayout: Record "Column Layout";
        CalcAddCurr: Boolean;
        AccSchedMgt: Codeunit AccSchedManagement;
    begin
        Results := AccSchedMgt.EvaluateExpression(true, strFormula, AccSchedLine, ColumnLayout, CalcAddCurr);
    end;


    procedure fnClosePayrollPeriod(dtOpenPeriod: Date) Closed: Boolean
    var
        dtNewPeriod: Date;
        intNewMonth: Integer;
        intNewYear: Integer;
        prEmployeeTransactions: Record "PR Employee Transactions";
        prPeriodTransactions: Record "PR Period Transactions";
        intMonth: Integer;
        intYear: Integer;
        prTransactionCodes: Record "PR Transaction Codes";
        curTransAmount: Decimal;
        curTransBalance: Decimal;
        prEmployeeTrans: Record "PR Employee Transactions";
        prPayrollPeriods: Record "PR Payroll Periods";
        prNewPayrollPeriods: Record "PR Payroll Periods";
        CreateTrans: Boolean;
    begin
        //MESSAGE('Also include function to reset No. of days worked');
        dtNewPeriod := CalcDate('1M', dtOpenPeriod);
        intNewMonth := Date2DMY(dtNewPeriod, 2);
        intNewYear := Date2DMY(dtNewPeriod, 3);
        intMonth := Date2DMY(dtOpenPeriod, 2);
        intYear := Date2DMY(dtOpenPeriod, 3);

        prEmployeeTransactions.Reset();
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Month", intMonth);
        prEmployeeTransactions.SetRange(prEmployeeTransactions."Period Year", intYear);
        prEmployeeTransactions.SetRange(prEmployeeTransactions.Stopped, false); //Added DW to not process Stopped Transactions
        if prEmployeeTransactions.Find('-') then
            repeat
                prTransactionCodes.Reset();
                prTransactionCodes.SetRange(prTransactionCodes."Transaction Code", prEmployeeTransactions."Transaction Code");
                if prTransactionCodes.Find('-') then
                    case prTransactionCodes."Balance Type" of
                        prTransactionCodes."Balance Type"::None:
                            begin
                                curTransAmount := prEmployeeTransactions.Amount;
                                curTransBalance := 0;
                            end;
                        prTransactionCodes."Balance Type"::Increasing:
                            begin
                                curTransAmount := prEmployeeTransactions.Amount;
                                curTransBalance := prEmployeeTransactions.Balance + prEmployeeTransactions.Amount;
                                //****
                                //Added DW to Include Subledger and Subledger Account for the next period
                                if prEmployeeTransactions.Subledger <> prEmployeeTransactions.Subledger::" " then begin
                                    curTransSubledger := prEmployeeTransactions.Subledger;
                                    curTransSubledgerAccount := prEmployeeTransactions."Subledger Account";
                                end;
                                //****

                            end;
                        prTransactionCodes."Balance Type"::Reducing:
                            begin
                                curTransAmount := prEmployeeTransactions.Amount;
                                if prEmployeeTransactions.Balance < prEmployeeTransactions.Amount then begin
                                    curTransAmount := prEmployeeTransactions.Balance;
                                    curTransBalance := 0;
                                end else
                                    curTransBalance := prEmployeeTransactions.Balance - prEmployeeTransactions.Amount;
                                if curTransBalance < 0 then begin
                                    curTransAmount := 0;
                                    curTransBalance := 0;
                                end;
                            end;
                    end;

                //For those transactions with Start and End Date Specified
                if (prEmployeeTransactions."Start Date" <> 0D) and (prEmployeeTransactions."End Date" <> 0D) then
                    if prEmployeeTransactions."End Date" < dtNewPeriod then begin
                        curTransAmount := 0;
                        curTransBalance := 0;
                    end;
                //End Transactions with Start and End Date

                if (prTransactionCodes.Frequency = prTransactionCodes.Frequency::Fixed) and
                   (prEmployeeTransactions."Stop for Next Period" = false) then //DENNO ADDED THIS TO CHECK FREQUENCY AND STOP IF MARKED


                    if (curTransAmount <> 0) then  //Update the employee transaction table
                     begin
                        if ((prTransactionCodes."Balance Type" = prTransactionCodes."Balance Type"::Reducing) and (curTransBalance <> 0)) or
                         (prTransactionCodes."Balance Type" <> prTransactionCodes."Balance Type"::Reducing) then
                            prEmployeeTransactions.Balance := curTransBalance;
                        prEmployeeTransactions.Modify();


                        //Insert record for the next period
                        begin
                            prEmployeeTrans.Init();
                            prEmployeeTrans."Employee Code" := prEmployeeTransactions."Employee Code";
                            prEmployeeTrans."Transaction Code" := prEmployeeTransactions."Transaction Code";
                            prEmployeeTrans."Transaction Name" := prEmployeeTransactions."Transaction Name";
                            prEmployeeTrans.Amount := curTransAmount;
                            prEmployeeTrans.Balance := curTransBalance;
                            prEmployeeTrans."Amortized Loan Total Repay Amt" := prEmployeeTransactions."Amortized Loan Total Repay Amt";
                            prEmployeeTrans."Original Amount" := prEmployeeTransactions."Original Amount";
                            prEmployeeTrans.Membership := prEmployeeTransactions.Membership;
                            prEmployeeTrans."Reference No" := prEmployeeTransactions."Reference No";
                            prEmployeeTrans."Period Month" := intNewMonth;
                            prEmployeeTrans."Period Year" := intNewYear;
                            prEmployeeTrans."Payroll Period" := dtNewPeriod;
                            //****
                            //Added DW to Insert Subledger and Subledger Account for the next period
                            if curTransSubledger <> curTransSubledger::" " then begin
                                prEmployeeTrans.Subledger := curTransSubledger;
                                prEmployeeTrans."Subledger Account" := curTransSubledgerAccount;

                            end;
                            //****
                            /*
                         "Loan Number":=
                         "Reference No":=
                            */
                            prEmployeeTrans.Insert();
                        end;
                    end;
            until prEmployeeTransactions.Next() = 0;

        //Update the Period as Closed
        prPayrollPeriods.Reset();
        prPayrollPeriods.SetRange(prPayrollPeriods."Period Month", intMonth);
        prPayrollPeriods.SetRange(prPayrollPeriods."Period Year", intYear);
        prPayrollPeriods.SetRange(prPayrollPeriods.Closed, false);
        if prPayrollPeriods.Find('-') then begin
            prPayrollPeriods.Closed := true;
            prPayrollPeriods."Date Closed" := Today;
            prPayrollPeriods."Closed By" := UserId;
            prPayrollPeriods.Modify();
        end;

        //Enter a New Period
        begin
            prNewPayrollPeriods.Init();
            prNewPayrollPeriods."Period Month" := intNewMonth;
            prNewPayrollPeriods."Period Year" := intNewYear;
            prNewPayrollPeriods."Period Name" := Format(dtNewPeriod, 0, '<Month Text>') + ' ' + Format(intNewYear);
            prNewPayrollPeriods."Date Opened" := dtNewPeriod;
            prNewPayrollPeriods."Opened By" := UserId;
            prNewPayrollPeriods.Closed := false;
            prNewPayrollPeriods.Insert();
        end;

        //Effect the transactions for the P9
        fnP9PeriodClosure(intMonth, intYear, dtOpenPeriod);

        //Take all the Negative pay (Net) for the current month & treat it as a deduction in the new period
        fnGetNegativePay(intMonth, intYear, dtOpenPeriod);

        //Effect the creation of Employee Banks into the Employee Banks table
        fnCreateBankAccountInfo(intMonth, intYear, dtOpenPeriod);

        /*{
        //Effect Creation of Employee Info into the Employee Info changes table
        fnCreateHREmployeeInfo(intMonth,intYear,dtOpenPeriod);
        }*/

        /*
        //Reset no. of days worked for casuals
        PRSalCard.RESET;
        PRSalCard.SETRANGE(PRSalCard."Employee Contract Type",'CASUALS');
        IF PRSalCard.FIND('-') THEN
        BEGIN
            REPEAT
                PRSalCard."No. of Days Worked":=0;
                PRSalCard.MODIFY;
            UNTIL PRSalCard.NEXT = 0;
        END;
        */


        /*{
        //MESSAGE('Also include function to reset No. of days worked');
        dtNewPeriod := CALCDATE('1M', dtOpenPeriod);
        intNewMonth := DATE2DMY(dtNewPeriod,2);
        intNewYear := DATE2DMY(dtNewPeriod,3);

        intMonth := DATE2DMY(dtOpenPeriod,2);
        intYear := DATE2DMY(dtOpenPeriod,3);

        {{
        prEmployeeTransactions.RESET;
        prEmployeeTransactions.SETRANGE(prEmployeeTransactions."Period Month",intMonth);
        prEmployeeTransactions.SETRANGE(prEmployeeTransactions."Period Year",intYear);
        prEmployeeTransactions.SETRANGE(prEmployeeTransactions.Stopped,FALSE); //Added DW to not process Stopped Transactions
        IF prEmployeeTransactions.FIND('-') THEN BEGIN
          REPEAT
           prTransactionCodes.RESET;
           prTransactionCodes.SETRANGE(prTransactionCodes."Transaction Code",prEmployeeTransactions."Transaction Code");
           IF prTransactionCodes.FIND('-') THEN BEGIN
            WITH prTransactionCodes DO BEGIN
              CASE prTransactionCodes."Balance Type" OF
                prTransactionCodes."Balance Type"::None:
                 BEGIN
                  curTransAmount:= prEmployeeTransactions.Amount;
                  curTransBalance:= 0;
                 END;
                prTransactionCodes."Balance Type"::Increasing:
                 BEGIN
                   curTransAmount := prEmployeeTransactions.Amount;
                   curTransBalance := prEmployeeTransactions.Balance + prEmployeeTransactions.Amount;
                   //****
                   //Added DW to Include Subledger and Subledger Account for the next period
                   IF prEmployeeTransactions.Subledger <> prEmployeeTransactions.Subledger::" " THEN
                   BEGIN
                      curTransSubledger:=prEmployeeTransactions.Subledger;
                      curTransSubledgerAccount:=prEmployeeTransactions."Subledger Account";
                   END;
                   //****

                 END;
                prTransactionCodes."Balance Type"::Reducing:
                 BEGIN
                   curTransAmount := prEmployeeTransactions.Amount;
                   IF prEmployeeTransactions.Balance < prEmployeeTransactions.Amount THEN BEGIN
                       curTransAmount := prEmployeeTransactions.Balance;
                       curTransBalance := 0;
                   END ELSE BEGIN
                       curTransBalance := prEmployeeTransactions.Balance - prEmployeeTransactions.Amount;
                   END;
                   IF curTransBalance < 0 THEN
                    BEGIN
                       curTransAmount:=0;
                       curTransBalance:=0;
                    END;
                  END;
              END;
            END;
           END;

            //For those transactions with Start and End Date Specified
               IF (prEmployeeTransactions."Start Date"<>0D) AND (prEmployeeTransactions."End Date"<>0D) THEN BEGIN
                   IF prEmployeeTransactions."End Date"<dtNewPeriod THEN BEGIN
                       curTransAmount:=0;
                       curTransBalance:=0;
                   END;
               END;
            //End Transactions with Start and End Date

          IF (prTransactionCodes.Frequency=prTransactionCodes.Frequency::Fixed) AND
             (prEmployeeTransactions."Stop for Next Period"=FALSE) THEN //DENNO ADDED THIS TO CHECK FREQUENCY AND STOP IF MARKED
           BEGIN
            IF (curTransAmount <> 0) THEN  //Update the employee transaction table
             BEGIN
             IF ((prTransactionCodes."Balance Type"=prTransactionCodes."Balance Type"::Reducing) AND (curTransBalance <> 0)) OR
              (prTransactionCodes."Balance Type"<>prTransactionCodes."Balance Type"::Reducing) THEN
              prEmployeeTransactions.Balance:=curTransBalance;
              prEmployeeTransactions.MODIFY;


           //Insert record for the next period
            WITH prEmployeeTrans DO BEGIN
               INIT;
              "Employee Code":= prEmployeeTransactions."Employee Code";
              "Transaction Code":= prEmployeeTransactions."Transaction Code";
              "Transaction Name":= prEmployeeTransactions."Transaction Name";
               Amount:= curTransAmount;
               Balance:= curTransBalance;
              "Amortized Loan Total Repay Amt":=prEmployeeTransactions. "Amortized Loan Total Repay Amt";
              "Original Amount":= prEmployeeTransactions."Original Amount";
               Membership:= prEmployeeTransactions.Membership;
              "Reference No":= prEmployeeTransactions."Reference No";
              "Period Month":= intNewMonth;
              "Period Year":= intNewYear;
              "Payroll Period":= dtNewPeriod;
               //****
               //Added DW to Insert Subledger and Subledger Account for the next period
               IF curTransSubledger <> curTransSubledger::" " THEN
               BEGIN
                Subledger:=curTransSubledger;
               "Subledger Account":=curTransSubledgerAccount;

               END;
               //****

               {
               "Loan Number":=
               "Reference No":=
               }

               INSERT;
             END;
          END;
          END
          UNTIL prEmployeeTransactions.NEXT=0;
        END;

        //Update the Period as Closed
        prPayrollPeriods.RESET;
        prPayrollPeriods.SETRANGE(prPayrollPeriods."Period Month",intMonth);
        prPayrollPeriods.SETRANGE(prPayrollPeriods."Period Year",intYear);
        prPayrollPeriods.SETRANGE(prPayrollPeriods.Closed,FALSE);
        IF prPayrollPeriods.FIND('-') THEN BEGIN
           prPayrollPeriods.Closed:=TRUE;
           prPayrollPeriods."Date Closed":=TODAY;
           prPayrollPeriods."Closed By":=USERID;
           prPayrollPeriods.MODIFY;
        END;

        //Enter a New Period
        WITH prNewPayrollPeriods DO BEGIN
          INIT;
            "Period Month":=intNewMonth;
            "Period Year":= intNewYear;
            "Period Name":= FORMAT(dtNewPeriod,0,'<Month Text>')+' '+FORMAT(intNewYear);
            "Date Opened":= dtNewPeriod;
            "Opened By":=USERID;
             Closed :=FALSE;
            INSERT;
        END;

        //Effect the transactions for the P9
        fnP9PeriodClosure (intMonth, intYear, dtOpenPeriod);

        //Take all the Negative pay (Net) for the current month & treat it as a deduction in the new period
        fnGetNegativePay(intMonth, intYear,dtOpenPeriod);
        }}

        //Effect Creation of Employee Info into the Employee Info changes table
        fnCreateHREmployeeInfo(intMonth,intYear,dtOpenPeriod);

        //Effect the creation of Employee Banks into the Employee Banks table
        fnCreateBankAccountInfo(intMonth, intYear,dtOpenPeriod)


        {
        //Reset no. of days worked for casuals
        PRSalCard.RESET;
        PRSalCard.SETRANGE(PRSalCard."Employee Contract Type",'CASUALS');
        IF PRSalCard.FIND('-') THEN
        BEGIN
            REPEAT
                PRSalCard."No. of Days Worked":=0;
                PRSalCard.MODIFY;
            UNTIL PRSalCard.NEXT = 0;
        END;
        }
        }*/

    end;


    procedure fnGetNegativePay(intMonth: Integer; intYear: Integer; dtOpenPeriod: Date)
    var
        prPeriodTransactions: Record "PR Period Transactions";
        prEmployeeTransactions: Record "PR Employee Transactions";
        intNewMonth: Integer;
        intNewYear: Integer;
        dtNewPeriod: Date;
    begin
        dtNewPeriod := CalcDate('1M', dtOpenPeriod);
        intNewMonth := Date2DMY(dtNewPeriod, 2);
        intNewYear := Date2DMY(dtNewPeriod, 3);

        prPeriodTransactions.Reset();
        prPeriodTransactions.SetRange(prPeriodTransactions."Period Month", intMonth);
        prPeriodTransactions.SetRange(prPeriodTransactions."Period Year", intYear);
        prPeriodTransactions.SetRange(prPeriodTransactions."Group Order", 9);
        prPeriodTransactions.SetFilter(prPeriodTransactions.Amount, '<0');

        if prPeriodTransactions.Find('-') then
            repeat
            begin
                prEmployeeTransactions.Init();
                prEmployeeTransactions."Employee Code" := prPeriodTransactions."Employee Code";
                prEmployeeTransactions."Transaction Code" := 'NEGP';
                prEmployeeTransactions."Transaction Name" := 'Negative Pay';
                prEmployeeTransactions.Amount := prPeriodTransactions.Amount;
                prEmployeeTransactions.Balance := 0;
                prEmployeeTransactions."Original Amount" := 0;
                prEmployeeTransactions."Period Month" := intNewMonth;
                prEmployeeTransactions."Period Year" := intNewYear;
                prEmployeeTransactions."Payroll Period" := dtNewPeriod;
                prEmployeeTransactions.Insert();
            end;
            until prPeriodTransactions.Next() = 0;
    end;


    procedure fnP9PeriodClosure(intMonth: Integer; intYear: Integer; dtCurPeriod: Date)
    var
        P9EmployeeCode: Code[20];
        P9BasicPay: Decimal;
        P9Allowances: Decimal;
        P9Benefits: Decimal;
        P9ValueOfQuarters: Decimal;
        P9DefinedContribution: Decimal;
        P9OwnerOccupierInterest: Decimal;
        P9GrossPay: Decimal;
        P9TaxablePay: Decimal;
        P9TaxCharged: Decimal;
        P9InsuranceRelief: Decimal;
        P9TaxRelief: Decimal;
        P9Paye: Decimal;
        P9NSSF: Decimal;
        P9NHIF: Decimal;
        P9Deductions: Decimal;
        P9NetPay: Decimal;
        prPeriodTransactions: Record "PR Period Transactions";
        prEmployee: Record "HR Employees";
        P9NHIFRelief: Decimal;
    begin
        P9BasicPay := 0;
        P9Allowances := 0;
        P9Benefits := 0;
        P9ValueOfQuarters := 0;
        P9DefinedContribution := 0;
        P9OwnerOccupierInterest := 0;
        P9GrossPay := 0;
        P9TaxablePay := 0;
        P9TaxCharged := 0;
        P9InsuranceRelief := 0;
        P9TaxRelief := 0;
        P9Paye := 0;
        P9NSSF := 0;
        P9NHIF := 0;
        P9Deductions := 0;
        P9NetPay := 0;
        P9NHIFRelief := 0;

        prEmployee.Reset();
        prEmployee.SetRange(prEmployee.Status, prEmployee.Status::Active);
        //prEmployee.SETFILTER(prEmployee."Employee Contract Type",'<>%1','CASUALS'); //Remove
        if prEmployee.Find('-') then
            repeat

                P9BasicPay := 0;
                P9Allowances := 0;
                P9Benefits := 0;
                P9ValueOfQuarters := 0;
                P9DefinedContribution := 0;
                P9OwnerOccupierInterest := 0;
                P9GrossPay := 0;
                P9TaxablePay := 0;
                P9TaxCharged := 0;
                P9InsuranceRelief := 0;
                P9TaxRelief := 0;
                P9Paye := 0;
                P9NSSF := 0;
                P9NHIF := 0;
                P9Deductions := 0;
                P9NetPay := 0;
                P9NHIFRelief := 0;

                prPeriodTransactions.Reset();
                prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", prEmployee."No.");
                prPeriodTransactions.SetRange(prPeriodTransactions."Period Month", intMonth);
                prPeriodTransactions.SetRange(prPeriodTransactions."Period Year", intYear);
                if prPeriodTransactions.Find('-') then
                    repeat

                        case prPeriodTransactions."Group Order" of
                            1: //Basic pay & Arrears
                                begin
                                    if prPeriodTransactions."Sub Group Order" = 1 then
                                        P9BasicPay := prPeriodTransactions.Amount; //Basic Pay
                                    if prPeriodTransactions."Sub Group Order" = 2 then
                                        P9BasicPay := P9BasicPay + prPeriodTransactions.Amount; //Basic Pay Arrears
                                end;
                            3:  //Allowances


                                P9Allowances := P9Allowances + prPeriodTransactions.Amount;
                            4: //Gross Pay


                                P9GrossPay := prPeriodTransactions.Amount;
                            6: //Taxation
                                begin
                                    if prPeriodTransactions."Sub Group Order" = 1 then
                                        P9DefinedContribution := prPeriodTransactions.Amount; //Defined Contribution
                                    if prPeriodTransactions."Sub Group Order" = 9 then
                                        P9TaxRelief := prPeriodTransactions.Amount; //Tax Relief
                                    if prPeriodTransactions."Sub Group Order" = 8 then
                                        P9InsuranceRelief := prPeriodTransactions.Amount; //Insurance Relief
                                    if prPeriodTransactions."Sub Group Order" = 6 then
                                        P9TaxablePay := prPeriodTransactions.Amount; //Taxable Pay
                                    if prPeriodTransactions."Sub Group Order" = 7 then
                                        P9TaxCharged := prPeriodTransactions.Amount; //Tax Charged
                                    if prPeriodTransactions."Sub Group Order" = 10 then
                                        P9NHIFRelief := prPeriodTransactions.Amount; //NHIFRelief Charged
                                end;
                            7: //STATUTORY DEDUCTIONS
                                begin
                                    if prPeriodTransactions."Sub Group Order" = 1 then
                                        P9NSSF := prPeriodTransactions.Amount; //Nssf
                                    if prPeriodTransactions."Sub Group Order" = 2 then
                                        P9NHIF := prPeriodTransactions.Amount; //Nhif
                                    if prPeriodTransactions."Sub Group Order" = 3 then
                                        P9Paye := prPeriodTransactions.Amount; //paye
                                    if prPeriodTransactions."Sub Group Order" = 4 then
                                        P9Paye := P9Paye + prPeriodTransactions.Amount; //Paye Arrears
                                end;
                            8://Deductions


                                P9Deductions := P9Deductions + prPeriodTransactions.Amount;
                            9: //NetPay


                                P9NetPay := prPeriodTransactions.Amount;
                        end;
                    until prPeriodTransactions.Next() = 0;
                //Update the P9 Details
                if P9NetPay <> 0 then
                    fnUpdateP9Table(prEmployee."No.", P9BasicPay, P9Allowances, P9Benefits, P9ValueOfQuarters, P9DefinedContribution,
                        P9OwnerOccupierInterest, P9GrossPay, P9TaxablePay, P9TaxCharged, P9InsuranceRelief, P9TaxRelief, P9Paye, P9NSSF,
                        P9NHIF, P9Deductions, P9NetPay, P9NHIFRelief, dtCurPeriod);

            until prEmployee.Next() = 0;
    end;


    procedure fnUpdateP9Table(P9EmployeeCode: Code[20]; P9BasicPay: Decimal; P9Allowances: Decimal; P9Benefits: Decimal; P9ValueOfQuarters: Decimal; P9DefinedContribution: Decimal; P9OwnerOccupierInterest: Decimal; P9GrossPay: Decimal; P9TaxablePay: Decimal; P9TaxCharged: Decimal; P9InsuranceRelief: Decimal; P9TaxRelief: Decimal; P9Paye: Decimal; P9NSSF: Decimal; P9NHIF: Decimal; P9Deductions: Decimal; P9NetPay: Decimal; P9NHIFRelief: Decimal; dtCurrPeriod: Date)
    var
        prEmployeeP9Info: Record "PR Employee P9 Info";
        intYear: Integer;
        intMonth: Integer;
    begin
        intMonth := Date2DMY(dtCurrPeriod, 2);
        intYear := Date2DMY(dtCurrPeriod, 3);

        prEmployeeP9Info.Reset();
        begin
            prEmployeeP9Info.Init();
            prEmployeeP9Info."Employee Code" := P9EmployeeCode;
            prEmployeeP9Info."Basic Pay" := P9BasicPay;
            prEmployeeP9Info.Allowances := P9Allowances;
            prEmployeeP9Info.Benefits := P9Benefits;
            prEmployeeP9Info."Value Of Quarters" := P9ValueOfQuarters;
            prEmployeeP9Info."Defined Contribution" := P9DefinedContribution;
            prEmployeeP9Info."Owner Occupier Interest" := P9OwnerOccupierInterest;
            prEmployeeP9Info."Gross Pay" := P9GrossPay;
            prEmployeeP9Info."Taxable Pay" := P9TaxablePay;
            prEmployeeP9Info."Tax Charged" := P9TaxCharged;
            prEmployeeP9Info."Insurance Relief" := P9InsuranceRelief;
            prEmployeeP9Info."Tax Relief" := P9TaxRelief;
            prEmployeeP9Info.PAYE := P9Paye;
            prEmployeeP9Info.NSSF := P9NSSF;
            prEmployeeP9Info.NHIF := P9NHIF;
            prEmployeeP9Info."NHIF Relief" := P9NHIFRelief;
            prEmployeeP9Info.Deductions := P9Deductions;
            prEmployeeP9Info."Net Pay" := P9NetPay;
            prEmployeeP9Info."Period Month" := intMonth;
            prEmployeeP9Info."Period Year" := intYear;
            prEmployeeP9Info."Payroll Period" := dtCurrPeriod;
            prEmployeeP9Info.Insert();
        end;
    end;


    procedure fnDaysWorked(dtDate: Date; IsTermination: Boolean) DaysWorked: Integer
    var
        Day: Integer;
        SysDate: Record Date;
        Expr1: Text[30];
        FirstDay: Date;
        LastDate: Date;
        TodayDate: Date;
    begin
        TodayDate := dtDate;

        Day := Date2DMY(TodayDate, 1);
        Expr1 := Format(-Day) + 'D+1D';
        FirstDay := CalcDate(Expr1, TodayDate);
        LastDate := CalcDate('1M-1D', FirstDay);

        SysDate.Reset();
        SysDate.SetRange(SysDate."Period Type", SysDate."Period Type"::Date);
        if not IsTermination then
            SysDate.SetRange(SysDate."Period Start", dtDate, LastDate)
        else
            SysDate.SetRange(SysDate."Period Start", FirstDay, dtDate);
        SysDate.SetFilter(SysDate."Period No.", '1..7');
        if SysDate.Find('-') then
            DaysWorked := SysDate.Count;
    end;


    procedure fnSalaryArrears(EmpCode: Text[30]; TransCode: Text[30]; CBasic: Decimal; StartDate: Date; EndDate: Date; dtOpenPeriod: Date; dtDOE: Date; dtTermination: Date)
    var
        FirstMonth: Boolean;
        startmonth: Integer;
        startYear: Integer;
        "prEmployee P9 Info": Record "PR Employee P9 Info";
        P9BasicPay: Decimal;
        P9taxablePay: Decimal;
        P9PAYE: Decimal;
        ProratedBasic: Decimal;
        SalaryArrears: Decimal;
        SalaryVariance: Decimal;
        SupposedTaxablePay: Decimal;
        SupposedTaxCharged: Decimal;
        SupposedPAYE: Decimal;
        PAYEVariance: Decimal;
        PAYEArrears: Decimal;
        PeriodMonth: Integer;
        PeriodYear: Integer;
        CountDaysofMonth: Integer;
        DaysWorked: Integer;
    begin
        FirstMonth := true;
        if EndDate > StartDate then begin
            while StartDate < EndDate do begin
                //fnGetEmpP9Info
                startmonth := Date2DMY(StartDate, 2);
                startYear := Date2DMY(StartDate, 3);

                "prEmployee P9 Info".Reset();
                "prEmployee P9 Info".SetRange("prEmployee P9 Info"."Employee Code", EmpCode);
                "prEmployee P9 Info".SetRange("prEmployee P9 Info"."Period Month", startmonth);
                "prEmployee P9 Info".SetRange("prEmployee P9 Info"."Period Year", startYear);
                if "prEmployee P9 Info".Find('-') then begin
                    P9BasicPay := "prEmployee P9 Info"."Basic Pay";
                    P9taxablePay := "prEmployee P9 Info"."Taxable Pay";
                    P9PAYE := "prEmployee P9 Info".PAYE;

                    if P9BasicPay > 0 then   //Staff payment history is available
                     begin
                        if FirstMonth then                  //This is the first month in the arrears loop
                            if Date2DMY(StartDate, 1) <> 1 then //if the date doesn't start on 1st, we have to prorate the salary
                             begin
                                //ProratedBasic := ProratePay.fnProratePay(P9BasicPay, CBasic, StartDate); ********
                                //Get the Basic Salary (prorate basic pay if needed) //Termination Remaining
                                if (Date2DMY(dtDOE, 2) = Date2DMY(StartDate, 2)) and (Date2DMY(dtDOE, 3) = Date2DMY(StartDate, 3)) then begin
                                    CountDaysofMonth := fnDaysInMonth(dtDOE);
                                    DaysWorked := fnDaysWorked(dtDOE, false);
                                    ProratedBasic := fnBasicPayProrated(EmpCode, startmonth, startYear, P9BasicPay, DaysWorked, CountDaysofMonth)
                                end;

                                //Prorate Basic Pay on    {What if someone leaves within the same month they are employed}
                                if dtTermination <> 0D then
                                    if (Date2DMY(dtTermination, 2) = Date2DMY(StartDate, 2)) and (Date2DMY(dtTermination, 3) = Date2DMY(StartDate, 3)) then begin
                                        CountDaysofMonth := fnDaysInMonth(dtTermination);
                                        DaysWorked := fnDaysWorked(dtTermination, true);
                                        ProratedBasic := fnBasicPayProrated(EmpCode, startmonth, startYear, P9BasicPay, DaysWorked, CountDaysofMonth)
                                    end;

                                SalaryArrears := (CBasic - ProratedBasic)
                            end
                            else
                                SalaryArrears := (CBasic - P9BasicPay);
                        SalaryVariance := SalaryVariance + SalaryArrears;
                        SupposedTaxablePay := P9taxablePay + SalaryArrears;

                        //To calc paye arrears, check if the Supposed Taxable Pay is > the taxable pay for the loop period
                        if SupposedTaxablePay > P9taxablePay then begin
                            SupposedTaxCharged := fnGetEmployeePaye(SupposedTaxablePay);
                            SupposedPAYE := SupposedTaxCharged - curReliefPersonal;
                            PAYEVariance := SupposedPAYE - P9PAYE;
                            PAYEArrears := PAYEArrears + PAYEVariance;
                        end;
                        FirstMonth := false;               //reset the FirstMonth Boolean to False
                    end;
                end;
                StartDate := CalcDate('+1M', StartDate);
            end;
            if SalaryArrears <> 0 then begin
                PeriodYear := Date2DMY(dtOpenPeriod, 3);
                PeriodMonth := Date2DMY(dtOpenPeriod, 2);
                fnUpdateSalaryArrears(EmpCode, TransCode, StartDate, EndDate, SalaryArrears, PAYEArrears, PeriodMonth, PeriodYear,
                dtOpenPeriod);
            end

        end
        else
            Error('The start date must be earlier than the end date');
    end;


    procedure fnUpdateSalaryArrears(EmployeeCode: Text[50]; TransCode: Text[50]; OrigStartDate: Date; EndDate: Date; SalaryArrears: Decimal; PayeArrears: Decimal; intMonth: Integer; intYear: Integer; payperiod: Date)
    var
        FirstMonth: Boolean;
        ProratedBasic: Decimal;
        SalaryVariance: Decimal;
        PayeVariance: Decimal;
        SupposedTaxablePay: Decimal;
        SupposedTaxCharged: Decimal;
        SupposedPaye: Decimal;
        CurrentBasic: Decimal;
        StartDate: Date;
        "prSalary Arrears": Record "PR Salary Arrears";
    begin
        "prSalary Arrears".Reset();
        "prSalary Arrears".SetRange("prSalary Arrears"."Employee Code");
        "prSalary Arrears".SetRange("prSalary Arrears"."Transaction Code", TransCode);
        "prSalary Arrears".SetRange("prSalary Arrears"."Period Month", intMonth);
        "prSalary Arrears".SetRange("prSalary Arrears"."Period Year", intYear);
        if "prSalary Arrears".Find('-') = false then begin
            "prSalary Arrears"."Employee Code" := EmployeeCode;
            "prSalary Arrears"."Transaction Code" := TransCode;
            "prSalary Arrears"."Start Date" := OrigStartDate;
            "prSalary Arrears"."End Date" := EndDate;
            "prSalary Arrears"."Salary Arrears" := SalaryArrears;
            "prSalary Arrears"."PAYE Arrears" := PayeArrears;
            "prSalary Arrears"."Period Month" := intMonth;
            "prSalary Arrears"."Period Year" := intYear;
            "prSalary Arrears"."Arrears Payroll Period" := payperiod;
            "prSalary Arrears".Modify();
        end
    end;


    procedure fnCalcLoanInterest(strEmpCode: Code[20]; strTransCode: Code[20]; InterestRate: Decimal; RecoveryMethod: Option Reducing,"Straight line",Amortized; LoanAmount: Decimal; Balance: Decimal; CurrPeriod: Date) LnInterest: Decimal
    var
        curLoanInt: Decimal;
        intMonth: Integer;
        intYear: Integer;
    begin
        intMonth := Date2DMY(CurrPeriod, 2);
        intYear := Date2DMY(CurrPeriod, 3);

        curLoanInt := 0;
        if InterestRate > 0 then begin
            if RecoveryMethod = RecoveryMethod::"Straight line" then //Straight Line Method [1]
                curLoanInt := (InterestRate / 1200) * LoanAmount;

            if RecoveryMethod = RecoveryMethod::Reducing then //Reducing Balance [0]

                 curLoanInt := (InterestRate / 100) * Balance;

            if RecoveryMethod = RecoveryMethod::Amortized then //Amortized [2]
                curLoanInt := (InterestRate / 100) * Balance;

        end else
            curLoanInt := 0;

        //Return the Amount/
        //greencom
        ////LnInterest:=curLoanInt;
        LnInterest := Round(curLoanInt, 1);
    end;


    procedure fnUpdateEmployerDeductions(EmpCode: Code[20]; TCode: Code[20]; TGroup: Code[20]; GroupOrder: Integer; SubGroupOrder: Integer; Description: Text[50]; curAmount: Decimal; curBalance: Decimal; Month: Integer; Year: Integer; mMembership: Text[30]; ReferenceNo: Text[30]; dtOpenPeriod: Date)
    var
        prEmployerDeductions: Record "PR Employer Deductions";
    begin

        if curAmount = 0 then
            exit;
        begin
            prEmployerDeductions.Init();
            prEmployerDeductions."Employee Code" := EmpCode;
            prEmployerDeductions."Transaction Code" := TCode;
            prEmployerDeductions.Amount := curAmount;
            prEmployerDeductions."Period Month" := Month;
            prEmployerDeductions."Period Year" := Year;
            prEmployerDeductions."Payroll Period" := dtOpenPeriod;
            //***********************************************************
            HREmp2.Reset();
            HREmp2.SetRange(HREmp2."No.", EmpCode);
            if HREmp2.Find('-') then;
            //"Global Dimension 1 Code":=HREmp2."Global Dimension 1 Code";
            //"Contract Type":=HREmp2."Contract Type";
            //****************************************************************
            prEmployerDeductions.Insert();
        end;
    end;


    procedure fnDisplayFrmlValues(EmpCode: Code[30]; intMonth: Integer; intYear: Integer; Formula: Text[50]) curTransAmount: Decimal
    var
        pureformula: Text[50];
    begin
        pureformula := fnPureFormula(EmpCode, intMonth, intYear, Formula);
        curTransAmount := fnFormulaResult(pureformula); //Get the calculated amount
                                                        //greencom
                                                        ////curTransAmount :=curTransAmount;
        curTransAmount := Round(curTransAmount, 0.01, '>');
    end;


    procedure fnUpdateEmployeeTrans(EmpCode: Code[20]; TransCode: Code[20]; Amount: Decimal; Month: Integer; Year: Integer; PayrollPeriod: Date)
    var
        prEmployeeTrans: Record "PR Employee Transactions";
    begin
        prEmployeeTrans.Reset();
        prEmployeeTrans.SetRange(prEmployeeTrans."Employee Code", EmpCode);
        prEmployeeTrans.SetRange(prEmployeeTrans."Transaction Code", TransCode);
        prEmployeeTrans.SetRange(prEmployeeTrans."Payroll Period", PayrollPeriod);
        prEmployeeTrans.SetRange(prEmployeeTrans."Period Month", Month);
        prEmployeeTrans.SetRange(prEmployeeTrans."Period Year", Year);
        if prEmployeeTrans.Find('-') then begin
            prEmployeeTrans.Amount := Amount;

            prEmployeeTrans.Modify();
        end;
    end;


    procedure fnGetOpenPeriod() dtOpenPeriod: Date
    var
        "prPayroll Periods": Record "PR Payroll Periods";
        intMonth: Integer;
        intYear: Integer;
    begin
        "prPayroll Periods".Reset();
        "prPayroll Periods".SetRange("prPayroll Periods".Closed, false);

        if "prPayroll Periods".Find('-') then begin
            dtOpenPeriod := "prPayroll Periods"."Date Opened";
            intMonth := Date2DMY(dtOpenPeriod, 2); //GET THE MONTH
            intYear := Date2DMY(dtOpenPeriod, 3);  //GET THE YEAR
        end
        else
            Error('There is no open payroll period');
    end;


    procedure fnGetJournalDet(strEmpCode: Code[20])
    var
        SalaryCard: Record "PR Salary Card";
        HREmp: Record "HR Employees";
    begin
        //Get Payroll Posting Accounts
        //IF SalaryCard.GET(strEmpCode) THEN BEGIN
        if HREmp.Get(strEmpCode) then
            if PostingGroup.Get(HREmp."Posting Group") then begin
                //Comment This for the Time Being
                PostingGroup.TestField("Salary Account");
                PostingGroup.TestField("Income Tax Account");
                PostingGroup.TestField("Net Salary Payable");
                PostingGroup.TestField("SSF Employer Account");
                PostingGroup.TestField("Pension Employer Acc");

                TaxAccount := PostingGroup."Income Tax Account";
                salariesAcc := PostingGroup."Salary Account";
                PayablesAcc := PostingGroup."Net Salary Payable";
                NSSFEMPyer := PostingGroup."SSF Employer Account";
                NSSFEMPyee := PostingGroup."SSF Employee Account";
                NHIFEMPyee := PostingGroup."NHIF Employee Account";
                PensionEMPyer := PostingGroup."Pension Employer Acc";
            end;
        //End Get Payroll Posting Accounts
    end;


    procedure fnGetEmployeeNSSF(curBaseAmount: Decimal) NSSF: Decimal
    var
        prNSSF: Record "prNSSF Tiers";
    begin

        prNSSF.Reset();
        prNSSF.SetCurrentKey(prNSSF.Tier);
        if prNSSF.FindFirst() then
            repeat
                if ((curBaseAmount >= prNSSF."Lower Limit") and (curBaseAmount <= prNSSF."Upper Limit")) then
                    NSSF := prNSSF."Tier 1 Employee Deduction" + prNSSF."Tier 2 Employee Deduction";
            until prNSSF.Next() = 0;
    end;


    procedure fnGetEmployerNSSF(curBaseAmount: Decimal) NSSF: Decimal
    var
        prNSSF: Record "prNSSF Tiers";
    begin

        prNSSF.Reset();
        prNSSF.SetCurrentKey(prNSSF.Tier);
        if prNSSF.FindFirst() then
            repeat
                if ((curBaseAmount >= prNSSF."Lower Limit") and (curBaseAmount <= prNSSF."Upper Limit")) then
                    NSSF := prNSSF."Tier 1 Employer Contribution" + prNSSF."Tier 2 Employer Contribution";
            until prNSSF.Next() = 0;
    end;


    procedure fnUpdateStaffBankTrans(EmpCode: Code[20]; TCode: Code[20]; Description: Text[50]; curAmount: Decimal; Month: Integer; Year: Integer; dtOpenPeriod: Date; Department: Code[50])
    var
        PRStaffBankT: Record "CshMgt Cashier Receipts";
    begin

        //IF curAmount = 0 THEN EXIT;
        //WITH PRStaffBankT DO BEGIN
        //    INIT;

        //    "Employee Code":=EmpCode;
        //    "Transaction Code" := TCode;
        //    "Transaction Name" := Description;
        //     Amount := curAmount;
        //    "Period Month" := Month;
        //    "Period Year" := Year;
        //    "Payroll Period" := dtOpenPeriod;
        //    "Department Code":=Department;

        //     //Insert Scheme Code and Contract Type for each Trans Being Updated
        //     HREmp2.RESET;
        //     IF HREmp2.GET(EmpCode) THEN
        //     BEGIN
        //         "Bank Code":=HREmp2."Bank Code";
        //         "Bank Name":=HREmp2."Bank Details";

        //         //"Branch Code":=HREmp2."Branch Code";
        //         //"Branch Name":=HREmp2."Branch Details";

        //         "Employee Name":=UPPERCASE(HREmp2."Full Name");
        //         "Global Dimension 1 Code":=HREmp2."Global Dimension 1 Code";
        //         "Contract Type":=HREmp2."Employee Contract Type";
        //         "Bank Account No.":=HREmp2."Bank Account Number"
        //     END;

        //     INSERT;
        //END;
    end;

    local procedure GetLastEntryNo() LastLineNum: Integer
    var
        HRBankSummary_2: Record "Bank Payment List";
    begin
        HRBankSummary_2.Reset();
        if HRBankSummary_2.Find('+') then
            LastLineNum := HRBankSummary_2."Line No." + 1
        else
            LastLineNum := 1000;
    end;


    procedure fnCreateLeaveEntitlements(var PayrollPeriod: Record "PR Payroll Periods")
    var
        AccPeriod: Record "PR Payroll Periods";
        NextDate: Date;
        EndOfYear: Boolean;
        Empleave: Record "HR Leave Ledger Entries";
        LeaveType: Record "HR Leave Types";
        MaturityDate: Date;
        NextMaturityDate: Date;
        Emp: Record Employee;
        CarryForwardDays: Decimal;
        EmpleaveCpy: Record "HR Leave Ledger Entries";
    begin
        /*
        EndOfYear:=FALSE;
        NextDate:=CALCDATE('1M',"Starting Date");
        IF AccPeriod.GET(NextDate) THEN
        IF AccPeriod."New Fiscal Year" THEN
        EndOfYear:=TRUE;

        IF EndOfYear THEN
        BEGIN

        MaturityDate:=CALCDATE('1M',PayrollPeriod."Starting Date")-1;
        NextMaturityDate:=CALCDATE('1Y',MaturityDate);

        LeaveType.RESET;
        LeaveType.SETRANGE(LeaveType."Annual Leave",TRUE);
        IF LeaveType.FIND('-') THEN
        BEGIN

        Emp.RESET;
        Emp.SETRANGE(Emp.Status,Emp.Status::Active);
        IF Emp.FIND('-') THEN
        REPEAT
         IF (Emp."Posting Group"='PARMANENT') THEN BEGIN

          IF EmpleaveCpy.GET(Emp."No.",LeaveType.Code,MaturityDate) THEN
          BEGIN
          EmpleaveCpy.CALCFIELDS(EmpleaveCpy."Total Days Taken");
          CarryForwardDays:=EmpleaveCpy.Entitlement+EmpleaveCpy."Balance Brought Forward"+EmpleaveCpy."Recalled Days"
          -EmpleaveCpy."Total Days Taken";
          IF CarryForwardDays>LeaveType."Max Carry Forward Days" THEN
          CarryForwardDays:=LeaveType."Max Carry Forward Days";
          END;

          Empleave.INIT;
          Empleave."Employee No":=Emp."No.";
          Empleave."Leave Code":=LeaveType.Code;
          Empleave."Maturity Date":=NextMaturityDate;
         // IF Emp."Date Of Join">"Starting Date" THEN
         //   Empleave.Entitlement:=
         // ELSE
          Empleave.Entitlement:=LeaveType.Days;
          Empleave."Balance Brought Forward":=CarryForwardDays;
          IF NOT Empleave.GET(Empleave."Employee No", Empleave."Leave Code",Empleave."Maturity Date") THEN
          Empleave.INSERT;
         END ELSE

         IF (Emp."Posting Group"='TEMP') OR (Emp."Posting Group"='INTERN') THEN BEGIN

          IF EmpleaveCpy.GET(Emp."No.",LeaveType.Code,MaturityDate) THEN
          BEGIN
          EmpleaveCpy.CALCFIELDS(EmpleaveCpy."Total Days Taken");
          CarryForwardDays:=EmpleaveCpy.Entitlement+EmpleaveCpy."Balance Brought Forward"+EmpleaveCpy."Recalled Days"
          -EmpleaveCpy."Total Days Taken";
          IF CarryForwardDays>LeaveType."Max Carry Forward Days" THEN
          CarryForwardDays:=LeaveType."Max Carry Forward Days";
          END;

          Empleave.INIT;
          Empleave."Employee No":=Emp."No.";
          Empleave."Leave Code":=LeaveType.Code;
          Empleave."Maturity Date":=NextMaturityDate;
         // IF Emp."Date Of Join">"Starting Date" THEN
         //   Empleave.Entitlement:=
         // ELSE
          Empleave.Entitlement:=ROUND(((Emp."Contract End Date"-Emp."Contract Start Date")/30),1)*2.5;
          Empleave."Balance Brought Forward":=CarryForwardDays;
          IF NOT Empleave.GET(Empleave."Employee No", Empleave."Leave Code",Empleave."Maturity Date") THEN
          Empleave.INSERT;
         END;
        UNTIL Emp.NEXT=0;

        END
        ELSE
        ERROR('You must select one leave type as annual on the leave setup');

        END;
        */

    end;


    procedure fnCreateLeaveEntitlement(intMonth: Integer; intYear: Integer) dtOpenPeriod: Date
    var
        "prPayroll Periods": Record "PR Payroll Periods";
    begin
        "prPayroll Periods".Reset();
        "prPayroll Periods".SetRange("prPayroll Periods".Closed, false);

        if "prPayroll Periods".Find('-') then begin
            dtOpenPeriod := "prPayroll Periods"."Date Opened";
            intMonth := Date2DMY(dtOpenPeriod, 2); //GET THE MONTH
            intYear := Date2DMY(dtOpenPeriod, 3);  //GET THE YEAR
        end
        else
            Error('There is no open payroll period');
    end;


    procedure fnCreateBankAccountInfo(intMonth: Integer; intYear: Integer; dtOpenPeriod: Date)
    var
        prPeriodBankInfo: Record "HR Employee Bank Accounts";
        intNewMonth: Integer;
        intNewYear: Integer;
        dtNewPeriod: Date;
        prEmployee: Record "HR Employees";
        prPeriodBankInfoCopy: Record "Employee Bank Accounts History";
    begin

        dtCurrentPeriod := CalcDate('-1M', dtOpenPeriod);
        dtNewPeriod := CalcDate('1M', dtOpenPeriod);
        intNewMonth := Date2DMY(dtNewPeriod, 2);
        intNewYear := Date2DMY(dtNewPeriod, 3);

        prEmployee.Reset();
        prEmployee.SetRange(prEmployee.Status, prEmployee.Status::Active);
        //prEmployee.SETFILTER(prEmployee."No.",'NLC20150178');
        //prEmployee.SETFILTER(prEmployee."No.",'NLC20150180|NLC20130002|NLC20210650|NLC20210651|NLC20210652|NLC20210653|NLC20210654');
        if prEmployee.Find('-') then
            repeat
                prPeriodBankInfo.Reset();
                prPeriodBankInfo.SetRange(prPeriodBankInfo."Employee Code", prEmployee."No.");
                //prPeriodBankInfo.SETFILTER(prPeriodBankInfo."Employee Code",'NLC20150178');
                //prPeriodBankInfo.SETRANGE(prPeriodBankInfo."From payroll Period",dtCurrentPeriod);
                if prPeriodBankInfo.Find('-') then
                    repeat
                        prPeriodBankInfoCopy."Employee Code" := prPeriodBankInfo."Employee Code";
                        prPeriodBankInfoCopy."Bank  Code" := prPeriodBankInfo."Bank  Code";
                        prPeriodBankInfoCopy."Bank Name" := prPeriodBankInfo."Bank Name";
                        prPeriodBankInfoCopy."Branch Code" := prPeriodBankInfo."Branch Code";
                        prPeriodBankInfoCopy."Branch Name" := prPeriodBankInfo."Branch Name";
                        prPeriodBankInfoCopy."A/C  Number" := prPeriodBankInfo."A/C  Number";
                        prPeriodBankInfoCopy."Line No." := GetBankInfoLastEntryNo();
                        prPeriodBankInfoCopy."From payroll Period" := dtOpenPeriod;
                        prPeriodBankInfoCopy."Percentage to Transfer" := prPeriodBankInfo."Percentage to Transfer";
                        //MESSAGE('%1%2%3',PrPeriodBankInfoCopy."Employee Code",dtOpenPeriod,dtNewPeriod);
                        prPeriodBankInfoCopy.Insert();
                        prPeriodBankInfo."From payroll Period" := dtNewPeriod;
                        prPeriodBankInfo.Modify();
                    until prPeriodBankInfo.Next() = 0;
            until prEmployee.Next() = 0;
    end;

    local procedure GetBankInfoLastEntryNo() LastLineNum: Integer
    var
        HRBankInfo: Record "Employee Bank Accounts History";
    begin
        HRBankInfo.Reset();
        if HRBankInfo.Find('+') then
            LastLineNum := HRBankInfo."Line No." + 1
        else
            LastLineNum := 1000;
    end;


    procedure fnCreateHREmployeeInfo(intMonth: Integer; intYear: Integer; dtOpenPeriod: Date)
    var
        prPeriodBankInfo: Record "HR Employees";
        intNewMonth: Integer;
        intNewYear: Integer;
        dtNewPeriod: Date;
        prEmployee: Record "HR Employees";
        prPeriodBankInfoCopy: Record "HR Employee Info Change";
    begin

        dtCurrentPeriod := CalcDate('-1M', dtOpenPeriod);
        dtNewPeriod := CalcDate('1M', dtOpenPeriod);
        intNewMonth := Date2DMY(dtNewPeriod, 2);
        intNewYear := Date2DMY(dtNewPeriod, 3);

        prEmployee.Reset();
        prEmployee.SetRange(prEmployee.Status, prEmployee.Status::Active);
        //prEmployee.SETFILTER(prEmployee."No.",'NLC20150178');
        //prEmployee.SETFILTER(prEmployee."No.",'NLC20150180|NLC20130002|NLC20210650|NLC20210651|NLC20210652|NLC20210653|NLC20210654');
        if prEmployee.Find('-') then
            repeat
                prPeriodBankInfo.Reset();
                prPeriodBankInfo.SetRange(prPeriodBankInfo."No.", prEmployee."No.");
                //prPeriodBankInfo.SETFILTER(prPeriodBankInfo."No.",'NLC20150178');
                //prEmployee.SETFILTER(prEmployee."No.",'NLC20150180|NLC20130002|NLC20210650|NLC20210651|NLC20210652|NLC20210653|NLC20210654');
                if prPeriodBankInfo.Find('-') then begin
                    prPeriodBankInfoCopy.Reset();
                    prPeriodBankInfoCopy."No." := prPeriodBankInfo."No.";
                    prPeriodBankInfoCopy."Full Name" := prPeriodBankInfo."Full Name";
                    prPeriodBankInfoCopy."Global Dimension 1 Code" := prPeriodBankInfo."Global Dimension 1 Code";
                    prPeriodBankInfoCopy."County Name" := prPeriodBankInfo."County Name";
                    prPeriodBankInfoCopy."Global Dimension 2 Code" := prPeriodBankInfo."Global Dimension 2 Code";
                    prPeriodBankInfoCopy."Department Name" := prPeriodBankInfo."Department Name";
                    prPeriodBankInfoCopy."Responsibility Center" := prPeriodBankInfo."Responsibility Center";
                    prPeriodBankInfoCopy."Job Title" := prPeriodBankInfo."Job Title";
                    prPeriodBankInfoCopy."Job ID" := prPeriodBankInfo."Job ID";
                    prPeriodBankInfoCopy.Grade := prPeriodBankInfo.Grade;
                    prPeriodBankInfoCopy."Payroll Period" := dtOpenPeriod;
                    prPeriodBankInfoCopy."Line No." := GetEmpInfoLastEntryNo();
                    //MESSAGE('%1%2%3',PrPeriodBankInfoCopy."No.",dtOpenPeriod,dtNewPeriod);
                    prPeriodBankInfoCopy.Insert();
                    prEmployee."Payroll Period" := dtNewPeriod;
                    prEmployee.Modify();
                end;
            until prEmployee.Next() = 0;
    end;

    local procedure GetEmpInfoLastEntryNo() LastLineNum: Integer
    var
        HREmpInfo: Record "HR Employee Info Change";
    begin
        HREmpInfo.Reset();
        if HREmpInfo.Find('+') then
            LastLineNum := HREmpInfo."Line No." + 1
        else
            LastLineNum := 1;
    end;


    procedure fnGetEmployeeNITA(curBaseAmount: Decimal) NITA: Decimal
    var
        PRPivotal: Record "PR Vital Setup Info";
    begin

        PRPivotal.Get();
        NITA := PRPivotal."NITA Employer Contribution"
    end;
}
