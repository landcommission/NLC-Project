#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50025 "Imprest Surrender NCA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Surrender NCA.rdlc';
    ApplicationArea = All;
    Caption = 'Imprest Surrender NCA';
    dataset
    {
        dataitem("Imprest Surrender Header"; "Imprest Surrender Header")
        {
            column(ReportForNavId_1; 1) { }
            column(ReceiptFrom; "Imprest Surrender Header"."Received From") { }
            column(AccountNo; "Imprest Surrender Header"."Account No.") { }
            column(Payee; "Imprest Surrender Header".Payee) { }
            column(Logo; CompanyInfo.Picture) { }
            dataitem("Imprest Surrender Details"; "Imprest Surrender Details")
            {
                column(ReportForNavId_6; 6) { }
                column(Amount_advanced; "Imprest Surrender Details".Amount) { }
                column(Actual_spent; "Imprest Surrender Details"."Actual Spent") { }
                column(Surrendered; "Imprest Surrender Details".Surrendered) { }
            }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
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
        CompanyInfo: Record "Company Information";
}
