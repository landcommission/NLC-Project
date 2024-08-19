#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193535 prP9A
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prP9A.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'prP9A';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(ReportForNavId_8631; 8631) { }
            column(SelectedPeriod; SelectedPeriod) { }
            column(EmployerPIN; EmployerPIN) { }
            column(HR_Employee__First_Name_; "First Name") { }
            column(HR_Employee__Middle_Name_; "Middle Name") { }
            column(HR_Employee__Last_Name_; "Last Name") { }
            column(HR_Employee__No__; "No.") { }
            column(HR_Employee__PIN_Number_; "HR Employees"."PIN No.") { }
            column(TotaA; TotaA) { }
            column(TotalB; TotalB) { }
            column(totalD; totalD) { }
            column(totalC; totalC) { }
            column(TotalF; TotalF) { }
            column(TotalE3; TotalE3) { }
            column(TotalE2; TotalE2) { }
            column(TotalE1; TotalE1) { }
            column(TotalL; TotalL) { }
            column(TotalK; TotalK) { }
            column(TotalJ; TotalJ) { }
            column(TotalH; TotalH) { }
            column(TotalG; TotalG) { }
            column(TotalH_Control1102755001; TotalH) { }
            column(TotalL_Control1102755005; TotalL) { }
            column(Employer_s_Name___MESPTCaption; Employer_s_Name___MESPTCaptionLbl) { }
            column(DOMESTIC_TAXES_DEPARTMENTCaption; DOMESTIC_TAXES_DEPARTMENTCaptionLbl) { }
            column(TAX_DEDUCTION_CARD_YEAR_Caption; TAX_DEDUCTION_CARD_YEAR_CaptionLbl) { }
            column(EMPLOYER_S_PINCaption; EMPLOYER_S_PINCaptionLbl) { }
            column(MONTHCaption; MONTHCaptionLbl) { }
            column(Basic_SalaryCaption; Basic_SalaryCaptionLbl) { }
            column(Benefits__Non_CashCaption; Benefits__Non_CashCaptionLbl) { }
            column(Value_Of__QuartersCaption; Value_Of__QuartersCaptionLbl) { }
            column(Total__Gross_PayCaption; Total__Gross_PayCaptionLbl) { }
            column(Defined_Contribution__Retirement_SchemeCaption; Defined_Contribution__Retirement_SchemeCaptionLbl) { }
            column(Owner_Occupier_InterestCaption; Owner_Occupier_InterestCaptionLbl) { }
            column(Retirement_Contribution___Owner_OccupierCaption; Retirement_Contribution___Owner_OccupierCaptionLbl) { }
            column(Column_D_G__Chargeable_AmountCaption; Column_D_G__Chargeable_AmountCaptionLbl) { }
            column(prEmployee_P9_Info__Tax_Charged_Caption; "PR Employee P9 Info".FieldCaption("Tax Charged")) { }
            column(Personal__ReliefCaption; Personal__ReliefCaptionLbl) { }
            column(prEmployee_P9_Info__Insurance_Relief_Caption; "PR Employee P9 Info".FieldCaption("Insurance Relief")) { }
            column(P_A_Y_E__TAXCaption; P_A_Y_E__TAXCaptionLbl) { }
            column(ECaption; ECaptionLbl) { }
            column(E1__30_Caption; E1__30_CaptionLbl) { }
            column(E2__ActualCaption; E2__ActualCaptionLbl) { }
            column(E3__FIXEDCaption; E3__FIXEDCaptionLbl) { }
            column(ACaption; ACaptionLbl) { }
            column(BCaption; BCaptionLbl) { }
            column(CCaption; CCaptionLbl) { }
            column(DCaption; DCaptionLbl) { }
            column(F__Amount_of_InterestCaption; F__Amount_of_InterestCaptionLbl) { }
            column(G__Lowest_of_E_added_to_FCaption; G__Lowest_of_E_added_to_FCaptionLbl) { }
            column(HCaption; HCaptionLbl) { }
            column(JCaption; JCaptionLbl) { }
            column(V1_162_00Caption; V1_162_00CaptionLbl) { }
            column(KCaption; KCaptionLbl) { }
            column(V0Caption; V0CaptionLbl) { }
            column(LCaption; LCaptionLbl) { }
            column(Total__Kshs___1_162_00Caption; Total__Kshs___1_162_00CaptionLbl) { }
            column(Employee_s_MainCaption; Employee_s_MainCaptionLbl) { }
            column(HR_Employee__Middle_Name_Caption; FieldCaption("Middle Name")) { }
            column(Personal_File_No_Caption; Personal_File_No_CaptionLbl) { }
            column(Employee_PINCaption; Employee_PINCaptionLbl) { }
            column(Tobe_completed_by_Employer_at_end_of_yearCaption; Tobe_completed_by_Employer_at_end_of_yearCaptionLbl) { }
            column(IMPORTANTCaption; IMPORTANTCaptionLbl) { }
            column(DataItem1102756145; NAMES_OF_MORTGAGE_FINANCIAL_INSTITUTION______________________________________Lbl) { }
            column(DataItem1102756146; L_R__No__OF_OWNER_OCCUPIED_HOUSE_____________________________________DATE_OF_OCCUPATILbl) { }
            column(DATE_OF_OCCUPATION; DATE_OF_OCCUPATION) { }
            column(TotalCaption; TotalCaptionLbl) { }
            column(TOTAL_CHARGEABLE_PAY__COL_h__KshsCaption; TOTAL_CHARGEABLE_PAY__COL_h__KshsCaptionLbl) { }
            column(TOTAL_CHARGEABLE_PAY__COL_l__Caption; TOTAL_CHARGEABLE_PAY__COL_l__KshsCaptionLbl) { }
            column(V1__Use_P9ACaption; V1__Use_P9ACaptionLbl) { }
            column(a__For_all_liable_employees_and_where_director_employee_received_Benefits_in_additions_to_cash_emoluments_Caption; a__For_all_liable_employees_and_where_director_employee_received_Benefits_in_additions_to_cash_emoluments_CaptionLbl) { }
            column(nextline; Next()) { }
            column(b__Where_an_employee_is_eligible_to_deduction_on_owner_occupier_interest_Caption; b__Where_an_employee_is_eligible_to_deduction_on_owner_occupier_interest_CaptionLbl) { }
            column(V2___a__Allowable_interest_in_respect_of_any_month_mustnot_exceed_Kshs_12_500___per_year_Caption; V2___a__Allowable_interest_in_respect_of_any_month_mustnot_exceed_Kshs_12_500___per_year_CaptionLbl) { }
            column(V2___a__Allowable_interest_in_respect_of_any_month_mustnot_exceed_Kshs_12_500___per_year_Caption_Control1102755010; V2___a__Allowable_interest_in_respect_of_any_month_mustnot_exceed_Kshs_12_500___per_year_Caption_Control1102755010Lbl) { }
            column(See_back_of_this_card_for_further_information_required_by_the_department__Caption; See_back_of_this_card_for_further_information_required_by_the_department__CaptionLbl) { }
            column(i__Photostat_copy_of_interest_certificate_and_statement_of_account_from_the_Financial_Institution_Caption; i__Photostat_copy_of_interest_certificate_and_statement_of_account_from_the_Financial_Institution_CaptionLbl) { }
            column(b__AttachCaption; b__AttachCaptionLbl) { }
            column(ii__THE_DECLARATION_duly_signed_by_the_employee_Caption; ii__THE_DECLARATION_duly_signed_by_the_employee_CaptionLbl) { }
            dataitem("PR Employee P9 Info"; "PR Employee P9 Info")
            {
                DataItemLink = "Employee Code" = field("No.");
                DataItemTableView = sorting("Employee Code", "Payroll Period") order(ascending);
                column(ReportForNavId_7242; 7242) { }
                column(FORMAT__prEmployee_P9_Info___Payroll_Period__0___Month_Text___; Format("PR Employee P9 Info"."Payroll Period", 0, '<Month Text>')) { }
                column(GPAY_Amoount; GPAY_Amoount) { }
                column(prEmployee_P9_Info__Basic_Pay_; "Basic Pay") { }
                column(prEmployee_P9_Info_Benefits; Benefits) { }
                column(prEmployee_P9_Info__Value_Of_Quarters_; "Value Of Quarters") { }
                column(prEmployee_P9_Info__Gross_Pay_; "Gross Pay") { }
                column(prEmployee_P9_Info__Owner_Occupier_Interest_; "Owner Occupier Interest") { }
                column(Basic_Pay__0_3; "Basic Pay" * 0.3) { }
                column(prEmployee_P9_Info_NSSF; NSSF) { }
                column(fixedDefContri; fixedDefContri) { }
                column(Gross_Pay__ColG; "Gross Pay" - ColG) { }
                column(prEmployee_P9_Info__Tax_Charged_; "Tax Charged") { }
                column(prEmployee_P9_Info__Tax_Relief_; "Tax Relief") { }
                column(prEmployee_P9_Info__Insurance_Relief_; "Insurance Relief") { }
                column(prEmployee_P9_Info_PAYE; PAYE) { }
                column(ColG; ColG) { }
                column(prEmployee_P9_Info_Employee_Code; "Employee Code") { }
                column(prEmployee_P9_Info_Payroll_Period; "Payroll Period") { }
                column(EmployerName; EmployerName) { }

                trigger OnAfterGetRecord()
                var
                    prPayrollProcess: Codeunit "PR Payroll Processing";
                begin
                    TransCode.Reset();
                    TransCode.SetRange(TransCode.Taxable, true);
                    if TransCode.Find('-') then
                        repeat
                            PeriodTrans2.Reset();
                            PeriodTrans2.SetRange(PeriodTrans2."Transaction Code", TransCode."Transaction Code");
                            PeriodTrans2.SetRange(PeriodTrans2."Payroll Period", "PR Employee P9 Info"."Payroll Period");
                            PeriodTrans2.SetRange(PeriodTrans2."Employee Code", "PR Employee P9 Info"."Employee Code");
                            if PeriodTrans2.Find('-') then
                                GPAY_Amoount += PeriodTrans2.Amount;
                        //MESSAGE(FORMAT(GPAY_Amoount))
                        //P9."Gross Pay"-
                        until TransCode.Next() = 0;




                    if (P9."Defined Contribution" + NSSF) > 20000 then begin
                        ColG := 20000 + "Owner Occupier Interest";
                        TotalG := TotalG + ColG;
                    end
                    else begin
                        ColG := (NSSF + SelfContrib);//+"Owner Occupier Interest";
                        TotalG := TotalG + ColG;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    "PR Employee P9 Info".SetFilter("PR Employee P9 Info"."Period Year", Format(SelectedPeriod));

                    GPAY_Amoount := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //   TransCode.RESET;
                //   TransCode.SETRANGE(TransCode.Taxable,TRUE);
                //   if TransCode.FIND('-') THEN
                //   BEGIN
                //      repeat
                //          PeriodTrans2.RESET;
                //          PeriodTrans2.SETRANGE(PeriodTrans2."Transaction Code",TransCode."Transaction Code");
                //          PeriodTrans2.SETRANGE()
                //      until  TransCode.NEXT=0;
                //   END


                objEmp.Reset();
                objEmp.SetRange(objEmp."No.", PeriodTrans."Employee Code");
                if objEmp.Find('-') then
                    //EmployeeName:=objEmp."First Name"+' '+objEmp."Middle Name"+' '+objEmp."Last Name";

                    SelfContrib := 0;

                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "No.");
                PeriodTrans.SetRange(PeriodTrans."Period Year", SelectedPeriod);
                PeriodTrans.SetRange(PeriodTrans."Transaction Name", 'Pension');
                PeriodTrans.SetRange(PeriodTrans."Company Deduction", false);  //dennis
                                                                               //PeriodTrans.SETRANGE(PeriodTrans."Transaction Code",SelfContribCode);

                if PeriodTrans.Find('-') then
                    SelfContrib := PeriodTrans.Amount;
                TotaA := 0;
                TotalB := 0;
                totalC := 0;
                totalD := 0;
                TotalE1 := 0;
                TotalE2 := 0;
                TotalE3 := 0;
                TotalF := 0;
                TotalG := 0;
                TotalH := 0;
                TotalJ := 0;
                TotalK := 0;
                TotalL := 0;

                P9.Reset();
                P9.SetRange(P9."Employee Code", "HR Employees"."No.");
                P9.SetRange(P9."Period Year", SelectedPeriod);
                if P9.Find('-') then
                    repeat
                        TotaA := TotaA + P9."Basic Pay";
                        TotalB := TotalB + P9.Benefits;
                        totalC := totalC + P9."Value Of Quarters";
                        totalD := totalD + P9."Gross Pay";
                        TotalE1 := TotalE1 + (P9."Basic Pay" * 0.3);
                        TotalE2 := TotalE2 + (P9.NSSF);
                        TotalE3 := TotalE3 + 20000;
                        TotalF := TotalF + P9."Owner Occupier Interest";
                        if P9.NSSF < 20000 then
                            //TotalG:=TotalG+P9.NSSF;
                            TotalH := TotalH + (P9."Gross Pay" - (P9.NSSF + P9."Defined Contribution"))
                        else
                            //TotalG:=TotalG+20000;
                            TotalH := TotalH + (P9."Gross Pay" - 20000);
                        TotalJ := TotalJ + P9."Tax Charged";
                        TotalK := TotalK + (P9."Tax Relief" + P9."Insurance Relief");
                        TotalL := TotalL + P9.PAYE;
                    until P9.Next() = 0;

                "Total Tax Charged" := TotalJ;
            end;

            trigger OnPreDataItem()
            begin
                if SelectedPeriod = 0 then
                    Error('Please enter a Payroll Year');
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Period)
                {
                    field("Select Period"; SelectedPeriod)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the SelectedPeriod field.';
                    }
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        //SelectedPeriod:="prEmployee P9 Info"."Period Year";
        fixedDefContri := 20000;

        ControlInfo.Reset();
        if ControlInfo.Get() then
            EmployerName := 'Employer Name: ' + ControlInfo.Name;
    end;

    var
        strEmpName: Text[250];
        strPin: Text[30];
        EmployerPIN: Text[30];
        SelectedPeriod: Integer;
        fixedDefContri: Decimal;
        "Total Tax Charged": Decimal;
        "Total PAYE": Decimal;
        TotaA: Decimal;
        TotalB: Decimal;
        totalC: Decimal;
        totalD: Decimal;
        TotalE1: Decimal;
        TotalE2: Decimal;
        TotalE3: Decimal;
        TotalF: Decimal;
        TotalG: Decimal;
        TotalH: Decimal;
        TotalI: Decimal;
        TotalJ: Decimal;
        TotalK: Decimal;
        TotalL: Decimal;
        P9: Record "PR Employee P9 Info";
        ColG: Decimal;
        Employer_s_Name___MESPTCaptionLbl: Label 'Employer''s Name:  Mwalimu Sacco LTD';
        DOMESTIC_TAXES_DEPARTMENTCaptionLbl: Label 'DOMESTIC TAXES DEPARTMENT';
        TAX_DEDUCTION_CARD_YEAR_CaptionLbl: Label 'TAX DEDUCTION CARD YEAR:';
        EMPLOYER_S_PINCaptionLbl: Label 'EMPLOYER''S PIN';
        MONTHCaptionLbl: Label 'MONTH';
        Basic_SalaryCaptionLbl: Label 'Basic Salary';
        Benefits__Non_CashCaptionLbl: Label 'Benefits\ Non-Cash';
        Value_Of__QuartersCaptionLbl: Label 'Value Of\ Quarters';
        Total__Gross_PayCaptionLbl: Label 'Total\ Gross Pay';
        Defined_Contribution__Retirement_SchemeCaptionLbl: Label 'Defined Contribution\ Retirement Scheme';
        Owner_Occupier_InterestCaptionLbl: Label 'Owner Occupier Interest';
        Retirement_Contribution___Owner_OccupierCaptionLbl: Label 'Retirement Contribution \ Owner Occupier';
        Column_D_G__Chargeable_AmountCaptionLbl: Label 'Column D-G\ Chargeable Amount';
        Personal__ReliefCaptionLbl: Label 'Personal\ Relief';
        P_A_Y_E__TAXCaptionLbl: Label 'P.A.Y.E. TAX';
        ECaptionLbl: Label 'E';
        E1__30_CaptionLbl: Label 'E1 \30%';
        E2__ActualCaptionLbl: Label 'E2 \Actual';
        E3__FIXEDCaptionLbl: Label 'E3 \FIXED';
        ACaptionLbl: Label 'A';
        BCaptionLbl: Label 'B';
        CCaptionLbl: Label 'C';
        DCaptionLbl: Label 'D';
        F__Amount_of_InterestCaptionLbl: Label 'F \Amount of Interest';
        G__Lowest_of_E_added_to_FCaptionLbl: Label 'G \Lowest of E added to F';
        HCaptionLbl: Label 'H';
        JCaptionLbl: Label 'J';
        V1_162_00CaptionLbl: Label '1,162.00';
        KCaptionLbl: Label 'K';
        V0CaptionLbl: Label '0';
        LCaptionLbl: Label 'L';
        Total__Kshs___1_162_00CaptionLbl: Label 'Total (Kshs) \1,162.00';
        Employee_s_MainCaptionLbl: Label 'Employee''s Main';
        Personal_File_No_CaptionLbl: Label 'Personal File No.';
        Employee_PINCaptionLbl: Label 'Employee PIN';
        Tobe_completed_by_Employer_at_end_of_yearCaptionLbl: Label 'Tobe completed by Employer at end of year';
        IMPORTANTCaptionLbl: Label 'IMPORTANT';
        NAMES_OF_MORTGAGE_FINANCIAL_INSTITUTION______________________________________Lbl: Label 'NAMES OF MORTGAGE FINANCIAL INSTITUTION .....................................................';
        L_R__No__OF_OWNER_OCCUPIED_HOUSE_____________________________________DATE_OF_OCCUPATILbl: Label 'L.R. No. OF OWNER OCCUPIED HOUSE........................................................................';
        DATE_OF_OCCUPATION: Label 'DATE OF OCCUPATION...............................................................................................';
        TotalCaptionLbl: Label 'Total';
        TOTAL_CHARGEABLE_PAY__COL_h__KshsCaptionLbl: Label 'TOTAL CHARGEABLE PAY (COL h) Kshs';
        TOTAL_CHARGEABLE_PAY__COL_l__KshsCaptionLbl: Label 'TOTAL CHARGEABLE PAY (COL l) Kshs';
        V1__Use_P9ACaptionLbl: Label '1. Use P9A';
        a__For_all_liable_employees_and_where_director_employee_received_Benefits_in_additions_to_cash_emoluments_CaptionLbl: Label '(a) For all liable employees and where director/employee received';
        next: Label ' Benefits in additions to cash emoluments.';
        b__Where_an_employee_is_eligible_to_deduction_on_owner_occupier_interest_CaptionLbl: Label '(b) Where an employee is eligible to deduction on owner occupier interest.';
        V2___a__Allowable_interest_in_respect_of_any_month_mustnot_exceed_Kshs_12_500___per_year_CaptionLbl: Label '2. (a) Allowable interest in respect of any month mustnot exceed Kshs.12,500/= per year.';
        V2___a__Allowable_interest_in_respect_of_any_month_mustnot_exceed_Kshs_12_500___per_year_Caption_Control1102755010Lbl: Label '2. (a) Allowable interest in respect of any month mustnot exceed Kshs.12,500/= per year.';
        See_back_of_this_card_for_further_information_required_by_the_department__CaptionLbl: Label '(See back of this card for further information required by the department).';
        i__Photostat_copy_of_interest_certificate_and_statement_of_account_from_the_Financial_Institution_CaptionLbl: Label ' (i) Photostat copy of interest certificate and statement of account from the Financial Institution.';
        b__AttachCaptionLbl: Label '(b) Attach';
        ii__THE_DECLARATION_duly_signed_by_the_employee_CaptionLbl: Label ' (ii) THE DECLARATION duly signed by the employee.';
        PeriodTrans: Record "PR Period Transactions";
        SelfContrib: Decimal;
        objEmp: Record "HR Employees";
        ControlInfo: Record "Control-Information";
        EmployerName: Text[100];
        TransCode: Record "PR Transaction Codes";
        PeriodTrans2: Record "PR Period Transactions";
        Emptrans: Record "PR Employee Transactions";
        GPAY_Amoount: Decimal;
}

