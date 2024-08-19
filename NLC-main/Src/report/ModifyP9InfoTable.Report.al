#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193742 "Modify P9 Info Table"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Modify P9 Info Table.rdlc';
    ApplicationArea = All;
    Caption = 'Modify P9 Info Table';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = const('N.H.I.F RELIEF'));
            column(ReportForNavId_1; 1) { }
            column(AmountRec; AmountRec) { }
            column(TransCode; TransCode) { }
            column(EmpCode; EmpCode) { }
            column(PayPeriod; PayPeriod) { }
            column(EmpName; EmpName) { }
            column(Counter; Counter) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(PeriodMonth_PRPeriodTransactions; "PR Period Transactions"."Period Month") { }
            column(PeriodYear_PRPeriodTransactions; "PR Period Transactions"."Period Year") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }

            trigger OnAfterGetRecord()
            var
                P9Info: Record "PR Employee P9 Info";
            begin
                Counter := Counter + 1;
                Emp.SetRange(Emp."No.", "PR Period Transactions"."Employee Code");
                if Emp.Find('-') then
                    EmpName := Emp."Full Name";

                P9Info.Reset();
                P9Info.SetRange(P9Info."Employee Code", "PR Period Transactions"."Employee Code");
                P9Info.SetRange(P9Info."Payroll Period", "PR Period Transactions"."Payroll Period");
                "PR Period Transactions".SetRange("PR Period Transactions"."Transaction Code", 'N.H.I.F RELIEF');
                //"PR Period Transactions".SETRANGE("PR Period Transactions"."Employee Code",'NLC20150304');
                if P9Info.Find('-') then
                    repeat
                        P9Info."NHIF Relief" := "PR Period Transactions".Amount;
                        //MESSAGE('%1%2',P9Info."Payroll Period",P9Info."Employee Code")
                        P9Info.Modify();
                    until P9Info.Next() = 0;
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
        P9Info: Record "PR Employee P9 Info";
        AmountRec: Decimal;
        TransCode: Code[50];
        EmpCode: Code[80];
        PayPeriod: Date;
        EmpName: Text[100];
        Emp: Record "HR Employees";
        Counter: Integer;
}
