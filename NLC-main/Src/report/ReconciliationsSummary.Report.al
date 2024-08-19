#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193606 "Reconciliations - Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Reconciliations - Summary.rdlc';
    ApplicationArea = All;
    Caption = 'Reconciliations - Summary';
    dataset
    {
        dataitem("Bank Bal. Alert Buffer"; "Bank Bal. Alert Buffer")
        {
            //DataItemTableView = sorting(Field215,Field216);
            // RequestFilterFields = Field211;
            column(ReportForNavId_6955; 6955) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; UserId) { }
            column(GETFILTERS; "Bank Bal. Alert Buffer".GetFilters) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }

        }
    }

    requestpage
    {

        layout
        {
            area(Content) { }
        }

        actions { }
    }

    labels { }

    var
        TotalFor: Label 'Total for ';
        SelectedPeriod: Date;
        CompanyInfo: Record "Company Information";
        NHFCurr: Decimal;
        NHFPrev: Decimal;
        NHFGross: Decimal;
        Reconciliation___SummaryCaptionLbl: Label 'Reconciliation - Summary';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        CodeCaptionLbl: Label 'Code';
        DescriptionCaptionLbl: Label 'Description';
        Last_MonthCaptionLbl: Label 'Last Month';
        Current_MonthCaptionLbl: Label 'Current Month';
        VarienceCaptionLbl: Label 'Varience';
        DateFilter: Date;
}
