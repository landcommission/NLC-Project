#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193517 "prEmployeeTransation ads"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prEmployeeTransation ads.rdlc';
    ApplicationArea = All;
    Caption = 'prEmployeeTransation ads';
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
        prEmployee_Transactions_AdsCaptionLbl: Label 'prEmployee Transactions Ads';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
