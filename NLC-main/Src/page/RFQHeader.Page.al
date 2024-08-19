#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193751 "RFQ Header"
{
    PageType = Document;
    SourceTable = "Purchase Quote Header";
    ApplicationArea = All;
    Caption = 'RFQ Header';
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
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Description field.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Code field.';
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Name field.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to Address field.';
                }
                field("Expected Opening Date"; Rec."Expected Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Opening Date field.';
                }
                field("Expected Closing Date"; Rec."Expected Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Closing Date field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Control1102755012; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Internal Requisition No."; Rec."Internal Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Requisition No. field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
            }
            part(Control1102755015; "RFQ Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(ActionGroup1102755017)
            {
                action("Get Document Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get Document Lines';
                    Image = GetLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Get Document Lines action.';
                    trigger OnAction()
                    begin
                        CurrPage.Update(true);
                        InsertRFQLines();
                    end;
                }
                action("Assign Vendor(s)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Vendor(s)';
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Assign Vendor(s) action.';
                    trigger OnAction()
                    var
                        Vends: Record "Quotation Request Vendors";
                    begin

                        Vends.Reset();
                        Vends.SetRange(Vends."Document Type", Rec."Document Type");
                        Vends.SetRange(Vends."Requisition Document No.", Rec."No.");

                        Page.Run(Page::"Quotation Request Vendors", Vends);
                    end;
                }
                action("Print/Preview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin

                        PQH.SetRecFilter();
                        PQH.SetFilter(PQH."Document Type", '%1', Rec."Document Type");
                        PQH.SetFilter("No.", Rec."No.");
                        repvend.SetTableView(PQH);
                        repvend.Run();
                    end;
                }
                action("Create Quotes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Vendor Quotes';
                    Image = VendorPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Create Vendor Quotes action.';
                    trigger OnAction()
                    var
                        RFQLines: Record "Purchase Quote Line";
                        PurchaseHeader: Record "Purchase Header";
                        PurchaseLines: Record "Purchase Line";
                        Vends: Record "Quotation Request Vendors";
                    begin
                        Vends.SetRange(Vends."Requisition Document No.", Rec."No.");
                        if Vends.FindSet() then
                            repeat
                                //create header
                                PurchaseHeader.Init();
                                PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Quote;
                                PurchaseHeader.DocApprovalType := PurchaseHeader.DocApprovalType::Quote;
                                PurchaseHeader."No." := '';
                                PurchaseHeader."Responsibility Center" := Rec."Responsibility Center";
                                PurchaseHeader."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                                PurchaseHeader."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                PurchaseHeader.Insert(true);
                                PurchaseHeader.Validate("Buy-from Vendor No.", Vends."Vendor No.");
                                PurchaseHeader."Responsibility Center" := Rec."Responsibility Center";
                                PurchaseHeader."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                                PurchaseHeader."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                //  PurchaseHeader.validate("RFQ No.","No.");
                                PurchaseHeader.Modify();
                                PurchaseHeader.Insert(true);

                                //create lines

                                RFQLines.SetRange(RFQLines."Document No.", Rec."No.");
                                if RFQLines.FindSet() then
                                    repeat
                                        PurchaseLines.Init();
                                        PurchaseLines.TransferFields(RFQLines);
                                        PurchaseLines."Document Type" := PurchaseLines."Document Type"::Quote;
                                        PurchaseLines."Document No." := Rec."No.";
                                        PurchaseLines.Insert();
                                    /*
                                      ReqLines.VALIDATE(ReqLines."No.");
                                      ReqLines.VALIDATE(ReqLines.Quantity);
                                      ReqLines.VALIDATE(ReqLines."Direct Unit Cost");
                                      ReqLines.MODIFY;
                                    */
                                    until RFQLines.Next() = 0;
                            until Vends.Next() = 0;

                    end;
                }
                action("Bid Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid Analysis';
                    Image = Worksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Bid Analysis Worksheet";
                    RunPageLink = "RFQ No." = field("No.");
                    ToolTip = 'Executes the Bid Analysis action.';
                    trigger OnAction()
                    var
                        PurchaseHeader: Record "Purchase Header";
                        PurchaseLines: Record "Purchase Line";
                        ItemNoFilter: Text[250];
                        RFQNoFilter: Text[250];
                        InsertCount: Integer;
                        BidAnalysis: Record "Bid Analysis";
                    begin
                        //deletebidanalysis for this vendor
                        BidAnalysis.SetRange(BidAnalysis."RFQ No.", Rec."No.");
                        BidAnalysis.DeleteAll();


                        //insert the quotes from vendors

                        PurchaseHeader.SetRange(PurchaseHeader."No.", Rec."No.");
                        PurchaseHeader.FindSet();
                        repeat
                            PurchaseLines.Reset();
                            PurchaseLines.SetRange("Document No.", PurchaseHeader."No.");
                            if PurchaseLines.FindSet() then
                                repeat
                                    BidAnalysis.Init();
                                    BidAnalysis."RFQ No." := Rec."No.";
                                    BidAnalysis."RFQ Line No." := PurchaseLines."Line No.";
                                    BidAnalysis."Quote No." := PurchaseLines."Document No.";
                                    BidAnalysis."Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                    BidAnalysis."Item No." := PurchaseLines."No.";
                                    BidAnalysis.Description := PurchaseLines.Description;
                                    BidAnalysis.Quantity := PurchaseLines.Quantity;
                                    BidAnalysis."Unit Of Measure" := PurchaseLines."Unit of Measure";
                                    BidAnalysis.Amount := PurchaseLines."Direct Unit Cost";
                                    BidAnalysis."Line Amount" := BidAnalysis.Quantity * BidAnalysis.Amount;
                                    BidAnalysis.Insert(true);
                                    InsertCount += 1;
                                until PurchaseLines.Next() = 0;
                        until PurchaseHeader.Next() = 0;
                        //MESSAGE('%1 records have been inserted to the bid analysis',InsertCount);
                    end;
                }
            }
            group(Status)
            {
                Caption = 'Status';
                action(Cancel)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel action.';
                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        if Confirm('Cancel Document?', false) = false then
                            exit;
                        Rec.Status := Rec.Status::Cancelled;
                        Rec.Modify();

                    end;
                }
                action(Stop)
                {
                    ApplicationArea = Basic;
                    Caption = 'Stop';
                    Image = Stop;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Stop action.';
                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        if Confirm('Close Document?', false) = false then
                            exit;
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify();

                    end;
                }
                action(Close)
                {
                    ApplicationArea = Basic;
                    Caption = 'Close';
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Close action.';
                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        if Confirm('Close Document?', false) = false then
                            exit;
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify();

                    end;
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Release action.';
                    trigger OnAction()
                    begin

                        if Confirm('Release document?', false) = false then
                            exit;
                        //check if the document has any lines
                        Lines.Reset();
                        Lines.SetRange(Lines."Document Type", Rec."Document Type");
                        Lines.SetRange(Lines."Document No.", Rec."No.");
                        if Lines.FindFirst() then
                            repeat
                                Lines.TestField(Lines.Quantity);
                                //Lines.TESTFIELD(Lines."Direct Unit Cost");
                                Lines.TestField("No.");
                            until Lines.Next() = 0
                        else
                            Error('Document has no lines');
                        Rec.Status := Rec.Status::Released;
                        Rec."Released By" := UserId;
                        Rec."Release Date" := Today;
                        Rec.Modify();
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reopen';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Reopen action.';
                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        PurchHeader.Reset();
                        PurchHeader.SetRange(PurchHeader."Document Type", PurchHeader."Document Type"::Quote);
                        //PurchHeader.SETRANGE(purchheader."request for quote no","No.");
                        if PurchHeader.FindFirst() then
                            Error('The Quotation for request is already tied to a Quotation. Cannot be Reopened');

                        if Confirm('Reopen Document?', false) = false then
                            exit;
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                    end;
                }
            }
        }
    }

    var
        PurchHeader: Record "Purchase Header";
        PParams: Record "Purchase Quote Params";
        Lines: Record "Purchase Quote Line";
        PQH: Record "Purchase Quote Header";
        repvend: Report "RFQ Report";


    procedure InsertRFQLines()
    var
        Counter: Integer;
        Collection: Record "Purchase Line";
        CollectionList: Page "PRF Lists";
    begin
        CollectionList.LookupMode(true);
        if CollectionList.RunModal() = Action::LookupOK then begin
            CollectionList.SetSelection(Collection);
            Counter := Collection.Count;
            if Counter > 0 then
                if Collection.FindSet() then
                    repeat
                        Lines.Init();
                        Lines.TransferFields(Collection);
                        Lines."Document Type" := Rec."Document Type";
                        Lines."Document No." := Rec."No.";
                        Lines."Line No." := 0;
                        Lines."PRF No" := Collection."Document No.";
                        Lines."PRF Line No." := Collection."Line No.";
                        Lines.Insert(true);
                    //Collection.Copied:=TRUE;
                    //Collection.MODIFY;
                    until Collection.Next() = 0;
        end;
    end;
}
