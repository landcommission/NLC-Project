#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193668 Receipt
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Receipt.rdlc';
    ApplicationArea = All;
    Caption = 'Receipt';
    dataset
    {
        dataitem("Receipt Header"; "Receipts Header")
        {
            DataItemTableView = where(Posted = const(true));
            RequestFilterFields = "No.";
            column(ReportForNavId_3632; 3632) { }
            column(Received_From; "Receipt Header"."Received From") { }
            column(Date; "Receipt Header".Date) { }
            column(Picture; CompanyInfo.Picture) { }
            column(Address_1; CompanyInfo.Address) { }
            column(Address_2; CompanyInfo."Address 2") { }
            column(City; CompanyInfo.City) { }
            column(Phone_No; CompanyInfo."Phone No.") { }
            column(Phone_No2; CompanyInfo."Phone No. 2") { }
            dataitem("Receipt Line"; "Receipt Line")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting("Line No.", No) order(ascending);
                column(ReportForNavId_7160; 7160) { }
                column(Description; "Receipt Line"."Account Name") { }
                column(Amount; "Receipt Line".Amount) { }
                column(NumberText; NumberText[1]) { }

                trigger OnAfterGetRecord()
                begin
                    "Receipt Line".Amount := "Receipt Line".Amount + "Receipt Line".Amount;
                    CheckReport.InitTextVariable();
                    CheckReport.FormatNoText(NumberText, "Receipt Line".Amount, '');
                end;
            }


            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
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
        Chq__Slip_No_CaptionLbl: Label 'Chq./Slip No.';
        DescriptionCaptionLbl: Label 'Description';
        No_CaptionLbl: Label 'No.';
        Received_fromCaptionLbl: Label 'Received from';
        Currency_CaptionLbl: Label 'Currency:';
        VATCaptionLbl: Label 'VAT';
        DateCaptionLbl: Label 'Date';
        DepartmentCaptionLbl: Label 'Department';
        TotalCaptionLbl: Label 'Total';
        Signature___________________Lbl: Label '..................................';
        Amount_Incl__VATCaptionLbl: Label 'Amount Incl. VAT';
        You_were_served_by_CaptionLbl: Label 'You were served by:';
        TimeCaptionLbl: Label 'Time';
        Amount_in_wordsCaptionLbl: Label 'Amount in words';
        VAT_Amount_CaptionLbl: Label 'VAT Amount:';
        Amount_Excl_VATCaptionLbl: Label 'Amount Excl VAT';
        Signature_CaptionLbl: Label 'Signature:';
        CompanyInfo: Record "Company Information";
        objLogos: Record "HR Job Responsiblities";
        CheckReport: Report Check;
        NumberText: array[2] of Text;
        Amount: Decimal;
}
