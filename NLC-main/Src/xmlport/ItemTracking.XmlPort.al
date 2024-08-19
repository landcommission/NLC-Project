#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50052 "Item Tracking"
{
    Format = VariableText;
    Caption = 'Item Tracking';
    schema
    {
        textelement(Reservation)
        {
            tableelement("Reservation Entry"; "Reservation Entry")
            {
                XmlName = 'ReservationEntryTable';
                fieldelement(EntryNo; "Reservation Entry"."Entry No.") { }
                fieldelement(ItemNo; "Reservation Entry"."Item No.") { }
                fieldelement(Location; "Reservation Entry"."Location Code") { }
                fieldelement(Quantity; "Reservation Entry"."Quantity (Base)") { }
                fieldelement(ReservationStatus; "Reservation Entry"."Reservation Status") { }
                fieldelement(CreationDate; "Reservation Entry"."Creation Date") { }
                fieldelement(SourceType; "Reservation Entry"."Source Type") { }
                fieldelement(SourceSubtype; "Reservation Entry"."Source Subtype") { }
                fieldelement(SourceId; "Reservation Entry"."Source ID") { }
                fieldelement(SourceBatchName; "Reservation Entry"."Source Batch Name") { }
                fieldelement(SourceRefNo; "Reservation Entry"."Source Ref. No.") { }
                fieldelement(LotNo; "Reservation Entry"."Lot No.") { }
                fieldelement(ItemTracking; "Reservation Entry"."Item Tracking") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
