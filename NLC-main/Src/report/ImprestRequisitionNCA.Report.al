#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50024 "Imprest Requisition NCA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Requisition NCA.rdlc';
    ApplicationArea = All;
    Caption = 'Imprest Requisition NCA';
    dataset
    {
        dataitem("Imprest Header"; "Imprest Header")
        {
            column(ReportForNavId_1; 1) { }
            column(Personal_No; "Imprest Header"."Account No.") { }
            column(Name; "Imprest Header".Payee) { }
            column(Purpose; "Imprest Header".Purpose) { }
            column(Logo; CompanyInfo.Picture) { }
            dataitem("Imprest Lines"; "Imprest Lines")
            {
                column(ReportForNavId_2; 2) { }
                column(AccountNo; "Imprest Lines"."Account No:") { }
                column(AccountName; "Imprest Lines"."Account Name") { }
                column(Amount; "Imprest Lines".Amount) { }
                column(Destination; "Imprest Lines"."Destination Code") { }
                column(No_of_Days; "Imprest Lines"."No of Days") { }
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
