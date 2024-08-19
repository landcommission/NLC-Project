#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193762 "Bid Analysis"
{
    PageType = Document;
    SourceTable = "Purchase Quote Header";
    ApplicationArea = All;
    Caption = 'Bid Analysis';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(ItemNoFilter; ItemNoFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the value of the Item No. field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ItemList: Page "Item List";
                    begin
                        ItemList.LookupMode := true;
                        if ItemList.RunModal() = Action::LookupOK then
                            Text := ItemList.GetSelectionFilter()
                        else
                            exit(false);

                        exit(true);
                    end;

                }
            }
            part(Control1102755004; "Bid Analysis SubForm") { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Get Vendor Quotations")
            {
                ApplicationArea = Basic;
                Caption = 'Get Vendor Quotations';
                Image = GetSourceDoc;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Get Vendor Quotations action.';
                trigger OnAction()
                begin
                    InsertBidAnalysisLines();
                end;
            }
        }
    }

    var
        PurchHeader: Record "Purchase Header";
        PurchLines: Record "Purchase Line";
        ItemNoFilter: Text[250];
        RFQNoFilter: Text[250];
        InsertCount: Integer;


    procedure InsertBidAnalysisLines()
    var
        BidAnalysisLines: Record "Bid Analysis";
    begin
        //insert the quotes from vendors
        //IF RFQNoFilter = '' THEN ERROR('Specify the RFQ No.');

        PurchHeader.SetRange(PurchHeader."No.", Rec."No.");
        PurchHeader.FindSet();
        repeat
            PurchLines.Reset();
            PurchLines.SetRange("Document No.", PurchHeader."No.");
            if PurchLines.FindSet() then
                repeat
                    Rec.Init();
                    BidAnalysisLines."RFQ No." := PurchHeader."No.";
                    BidAnalysisLines."RFQ Line No." := PurchLines."Line No.";
                    BidAnalysisLines."Quote No." := PurchLines."Document No.";
                    BidAnalysisLines."Vendor No." := PurchLines."Buy-from Vendor No.";
                    BidAnalysisLines."Item No." := PurchLines."No.";
                    BidAnalysisLines.Description := PurchLines.Description;
                    BidAnalysisLines.Quantity := PurchLines.Quantity;
                    BidAnalysisLines."Unit Of Measure" := PurchLines."Unit of Measure";
                    BidAnalysisLines.Amount := PurchLines."Direct Unit Cost";
                    BidAnalysisLines."Line Amount" := BidAnalysisLines.Quantity * BidAnalysisLines.Amount;
                    BidAnalysisLines.Insert(true);
                    InsertCount := +1;
                until PurchLines.Next() = 0;
        until PurchHeader.Next() = 0;
    end;
}
