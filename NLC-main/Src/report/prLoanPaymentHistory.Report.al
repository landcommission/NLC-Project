#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193529 "prLoan Payment History"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prLoan Payment History.rdlc';
    ApplicationArea = All;
    Caption = 'prLoan Payment History';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        MonthName: Text[100];
        EName: Text[200];
        HREmployee: Record "FA Budget Entry";
        CompanyInfo: Record "Company Information";
        Employee_Transaction_HistoryCaptionLbl: Label 'Employee Transaction History';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employee_NameCaptionLbl: Label 'Employee Name';
        TransactionCaptionLbl: Label 'Transaction';
        Running_BalanceCaptionLbl: Label 'Running Balance';
        YearCaptionLbl: Label 'Year';
        MonthCaptionLbl: Label 'Month';
}
