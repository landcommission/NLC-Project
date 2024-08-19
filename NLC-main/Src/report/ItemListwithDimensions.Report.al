#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50011 "Item List with Dimensions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Item List with Dimensions.rdlc';
    ApplicationArea = All;
    Caption = 'Item List with Dimensions';
    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            column(ReportForNavId_1000000000; 1000000000) { }
            column(ItemNo; "Item Ledger Entry"."Item No.") { }
            column(Description; "Item Ledger Entry".Description) { }
            column(Quantity; "Item Ledger Entry".Quantity) { }
            column(TotalCost; "Item Ledger Entry"."Cost Amount (Actual)") { }
            column(DonorCode; "Item Ledger Entry"."Global Dimension 1 Code") { }
            column(ProjectCode; "Item Ledger Entry"."Global Dimension 2 Code") { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
