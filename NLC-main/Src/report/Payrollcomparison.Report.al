#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193642 "Payroll comparison"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll comparison.rdlc';
    ApplicationArea = All;
    Caption = 'Payroll comparison';
    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
            column(ReportForNavId_2; 2) { }
            column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code") { }
            column(TransactionName_PRTransactionCodes; "PR Transaction Codes"."Transaction Name") { }
            column(EmployeeCode; PRSalaryCard."Employee Code") { }
            dataitem("PR Salary Card"; "PR Salary Card")
            {
                column(ReportForNavId_3; 3) { }
                column(EmployeeCode_PRSalaryCard; "PR Salary Card"."Employee Code") { }
                column(BasicPay_PRSalaryCard; "PR Salary Card"."Basic Pay") { }

                trigger OnAfterGetRecord()
                begin

                    Employee.Get("PR Salary Card"."Employee Code");

                    if HrEmp.Get("PR Salary Card"."Employee Code") then
                        Names := HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                    EmpNo := HrEmp."No.";
                    VPast := 0;
                    VCurr := 0;
                    VVar := 0;

                    Matrix.Reset();
                    Matrix.SetRange(Matrix."Employee Code", "PR Salary Card"."Employee Code");
                    Matrix.SetRange(Matrix."Payroll Period", PrevPeriod);
                    Matrix.SetRange(Matrix."Transaction Code", "PR Transaction Codes"."Transaction Code");
                    if Matrix.Find('-') then begin
                        VPast := Abs(Matrix.Amount);
                        TransCode := Matrix."Transaction Code";
                        TransName := Matrix."Transaction Name";
                    end;

                    Matrix.Reset();
                    Matrix.SetRange(Matrix."Employee Code", "PR Salary Card"."Employee Code");
                    Matrix.SetRange(Matrix."Payroll Period", CurrPeriod);
                    Matrix.SetRange(Matrix."Transaction Code", "PR Transaction Codes"."Transaction Code");
                    if Matrix.Find('-') then begin
                        VCurr := Abs(Matrix.Amount);
                        TransCode := Matrix."Transaction Code";
                        TransName := Matrix."Transaction Name";
                    end;

                    VVar := VCurr - VPast;
                    VPastTot := VPastTot + VPast;
                    VCurrTot := VCurrTot + VCurr;
                    VVarTot := VVarTot + VVar;

                    if (VPast = 0) and (VCurr = 0) and (VVar = 0) then
                        CurrReport.Skip();
                end;

                trigger OnPreDataItem()
                begin

                    VPastTot := 0;
                    VCurrTot := 0;
                    VVarTot := 0;
                end;
            }
        }
        dataitem(BasicPay; "PR Salary Card")
        {
            column(ReportForNavId_8; 8) { }
            column(bpay; "PR Salary Card"."Basic Pay") { }
            column(TransCode; TransCode) { }
            column(TransName; TransName) { }
            column(EmpNo; EmpNo) { }
            column(Names; Names) { }
            column(VPast; VPast) { }
            column(VCurr; VCurr) { }
            column(VVarTot; VVarTot) { }

            trigger OnAfterGetRecord()
            begin

                Employee.Get(BasicPay."Employee Code");
                if HrEmp.Get(BasicPay."Employee Code") then
                    Names2 := HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                EmpNo2 := HrEmp."No.";


                VPast := 0;
                VCurr := 0;
                VVar := 0;

                Matrix.Reset();
                Matrix.SetRange(Matrix."Employee Code", BasicPay."Employee Code");
                Matrix.SetRange(Matrix."Payroll Period", PrevPeriod);
                Matrix.SetFilter(Matrix."Transaction Code", '=BPAY');
                if Matrix.Find('-') then begin
                    VPast := Abs(Matrix.Amount);
                    TransCode := Matrix."Transaction Code";
                    TransName := Matrix."Transaction Name";

                end;

                Matrix.Reset();
                Matrix.SetRange(Matrix."Employee Code", BasicPay."Employee Code");
                Matrix.SetRange(Matrix."Payroll Period", CurrPeriod);
                Matrix.SetFilter(Matrix."Transaction Code", '=BPAY');
                if Matrix.Find('-') then begin
                    VCurr := Abs(Matrix.Amount);
                    TransCode := Matrix."Transaction Code";
                    TransName := Matrix."Transaction Name";

                end;

                VVar := VCurr - VPast;
                VPastTot := VPastTot + VPast;
                VCurrTot := VCurrTot + VCurr;
                VVarTot := VVarTot + VVar;

                if (VPast = 0) and (VCurr = 0) and (VVar = 0) then
                    CurrReport.Skip();
            end;

            trigger OnPreDataItem()
            begin

                VPastTot := 0;
                VCurrTot := 0;
                VVarTot := 0;
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Employee: Record "PR Salary Card";
        VPast: Decimal;
        VCurr: Decimal;
        VVar: Decimal;
        VPastTot: Decimal;
        VCurrTot: Decimal;
        VVarTot: Decimal;
        PrevPeriod: Date;
        CurrPeriod: Date;
        Matrix: Record "PR Period Transactions";
        Names: Text[80];
        HrEmp: Record "HR Employees";
        EmpNo: Code[30];
        TransCode: Code[30];
        TransName: Text[100];
        Names2: Text[60];
        EmpNo2: Code[30];
        PRSalaryCard: Record "PR Salary Card";
}
