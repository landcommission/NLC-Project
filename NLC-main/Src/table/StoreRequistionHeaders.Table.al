#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 52193901 "Store Requistion Headers"
{
    Caption = 'Store Requistion Headers';
    DrillDownPageID = "Store Requisition Card";
    LookupPageID = "Store Requisition Card";

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = true;
            NotBlank = false;

            trigger OnValidate()
            begin
                //IF "No." = '' THEN BEGIN
                if "No." <> xRec."No." then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Store Requisition Nos.");
                    "No." := '';
                end;
                //END;
            end;
        }
        field(2; "Request date"; Date)
        {
            Editable = false;
        }
        field(5; "Required Date"; Date)
        {
            Caption = 'Order Date';

            trigger OnValidate()
            begin
                //IF "Required Date" > TODAY THEN ERROR('Order date cannot be a future Date');
            end;
        }
        field(6; "Requester ID"; Code[50])
        {
            Caption = 'Requester ID';
            Editable = true;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnLookup()
            var
                LoginMgt: Codeunit 418;
            begin
            end;

            trigger OnValidate()
            var
                LoginMgt: Codeunit 418;
            begin


                if UsersRec.Get("Requester ID") then begin
                    Empl.SetRange(Empl."User ID", UsersRec."User ID");
                    if Empl.Find('-') then begin
                        Empl.CalcFields("County Name", "Department Name");
                        "Employee Code" := Empl."No.";
                        "Employee Name" := Empl."First Name" + ' ' + Empl."Last Name";
                        "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                        "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
                        "Responsibility Center" := Empl."Responsibility Center";
                        "Function Name" := Empl."County Name";
                        "Budget Center Name" := Empl."Department Name";
                    end;
                end;
            end;
        }
        field(7; "Request Description"; Text[150])
        {
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";

            trigger OnValidate()
            begin
                /*
                IF PurchaseLine.Quantity > 0 THEN BEGIN
                  Item.RESET;
                  FOR i := 1 TO PurchaseLine.Quantity DO BEGIN
                    Item.INIT;
                    Item."No." := 'New Item ' + i;
                    Item."Description" := 'Description of new item ' + i;
                    Item.INSERT;
                  END;
                END;
                */

            end;
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled,Posted,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted,Rejected;

            trigger OnValidate()
            begin

                if "Action Type" = "action type"::Asset then begin
                    if Status = Status::Released then begin

                        SReqLines.SetRange(SReqLines."Requistion No", "No.");
                        //SReqLines.SETRANGE("Asset Code",SReqLines."Asset Code");
                        if SReqLines.Find('-') then
                            //MESSAGE( SReqLines."Requistion No");
                            //Insert PO Header
                            StoreRequistionHeaders.Reset;
                        NextCodeRec := NoSeriesMgnt.GetNextNo('ASSETREC', WorkDate, true);
                        StoreRequistionHeaders."No." := NextCodeRec;
                        //StoreRequistionHeaders."Document Type":=StoreRequistionHeaders."Document Type"::ASSET;
                        StoreRequistionHeaders."Action Type" := StoreRequistionHeaders."action type"::Asset;
                        StoreRequistionHeaders."Purchase Order No" := "Purchase Order No";
                        StoreRequistionHeaders."Request date" := Today;
                        StoreRequistionHeaders."Requester ID" := UserId;
                        StoreRequistionHeaders.Validate("Requester ID");
                        StoreRequistionHeaders."Order Date" := "Order Date";
                        StoreRequistionHeaders."Purchasing Store" := "Purchasing Store";
                        StoreRequistionHeaders."Purchase Order No" := "Purchase Order No";
                        StoreRequistionHeaders."Vendor No." := "Vendor No.";
                        StoreRequistionHeaders."Vendor Name" := "Vendor Name";
                        StoreRequistionHeaders.Currency := Currency;
                        StoreRequistionHeaders."Required Date" := "Required Date";
                        StoreRequistionHeaders.Insert;
                        repeat
                            if SReqLines."Quantity Requested" > 0 then begin

                                fasset.Reset;
                                for i := 1 to SReqLines."Quantity Requested"
                                 do begin
                                    fasset.Init;
                                    NextCode := NoSeriesMgnt.GetNextNo('FIXEDASSET', WorkDate, true);
                                    fasset."No." := NextCode;
                                    fasset.Description := PadStr(SReqLines.Description, 50);
                                    fasset."Supplier Name" := SReqLines."Supplier Name";
                                    // fasset."IFMIS Order No" := SReqLines."Approved IFMIS No.";
                                    // fasset."IFMIS Code" := SReqLines."Approved Assset Code";
                                    //fasset."Asset Movement Status" := fasset."asset movement status"::New;
                                    fasset."FA Class Code" := 'TANGIBLE';
                                    fasset."Supplier Name" := SReqLines."Supplier Name";
                                    // fasset."IFMIS Order No" := SReqLines."Approved IFMIS No.";
                                    fasset."FA Location Code" := 'HEADOFFICE';
                                    fasset."Location Code" := 'MAIN';
                                    fasset.Insert;

                                    Deprec."FA No." := NextCode;
                                    Deprec."Depreciation Book Code" := 'NLC';
                                    Deprec."FA Posting Group" := 'OFFICEQUIP';
                                    Deprec."Depreciation Method" := Deprec."depreciation method"::"Straight-Line";
                                    Deprec."Depreciation Starting Date" := StoreRequistionHeaders."Order Date";
                                    Deprec.Insert;

                                    //Insert PO Lines
                                    StoreRequistionLine.Reset;
                                    StoreRequistionLine."Requistion No" := StoreRequistionHeaders."No.";
                                    StoreRequistionLine.Type := StoreRequistionLine.Type::Asset;
                                    StoreRequistionLine."No." := fasset."No.";
                                    StoreRequistionLine."Quantity Requested" := 1;
                                    StoreRequistionLine."Asset Quantity" := 1;
                                    StoreRequistionLine.Quantity := 1;
                                    StoreRequistionLine."Unit Cost" := SReqLines."Unit Cost";
                                    StoreRequistionLine."Unit of Measure" := SReqLines."Unit of Measure";
                                    StoreRequistionLine."IFMIS Nos" := "Purchase Order No";
                                    StoreRequistionLine."Line No." := GetLastEntryNo;
                                    StoreRequistionLine."Asset Code" := fasset."No.";
                                    StoreRequistionLine.Description := fasset.Description;
                                    StoreRequistionLine."Line Amount" := SReqLines."Unit Cost";
                                    StoreRequistionLine."Shortcut Dimension 1 Code" := SReqLines."Shortcut Dimension 1 Code";
                                    StoreRequistionLine."Shortcut Dimension 2 Code" := SReqLines."Shortcut Dimension 2 Code";
                                    StoreRequistionLine."Purchasing Store" := SReqLines."Purchasing Store";
                                    StoreRequistionLine.Insert;

                                    // Post to Asset Ledgers
                                    LineNoRec := LineNoRec + 1000;
                                    GenJnlines.Init;
                                    GenJnlines."Journal Template Name" := 'ASSETS';
                                    GenJnlines."Journal Batch Name" := 'ACQ';
                                    GenJnlines."Line No." := LineNoRec;
                                    //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                                    GenJnlines."Document No." := "No.";
                                    GenJnlines."FA No." := StoreRequistionLine."No.";
                                    ////GenJnlines.VALIDATE(StoreRequistionLine."No.");
                                    GenJnlines."FA Posting Date" := "Request date";
                                    GenJnlines.Description := StoreRequistionLine.Description;
                                    GenJnlines.Amount := StoreRequistionLine."Line Amount";
                                    GenJnlines."External Document No." := StoreRequistionHeaders."Purchase Order No";
                                    GenJnlines."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                    GenJnlines.Validate("Shortcut Dimension 1 Code");
                                    GenJnlines."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                    GenJnlines.Validate("Shortcut Dimension 2 Code");
                                    GenJnlines."Depreciation Book Code" := 'NLC';
                                    GenJnlines.Insert(true);
                                    fasset.Reset;
                                    fasset.SetRange(fasset."No.", StoreRequistionLine."No.");
                                    if fasset.Find('-') then
                                        //  fasset."Asset Movement Status" := fasset."asset movement status"::Available;
                                        fasset."Supplier Name" := StoreRequistionHeaders."Vendor Name";
                                    //  fasset."IFMIS Code" := StoreRequistionLine."IFMIS Nos";
                                    fasset.Modify;
                                    ////Status:=Status::Posted;
                                    Modify;


                                    //Post Entries
                                    GenJnlines.Reset;
                                    GenJnlines.SetRange(GenJnlines."Journal Template Name", FASetup."FA Jnl. Template Name");
                                    GenJnlines.SetRange(GenJnlines."Journal Batch Name", FASetup."FA Jnl. Batch Name");
                                    Codeunit.Run(Codeunit::"FA. Jnl.-Post", GenJnlines);
                                    //End Post to Ledgers


                                end;
                            end;
                        until SReqLines.Next = 0;
                    end;
                end;



                if "Document Type" = "document type"::PR then begin
                    if "Action Type" = "action type"::Item then
                        if Status = Status::Released then
                            //
                            if InventorySetup.Get then begin
                                InventorySetup.TestField(InventorySetup."Item Jnl Template");
                                InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                                GenJnline.Reset;
                                GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                if GenJnline.Find('-') then GenJnline.DeleteAll;
                                ReqLine.Reset;
                                ReqLine.SetRange(ReqLine."Requistion No", "No.");
                                if ReqLine.Find('-') then begin
                                    repeat
                                        //Receive
                                        ReqLine.CalcFields("Issuing Store");
                                        LineNo := LineNo + 1000;
                                        GenJnline.Init;
                                        GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                        GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                        GenJnline."Line No." := LineNo;
                                        GenJnline."Entry Type" := GenJnline."entry type"::"Positive Adjmt.";
                                        GenJnline."Document No." := "No.";
                                        GenJnline."Item No." := ReqLine."No.";
                                        GenJnline.Validate("Item No.");
                                        GenJnline."Location Code" := ReqLine."Issuing Store";
                                        GenJnline."Bin Code" := ReqLine."Bin Code";
                                        GenJnline.Validate("Location Code");
                                        GenJnline."Posting Date" := "Request date";
                                        GenJnline.Description := "Request Description";
                                        GenJnline.Quantity := ReqLine."Quantity Requested";
                                        GenJnline."Gen. Bus. Posting Group" := 'LOCAL';
                                        GenJnline."Gen. Prod. Posting Group" := 'GOODS';

                                        GenJnline."Order No." := "Purchase Order No";
                                        GenJnline."Invoice No." := "Invoice No";
                                        GenJnline."Vendor No" := "Vendor No.";
                                        GenJnline."Vendor Name" := "Vendor Name";
                                        GenJnline."Employee No" := "Employee Code";
                                        GenJnline."Employee Name" := "Employee Name";
                                        GenJnline."Order No" := "Order No";
                                        GenJnline."User ID" := "Requester ID";
                                        GenJnline."Unit Amount" := ReqLine."Unit Cost";
                                        GenJnline.Amount := ReqLine."Line Amount";

                                        GenJnline."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                        GenJnline.Validate("Shortcut Dimension 1 Code");
                                        GenJnline."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                        GenJnline.Validate("Shortcut Dimension 2 Code");
                                        GenJnline.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                                        GenJnline.ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                                        GenJnline.Validate(Quantity);
                                        GenJnline.Validate("Unit Amount");

                                        //GenJnline."Reason Code":='221';
                                        //GenJnline.VALIDATE("Reason Code");
                                        GenJnline.Insert(true);

                                    //ReqLine."Request Status":=ReqLine."Request Status"::Closed;

                                    until ReqLine.Next = 0;

                                    //Post Entries
                                    GenJnline.Reset;
                                    GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                    GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                    Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                                    //End Post entries

                                    //Modify All
                                    //Post:=FALSE;
                                    //Post:=JournlPosted.PostedSuccessfully();
                                    //IF Post THEN BEGIN
                                    //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                                    Status := Status::Posted;
                                    Modify;
                                end;
                            end;
                end;














                /*{
                 IF "Action Type"="Action Type"::Asset THEN
                     BEGIN
                        IF Status=Status::Released THEN
                             BEGIN
                            SReqLines.SETRANGE(SReqLines."Requistion No","No.");
                            SReqLines.SETRANGE("Asset Code",SReqLines."Asset Code");
                         IF SReqLines.FIND('-') THEN
                          //Insert PO Header
                                StoreRequistionHeaders.RESET;
                                NextCodeRec:=NoSeriesMgnt.GetNextNo('ASSETREC',WORKDATE,TRUE);
                                StoreRequistionHeaders."No.":= NextCodeRec;
                                StoreRequistionHeaders."Document Type":=StoreRequistionHeaders."Document Type"::ASSET;
                                StoreRequistionHeaders."Action Type":=StoreRequistionHeaders."Action Type"::Asset;
                                StoreRequistionHeaders."Purchase Order No":="Purchase Order No";
                                StoreRequistionHeaders."Request date":=TODAY;
                                StoreRequistionHeaders."Requester ID":=USERID;
                                StoreRequistionHeaders.VALIDATE("Requester ID");
                                StoreRequistionHeaders."Order Date":="Order Date";
                                StoreRequistionHeaders."Purchasing Store":="Purchasing Store";
                                StoreRequistionHeaders."Purchase Order No":="Purchase Order No";
                                StoreRequistionHeaders."Vendor No.":="Vendor No.";
                                StoreRequistionHeaders."Vendor Name":="Vendor Name";
                                StoreRequistionHeaders.Currency:=Currency;
                                StoreRequistionHeaders."Required Date":="Required Date";
                                StoreRequistionHeaders.INSERT;
                
                
                             IF SReqLines."Quantity Requested" > 0 THEN
                                  REPEAT
                                BEGIN
                               fasset.RESET;
                             FOR i := 1 TO SReqLines."Quantity Requested"
                              DO BEGIN
                              fasset.INIT;
                              NextCode:=NoSeriesMgnt.GetNextNo('FIXEDASSET',WORKDATE,TRUE);
                              fasset."No.":=NextCode;
                              fasset.Description:=PADSTR(SReqLines.Description,50);
                              fasset."Supplier Name":=SReqLines."Supplier Name";
                              fasset."IFMIS Order No":=SReqLines."Approved IFMIS No.";
                              fasset."IFMIS Code":=SReqLines."Approved Assset Code";
                              fasset."Asset Movement Status":=fasset."Asset Movement Status"::New;
                              fasset."FA Class Code":='TANGIBLE';
                              fasset."Supplier Name":= SReqLines."Supplier Name";
                              fasset."IFMIS Order No":=SReqLines."Approved IFMIS No.";
                              fasset."FA Location Code":='HEADOFFICE';
                              fasset."Location Code":='MAIN';
                              fasset.INSERT;
                
                              Deprec."FA No.":=NextCode;
                              Deprec."Depreciation Book Code":='NLC';
                              Deprec."FA Posting Group":='OFFICEQUIP';
                              Deprec."Depreciation Method":=Deprec."Depreciation Method"::"Straight-Line";
                              Deprec."Depreciation Starting Date":=StoreRequistionHeaders."Order Date";
                              Deprec.INSERT;
                
                              //Insert PO Lines
                                StoreRequistionLine.RESET;
                                StoreRequistionLine."Requistion No":=StoreRequistionHeaders."No.";
                                StoreRequistionLine.Type:=StoreRequistionLine.Type::Asset;
                                StoreRequistionLine."No.":=fasset."No.";
                                StoreRequistionLine."Quantity Requested":=1;
                                StoreRequistionLine."Asset Quantity":=1;
                                StoreRequistionLine.Quantity:=1;
                                StoreRequistionLine."Unit Cost":= SReqLines."Unit Cost";
                                StoreRequistionLine."Unit of Measure":=SReqLines."Unit of Measure";
                                StoreRequistionLine."IFMIS Nos":="Purchase Order No";
                                StoreRequistionLine."Line No.":=GetLastEntryNo;
                                StoreRequistionLine."Asset Code":=fasset."No.";
                                StoreRequistionLine.Description:=fasset.Description;
                                StoreRequistionLine."Line Amount":=SReqLines."Unit Cost";
                                StoreRequistionLine."Shortcut Dimension 1 Code":=SReqLines."Shortcut Dimension 1 Code";
                                StoreRequistionLine."Shortcut Dimension 2 Code":=SReqLines."Shortcut Dimension 2 Code";
                                StoreRequistionLine."Purchasing Store":=SReqLines."Purchasing Store";
                                StoreRequistionLine.INSERT;
                
                              // Post to Asset Ledgers
                             LineNoRec:=LineNoRec+1000;
                             GenJnlines.INIT;
                             GenJnlines."Journal Template Name":='ASSETS';
                             GenJnlines."Journal Batch Name":='ACQ';
                             GenJnlines."Line No.":=LineNoRec;
                             //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                             GenJnlines."Document No.":="No.";
                             GenJnlines."FA No.":=StoreRequistionLine."No.";
                             ////GenJnlines.VALIDATE(StoreRequistionLine."No.");
                             GenJnlines."FA Posting Date":="Request date";
                             GenJnlines.Description:=StoreRequistionLine.Description;
                             GenJnlines.Amount:=StoreRequistionLine."Line Amount";
                             GenJnlines."External Document No.":=StoreRequistionHeaders."Purchase Order No";
                             GenJnlines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                             GenJnlines.VALIDATE("Shortcut Dimension 1 Code");
                             GenJnlines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                             GenJnlines.VALIDATE("Shortcut Dimension 2 Code");
                             GenJnlines."Depreciation Book Code":='NLC';
                             GenJnlines.INSERT(TRUE);
                              fasset.RESET;
                              fasset.SETRANGE(fasset."No.",StoreRequistionLine. "No.");
                              IF fasset.FIND('-') THEN
                                 fasset."Asset Movement Status":=fasset."Asset Movement Status"::Available;
                                 fasset."Supplier Name":=StoreRequistionHeaders."Vendor Name";
                                 fasset."IFMIS Code":=StoreRequistionLine."IFMIS Nos";
                                 fasset.MODIFY;
                                 ////Status:=Status::Posted;
                                 MODIFY;
                            //Post Entries
                            GenJnlines.RESET;
                            GenJnlines.SETRANGE(GenJnlines."Journal Template Name",FASetup."FA Jnl. Template Name");
                            GenJnlines.SETRANGE(GenJnlines."Journal Batch Name",FASetup."FA Jnl. Batch Name");
                            CODEUNIT.RUN(CODEUNIT::"FA. Jnl.-Post",GenJnlines);
                              //End Post to Ledgers
                
                            END;
                            END;
                          UNTIL SReqLines.NEXT=SReqLines."Quantity Requested";
                                END;
                         END;
                    }*/


                if "Document Type" = "document type"::PR then begin
                    if "Action Type" = "action type"::Item then
                        if Status = Status::Released then
                            //
                            if InventorySetup.Get then begin
                                InventorySetup.TestField(InventorySetup."Item Jnl Template");
                                InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                                GenJnline.Reset;
                                GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                if GenJnline.Find('-') then GenJnline.DeleteAll;
                                ReqLine.Reset;
                                ReqLine.SetRange(ReqLine."Requistion No", "No.");
                                if ReqLine.Find('-') then begin
                                    repeat
                                        //Receive
                                        ReqLine.CalcFields("Issuing Store");
                                        LineNo := LineNo + 1000;
                                        GenJnline.Init;
                                        GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                        GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                        GenJnline."Line No." := LineNo;
                                        GenJnline."Entry Type" := GenJnline."entry type"::"Positive Adjmt.";
                                        GenJnline."Document No." := "No.";
                                        GenJnline."Item No." := ReqLine."No.";
                                        GenJnline.Validate("Item No.");
                                        GenJnline."Location Code" := ReqLine."Issuing Store";
                                        GenJnline."Bin Code" := ReqLine."Bin Code";
                                        GenJnline.Validate("Location Code");
                                        GenJnline."Posting Date" := "Request date";
                                        GenJnline.Description := "Request Description";
                                        GenJnline.Quantity := ReqLine."Quantity Requested";
                                        GenJnline."Gen. Bus. Posting Group" := 'LOCAL';
                                        GenJnline."Gen. Prod. Posting Group" := 'GOODS';

                                        GenJnline."Order No." := "Purchase Order No";
                                        GenJnline."Invoice No." := "Invoice No";
                                        GenJnline."Vendor No" := "Vendor No.";
                                        GenJnline."Vendor Name" := "Vendor Name";
                                        GenJnline."Employee No" := "Employee Code";
                                        GenJnline."Employee Name" := "Employee Name";
                                        GenJnline."Order No" := "Order No";
                                        GenJnline."User ID" := "Requester ID";
                                        GenJnline."Unit Amount" := ReqLine."Unit Cost";
                                        GenJnline.Amount := ReqLine."Line Amount";

                                        GenJnline."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                        GenJnline.Validate("Shortcut Dimension 1 Code");
                                        GenJnline."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                        GenJnline.Validate("Shortcut Dimension 2 Code");
                                        GenJnline.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                                        GenJnline.ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                                        GenJnline.Validate(Quantity);
                                        GenJnline.Validate("Unit Amount");

                                        //GenJnline."Reason Code":='221';
                                        //GenJnline.VALIDATE("Reason Code");
                                        GenJnline.Insert(true);

                                    //ReqLine."Request Status":=ReqLine."Request Status"::Closed;

                                    until ReqLine.Next = 0;

                                    //Post Entries
                                    GenJnline.Reset;
                                    GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                    GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                    Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                                    //End Post entries

                                    //Modify All
                                    //Post:=FALSE;
                                    //Post:=JournlPosted.PostedSuccessfully();
                                    //IF Post THEN BEGIN
                                    //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                                    Status := Status::Posted;
                                    Modify;
                                end;
                            end;
                end;



                /*
                IF "Document Type"="Document Type"::PR THEN
                 BEGIN
                   IF "Action Type"="Action Type"::Asset THEN
                       IF Status=Status::Released THEN
                              //
                    GenJnlines.RESET;
                    GenJnlines.SETRANGE(GenJnlines."Journal Template Name",'ASSETS');
                    GenJnlines.SETRANGE(GenJnlines."Journal Batch Name",'ACQ');
                    IF GenJnlines.FIND('-') THEN GenJnlines.DELETEALL;
                    ReqLine.RESET;
                    ReqLine.SETRANGE(ReqLine."Requistion No","No.");
                    TESTFIELD("Purchasing Store");
                    IF ReqLine.FIND('-') THEN BEGIN
                    REPEAT
                    //Purchase Fixed Assets
                             LineNos:=LineNos+1000;
                             GenJnlines.INIT;
                             GenJnlines."Journal Template Name":='ASSETS';
                             GenJnlines."Journal Batch Name":='ACQ';
                             GenJnline."Line No.":=LineNos;
                             //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                             GenJnlines."Document No.":="No.";
                             GenJnlines."FA No.":=ReqLine."No.";
                             GenJnlines.VALIDATE("FA No.");
                             GenJnlines."FA Posting Date":="Request date";
                             GenJnlines.Description:=ReqLine.Description;
                             GenJnlines.Amount:=ReqLine."Line Amount";
                             GenJnlines."External Document No.":="Order No";
                             GenJnlines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                             GenJnlines.VALIDATE("Shortcut Dimension 1 Code");
                             GenJnlines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                             GenJnlines.VALIDATE("Shortcut Dimension 2 Code");
                             GenJnlines.INSERT(TRUE);
                
                
                              fasset.RESET;
                              fasset.SETRANGE(fasset."No.",ReqLine. "No.");
                              IF fasset.FIND('-') THEN
                                 fasset."Asset Movement Status":=fasset."Asset Movement Status"::Available;
                                 //fasset."Supplier Name":=
                                 //fasset."IFMIS Order No":=
                                 fasset."IFMIS Code":=ReqLine."Approved Assset Code";
                                 fasset.MODIFY;
                                 Status:=Status::Posted;
                                  MODIFY;
                
                
                   UNTIL ReqLine. NEXT=0;
                
                            //Post Entries
                            GenJnlines.RESET;
                            GenJnlines.SETRANGE(GenJnlines."Journal Template Name",FASetup."FA Jnl. Template Name");
                            GenJnlines.SETRANGE(GenJnlines."Journal Batch Name",FASetup."FA Jnl. Batch Name");
                            ////CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
                            CODEUNIT.RUN(CODEUNIT::"FA. Jnl.-Post",GenJnlines);
                            //End Post entries
                
                          //Modify All
                          //Post:=FALSE;
                          //Post:=JournlPosted.PostedSuccessfully();
                          //IF Post THEN BEGIN
                
                                  {
                                  ReqLineCopy.RESET;
                                  ReqLineCopy.SETRANGE(ReqLineCopy."Approved Assset Code",ReqLine."Asset Code");
                                  ReqLineCopy."Request Status":=ReqLineCopy."Request Status"::Posted;
                                  MESSAGE(FORMAT(ReqLineCopy."Requistion No"));
                                  }
                
                            END;
                          END;
                
                
                 */

            end;
        }
        field(11; Supplier; Code[20])
        {
            TableRelation = Vendor;
        }
        field(12; "Action Type"; Option)
        {
            OptionCaption = 'Item,Asset';
            OptionMembers = Item,Asset;

            trigger OnValidate()
            begin
                /*
                IF Type=Type::"G/L Account" THEN BEGIN
                   IF "Action Type"="Action Type"::Issue THEN
                            ERROR('You cannot Issue a G/L Account please order for it')
                END;


               //Compare Quantity in Store and Qty to Issue
                IF Type=Type::Item THEN BEGIN
                   IF "Action Type"="Action Type"::Issue THEN BEGIN
                    IF Quantity>"Qty in store" THEN
                      ERROR('You cannot Issue More than what is available in store')
                   END;
                END;
                */

            end;
        }
        field(29; Justification; Text[250])
        {
        }
        field(30; "User ID"; Code[50])
        {
        }
        field(31; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                Dimval.Reset;
                Dimval.SetRange(Dimval."Global Dimension No.", 1);
                Dimval.SetRange(Dimval.Code, "Global Dimension 1 Code");
                if Dimval.Find('-') then
                    "Function Name" := Dimval.Name;

                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                Dimval.Reset;
                Dimval.SetRange(Dimval."Global Dimension No.", 2);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 2 Code");
                if Dimval.Find('-') then
                    "Budget Center Name" := Dimval.Name;

                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(57; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';

            trigger OnLookup()
            begin
                LookupShortcutDimCode(3, "Shortcut Dimension 3 Code");
                Validate("Shortcut Dimension 3 Code");
            end;

            trigger OnValidate()
            begin
                Dimval.Reset;
                //Dimval.SETRANGE(Dimval."Global Dimension No.",3);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 3 Code");
                if Dimval.Find('-') then
                    Dim3 := Dimval.Name;

                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(82; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';

            trigger OnLookup()
            begin
                LookupShortcutDimCode(4, "Shortcut Dimension 4 Code");
                Validate("Shortcut Dimension 4 Code");
            end;

            trigger OnValidate()
            begin
                Dimval.Reset;
                //Dimval.SETRANGE(Dimval."Global Dimension No.",4);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 4 Code");
                if Dimval.Find('-') then
                    Dim4 := Dimval.Name;

                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(83; Dim3; Text[250])
        {
        }
        field(84; Dim4; Text[250])
        {
        }
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR NEW".Code;

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Status,Status::Open);
                IF NOT UserMgt.CheckRespCenter(1,"Responsibility Center") THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter)
                "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
                IF "Location Code" = '' THEN BEGIN
                  IF InvtSetup.GET THEN
                    "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
                END ELSE BEGIN
                  IF Location.GET("Location Code") THEN;
                  "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
                END;
                
                UpdateShipToAddress;
                   */

                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

            end;
        }
        field(86; TotalAmount; Decimal)
        {
            CalcFormula = sum("Store Requistion Line"."Line Amount" where("Requistion No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(87; "Issuing Store"; Code[10])
        {
            TableRelation = Location;

            trigger OnValidate()
            begin

                ReqLines.Reset;
                ReqLines.SetRange(ReqLines."Requistion No", "No.");
                if ReqLines.Find('-') then begin
                    repeat
                        ReqLines."Issuing Store" := "Issuing Store";
                    until ReqLines.Next = 0;
                end;
            end;
        }
        field(88; "Job No"; Code[20])
        {
            TableRelation = "HR Employee Qualifications"."Employee No.";
        }
        field(89; "Posting Date"; Date)
        {
        }
        field(90; "Document Type"; Option)
        {
            OptionCaption = 'PR,SR,MEMO,ASSET';
            OptionMembers = PR,SR,MEMO,ASSET;
        }
        field(91; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(481; "Employee Code"; Code[20])
        {
            Editable = false;
            //TableRelation = "HR Employees"."No.";
            // trigger OnValidate()
            // var
            //     myInt: Integer;
            //     HrEmployee: Record "HR Employees";
            // begin
            //     HrEmployee.Reset();
            //     HrEmployee.SetRange("No.", rec."Employee Code");
            //     if HrEmployee.FindFirst() then
            //         rec."Employee Name" := HrEmployee."Full Name";

            // end;
        }
        field(482; "Employee Name"; Text[100])
        {
            Editable = false;
        }
        field(483; Received; Boolean)
        {
            Editable = false;
        }
        field(484; "Received By"; Code[80])
        {
            Editable = false;
        }
        field(485; "Received Date"; Date)
        {
            Editable = false;
        }
        field(486; "Invoice No"; Code[50])
        {
        }
        field(487; "Order No"; Code[50])
        {
        }
        field(488; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vend.Get("Vendor No.") then begin
                    "Vendor Name" := Vend.Name
                end
                else
                    "Vendor Name" := '-';
            end;
        }
        field(489; "Vendor Name"; Text[100])
        {
        }
        field(490; "Purchasing Store"; Code[20])
        {
            TableRelation = Location;
        }
        field(491; "Date Received"; Date)
        {
        }
        field(492; Rejected; Boolean)
        {
            Editable = false;
        }
        field(493; "Rejected By"; Code[80])
        {
            Editable = false;
        }
        field(494; "Rejected Date"; Date)
        {
            Editable = false;
        }
        field(495; "Purchase Order No"; Code[50])
        {
            Caption = 'PO No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*
                PurchH.RESET;
                PurchH.SETRANGE(PurchH.IFMIS_No,"Purchase Order No");
                IF PurchH.FIND('-') THEN
                   BEGIN
                   REPEAT
                  "Vendor Name":=PurchH."Supplier Name";
                   Currency:=PurchH.Currency;
                   "Order Date":=PurchH.Date;
                    "Rejected PO No.":=PurchH.IFMIS_No;
                     Rec.MODIFY;
                    UNTIL PurchH.NEXT=0;
                END;
                //Insert the Asset Lines
                PurchLines.RESET;
                PurchLines.SETRANGE(PurchLines."IFMIS No","Purchase Order No");
                PurchLines.SETRANGE(PurchLines.Type,PurchLines.Type::Asset);
                IF PurchLines.FIND('-') THEN
                  BEGIN
                      REPEAT
                    SReqLines."Requistion No":="No.";
                    SReqLines.Type:=PurchLines.Type;
                    SReqLines."Asset Code":=PurchLines."Asset Code";
                    SReqLines."No.":=PurchLines."Asset No.";
                    SReqLines.Description:=PurchLines.Description;
                    SReqLines."Quantity Requested":=PurchLines.Quantity;
                    SReqLines."Unit Cost":=PurchLines.Price;
                    SReqLines."Unit of Measure":=PurchLines."Unit of Measure";
                    SReqLines."Line Amount":=PurchLines."Line Total";
                    SReqLines.LineNo:=PurchLines."Line No";
                    SReqLines.Category:=PurchLines.Category;
                    SReqLines."Account Combination":=PurchLines."Account Combination";
                    SReqLines."Req No":=PurchLines."Req No";
                    SReqLines."Quot No":=PurchLines."Quot No";
                    SReqLines."Contr. No":=PurchLines."Contr. No";
                    SReqLines.Currency:= PurchLines.Currency;
                    SReqLines."Line No.":=GetLastEntryNo;
                    SReqLines."Purchasing Store":="Purchasing Store";
                    SReqLines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    SReqLines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                    SReqLines."Supplier Name":=PurchH."Supplier Name";
                    SReqLines."Approved IFMIS No.":= "Purchase Order No";
                    SReqLines.INSERT;
                    UNTIL PurchLines.NEXT=0;
                END;
                
                
                //Insert the Item Lines
                PurchLines.RESET;
                PurchLines.SETRANGE(PurchLines."IFMIS No","Purchase Order No");
                PurchLines.SETRANGE(PurchLines.Type,PurchLines.Type::Item);
                IF PurchLines.FIND('-') THEN
                  BEGIN
                      REPEAT
                    SReqLines."Requistion No":="No.";
                    SReqLines.Type:=PurchLines.Type;
                    //SReqLines."Asset Code":=PurchLines."Asset Code";
                    SReqLines."No.":=PurchLines."Item No";
                    SReqLines.Description:=PurchLines.Description;
                    SReqLines."Quantity Requested":=PurchLines.Quantity;
                    SReqLines."Unit Cost":=PurchLines.Price;
                    SReqLines."Unit of Measure":=PurchLines."Unit of Measure";
                    SReqLines."Line Amount":=PurchLines."Line Total";
                    SReqLines.LineNo:=PurchLines."Line No";
                    SReqLines.Category:=PurchLines.Category;
                    SReqLines."Account Combination":=PurchLines."Account Combination";
                    SReqLines."Req No":=PurchLines."Req No";
                    SReqLines."Quot No":=PurchLines."Quot No";
                    SReqLines."Contr. No":=PurchLines."Contr. No";
                    SReqLines.Currency:= PurchLines.Currency;
                    SReqLines."Line No.":=GetLastEntryNo;
                    SReqLines."Purchasing Store":="Purchasing Store";
                    SReqLines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    SReqLines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                    SReqLines."Supplier Name":=PurchH."Supplier Name";
                    SReqLines."Approved IFMIS No.":= "Purchase Order No";
                     SReqLines."IFMIS Nos":= "Purchase Order No";
                    IF Item.GET(SReqLines."No.") THEN
                       SReqLines."Unit of Measure":=Item."Base Unit of Measure";
                
                    SReqLines.INSERT;
                    UNTIL PurchLines.NEXT=0;
                END;
                  */

            end;
        }
        field(496; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Approved,Pending Approval,Pending Recommendation,Cancelled,Posted,Rejected';
            OptionMembers = Open,Approved,"Pending Approval","Pending Recommendation",Cancelled,Posted,Rejected;
        }
        field(497; "Booking Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Ticket,Hotel';
            OptionMembers = Ticket,Hotel;

            trigger OnValidate()
            begin
                SReqLines.Reset;
                SReqLines.SetRange(SReqLines."Requistion No", "No.");
                if SReqLines.Find('-') then begin
                    repeat
                        SReqLines."Booking Type" := "Booking Type";
                        SReqLines.Modify;
                    until SReqLines.Next = 0;
                end;
            end;
        }
        field(498; "No of Lines"; Integer)
        {
            CalcFormula = count("Store Requistion Line" where("Requistion No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(499; Currency; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(500; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //IF "Order Date" <> 0D THEN BEGIN
                //  IF "Order Date" > TODAY THEN
                //ERROR('Order Date cannot be a future Date',"Order Date");

                //END;
            end;
        }
        field(501; "Approved IFMIS Order"; Code[50])
        {
            Caption = 'Approved PO ';
            TableRelation = "Store Requistion Line"."Requistion No" where("Request Status" = const(Released));

            trigger OnValidate()
            begin

                PurchH.Reset;
                //PurchH.SetRange(PurchH.IFMIS_No, "Approved IFMIS Order");
                if PurchH.Find('-') then begin
                    repeat
                        // "Vendor Name" := PurchH."Supplier Name";
                        // Currency := PurchH.Currency;
                        // "Order Date" := PurchH.Date;
                        Rec.Modify;
                    until PurchH.Next = 0;
                end;
            end;
        }
        field(502; "Rejected PO No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(503; Allocated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(504; "User Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;
        }
        field(505; "Date Signed"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(506; Open; Integer)
        {
            CalcFormula = count("Store Requistion Headers" where(Status = const(Open)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(507; "Pending Approval"; Integer)
        {
            CalcFormula = count("Store Requistion Headers" where(Status = const("Pending Approval")));
            FieldClass = FlowField;
        }
        field(508; Approved; Integer)
        {
            CalcFormula = count("Store Requistion Headers" where(Status = const(Released)));
            FieldClass = FlowField;
        }
        field(509; "File Movement Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Required; "No.", "Required Date", "Request Description", Status)
        {
        }
    }

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error('You Cannot DELETE an already released Requisition')
    end;

    trigger OnInsert()
    begin

        if "No." = '' then begin
            if "Document Type" = "document type"::PR then begin
                PurchSetup.Get;
                PurchSetup.TestField("Purchase Req No");
                NoSeriesMgt.InitSeries(PurchSetup."Purchase Req No", xRec."No.", 0D, "No.", "No. Series");
                //NoSeriesMgt.InitSeries(PurchSetup."File Movement Numbers", xRec."File Movement Code", 0D, "File Movement Code", "No. Series");
            end;

            if "Document Type" = "document type"::SR then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Store Requisition Nos.");
                NoSeriesMgt.InitSeries(PurchSetup."Store Requisition Nos.", xRec."No.", 0D, "No.", "No. Series");
            end;

            if "Document Type" = "document type"::MEMO then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Internal Memo Nos.");
                NoSeriesMgt.InitSeries(PurchSetup."Internal Memo Nos.", xRec."No.", 0D, "No.", "No. Series");
            end;


            if "Document Type" = "document type"::ASSET then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Asset Receiving No");
                NoSeriesMgt.InitSeries(PurchSetup."Asset Receiving No", xRec."No.", 0D, "No.", "No. Series");
            end;
        end;



        if UsersRec.Get(UserId) then begin
            Empl.Reset();
            Empl.SetRange(Empl."User ID", UsersRec."User ID");
            if Empl.Find('-') then begin
                "Employee Code" := Empl."No.";
                "Employee Name" := Empl."First Name" + ' ' + Empl."Last Name";
                "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
                "Responsibility Center" := Empl."Responsibility Center";
                "Function Name" := Empl."County Name";
                "Budget Center Name" := Empl."Department Name";
            end;
        end;
        "Request date" := Today;
        "Posting Date" := Today;
        "User ID" := UserId;
        "Requester ID" := UserId;
        "Date Received" := Today;
        "Required Date" := Today;

        /*
        IF "No." = '' THEN BEGIN
          NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series",0D,"No.","No. Series");
        END;
        //EXIT(GetNoSeriesRelCode(NoSeriesCode));
        */

        "Issuing Store" := 'MAIN';
        "Purchasing Store" := 'MAIN'

    end;

    trigger OnModify()
    begin
        //  IF Status=Status::Released THEN
        //     ERROR('You Cannot modify an already Approved Requisition');
        /*
        ReqLines.RESET;
        ReqLines.SETRANGE(ReqLines."Requistion No","No.");
        IF ReqLines.FIND('-') THEN BEGIN
        REPEAT
          ReqLines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
          ReqLines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
        //  ReqLines."dimension set id" := "dimension set id";
        UNTIL ReqLines.NEXT=0;
        END;
        */

    end;

    var
        NoSeriesMgt: Codeunit 396;
        PurchSetup: Record "Purchases & Payables Setup";
        UserDept: Record 52193632;
        RespCenter: Record 52193659;
        UserMgt: Codeunit 52193453;
        Text001: label 'Your identification is set up to process from %1 %2 only.';
        Dimval: Record 349;
        ReqLines: Record "Store Requistion Lines";
        DimMgt: Codeunit 408;
        RequisitionHeader: Record "Store Requistion Header";
        GenLedgerSetup: Record "Purchases & Payables Setup";
        UsersRec: Record "User Setup";
        Empl: Record 52193433;
        Vend: Record Vendor;
        PurchLines: Record "Attachment Lines";
        SRHeader: Record "Store Requistion Headers";
        SReqLines: Record "Store Requistion Line";
        PurchH: Record Attachments;
        fasset: Record "Fixed Asset";
        NoSeriesMgnt: Codeunit 396;
        i: Integer;
        Counter: Integer;
        NextCode: Code[100];
        Deprec: Record "FA Depreciation Book";
        Item: Record Item;
        StoreRequistionHeaders: Record "Store Requistion Headers";
        StoreRequistionLine: Record "Store Requistion Line";
        NextCodeRec: Code[100];
        InventorySetup: Record 313;
        GenJnline: Record "Item Journal Line";
        ReqLine: Record "Store Requistion Line";
        LineNo: Integer;
        GenJnlines: Record 5621;
        LineNos: Integer;
        FASetup: Record 5605;
        LineNoRec: Integer;


    procedure GetNoSeriesRelCode(NoSeriesCode: Code[20]): Code[10]
    var
        GenLedgerSetup: Record 98;
        RespCenter: Record 52193659;
        DimMgt: Codeunit 408;
        NoSrsRel: Record 310;
    begin
        //EXIT(GetNoSeriesRelCode(NoSeriesCode));
        GenLedgerSetup.Get;
        case GenLedgerSetup."Base No. Series" of
            GenLedgerSetup."base no. series"::"Responsibility Center":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Responsibility Center");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."base no. series"::"Shortcut Dimension 1":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Global Dimension 1 Code");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."base no. series"::"Shortcut Dimension 2":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 2 Code");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."base no. series"::"Shortcut Dimension 3":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 3 Code");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;

            GenLedgerSetup."base no. series"::"Shortcut Dimension 4":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 4 Code");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;
            else
                exit(NoSeriesCode);
        end;
    end;

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSeriesCode: Code[20];
    begin
        ///GenLedgerSetup.GET();
        /*
        IF "Document Type" = "Document Type"::Grant THEN
          GenLedgerSetup.TESTFIELD(GenLedgerSetup."Staff Grants Nos.")
       ELSE
       */
        GenLedgerSetup.TestField(GenLedgerSetup."Stores Requisition No");
        /*
        IF "Document Type" = "Document Type"::Grant THEN
          NoSeriesCode:=GenLedgerSetup."Staff Grants Nos."
        ELSE
        */

        NoSeriesCode := GenLedgerSetup."Stores Requisition No";

        exit(GetNoSeriesRelCode(NoSeriesCode));

    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Payments', "No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;

    local procedure GetLastEntryNo() LastLineNum: Integer
    var
        SRLines: Record "Store Requistion Line";
    begin
        SRLines.Reset;
        SRLines.SetRange(SRLines."Requistion No", "No.");
        if SRLines.Find('+') then begin
            LastLineNum := SRLines."Line No." + 1;
        end else begin
            LastLineNum := 1000;
        end;
    end;
}

