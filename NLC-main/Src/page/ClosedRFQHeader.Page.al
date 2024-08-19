#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193758 "Closed RFQ Header"
{
    PageType = Document;
    SourceTable = "Purchase Quote Header";
    ApplicationArea = All;
    Caption = 'Closed RFQ Header';
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
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
            }
            part(Control1102755015; "RFQ Subform") { }
        }
    }

    actions
    {
        area(Processing)
        {
            group(ActionGroup1102755017)
            {
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
                    Visible = false;
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
        repvend: Report "Purchase Quote Request Report";
}
