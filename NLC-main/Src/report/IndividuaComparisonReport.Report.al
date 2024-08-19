#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50050 "Individua Comparison Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Individua Comparison Report.rdlc';
    ApplicationArea = All;
    Caption = 'Individua Comparison Report';
    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
            RequestFilterFields = "Transaction Code", "Transaction Type";
            column(ReportForNavId_9; 9) { }
            column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code") { }
            column(TransactionName_PRTransactionCodes; "PR Transaction Codes"."Transaction Name") { }
            dataitem("PR Salary Card"; "PR Salary Card")
            {
                RequestFilterFields = "Employee Code";
                column(ReportForNavId_2; 2) { }
                column(Names; Names) { }
                column(EmpNo; EmpNo) { }
                column(VPast; VPast) { }
                column(VCurr; VCurr) { }
                column(VVar; VVar) { }
                column(Reason; Reason) { }
                column(Grade; Grade) { }
                column(Title; Title) { }
                column(Responsibility; Responsibility) { }
                column(PrevPeriod; PrevPeriod) { }
                column(CurrPeriod; CurrPeriod) { }
                column(VPastTot; VPastTot) { }
                column(VCurrTot; VCurrTot) { }
                column(VVarTot; VVarTot) { }

                trigger OnAfterGetRecord()
                begin
                    Employee.Get("PR Salary Card"."Employee Code");

                    if HrEmp.Get("PR Salary Card"."Employee Code") then
                        Names := HrEmp."First Name" + ' ' + HrEmp."Middle Name" + ' ' + HrEmp."Last Name";
                    EmpNo := HrEmp."No.";
                    Grade := HrEmp.Grade;
                    Title := HrEmp."Job Title";
                    Responsibility := HrEmp."Responsibility Center";
                    VPast := 0;
                    VCurr := 0;
                    VVar := 0;

                    Matrix.Reset();
                    Matrix.SetRange(Matrix."Employee Code", "PR Salary Card"."Employee Code");

                    Matrix.SetRange(Matrix."Payroll Period", PrevPeriod);
                    Matrix.SetRange(Matrix."Transaction Code", "PR Transaction Codes"."Transaction Code");
                    //Matrix.SETRANGE(Matrix."Posting Group",PostingGroup);
                    if Matrix.Find('-') then begin
                        VPast := Abs(Matrix.Amount);
                        TransCode := Matrix."Transaction Code";
                        TransName := Matrix."Transaction Name";

                    end;

                    Matrix.Reset();
                    Matrix.SetRange(Matrix."Employee Code", "PR Salary Card"."Employee Code");
                    Matrix.SetRange(Matrix."Payroll Period", CurrPeriod);
                    Matrix.SetRange(Matrix."Transaction Code", "PR Transaction Codes"."Transaction Code");
                    //Matrix.SETRANGE(Matrix."Posting Group",PostingGroup);
                    if Matrix.Find('-') then begin
                        VCurr := Abs(Matrix.Amount);
                        TransCode := Matrix."Transaction Code";
                        TransName := Matrix."Transaction Name";
                    end;

                    VVar := VCurr - VPast;
                    VPastTot := VPastTot + VPast;
                    VCurrTot := VCurrTot + VCurr;
                    VVarTot := VVarTot + VVar;

                    //IF (VPast=0) AND (VCurr=0) AND (VVar=0) THEN CurrReport.SKIP;

                    if (VVar = 0) then
                        CurrReport.Skip();


                    PREmployeeTrans.Reset();
                    PREmployeeTrans.SetRange(PREmployeeTrans."Employee Code", "Employee Code");
                    PREmployeeTrans.SetRange(PREmployeeTrans."Transaction Code", TransCode);
                    if PREmployeeTrans.Find('-') then
;
                end;

                trigger OnPreDataItem()
                begin
                    VPastTot := 0;
                    VCurrTot := 0;
                    VVarTot := 0;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field("Previous Period"; PrevPeriod)
                {
                    ApplicationArea = Basic;
                    TableRelation = "PR Payroll Periods"."Date Opened";
                    ToolTip = 'Specifies the value of the PrevPeriod field.';
                }
                field("Current Period"; CurrPeriod)
                {
                    ApplicationArea = Basic;
                    TableRelation = "PR Payroll Periods"."Date Opened";
                    ToolTip = 'Specifies the value of the CurrPeriod field.';
                }
                field(PostingGroup; PostingGroup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Group';
                    TableRelation = "prSalary Review Header"."Proposal No.";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
            }
        }

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
        EmpNo: Code[100];
        TransCode: Code[100];
        TransName: Text[100];
        Names2: Text[100];
        EmpNo2: Code[10];
        PREmployeeTrans: Record "PR Employee Transactions";
        Reason: Text[100];
        PostingGroup: Code[20];
        Grade: Code[50];
        Title: Text[100];
        Responsibility: Code[100];
}

