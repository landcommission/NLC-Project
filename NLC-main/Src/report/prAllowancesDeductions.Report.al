#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193540 "prAllowances_Deductions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prAllowances_Deductions.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'prAllowances_Deductions';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            RequestFilterFields = "Payroll Period";
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode; "PR Period Transactions"."Employee Code") { }
            column(EmployeeName; "Employee Name") { }
            column(Department; "PR Period Transactions".Department) { }
            column(TransactionCode; "PR Period Transactions"."Transaction Code") { }
            column(TransactionName; "PR Period Transactions"."Transaction Name") { }
            column(Amount; "PR Period Transactions".Amount) { }
            column(Picture; CI.Picture) { }
            column(PeriodName; PeriodName) { }
            column(Caption; Txt001) { }

            trigger OnAfterGetRecord()
            begin
                "PR Period Transactions".SetRange("PR Period Transactions"."Payroll Period", SelectedPeriod);

                "Employee Name" := '';
                "PR Period Transactions".Department := '';
                HREmp.Reset();
                if HREmp.Get("PR Period Transactions"."Employee Code") then begin
                    "Employee Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    "PR Period Transactions".Department := HREmp."Global Dimension 1 Code";
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field(SelectedPeriod; SelectedPeriod)
                {
                    ApplicationArea = Basic;
                    TableRelation = "PR Payroll Periods";
                    ToolTip = 'Specifies the value of the SelectedPeriod field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin

        if SelectedPeriod = 0D then
            Error('You must specify the period filter');
        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then
            PeriodName := objPeriod."Period Name";



        CI.Reset();
        if CI.Get() then
            CI.CalcFields(Picture);
    end;

    var
        HREmp: Record "HR Employees";
        "Employee Name": Text[250];
        Department: Code[20];
        CI: Record "Company Information";
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        PeriodName: Text[50];
        Txt001: Label 'Allowance and Deductions Report';
}
