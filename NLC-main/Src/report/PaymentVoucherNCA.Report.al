#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50022 "Payment Voucher NCA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payment Voucher NCA.rdlc';
    ApplicationArea = All;
    Caption = 'Payment Voucher NCA';
    dataset
    {
        dataitem("Payments Header"; "Payments Header")
        {
            column(ReportForNavId_1; 1) { }
            column(Doc_No; "Payments Header"."No.") { }
            column(Date; "Payments Header".Date) { }
            column(Payee; "Payments Header".Payee) { }
            column(Total_Gross; TotalGross) { }
            column(Total_VAT; TotalVat) { }
            column(Total_Net; TotalNet) { }
            column(logo; CompanyInfo.Picture) { }
            dataitem("Payment Line"; "Payment Line")
            {
                column(ReportForNavId_5; 5) { }
                column(DocLine_No; "Payment Line".No) { }
                column(Type; "Payment Line".Type) { }
                column(Remarks; "Payment Line".Remarks) { }
                column(GrossAmount; "Payment Line".Amount) { }
                column(VAT_Amount; "Payment Line"."VAT Amount") { }
                column(Net_Amount; "Payment Line"."Net Amount") { }
                column(Description; "Payment Line"."Account Name") { }
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;

            trigger OnPostDataItem()
            begin
                TotalGross := 0;
                TotalVat := 0;
                TotalNet := 0;



                PaymentLine.Reset();
                PaymentLine.SetRange(PaymentLine.No, "Payments Header"."No.");
                if PaymentLine.Find('-') then begin

                    PaymentLine.CalcSums(PaymentLine.Amount, PaymentLine."VAT Amount", PaymentLine."Net Amount");
                    TotalGross := PaymentLine.Amount;
                    TotalVat := PaymentLine."VAT Amount";
                    TotalNet := PaymentLine."Net Amount";
                end;
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
        TotalGross: Decimal;
        TotalVat: Decimal;
        TotalNet: Decimal;
        PaymentHeader: Record "Payments Header";
        PaymentLine: Record "Payment Line";
        CompanyInfo: Record "Company Information";
}
