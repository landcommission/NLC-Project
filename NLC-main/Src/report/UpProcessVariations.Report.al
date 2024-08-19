#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193618 "Up-Process Variations"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Up-Process Variations.rdlc';
    ApplicationArea = All;
    Caption = 'Up-Process Variations';
    dataset
    {
        dataitem("JV Header"; "JV Header")
        {
            column(ReportForNavId_5357; 5357) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        prPayroll_VariationsCaptionLbl: Label 'prPayroll Variations';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
