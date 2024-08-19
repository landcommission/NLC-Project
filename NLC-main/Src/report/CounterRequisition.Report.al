#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193661 "Counter Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Counter Requisition.rdlc';
    ApplicationArea = All;
    Caption = 'Counter Requisition';
    dataset
    {
        dataitem("Store Requistion Header"; "Store Requistion Header")
        {
            column(ReportForNavId_1; 1) { }
            column(DocumentNo; "Store Requistion Header"."No.") { }
            column(PointOfIssue; "Store Requistion Header"."Issuing Store") { }
            column(PointofUse; "Store Requistion Header"."Responsibility Center") { }
            column(Date; "Store Requistion Header"."Request date") { }
            column(Picture; Logos.Picture) { }
            dataitem("Store Requistion Lines"; "Store Requistion Lines")
            {
                DataItemLink = "Requistion No" = field("No.");
                column(ReportForNavId_5; 5) { }
                column(ItemNo; "Store Requistion Lines"."No.") { }
                column(Description; "Store Requistion Lines".Description) { }
                column(UnitofIssue; "Store Requistion Lines"."Unit of Measure") { }
                column(QuantitiyIssued; "Store Requistion Lines".Quantity) { }
                column(QuantityRequested; "Store Requistion Lines"."Quantity Requested") { }
                column(LastDateofIssue; "Store Requistion Lines"."Last Date of Issue") { }
                column(LastQuantityIssued; "Store Requistion Lines"."Last Quantity Issued") { }
                column(Remarks; "Store Requistion Lines".Remarks) { }
                column(Value; "Store Requistion Lines"."Line Amount") { }
                column(SCard_No; "Store Requistion Lines"."Requistion No") { }
                column(ItemStatus_StoreRequistionLines; "Store Requistion Lines"."Item Status") { }
            }

            trigger OnAfterGetRecord()
            begin

                Logos.Reset();
                //Logos.SETRANGE(Logos.Code,"Store Requistion Header"."Global Dimension 1 Code");
                if Logos.Find('-') then
                    Logos.CalcFields(Logos.Picture)
                else begin
                    Logos.Reset();
                    //Logos.SETRANGE(Logos.Default,TRUE);
                    Logos.CalcFields(Logos.Picture);
                end;
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
        Logos: Record "Company Information";
}
