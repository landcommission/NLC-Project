#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50040 "PR Comparison Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Comparison Report.rdlc';
    ApplicationArea = All;
    Caption = 'PR Comparison Report';
    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
            DataItemTableView = where("Transaction Code" = filter(<> ''));
            RequestFilterFields = "Transaction Type", "Transaction Code";
            column(ReportForNavId_13; 13) { }
            column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code") { }
            column(TransactionName_PRTransactionCodes; "PR Transaction Codes"."Transaction Name") { }
            column(Names; Names) { }
            column(EmpNo; EmpNo) { }
            column(VPast; VPast) { }
            column(VCurr; VCurr) { }
            column(VVar; VVar) { }
            column(Reason; Reason) { }

            trigger OnAfterGetRecord()
            begin

                //Initialize
                VPast := 0;
                VCurr := 0;
                VVar := 0;

                //Period 1
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Transaction Codes"."Transaction Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PrevPeriod);
                if PRPeriodTrans.Find('-') then
                    repeat
                        VPast := PRPeriodTrans.Amount;
                    until PRPeriodTrans.Next() = 0;

                //Period 2
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Transaction Codes"."Transaction Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", CurrPeriod);
                if PRPeriodTrans.Find('-') then
                    repeat

                        VCurr := PRPeriodTrans.Amount;
                    until PRPeriodTrans.Next() = 0;

                //Variance
                VVar := VPast - VCurr;

                //Skip if no results
                if VVar = 0 then
                    CurrReport.Skip();
            end;
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
                field("Transcation Type"; TranscationType)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transcation Type';
                    ToolTip = 'Specifies the value of the Transcation Type field.';
                }
                field("Transcation Code"; TranscationCode)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transcation Code';
                    ToolTip = 'Specifies the value of the Transcation Code field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        //Test Fields
        if PrevPeriod = 0D then
            Error('Please select Period 1 filter');
        if CurrPeriod = 0D then
            Error('Please select Period 2 filter');
        if PrevPeriod = CurrPeriod then
            Error('Period 1 Filter cannot be same as Period 2 Filter');

        //Company Info
        //fnCompanyInfo;

        //Applied Filters
        AppliedFilters := 'PrevPeriod: ' + Format(CurrPeriod) + ', Period 2 Filter: ' + Format(CurrPeriod) +
                         ',' + "PR Transaction Codes".GetFilters;
    end;

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
        TranscationType: Option Income,Deduction;
        TranscationCode: Code[100];
        PRPeriodTrans: Record "PR Period Transactions";
        AppliedFilters: Text;
}
