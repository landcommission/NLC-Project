#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193539 "prMonthly Variance2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prMonthly Variance2.rdlc';
    ApplicationArea = All;
    Caption = 'prMonthly Variance2';
    dataset
    {
        dataitem("prMonthly Variance"; "prMonthly Variance")
        {
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode; "prMonthly Variance"."Employee code") { }
            column(TransactionCode; "prMonthly Variance"."Trans Code") { }
            column(EmployeeName; "prMonthly Variance"."Employee Name") { }
            column(TransactionName; "prMonthly Variance"."Trans Name") { }
            column(CurrentAmount; "prMonthly Variance"."Curr Amount") { }
            column(PreviousAmount; "prMonthly Variance"."Prev Amount") { }
            column(Variance; "prMonthly Variance".Variance) { }
            column(Picture; CI.Picture) { }
            column(Caption; Txt001) { }

            trigger OnAfterGetRecord()
            begin

                if "prMonthly Variance".Variance = 0 then
                    CurrReport.Skip();
            end;

            trigger OnPreDataItem()
            begin
                CI.Reset();
                if CI.Get() then
                    CI.CalcFields(Picture);
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
        CI: Record "Company Information";
        Txt001: Label 'Variance Report';
}
