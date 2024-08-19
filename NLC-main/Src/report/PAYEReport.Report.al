#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193476 "PAYE Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PAYE Report.rdlc';
    ApplicationArea = All;
    Caption = 'PAYE Report';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode_PRSalaryCard; "PR Salary Card"."Employee Code") { }
            column(BasicPay_PRSalaryCard; "PR Salary Card"."Basic Pay") { }
            column(PaymentMode_PRSalaryCard; "PR Salary Card"."Payment Mode") { }
            column(Currency_PRSalaryCard; "PR Salary Card".Currency) { }
            column(PaysNSSF_PRSalaryCard; "PR Salary Card"."Pays NSSF") { }
            column(PaysNHIF_PRSalaryCard; "PR Salary Card"."Pays NHIF") { }
            column(PaysPAYE_PRSalaryCard; "PR Salary Card"."Pays PAYE") { }
            column(PayslipMessage_PRSalaryCard; "PR Salary Card"."Payslip Message") { }
            column(CummBasicPay_PRSalaryCard; "PR Salary Card"."Cumm BasicPay") { }
            column(CummGrossPay_PRSalaryCard; "PR Salary Card"."Cumm GrossPay") { }
            column(CummNetPay_PRSalaryCard; "PR Salary Card"."Cumm NetPay") { }
            column(CummAllowances_PRSalaryCard; "PR Salary Card"."Cumm Allowances") { }
            column(CummDeductions_PRSalaryCard; "PR Salary Card"."Cumm Deductions") { }
            column(SuspendPay_PRSalaryCard; "PR Salary Card"."Suspend Pay") { }
            column(SuspensionDate_PRSalaryCard; "PR Salary Card"."Suspension Date") { }
            column(SuspensionReasons_PRSalaryCard; "PR Salary Card"."Suspension Reasons") { }
            column(PeriodFilter_PRSalaryCard; "PR Salary Card"."Period Filter") { }
            column(Exists_PRSalaryCard; "PR Salary Card".Exists) { }
            column(CummPAYE_PRSalaryCard; "PR Salary Card"."Cumm PAYE") { }
            column(CummNSSF_PRSalaryCard; "PR Salary Card"."Cumm NSSF") { }
            column(CummPension_PRSalaryCard; "PR Salary Card"."Cumm Pension") { }
            column(CummHELB_PRSalaryCard; "PR Salary Card"."Cumm HELB") { }
            column(CummNHIF_PRSalaryCard; "PR Salary Card"."Cumm NHIF") { }
            column(BankAccountNumber_PRSalaryCard; "PR Salary Card"."Bank Account Number") { }
            column(BankBranch_PRSalaryCard; "PR Salary Card"."Bank Branch") { }
            column(EmployeesBank_PRSalaryCard; "PR Salary Card"."Employee's Bank") { }
            column(PostingGroup_PRSalaryCard; "PR Salary Card"."Posting Group") { }
            column(NoOvertimeDaysWorked_PRSalaryCard; "PR Salary Card"."No. Overtime Day(s) Worked") { }
            column(IdentificationNumber_PRSalaryCard; "PR Salary Card"."Identification Number") { }
            column(MobileNumber_PRSalaryCard; "PR Salary Card"."Mobile Number") { }
            column(Nationality_PRSalaryCard; "PR Salary Card".Nationality) { }
            column(DateofBirth_PRSalaryCard; "PR Salary Card"."Date of Birth") { }
            column(SchemeCode2_PRSalaryCard; "PR Salary Card"."Scheme Code 2") { }
            column(JobTitle_PRSalaryCard; "PR Salary Card"."Job Title") { }
            column(JobDescription_PRSalaryCard; "PR Salary Card"."Job Description") { }
            column(Address_PRSalaryCard; "PR Salary Card".Address) { }
            column(EmploymentDate_PRSalaryCard; "PR Salary Card"."Employment Date") { }
            column(Status_PRSalaryCard; "PR Salary Card".Status) { }
            column(PINNo_PRSalaryCard; "PR Salary Card"."PIN No.") { }
            column(BankAccountNo_PRSalaryCard; "PR Salary Card"."Bank Account No.") { }
            column(ContractEndDate_PRSalaryCard; "PR Salary Card"."Contract End Date") { }
            column(JobGroup_PRSalaryCard; "PR Salary Card"."Job Group") { }
            column(CompanyEMail_PRSalaryCard; "PR Salary Card"."Company E-Mail") { }
            column(DaysWorked_PRSalaryCard; "PR Salary Card"."Days Worked") { }
            column(GradeLevel_PRSalaryCard; "PR Salary Card"."Grade Level") { }
            column(Gratuity_PRSalaryCard; "PR Salary Card"."Gratuity %") { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
