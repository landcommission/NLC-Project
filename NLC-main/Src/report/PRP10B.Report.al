#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193468 "PR P10B"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR P10B.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR P10B';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            column(ReportForNavId_1102755000; 1102755000) { }
            column(EmployerName; EmployerName) { }
            column(EmployeeName; EmployeeName) { }
            column(EmployerPin; EmployerPIN) { }
            column(OpeningBalAsAtJan; OpeningLoanBal) { }
            column(AdditionalLoan; AdditionalLoan) { }
            column(DateLoanAdvanced; DateLoanAdvanced) { }
            column(EmployersInterestRate; EmployersInterestRate) { }
            column(LoanBalAtDec; ClosingLoanBal) { }
            column(TaxableFringeBenefitValuePerYear; TaxableFringe) { }
            column(FringeBenefitTaxPaid; FringeTaxPaid) { }
            column(KENYAREVENUE; KENYA_REVENUECaption) { }
            column(AUTHORITY; AUTHORITYCaption) { }
            column(INCOMETAXDEPT; INCOME_TAXE_DEPARTMENTCaptionLbl) { }
            column(P10B; P_10BCaptionLbl) { }
            column(EMPLOYERSNAME; EMPLOYER_S_NAME__________________________________________Lbl) { }
            column(EMPLOYERSPIN; EMPLOYER_S_PINCaptionLbl) { }
            column(OPENINGLOANBAL; OPENING_LOAN_BAL) { }
            column(ADDITIONALOAN; ADDITIONAL_LOAN) { }
            column(ADVANCELOAN; ADVANCE_LAON) { }
            column(INTRATE; INT_RATE) { }
            column(LOANBAL; LOAN_BAL) { }
            column(TAXABLEFRINGE; TAXABLE_FRINGE) { }
            column(FRINGETAX; FRINGE_TAX) { }
            column(FRINGEBENEFITTAXRETURN; FRINGE_BENEFIT_RETURN_CaptionLbl) { }
            column(TOTALS; TOTALS) { }
            column(KSHS; KSHSCaptionLbl) { }
            column(EMPTYSTRING; EmptyStringCaptionLbl) { }
            column(COMPANY; Company) { }
            column(loanbalance; loanbal) { }
            column(FRINGE; FRINGEtax) { }
            column(totFRINGEtax; totFRINGEtax) { }
            column(totalloanbalance; totloanbal) { }
            column(intrates; intRate) { }

            trigger OnAfterGetRecord()
            begin
                objEmp.Reset();
                objEmp.SetRange(objEmp."No.", "Employee Code");
                if objEmp.Find('-') then
                    EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";

                loanbal := 0;
                FRINGEtax := 0;

                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "Employee Code");
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Period","PR Salary Card"."Period Filter");
                PeriodTrans.SetRange(PeriodTrans."coop parameters", PeriodTrans."coop parameters"::loan);
                if PeriodTrans.Find('-') then begin
                    transcode.Reset();
                    transcode.SetRange(transcode."Transaction Code", PeriodTrans."Transaction Code");
                    if transcode.Find('-') then
                        intRate := transcode."Interest Rate";
                    repeat
                        loanbal := loanbal + PeriodTrans.Amount;
                        totloanbal := totloanbal + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                end;

                employerded.Reset();
                employerded.SetRange(employerded."Employee Code", "Employee Code");
                //employerded.SETRANGE(employerded."Payroll Period","PR Payroll Periods"."Date Opened");
                employerded.SetRange(employerded."Transaction Code");
                if employerded.Find('-') then
                    repeat
                        FRINGEtax := Round(FRINGEtax + employerded.Amount, 0.01);
                        totFRINGEtax := Round(totFRINGEtax + employerded.Amount, 0.01);
                    until employerded.Next() = 0;
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        PeriodTrans: Record "PR Period Transactions";
        PayeAmount: Decimal;
        TotPayeAmount: Decimal;
        GrossPay: Decimal;
        TotGrossPay: Decimal;
        EmployeeName: Text[50];
        PinNumber: Text[30];
        objPeriod: Record "PR Payroll Periods";
        objEmp: Record "HR Employees";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        controlinfo: Record "Company Information";
        EmployerPIN: Text[50];
        EmployerName: Text[100];
        DAY: Integer;
        OpeningLoanBal: Decimal;
        AdditionalLoan: Decimal;
        DateLoanAdvanced: Date;
        EmployersInterestRate: Decimal;
        ClosingLoanBal: Decimal;
        TaxableFringe: Decimal;
        FringeTaxPaid: Decimal;
        KENYA_REVENUECaption: Label 'KENYA REVENUE';
        AUTHORITYCaption: Label 'AUTHORITY';
        P_10BCaptionLbl: Label 'P.10B';
        INCOME_TAXE_DEPARTMENTCaptionLbl: Label 'INCOME TAX DEPARTMENT';
        FRINGE_BENEFIT_RETURN_CaptionLbl: Label 'FRINGE BENEFIT TAX RETURN FOR YEAR................................';
        EMPLOYER_S_PINCaptionLbl: Label 'EMPLOYER''S PIN';
        EMPLOYER_S_NAME__________________________________________Lbl: Label 'EMPLOYER''S NAME....................................................................................................................................';
        EMPLOYEE_S_PINCaptionLbl: Label 'EMPLOYEE''S PIN';
        TOTAL_PAYECaptionLbl: Label 'TOTAL PAYE';
        TOTAL_EMOLUMENTSCaptionLbl: Label 'TOTAL EMOLUMENTS';
        ADDITIONAL_LOAN: Label 'ADDITIONAL LOAN';
        OPENING_LOAN_BAL: Label 'OPENING LOAN BALANCE AT 1ST JANUARY';
        ADVANCE_LAON: Label 'DATE LOAN ADVANCED';
        INT_RATE: Label 'EMPLOYER''S INTEREST RATE %';
        TAXABLE_FRINGE: Label 'TAXABLE FRINGE BENEFIT VALUE PER YEAR';
        FRINGE_TAX: Label 'FRINGE BENEFIT TAX PAID';
        LOAN_BAL: Label 'LOAN BALANCE AT 31ST DEC.';
        "EMPLOYEE'S_NAME": Label 'EMPLOYEE''S NAME';
        KSHSCaptionLbl: Label 'KSHS';
        EmptyStringCaptionLbl: Label '.................................';
        EmptyStringCaption_Control1102756014Lbl: Label '.................................';
        EmptyStringCaption_Control1102756017Lbl: Label '.................................';
        TOTALS: Label 'TOTALS';
        loanbal: Decimal;
        totloanbal: Decimal;
        EmployerAddress: Text[50];
        FRINGEtax: Decimal;
        employerded: Record "PR Employer Deductions";
        transcode: Record "PR Transaction Codes";
        totFRINGEtax: Decimal;
        Company: Label 'MESPT';
        intRate: Decimal;
}

