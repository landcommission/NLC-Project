#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50110 tableextension50110 extends "Purchase Header"
{
    fields
    {

        //Unsupported feature: Code Modification on ""Buy-from Vendor No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        InitRecOnVendUpdate;
        TESTFIELD(Status,Status::Open);
        IF ("Buy-from Vendor No." <> xRec."Buy-from Vendor No.") AND
        #4..41
              EXIT;
            END;
            IF "Document Type" = "Document Type"::Order THEN
              PurchLine.SETFILTER("Quantity Received",'<>0')
            ELSE
              IF "Document Type" = "Document Type"::Invoice THEN BEGIN
                PurchLine.SETRANGE("Buy-from Vendor No.",xRec."Buy-from Vendor No.");
                PurchLine.SETFILTER("Receipt No.",'<>%1','');
              END;
            IF PurchLine.FINDFIRST THEN
              IF "Document Type" = "Document Type"::Order THEN
                PurchLine.TESTFIELD("Quantity Received",0)
              ELSE
                PurchLine.TESTFIELD("Receipt No.",'');

            PurchLine.SETRANGE("Receipt No.");
            PurchLine.SETRANGE("Quantity Received");
            PurchLine.SETRANGE("Buy-from Vendor No.");

            IF "Document Type" = "Document Type"::Order THEN BEGIN
        #62..139

        IF NOT SkipBuyFromContact THEN
          UpdateBuyFromCont("Buy-from Vendor No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..44
              PurchLine.SETFILTER(l8,'<>0')
        #46..52
                PurchLine.TESTFIELD(l8,0)
        #54..57
            PurchLine.SETRANGE(l8);
        #59..142
        */
        //end;


        //Unsupported feature: Code Modification on ""Pay-to Vendor No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD(Status,Status::Open);
        IF (xRec."Pay-to Vendor No." <> "Pay-to Vendor No.") AND
           (xRec."Pay-to Vendor No." <> '')
        #4..10
            PurchLine.SETRANGE("Document No.","No.");

            IF "Document Type" = "Document Type"::Order THEN
              PurchLine.SETFILTER("Quantity Received",'<>0');
            IF "Document Type" = "Document Type"::Invoice THEN
              PurchLine.SETFILTER("Receipt No.",'<>%1','');
            IF PurchLine.FINDFIRST THEN
              IF "Document Type" = "Document Type"::Order THEN
                PurchLine.TESTFIELD("Quantity Received",0)
              ELSE
                PurchLine.TESTFIELD("Receipt No.",'');

            PurchLine.SETRANGE("Receipt No.");
            PurchLine.SETRANGE("Quantity Received");

            IF "Document Type" = "Document Type"::Order THEN BEGIN
              PurchLine.SETFILTER("Prepmt. Amt. Inv.",'<>0');
        #28..112
          UpdatePayToCont("Pay-to Vendor No.");

        "Pay-to IC Partner Code" := Vend."IC Partner Code";
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..13
              PurchLine.SETFILTER(l8,'<>0');
        #15..18
                PurchLine.TESTFIELD(l8,0)
        #20..23
            PurchLine.SETRANGE(l8);
        #25..115
        */
        //end;


        //Unsupported feature: Code Modification on ""Applies-to ID"(Field 118).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Applies-to ID" <> '' THEN
          TESTFIELD("Bal. Account No.",'');
        IF ("Applies-to ID" <> xRec."Applies-to ID") AND (xRec."Applies-to ID" <> '') THEN BEGIN
          VendLedgEntry.SETCURRENTKEY("Vendor No.",Open);
          VendLedgEntry.SETRANGE("Vendor No.","Pay-to Vendor No.");
          VendLedgEntry.SETRANGE(Open,TRUE);
          VendLedgEntry.SETRANGE("Applies-to ID",xRec."Applies-to ID");
          IF VendLedgEntry.FINDFIRST THEN
            VendEntrySetApplID.SetApplId(VendLedgEntry,TempVendLedgEntry,'');
          VendLedgEntry.RESET;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..8
            //VendEntrySetApplID.SetApplId(VendLedgEntry,TempVendLedgEntry,'');
          VendLedgEntry.RESET;
        END;
        */
        //end;
        field(50000; Copied; Boolean)
        {
            Caption = 'Copied';
            DataClassification = CustomerContent;
        }
        field(50001; "Debit Note"; Boolean)
        {
            Caption = 'Debit Note';
            DataClassification = CustomerContent;
        }
        field(50002; "Request for Quote No."; Code[20])
        {
            Description = 'Request for Quote No.';
            TableRelation = "Purchase Quote Header"."No." where(Status = const(Released));
            Caption = 'Request for Quote No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                //CHECK WHETHER HAS LINES AND DELETE
                if not Confirm('If you change the Request for Quote No. the current lines will be deleted. Do you want to continue?', false)
                then
                    Error('You have selected to abort the process');

                PurchLine.Reset();
                PurchLine.SetRange(PurchLine."Document No.", Rec."No.");
                PurchLine.DeleteAll();
                QuoteLine.Reset();
                QuoteLine.SetRange(QuoteLine."Document No.", Rec."No.");
                QuoteLine.DeleteAll();


                RFQ.Reset();
                RFQ.SetRange(RFQ."Document No.", Rec."Request for Quote No.");
                //Compare Vendor No
                //RFQ.SETRANGE(RFQ."Buy-from Vendor No.","Buy-from Vendor No.");
                if RFQ.Find('-') then
                    repeat
                        PurchLine.Init();
                        PurchLine."Document Type" := Rec."Document Type";
                        PurchLine."Document No." := Rec."No.";
                        PurchLine."Line No." := RFQ."Line No.";
                        PurchLine.Type := RFQ.Type;
                        PurchLine."No." := RFQ."No.";
                        PurchLine.Validate("No.");
                        PurchLine."Location Code" := RFQ."Location Code";
                        PurchLine.Validate("Location Code");
                        PurchLine.Quantity := RFQ.Quantity;
                        PurchLine.Validate(Quantity);
                        PurchLine."Direct Unit Cost" := RFQ."Direct Unit Cost";
                        PurchLine.Validate("Direct Unit Cost");
                        PurchLine.Amount := RFQ.Amount;
                        //Insert Expense Code
                        PurchLine."Expense Code" := RFQ."Expense Code";
                        PurchLine.Insert();
                        ///Added to Insert Specs
                        Params.Reset();
                        Params.SetRange(Params."Document No.", RFQ."Document No.");
                        if Params.Find('-') then
                            repeat
                                //IF QuoteLine.FIND('-') THEN BEGIN

                                QuoteLine.Code := Params.Specification;
                                QuoteLine."Request No." := Rec."Request for Quote No.";
                                QuoteLine."Line No." := RFQ."Line No.";
                                QuoteLine."Document No." := Rec."No.";
                                QuoteLine.Description := Params.Description;
                                QuoteLine."Type No." := RFQ."No.";
                                QuoteLine."Type Name" := RFQ.Description;
                                QuoteLine."Assigned Value" := Params.Value;
                                QuoteLine."Vendor No" := PurchLine."Buy-from Vendor No.";
                                QuoteLine.Insert();
                            //END;
                            until Params.Next() = 0;
                        //to insert Name
                        PurchHeader.Reset();
                        PurchHeader.SetRange(PurchHeader."Buy-from Vendor No.", QuoteLine."Vendor No");
                        if PurchHeader.Find('-') then
                            QuoteLine."Vendor Name" := PurchHeader."Buy-from Vendor No.";
                    //to insert Name
                    until RFQ.Next() = 0;
            end;
        }
        field(50003; "Quote Comments"; Text[250])
        {
            Description = 'Store Comments of Purchase Quote in the DB (Added)';
            Caption = 'Quote Comments';
            DataClassification = CustomerContent;
        }
        field(50004; "Responsibility Center Name"; Text[100])
        {
            Description = 'Stores Responsibilty Center Name in the database (Added)';
            Caption = 'Responsibility Center Name';
            DataClassification = CustomerContent;
        }
        field(50005; "Donor Name"; Text[50])
        {
            Description = 'Stores Donor Name in the database (Added)';
            Caption = 'Donor Name';
            DataClassification = CustomerContent;
        }
        field(50006; "Pillar Name"; Text[50])
        {
            Description = 'Stores Pillar Name in the database (Added)';
            Caption = 'Pillar Name';
            DataClassification = CustomerContent;
        }
        field(50009; "Quote Comments 2"; Text[150])
        {
            Caption = 'Quote Comments 2';
            DataClassification = CustomerContent;
        }
        field(50010; "Quote Comments 3"; Text[100])
        {
            Enabled = false;
            Caption = 'Quote Comments 3';
            DataClassification = CustomerContent;
        }
        field(50011; "Recommendation 1"; Text[150])
        {
            Caption = 'Recommendation 1';
            DataClassification = CustomerContent;
        }
        field(50012; "Recommendation 2"; Text[150])
        {
            Caption = 'Recommendation 2';
            DataClassification = CustomerContent;
        }
        field(50013; "Project Code"; Code[10])
        {
            Caption = 'Project Code';
            DataClassification = CustomerContent;
        }
        field(50014; "Archive Unused Doc"; Boolean)
        {
            Caption = 'Archive Unused Doc';
            DataClassification = CustomerContent;
        }
        field(50050; "VAT Method"; Option)
        {
            OptionCaption = 'Expensed,Recovered';
            OptionMembers = Expensed,Recovered;
            Caption = 'VAT Method';
            DataClassification = CustomerContent;
        }
        field(39005536; Cancelled; Boolean)
        {
            Editable = false;
            Caption = 'Cancelled';
            DataClassification = CustomerContent;
        }
        field(39005537; "Cancelled By"; Code[20])
        {
            Caption = 'Cancelled By';
            DataClassification = CustomerContent;
        }
        field(39005538; "Cancelled Date"; Date)
        {
            Caption = 'Cancelled Date';
            DataClassification = CustomerContent;
        }
        field(39005539; DocApprovalType; Option)
        {
            OptionMembers = Purchase,Requisition,Quote,Capex;
            Caption = 'DocApprovalType';
            DataClassification = CustomerContent;
        }
        field(39005540; "Procurement Type Code"; Code[20])
        {
            TableRelation = "CshMgt PV Steps";
            Caption = 'Procurement Type Code';
            DataClassification = CustomerContent;
        }
        field(39005541; "Invoice Basis"; Option)
        {
            OptionMembers = "PO Based","Direct Invoice";
            Caption = 'Invoice Basis';
            DataClassification = CustomerContent;
        }
        field(39005544; "RFQ No."; Code[20])
        {
            TableRelation = "Purchase Quote Header" where(Status = const(Released));
            Caption = 'RFQ No.';
            DataClassification = CustomerContent;
            trigger OnLookup()
            begin
                Rec.TestField(Rec."Responsibility Center");
                Rec.TestField(Rec."Shortcut Dimension 1 Code");
                Rec.TestField(Rec."Shortcut Dimension 2 Code");

                RFQHdr.Reset();
                RFQHdr.SetRange(RFQHdr.Status, RFQHdr.Status::Released);
                if Page.RunModal(39006069, RFQHdr) = Action::LookupOK then
                    Rec.InsertRFQ(RFQHdr);
            end;
        }
        field(39005550; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = CustomerContent;
        }
        field(39005551; "Special Remark"; Text[50])
        {
            Caption = 'Special Remark';
            DataClassification = CustomerContent;
        }
        field(39005552; "Responsible Officer"; Code[50])
        {
            TableRelation = "User Setup" where("Procurement Officer" = filter(true));
            Caption = 'Responsible Officer';
            DataClassification = CustomerContent;
        }
        field(39005553; Type; Option)
        {
            OptionCaption = ' ,LPO,LSO';
            OptionMembers = " ",LPO,LSO;
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(39005554; "Imprest Purchase Doc No"; Code[20])
        {
            Caption = 'Imprest Purchase Doc No';
            DataClassification = CustomerContent;
        }
        field(39005555; "Manual LPO No."; Code[20])
        {
            Caption = 'Manual LPO No.';
            DataClassification = CustomerContent;
        }
        field(39005556; "Requisition No."; Code[20])
        {
            FieldClass = Normal;
            TableRelation = "Purchase Quote Header"."No." where(Status = const(Released));
            Caption = 'Requisition No.';
            DataClassification = CustomerContent;
        }
        field(39005557; "Request for Quote No"; Code[20])
        {
            TableRelation = "Purchase Quote Header"."No." where(Status = const(Released));
            Caption = 'Request for Quote No';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                //CHECK WHETHER HAS LINES AND DELETE
                if not Confirm('If you change the Request for Quote No. the current lines will be deleted. Do you want to continue?', false)
                then
                    Error('You have selected to abort the process');

                PurchLine.Reset();
                PurchLine.SetRange(PurchLine."Document No.", Rec."No.");
                PurchLine.DeleteAll();
                QuoteLine.Reset();
                QuoteLine.SetRange(QuoteLine."Document No.", Rec."No.");
                QuoteLine.DeleteAll();


                RFQ.Reset();
                RFQ.SetRange(RFQ."Document No.", Rec."Request for Quote No.");
                //Compare Vendor No
                //RFQ.SETRANGE(RFQ."Buy-from Vendor No.","Buy-from Vendor No.");
                if RFQ.Find('-') then
                    repeat
                        PurchLine.Init();
                        PurchLine."Document Type" := Rec."Document Type";
                        PurchLine."Document No." := Rec."No.";
                        PurchLine."Line No." := RFQ."Line No.";
                        PurchLine.Type := RFQ.Type;
                        PurchLine."No." := RFQ."No.";
                        PurchLine.Validate("No.");
                        PurchLine."Location Code" := RFQ."Location Code";
                        PurchLine.Validate("Location Code");
                        PurchLine.Quantity := RFQ.Quantity;
                        PurchLine.Validate(Quantity);
                        PurchLine."Direct Unit Cost" := RFQ."Direct Unit Cost";
                        PurchLine.Validate("Direct Unit Cost");
                        PurchLine.Amount := RFQ.Amount;
                        //Insert Expense Code
                        PurchLine."Expense Code" := RFQ."Expense Code";
                        PurchLine.Insert();
                        ///Added to Insert Specs
                        Params.Reset();
                        Params.SetRange(Params."Document No.", RFQ."Document No.");
                        if Params.Find('-') then
                            repeat
                                //IF QuoteLine.FIND('-') THEN BEGIN

                                QuoteLine.Code := Params.Specification;
                                QuoteLine."Request No." := Rec."Request for Quote No.";
                                QuoteLine."Line No." := RFQ."Line No.";
                                QuoteLine."Document No." := Rec."No.";
                                QuoteLine.Description := Params.Description;
                                QuoteLine."Type No." := RFQ."No.";
                                QuoteLine."Type Name" := RFQ.Description;
                                QuoteLine."Assigned Value" := Params.Value;
                                QuoteLine."Vendor No" := PurchLine."Buy-from Vendor No.";
                                QuoteLine.Insert();
                            //END;
                            until Params.Next() = 0;
                        //to insert Name
                        PurchHeader.Reset();
                        PurchHeader.SetRange(PurchHeader."Buy-from Vendor No.", QuoteLine."Vendor No");
                        if PurchHeader.Find('-') then
                            QuoteLine."Vendor Name" := PurchHeader."Buy-from Vendor No.";
                    //to insert Name
                    until RFQ.Next() = 0;
            end;
        }
        field(39005558; "Vendor Quote No."; Code[20])
        {
            Caption = 'Vendor Quote No.';
            DataClassification = CustomerContent;
        }
        field(39005559; "Contract No."; Code[20])
        {
            TableRelation = Contracts."Contract No" where(Type = const(Vendor),
                                                           "Contractor No" = field("Buy-from Vendor No."));
            Caption = 'Contract No.';
            DataClassification = CustomerContent;
        }
        field(39005560; "Contract Value"; Decimal)
        {
            Caption = 'Contract Value';
            DataClassification = CustomerContent;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT SkipInitialization THEN
      InitInsert;

    IF GETFILTER("Buy-from Vendor No.") <> '' THEN
      IF GETRANGEMIN("Buy-from Vendor No.") = GETRANGEMAX("Buy-from Vendor No.") THEN
        VALIDATE("Buy-from Vendor No.",GETRANGEMIN("Buy-from Vendor No."));

    "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Purchase Header","Document Type","No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8

    IF DocApprovalType=DocApprovalType::Requisition THEN BEGIN
    "Buy-from Vendor No.":=PurchSetup."Requisition Default Vendor";
    VALIDATE("Buy-from Vendor No.");
    END;
    */
    //end;


    //Unsupported feature: Code Modification on "RecreatePurchLines(PROCEDURE 4)".

    //procedure RecreatePurchLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF PurchLinesExist THEN BEGIN
      IF HideValidationDialog THEN
        Confirmed := TRUE
    #4..15
        PurchLine.SETRANGE("Document No.","No.");
        IF PurchLine.FINDSET THEN BEGIN
          REPEAT
            PurchLine.TESTFIELD("Quantity Received",0);
            PurchLine.TESTFIELD("Quantity Invoiced",0);
            PurchLine.TESTFIELD("Return Qty. Shipped",0);
            PurchLine.CALCFIELDS("Reserved Qty. (Base)");
    #23..196
        ERROR(
          Text018,ChangedFieldName);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
            PurchLine.TESTFIELD(l8,0);
    #20..199
    */
    //end;


    //Unsupported feature: Code Modification on "ReceivedPurchLinesExist(PROCEDURE 20)".

    //procedure ReceivedPurchLinesExist();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PurchLine.RESET;
    PurchLine.SETRANGE("Document Type","Document Type");
    PurchLine.SETRANGE("Document No.","No.");
    PurchLine.SETFILTER("Quantity Received",'<>0');
    EXIT(PurchLine.FINDFIRST);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    PurchLine.SETFILTER(l8,'<>0');
    EXIT(PurchLine.FINDFIRST);
    */
    //end;

    procedure InsertRFQ(RFQHeader: Record "Purchase Quote Header")
    var
        RFQLines: Record "Purchase Quote Line";
        ReqLines: Record "Purchase Line";
    begin
        //RFQHeader.GET(RFQHeader."Document Type"::"Quotation Request","RFQ No.");

        ReqLines.Reset();
        ReqLines.SetRange(ReqLines."Document Type", Rec."Document Type");
        ReqLines.SetRange(ReqLines."Document No.", Rec."No.");
        ReqLines.DeleteAll();

        RFQLines.SetRange(RFQLines."Document No.", RFQHeader."No.");
        if RFQLines.FindSet() then
            repeat
                ReqLines.Init();
                ReqLines.TransferFields(RFQLines);
                ReqLines."Document Type" := Rec."Document Type";
                ReqLines."Document No." := Rec."No.";
                ReqLines."Buy-from Vendor No." := Rec."Buy-from Vendor No.";
                ReqLines."Pay-to Vendor No." := Rec."Pay-to Vendor No.";
                ReqLines.Insert();
            /*
              ReqLines.VALIDATE(ReqLines."No.");
              ReqLines.VALIDATE(ReqLines.Quantity);
              ReqLines.VALIDATE(ReqLines."Direct Unit Cost");
              ReqLines.MODIFY;
            */
            until RFQLines.Next() = 0;
        Rec."RFQ No." := RFQHeader."No.";
        Rec.Modify();

    end;

    var
        VendLimit: Codeunit "Vendor Credit Limit Check";
        CheckNos: Codeunit "Check Manual Nos";
        Used: Boolean;
        RFQHdr: Record "Purchase Quote Header";
        RFQ: Record "Purchase Quote Line";
        PurchLine2: Record "Purchase Line";
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        LineNo: Decimal;
        RFQVendors: Record "Quotation Request Vendors";
        QuoteLine: Record "Quotation Specification Lines";
        Params: Record "Purchase Quote Params";
}
