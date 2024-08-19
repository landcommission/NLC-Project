#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193725 "Expire LPOs"
{
    DefaultLayout = RDLC;
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'Expire LPOs';
    //RDLCLayout = './Layouts/Expire LPOs.rdlc';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(ReportForNavId_1102755000; 1102755000) { }

            trigger OnAfterGetRecord()
            begin
                if "Purchase Header"."Expiry Date" = WorkDate() then
                    //"Purchase Header".Status := "Purchase Header".Status::"5";
                    "Purchase Header".Modify();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
