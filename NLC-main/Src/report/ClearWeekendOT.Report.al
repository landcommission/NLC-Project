#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193617 "Clear Weekend OT"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Clear Weekend OT.rdlc';
    ApplicationArea = All;
    Caption = 'Clear Weekend OT';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        prEmployee_TransactionsCaptionLbl: Label 'prEmployee Transactions';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
