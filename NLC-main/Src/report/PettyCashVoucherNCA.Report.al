#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50023 "Petty Cash Voucher NCA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Petty Cash Voucher NCA.rdlc';
    ApplicationArea = All;
    Caption = 'Petty Cash Voucher NCA';
    dataset
    {
        dataitem("Payments Header"; "Payments Header")
        {
            column(ReportForNavId_1; 1) { }
            column(No; "Payments Header"."No.") { }
            column(Date; "Payments Header".Date) { }
            column(Payee; "Payments Header".Payee) { }
            column(Logo; CompanyInfo.Picture) { }
            column(Total; Total) { }
            dataitem("Payment Line"; "Payment Line")
            {
                DataItemLink = No = field("No.");
                column(ReportForNavId_5; 5) { }
                column(Particulars; "Payment Line"."Account Name") { }
                column(Amount; "Payment Line".Amount) { }
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Status = filter(Approved));
                column(ReportForNavId_8; 8) { }
                column(Approved_By; "Approval Entry"."Approver ID") { }
                column(Date_Approved; "Approval Entry"."Last Date-Time Modified") { }
            }

            trigger OnAfterGetRecord()
            begin
                PaymentLine.Reset();
                PaymentLine.SetRange(PaymentLine.No, "Payments Header"."No.");
                if PaymentLine.Find('-') then
                    PaymentLine.CalcSums(PaymentLine.Amount);
                Total := PaymentLine.Amount;
            end;

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
        PaymentLine: Record "Payment Line";
        Total: Decimal;
        CompanyInfo: Record "Company Information";
}
