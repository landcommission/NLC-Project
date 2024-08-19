#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193613 "Validate Employee Period"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Validate Employee Period.rdlc';
    ApplicationArea = All;
    Caption = 'Validate Employee Period';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        HREmployee: Record "FA Budget Entry";
        AdjustRunningBal: Option " ","Reduce 1 Installment","Increase 1 Installment";
        Trans: Record "Bank Bal. Alert Buffer";
        prEmployee_TransactionsCaptionLbl: Label 'prEmployee Transactions';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
