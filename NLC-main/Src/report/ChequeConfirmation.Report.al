#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193706 "Cheque Confirmation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Cheque Confirmation.rdlc';
    ApplicationArea = All;
    Caption = 'Cheque Confirmation';
    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.", "Date Filter";
            column(ReportForNavId_1102755019; 1102755019) { }

            trigger OnPreDataItem()
            begin
                if "Bank Account".GetFilter("Bank Account"."Date Filter") = '' then
                    Error('Specify a date filter');
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
        SNo := 0;
    end;

    var
        CompanyInfo: Record "Company Information";
        Bank: Record "Bank Account";
        SNo: Integer;
        TotalNetAmount: Decimal;
        NumberText: array[2] of Text[120];
        CheckReport: Report Check;
}
