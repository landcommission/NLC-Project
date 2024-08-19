#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193739 "HR Job Applications Modify"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Job Applications Modify.rdlc';
    ApplicationArea = All;
    Caption = 'HR Job Applications Modify';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
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
