#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193707 "Posted Cheque Confirmation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Posted Cheque Confirmation.rdlc';
    ApplicationArea = All;
    Caption = 'Posted Cheque Confirmation';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
