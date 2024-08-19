#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193716 "UNIT OF MEASURE TRANS"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'UNIT OF MEASURE TRANS';
    dataset
    {
        dataitem(Item; Item)
        {
            column(ReportForNavId_1; 1) { }
            column(No; Item."No.") { }
            column(Unit_of_Measure; Item."Base Unit of Measure") { }

            trigger OnAfterGetRecord()
            begin
                ItemUnitofMeasure.Reset();
                ItemUnitofMeasure.SetRange(ItemUnitofMeasure."Item No.", Item."No.");
                if not ItemUnitofMeasure.Find('-') then begin
                    ItemUnitofMeasure."Item No." := Item."No.";
                    ItemUnitofMeasure.Validate(ItemUnitofMeasure."Item No.");
                    ItemUnitofMeasure.Code := Item."Base Unit of Measure";
                    //ItemUnitofMeasure.VALIDATE(ItemUnitofMeasure.Code);
                    ItemUnitofMeasure."Qty. per Unit of Measure" := 1;
                    ItemUnitofMeasure.Validate(ItemUnitofMeasure."Qty. per Unit of Measure");
                    ItemUnitofMeasure.Insert();



                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Item units of measure transfer complete');
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
        ItemUnitofMeasure: Record "Item Unit of Measure";
}
