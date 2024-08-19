#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193720 "Purchase Receipt Blank"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Purchase Receipt Blank.rdlc';
    ApplicationArea = All;
    Caption = 'Purchase Receipt Blank';
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            column(ReportForNavId_1; 1) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
