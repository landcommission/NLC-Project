#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50021 "Imprest Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Requisition.rdlc';
    ApplicationArea = All;
    Caption = 'Imprest Requisition';
    dataset
    {
        dataitem("Imprest Header"; "Imprest Header")
        {
            column(ReportForNavId_1; 1) { }
            column(No; "Imprest Header"."No.") { }
            column(Date; "Imprest Header".Date) { }
            column(Account_No; "Imprest Header"."Account No.") { }
            column(Name; "Imprest Header".Payee) { }
            column(Purpose; "Imprest Header".Purpose) { }
            column(Logo; CompanyInfo.Picture) { }

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
