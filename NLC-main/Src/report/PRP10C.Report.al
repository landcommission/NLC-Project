#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193465 "PR P10C"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR P10C.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR P10C';
    dataset
    {
        dataitem("PR Payroll Periods"; "PR Payroll Periods")
        {
            column(ReportForNavId_1102755000; 1102755000) { }
            column(periodName; PeriodName) { }
            column(PAYEtax; PAYEtax) { }
            column(totalPAYE; totPAYEtax) { }
            column(pensionContribution; pensioncontribution) { }
            column(TotalContribution; totalcontribution) { }

            trigger OnAfterGetRecord()
            begin
                PAYEtax := 0;
                FRINGEtax := 0;
                pensioncontribution := 0;

                periodtrans.Reset();
                periodtrans.SetRange(periodtrans."Payroll Period", "PR Payroll Periods"."Date Opened");
                periodtrans.SetRange(periodtrans."Transaction Name", 'P.A.Y.E');
                if periodtrans.Find('-') then
                    repeat
                        PeriodName := "PR Payroll Periods"."Period Name";
                        PAYEtax := PAYEtax + periodtrans.Amount;
                        totPAYEtax := totPAYEtax + periodtrans.Amount;
                    until periodtrans.Next() = 0;

                periodtrans.Reset();
                periodtrans.SetRange(periodtrans."Transaction Name", 'Pension Employee');
                if periodtrans.Find('-') then
                    repeat
                        pensioncontribution := pensioncontribution + periodtrans.Amount;
                        totalcontribution := totalcontribution + periodtrans.Amount;
                    until periodtrans.Next() = 0;
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
        PeriodName: Text[50];
        SelectedPeriod: Date;
        EmployerPIN: Text[30];
        objPeriod: Record "PR Payroll Periods";
        PAYEtax: Decimal;
        periodtrans: Record "PR Period Transactions";
        totPAYEtax: Decimal;
        EmployerName: Text[50];
        EmployerAddress: Text[50];
        FRINGEtax: Decimal;
        employerded: Record "PR Employer Deductions";
        totFRINGEtax: Decimal;
        pensioncontribution: Decimal;
        totalcontribution: Decimal;
}
