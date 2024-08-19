#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193689 "Adjust Bank Ledger To Open"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Adjust Bank Ledger To Open.rdlc';
    ApplicationArea = All;
    Caption = 'Adjust Bank Ledger To Open';
    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            column(ReportForNavId_1000000000; 1000000000) { }

            trigger OnAfterGetRecord()
            begin
                "Bank Account Ledger Entry".Open := false;
                "Bank Account Ledger Entry".Modify();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        GLAccount: Record "G/L Account";
}
