#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193607 "Reconciliation - By Entry/Exit"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Reconciliation - By EntryExit.rdlc';
    ApplicationArea = All;
    Caption = 'Reconciliation - By Entry/Exit';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        RCount: Integer;
        VariationRemarks: Text[1000];
        MonthlyRecon: Record "Quotation Specification Lines";
        SelectedPeriod: Date;
        CompanyInfo: Record "Company Information";
        Salary_Reconciliations___By_Staff_Entry_ExitsCaptionLbl: Label 'Salary Reconciliations - By Staff Entry/Exits';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NamesCaptionLbl: Label 'Names';
        RemarksCaptionLbl: Label 'Remarks';
}
