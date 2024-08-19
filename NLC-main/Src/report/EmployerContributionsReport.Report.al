#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193497 "Employer Contributions Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employer Contributions Report.rdlc';
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'Employer Contributions Report';
    dataset
    {
        dataitem("PR Employer Deductions"; "PR Employer Deductions")
        {
            column(ReportForNavId_18; 18) { }
            column(EmployeeCode_PREmployerDeductions; "PR Employer Deductions"."Employee Code") { }
            column(TransactionCode_PREmployerDeductions; "PR Employer Deductions"."Transaction Code") { }
            column(Amount_PREmployerDeductions; "PR Employer Deductions".Amount) { }
            column(PeriodMonth_PREmployerDeductions; "PR Employer Deductions"."Period Month") { }
            column(PeriodYear_PREmployerDeductions; "PR Employer Deductions"."Period Year") { }
            column(PayrollPeriod_PREmployerDeductions; "PR Employer Deductions"."Payroll Period") { }
            column(PayrollCode_PREmployerDeductions; "PR Employer Deductions"."Payroll Code") { }
            column(Period1_Filter; Period1_Filter) { }
            column(Period2_Filter; Period2_Filter) { }
            column(Period_1_TransAmount; Period_1_TransAmount) { }
            column(Period_2_TransAmount; Period_2_TransAmount) { }
            column(Var_TransAmount; Var_TransAmount) { }
            column(TotalVariance; TotalVariance) { }
            column(AppliedFilters; AppliedFilters) { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(Names; Names) { }

            trigger OnAfterGetRecord()
            begin


                HrEmp.Reset();
                HrEmp.SetRange(HrEmp."No.", "PR Employer Deductions"."Employee Code");
                if HrEmp.Find('-') then
                    Names := HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
            end;

            trigger OnPreDataItem()
            begin

                "PR Employer Deductions".SetRange("PR Employer Deductions"."Transaction Code", TransactionCode);
                "PR Employer Deductions".SetRange("PR Employer Deductions"."Payroll Period", SelectedPeriod);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field("Payroll Period"; SelectedPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Period';
                    TableRelation = "PR Payroll Periods"."Date Opened";
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field(TransactionCode; TransactionCode)
                {
                    ApplicationArea = Basic;
                    Caption = 'TransactionCode';
                    TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Code" = const('NSSF|D162|NITA'));
                    ToolTip = 'Specifies the value of the TransactionCode field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        if SelectedPeriod = 0D then
            Error('Please enter selected period');
        if TransactionCode = '' then
            Error('Please enter the Transaction Code');
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        VPast: Decimal;
        VCurr: Decimal;
        VVar: Decimal;
        VPastTot: Decimal;
        VCurrTot: Decimal;
        VVarTot: Decimal;
        PrevPeriod: Date;
        CurrPeriod: Date;
        Names: Text[80];
        HrEmp: Record "HR Employees";
        EmpNo: Code[100];
        TransCode: Code[100];
        TransName: Text[100];
        Names2: Text[100];
        EmpNo2: Code[10];
        Reason: Text[100];
        PostingGroup: Code[20];
        Matrix: Record "PR Employer Deductions";
        Period_1_TransAmount: Decimal;
        Period_2_TransAmount: Decimal;
        Var_TransAmount: Decimal;
        PRPeriodTrans: Record "PR Period Transactions";
        Period1_Filter: Date;
        Period2_Filter: Date;
        AppliedFilters: Text;
        CompInfo: Record "Company Information";
        EmployeeName: Text;
        TotalVariance: Decimal;
        Period_1_Var: Decimal;
        Period_2_Var: Decimal;
        TransactionCode: Code[50];
        SelectedPeriod: Date;
        PrTransactCode: Record "PR Transaction Codes";
}
