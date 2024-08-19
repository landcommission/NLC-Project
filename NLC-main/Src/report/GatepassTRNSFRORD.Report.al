#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193656 "Gate pass TRNSFR_ORD"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Gate pass TRNSFR_ORD.rdlc';
    ApplicationArea = All;
    Caption = 'Gate pass TRNSFR_ORD';
    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1) { }
            column(Point_of_Issue; "Transfer Shipment Header"."Transfer-from Name") { }
            column(Destination; "Transfer Shipment Header"."Transfer-to Name") { }
            column(Date; "Transfer Shipment Header"."Posting Date") { }
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_5; 5) { }
                column(No; "Transfer Shipment Line"."Line No.") { }
                column(Item_Taken; "Transfer Shipment Line".Description) { }
                column(Quantity; "Transfer Shipment Line".Quantity) { }
                column(Status; State) { }

                trigger OnAfterGetRecord()
                begin
                    State := 'Functional';
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Logos.Reset();
                /*{
                Logos.SETRANGE(Logos.Code,"Transfer Shipment Header"."Shortcut Dimension 1 Code");
                IF Logos.FIND('-') THEN BEGIN
                   Logos.CALCFIELDS(Logos.Picture);
                END ELSE BEGIN
                   Logos.RESET;
                   Logos.SETRANGE(Logos.Default,TRUE);
                   Logos.CALCFIELDS(Logos.Picture);
                END;
                }*/

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
        State: Text;
        Logos: Record "HR Job Responsiblities";
}
