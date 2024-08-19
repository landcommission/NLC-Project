#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50111 tableextension50111 extends "Purchase Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Name) on ""Quantity Received"(Field 60)".

        modify("FA Posting Type")
        {
            OptionCaption = ' ,Acquisition Cost,Maintenance,Custom 1,Custom 2';

            //Unsupported feature: Property Modification (OptionString) on ""FA Posting Type"(Field 5601)".

        }

        //Unsupported feature: Code Modification on "Type(Field 5).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetPurchHeader;
        TestStatusOpen;

        TESTFIELD("Qty. Rcd. Not Invoiced",0);
        TESTFIELD("Quantity Received",0);
        TESTFIELD("Receipt No.",'');

        TESTFIELD("Return Qty. Shipped Not Invd.",0);
        #9..52
          "Allow Item Charge Assignment" := TRUE
        ELSE
          "Allow Item Charge Assignment" := FALSE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        TESTFIELD(l8,0);
        #6..55
        */
        //end;


        //Unsupported feature: Code Modification on ""No."(Field 6).OnValidate".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        TESTFIELD("Qty. Rcd. Not Invoiced",0);
        TESTFIELD("Quantity Received",0);
        TESTFIELD("Receipt No.",'');

        TESTFIELD("Prepmt. Amt. Inv.",0);

        #8..42
          "Recalculate Invoice Disc." := TRUE;
        Type := TempPurchLine.Type;
        "No." := TempPurchLine."No.";
        IF "No." = '' THEN
          EXIT;
        IF Type <> Type::" " THEN BEGIN
        #49..51

        "System-Created Entry" := TempPurchLine."System-Created Entry";
        GetPurchHeader;
        PurchHeader.TESTFIELD("Buy-from Vendor No.");

        "Buy-from Vendor No." := PurchHeader."Buy-from Vendor No.";
        "Currency Code" := PurchHeader."Currency Code";
        #59..268
          CreateTempJobJnlLine(TRUE);
          UpdateJobPrices;
        END
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TestStatusOpen;
        TESTFIELD("Qty. Rcd. Not Invoiced",0);
        TESTFIELD(l8,0);
        TESTFIELD("Receipt No.",'');
        //TESTFIELD("Location Code");

        #5..45
        "Requisition No":=TempPurchLine."Requisition No";
        #46..54
        //PurchHeader.TESTFIELD("Buy-from Vendor No.");
        #56..271
        */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;

        IF "Drop Shipment" AND ("Document Type" <> "Document Type"::Invoice) THEN
        #4..14
          THEN
            FIELDERROR("Quantity (Base)",STRSUBSTNO(Text004,FIELDCAPTION("Return Qty. Shipped (Base)")));
        END ELSE BEGIN
          IF (Quantity * "Quantity Received" < 0) OR
             ((ABS(Quantity) < ABS("Quantity Received")) AND ("Receipt No." = ''))
          THEN
            FIELDERROR(Quantity,STRSUBSTNO(Text004,FIELDCAPTION("Quantity Received")));
          IF ("Quantity (Base)" * "Qty. Received (Base)" < 0) OR
             ((ABS("Quantity (Base)") < ABS("Qty. Received (Base)")) AND ("Receipt No." = ''))
          THEN
        #25..80
        END;

        CheckWMS;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..17
          IF (Quantity * l8 < 0) OR
             ((ABS(Quantity) < ABS(l8)) AND ("Receipt No." = ''))
          THEN
            FIELDERROR(Quantity,STRSUBSTNO(Text004,FIELDCAPTION(l8)));
        #22..83
        //ERROR('Wapi');
        */
        //end;


        //Unsupported feature: Code Modification on ""Qty. to Receive"(Field 18).OnValidate".

        //trigger  to Receive"(Field 18)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetLocation("Location Code");
        IF (CurrFieldNo <> 0) AND
           (Type = Type::Item) AND
        #4..9
          WhseValidateSourceLine.PurchaseLineVerifyChange(Rec,xRec);
        END;

        IF "Qty. to Receive" = Quantity - "Quantity Received" THEN
          InitQtyToReceive
        ELSE BEGIN
          "Qty. to Receive (Base)" := CalcBaseQty("Qty. to Receive");
        #17..35

        IF "Job Planning Line No." <> 0 THEN
          VALIDATE("Job Planning Line No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..12
        IF "Qty. to Receive" = Quantity - l8 THEN
        #14..38
        */
        //end;


        //Unsupported feature: Code Modification on ""Job No."(Field 45).OnValidate".

        //trigger "(Field 45)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Drop Shipment",FALSE);
        TESTFIELD("Special Order",FALSE);
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF ReservEntryExist THEN
          TESTFIELD("Job No.",'');
        #9..31
          DimMgt.TypeToTableID3(Type),"No.",
          DATABASE::"Responsibility Center","Responsibility Center",
          DATABASE::"Work Center","Work Center No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
          TESTFIELD(l8,0);
        #6..34

        CheckWipAccount;
        */
        //end;


        //Unsupported feature: Code Modification on ""Blanket Order No."(Field 97).OnLookup".

        //trigger "(Field 97)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Quantity Received",0);
        BlanketOrderLookup;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD(l8,0);
        BlanketOrderLookup;
        */
        //end;


        //Unsupported feature: Code Modification on ""Blanket Order No."(Field 97).OnValidate".

        //trigger "(Field 97)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Quantity Received",0);
        IF "Blanket Order No." = '' THEN
          "Blanket Order Line No." := 0
        ELSE
          VALIDATE("Blanket Order Line No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD(l8,0);
        #2..5
        */
        //end;


        //Unsupported feature: Code Modification on ""Blanket Order Line No."(Field 98).OnValidate".

        //trigger "(Field 98)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Quantity Received",0);
        IF "Blanket Order Line No." <> 0 THEN BEGIN
          PurchLine2.GET("Document Type"::"Blanket Order","Blanket Order No.","Blanket Order Line No.");
          PurchLine2.TESTFIELD(Type,Type);
          PurchLine2.TESTFIELD("No.","No.");
          PurchLine2.TESTFIELD("Pay-to Vendor No.","Pay-to Vendor No.");
          PurchLine2.TESTFIELD("Buy-from Vendor No.","Buy-from Vendor No.");
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD(l8,0);
        #2..6
          //PurchLine2.TESTFIELD("Buy-from Vendor No.","Buy-from Vendor No.");
        END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Task No."(Field 1001).OnValidate".

        //trigger "(Field 1001)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');

        IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
          VALIDATE("Job Planning Line No.",0);
          IF "Document Type" = "Document Type"::Order THEN
            TESTFIELD("Quantity Received",0);
        END;

        IF "Job Task No." = '' THEN BEGIN
        #10..18
          UpdateJobPrices;
        END;
        UpdateDimensionsFromJobTask;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..5
            TESTFIELD(l8,0);
        #7..21
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Line Type"(Field 1002).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF "Job Planning Line No." <> 0 THEN
          ERROR(Text048,FIELDCAPTION("Job Line Type"),FIELDCAPTION("Job Planning Line No."));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD(l8,0);
        #4..6
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Unit Price"(Field 1003).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine(FALSE);
          JobJnlLine.VALIDATE("Unit Price","Job Unit Price");
          UpdateJobPrices;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD(l8,0);
        #4..9
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Line Amount"(Field 1005).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine(FALSE);
          JobJnlLine.VALIDATE("Line Amount","Job Line Amount");
          UpdateJobPrices;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD(l8,0);
        #4..9
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Line Discount Amount"(Field 1006).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine(FALSE);
          JobJnlLine.VALIDATE("Line Discount Amount","Job Line Discount Amount");
          UpdateJobPrices;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD(l8,0);
        #4..9
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Line Discount %"(Field 1007).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine(FALSE);
          JobJnlLine.VALIDATE("Line Discount %","Job Line Discount %");
          UpdateJobPrices;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD(l8,0);
        #4..9
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Unit Price (LCY)"(Field 1008).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine(FALSE);
          JobJnlLine.VALIDATE("Unit Price (LCY)","Job Unit Price (LCY)");
          UpdateJobPrices;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD(l8,0);
        #4..9
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Line Amount (LCY)"(Field 1010).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine(FALSE);
          JobJnlLine.VALIDATE("Line Amount (LCY)","Job Line Amount (LCY)");
          UpdateJobPrices;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD(l8,0);
        #4..9
        */
        //end;


        //Unsupported feature: Code Modification on ""Job Line Disc. Amount (LCY)"(Field 1011).OnValidate".

        //trigger  Amount (LCY)"(Field 1011)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD("Quantity Received",0);

        IF JobTaskIsSet THEN BEGIN
          CreateTempJobJnlLine(FALSE);
          JobJnlLine.VALIDATE("Line Discount Amount (LCY)","Job Line Disc. Amount (LCY)");
          UpdateJobPrices;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Receipt No.",'');
        IF "Document Type" = "Document Type"::Order THEN
          TESTFIELD(l8,0);
        #4..9
        */
        //end;


        //Unsupported feature: Code Modification on ""Bin Code"(Field 5403).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Bin Code" <> '' THEN BEGIN
          IF NOT IsInbound AND ("Quantity (Base)" <> 0) THEN
            WMSManagement.FindBinContent("Location Code","Bin Code","No.","Variant Code",'')
        #4..10
            FIELDCAPTION("Bin Code"),"Sales Order No.");

        TESTFIELD(Type,Type::Item);
        TESTFIELD("Location Code");

        IF "Bin Code" <> '' THEN BEGIN
          GetLocation("Location Code");
          Location.TESTFIELD("Bin Mandatory");
          CheckWarehouse;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..13
        //TESTFIELD("Location Code");
        #15..20
        */
        //end;


        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 5407).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        TESTFIELD("Quantity Received",0);
        TESTFIELD("Qty. Received (Base)",0);
        TESTFIELD("Qty. Rcd. Not Invoiced",0);
        IF "Unit of Measure Code" <> xRec."Unit of Measure Code" THEN BEGIN
        #6..43
          "Qty. per Unit of Measure" := 0;

        VALIDATE(Quantity);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TestStatusOpen;
        TESTFIELD(l8,0);
        #3..46
        */
        //end;
        field(50000; Committed; Boolean)
        {
            Caption = 'Committed';
            DataClassification = CustomerContent;
        }
        field(50004; "Expense Code"; Code[10])
        {
            Caption = 'Expense Code';
            DataClassification = CustomerContent;
            // //TableRelation = Table39005906;

            trigger OnValidate()
            begin
                //TestStatusOpen;
                Rec.TestField(Rec.Type, Rec.Type::"G/L Account");
            end;
        }
        field(50005; "RFQ No."; Code[20])
        {
            Description = 'ADDED THIS FIELD';
            Caption = 'RFQ No.';
            DataClassification = CustomerContent;
        }
        field(50006; "RFQ Line No."; Integer)
        {
            Description = 'ADDED THIS FIELD';
            Caption = 'RFQ Line No.';
            DataClassification = CustomerContent;
            // //TableRelation = Table39006018.Field4;
        }
        field(50010; "Project Code"; Code[10])
        {
            CalcFormula = lookup("Purchase Header"."Project Code" where("No." = field("Document No.")));
            FieldClass = FlowField;
            Caption = 'Project Code';
            Editable = false;
        }
        field(51000; "RFQ Remarks"; Text[50])
        {
            Caption = 'RFQ Remarks';
            DataClassification = CustomerContent;
        }
        field(51002; "Requisition No"; Code[20])
        {
            Caption = 'Requisition No';
            DataClassification = CustomerContent;
        }
        field(39005540; "Procurement Type Code"; Code[20])
        {
            TableRelation = "CshMgt PV Steps";
            Caption = 'Procurement Type Code';
            DataClassification = CustomerContent;
        }
        field(39005606; "Manual Requisition No"; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote),
                                                           Status = const(Released));
            Caption = 'Manual Requisition No';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec."Manually Added" := true;
            end;
        }
        field(39005607; "Manually Added"; Boolean)
        {
            Caption = 'Manually Added';
            DataClassification = CustomerContent;
        }
    }


    //Unsupported feature: Code Modification on "InitOutstanding(PROCEDURE 16)".

    //procedure InitOutstanding();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN BEGIN
      "Outstanding Quantity" := Quantity - "Return Qty. Shipped";
      "Outstanding Qty. (Base)" := "Quantity (Base)" - "Return Qty. Shipped (Base)";
      "Return Qty. Shipped Not Invd." := "Return Qty. Shipped" - "Quantity Invoiced";
      "Ret. Qty. Shpd Not Invd.(Base)" := "Return Qty. Shipped (Base)" - "Qty. Invoiced (Base)";
    END ELSE BEGIN
      "Outstanding Quantity" := Quantity - "Quantity Received";
      "Outstanding Qty. (Base)" := "Quantity (Base)" - "Qty. Received (Base)";
      "Qty. Rcd. Not Invoiced" := "Quantity Received" - "Quantity Invoiced";
      "Qty. Rcd. Not Invoiced (Base)" := "Qty. Received (Base)" - "Qty. Invoiced (Base)";
    END;
    "Completely Received" := (Quantity <> 0) AND ("Outstanding Quantity" = 0);
    InitOutstandingAmount;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
      "Outstanding Quantity" := Quantity - l8;
      "Outstanding Qty. (Base)" := "Quantity (Base)" - "Qty. Received (Base)";
      "Qty. Rcd. Not Invoiced" := l8 - "Quantity Invoiced";
    #10..13
    */
    //end;


    //Unsupported feature: Code Modification on "MaxQtyToInvoice(PROCEDURE 18)".

    //procedure MaxQtyToInvoice();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Prepayment Line" THEN
      EXIT(1);
    IF "Document Type" IN ["Document Type"::"Return Order","Document Type"::"Credit Memo"] THEN
      EXIT("Return Qty. Shipped" + "Return Qty. to Ship" - "Quantity Invoiced");

    EXIT("Quantity Received" + "Qty. to Receive" - "Quantity Invoiced");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    EXIT(l8 + "Qty. to Receive" - "Quantity Invoiced");
    */
    //end;

    procedure CheckWipAccount()
    var
        FAWIPJob: Record Job;
        FAWIPJobPostingGrp: Record "Job Posting Group";
    begin
        FAWIPJob.Get(Rec."Job No.");
        FAWIPJobPostingGrp.Get(FAWIPJob."Job Posting Group");
        Rec.TestField(Rec.Type, Rec.Type::"G/L Account");
        if Rec."No." <> FAWIPJobPostingGrp."WIP Costs Account" then
            Error('Insert the right WIP Account %1', FAWIPJobPostingGrp."WIP Costs Account");
    end;
}
