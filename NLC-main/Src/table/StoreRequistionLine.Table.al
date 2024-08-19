#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 52193902 "Store Requistion Line"
{
    // DrillDownPageID = 50078;
    // LookupPageID = 50078;

    fields
    {
        field(1; "Requistion No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                  IF ReqHeader.GET("Requistion No") THEN BEGIN
                    IF ReqHeader."Global Dimension 1 Code"='' THEN
                       ERROR('Please Select the Global Dimension 1 Requisitioning')
                  END;
                 */

            end;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Item,Asset,Service';
            OptionMembers = Item,Asset,Service;
        }
        field(5; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(Item)) Item where(Blocked = const(false))
            else if (Type = const(Asset)) "Fixed Asset" where(Blocked = const(false));

            trigger OnValidate()
            begin

                CalcFields("Qty in store");

                //"Qty in store":=0;

                //Control: Don't Post Same Item Twice NOT GL's
                if Type = Type::Item then begin
                    RequisitionLine.Reset;
                    RequisitionLine.SetRange(RequisitionLine."Requistion No", "Requistion No");
                    RequisitionLine.SetRange(RequisitionLine."No.", "No.");
                    if RequisitionLine.Find('-') then
                        Error('You Cannot enter two lines for the same Item');
                end;

                //Control: Don't Post Same Asset Twice NOT GL's
                if Type = Type::Asset then begin
                    RequisitionLine.Reset;
                    RequisitionLine.SetRange(RequisitionLine."Requistion No", "Requistion No");
                    RequisitionLine.SetRange(RequisitionLine."No.", "No.");
                    if RequisitionLine.Find('-') then
                        Error('You Cannot enter two lines for the same Asset');
                end;



                /*
                "Action Type":="Action Type"::"Ask for Quote";
                IF Type=Type::Item THEN BEGIN
                   IF QtyStore.GET("No.") THEN
                      Description:=QtyStore.Description;
                      "Unit of Measure":=QtyStore."Base Unit of Measure";
                      "Unit Cost":=QtyStore."Unit Cost";
                      "Line Amount":="Unit Cost"*Quantity;
                      QtyStore.CALCFIELDS(QtyStore.Inventory);
                      "Qty in store":=QtyStore.Inventory;
                      "Gen. Bus. Posting Group" := GenPostGroup."Gen. Bus. Posting Group";
                      "Gen. Prod. Posting Group" := QtyStore."Gen. Prod. Posting Group";
                      END;
                 */


                case Type of
                    Type::Item:
                        begin
                            Item.Get("No.");
                            Description := Item.Description;
                            "Unit of Measure" := Item."Base Unit of Measure";
                            "Unit Cost" := Item."Last Direct Cost";
                            "Line Amount" := "Unit Cost" * "Quantity Requested";
                            //Item.CALCFIELDS(Item.Inventory);
                            //"Qty in store":=Item.Inventory;
                            "Gen. Bus. Posting Group" := GenPostGroup."Gen. Bus. Posting Group";
                            "Gen. Prod. Posting Group" := QtyStore."Gen. Prod. Posting Group";
                        end;
                end;

                /*
                 ItemLedger.RESET;
                 ItemLedger.SETRANGE(ItemLedger."Item No.","No.");
                 ItemLedger.SETRANGE(ItemLedger."Location Code","Issuing Store");
                 IF ItemLedger.FIND('-') THEN BEGIN
                 REPEAT
                 InventoryRec:=InventoryRec+ItemLedger.Quantity;
                 "Qty in store":=InventoryRec;
                 UNTIL ItemLedger.NEXT=0;
                 END;
               */

                if Type = Type::Asset then begin
                    FA.Get("No.");
                    Description := FA.Description;
                    "Unit of Measure" := 'PCS';
                end;


                /*
               IF Type=Type::Item THEN BEGIN
                  IF GLAccount.GET("No.") THEN
                     Description:=GLAccount.Name;
                END;
               */

                /*
                {Modified}
                //Validate Item
                GLAccount.GET(QtyStore."Item G/L Budget Account");
                GLAccount.CheckGLAcc;
                */


                /*
                 IF Type=Type::Asset THEN
                 BEGIN
                  RequisitionLine.RESET;
                  RequisitionLine.SETRANGE(RequisitionLine."Approved Assset Code",ReqLine."Asset Code");
                  IF RequisitionLine.FIND('-') THEN BEGIN
                      //MESSAGE(ReqLine."Asset Code");
                    // REPEAT
                   RequisitionLine.Supplier:=ReqLine."Supplier Name";
                   RequisitionLine."IFMIS Nos":=ReqLine."Approved IFMIS No.";
                    MESSAGE(RequisitionLine.Supplier);
                    // UNTIL
                     //ReqLine.NEXT=0;
                    // MESSAGE(FORMAT(ReqLine."Unit Cost"));
                     END;
                  END;
                */

            end;
        }
        field(6; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(7; "Description 2"; Text[250])
        {
            Caption = 'Description 2';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin

                "Line Amount" := "Unit Cost" * "Quantity Requested";


                if "Document Type" = "document type"::SR then begin
                    if Type = Type::Item then begin
                        if Quantity > "Quantity Requested" then
                            Error('You cannot Issue more  than what has been requested');
                        if Quantity > "Qty in store" then
                            Error('You cannot Issue more  than what is in the store');
                    end;
                end;

                /*
               IF QtyStore.GET("No.") THEN
                  QtyStore.CALCFIELDS(QtyStore.Inventory);
                  "Qty in store":=QtyStore.Inventory;
                IF "Last Quantity Issued">"Qty in store" THEN
                 ERROR('You cannot request more  than what is in the store');
                */

            end;
        }
        field(9; "Qty in store"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No.")));
            FieldClass = FlowField;
        }
        field(10; "Request Status"; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled,Posted,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted,Rejected;
        }
        field(11; "Action Type"; Option)
        {
            OptionMembers = " ",Issue,"Ask for Quote";

            trigger OnValidate()
            begin
                if Type = Type::Item then begin
                    if "Action Type" = "action type"::Issue then
                        Error('You cannot Issue a G/L Account please order for it')
                end;
                //Compare Quantity in Store and Qty to Issue
                if Type = Type::Item then begin
                    if "Action Type" = "action type"::Issue then begin
                        if "Quantity Requested" > "Qty in store" then
                            Error('You cannot Issue More than what is available in store')
                    end;
                end;
            end;
        }
        field(12; "Unit of Measure"; Code[20])
        {
            TableRelation = "Unit of Measure";
        }
        field(13; "Total Budget"; Decimal)
        {
        }
        field(14; "Current Month Budget"; Decimal)
        {
        }
        field(15; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                // IF Type=Type::Item THEN
                "Line Amount" := "Unit Cost" * "Quantity Requested";
            end;
        }
        field(16; "Line Amount"; Decimal)
        {
        }
        field(17; "Quantity Requested"; Decimal)
        {
            Caption = 'Quantity Requested';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin

                Quantity := "Quantity Requested";
                "Approved Qty" := "Quantity Requested";

                Validate(Quantity);
                "Line Amount" := "Unit Cost" * "Quantity Requested";


                if Type = Type::Item then begin
                    if ReqHeader.Get("Requistion No") then
                        if ReqHeader."Document Type" = ReqHeader."document type"::SR then begin
                            CalcFields("Qty in store");
                            if "Quantity Requested" > "Qty in store" then
                                Error('You cannot request more  than what is in the store');
                        end;
                end;
            end;
        }
        field(24; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(25; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(26; "Current Actuals Amount"; Decimal)
        {
        }
        field(27; Committed; Boolean)
        {
        }
        field(57; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(58; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(83; "Issuing Store"; Code[20])
        {
            CalcFormula = lookup("Store Requistion Headers"."Issuing Store" where("No." = field("Requistion No")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Validate("No.")
            end;
        }
        field(84; "Bin Code"; Code[20])
        {
            TableRelation = Bin.Code where("Location Code" = field("Issuing Store"));
        }
        field(85; "FA No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";
        }
        field(86; "Maintenance Code"; Code[10])
        {
            Caption = 'Maintenance Code';
            TableRelation = Maintenance;

            trigger OnValidate()
            begin
                /*
                IF "Maintenance Code" <> '' THEN
                  TESTFIELD("FA Posting Type","FA Posting Type"::Maintenance);
                */

            end;
        }
        field(87; "Last Date of Issue"; Date)
        {
        }
        field(88; "Last Quantity Issued"; Decimal)
        {
        }
        field(89; Remarks; Text[250])
        {
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
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50002; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'PR,SR';
            OptionMembers = PR,SR;
        }
        field(50003; "Quantity Inspected"; Decimal)
        {
            Caption = 'Quantity Inspected';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Quantity Delivered" = 0 then
                    Error('Kindly Enter the Quantity Delivered');

                if "Quantity Inspected" > "Quantity Delivered" then
                    Error('Quantity Inspected cannot be greater than Quantity Delivered');

                "Line Amount" := "Unit Cost" * "Quantity Inspected";
            end;
        }
        field(50004; "Balance Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39003900; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
            Editable = false;
        }
        field(39003901; "Item Status"; Option)
        {
            OptionMembers = ,Functional,Faulty;
        }
        field(39003902; "Purchasing Store"; Code[20])
        {
            TableRelation = Location;
        }
        field(39003903; "Approved Qty"; Decimal)
        {
        }
        field(39003904; "Quantity Delivered"; Decimal)
        {
            Caption = 'Quantity Delivered';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                if "Quantity Delivered" <> 0 then begin
                    if "Quantity Delivered" > "Quantity Requested" then
                        Error('Quantity to Receive cannot be greater than Quantity Requested');
                end;

                "Balance Quantity" := "Quantity Requested" - "Quantity Delivered"
            end;
        }
        field(39003905; "Procurement Plan Item No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Attachment Lines"."Asset No.";
        }
        field(39003906; "Quantity to Receive"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(39003907; "Quantity to Reject"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(39003908; "Supplier No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supplier Categories"."No. Prequalified";

            trigger OnValidate()
            begin
                if Supp.Get("Supplier No") then
                    "Supplier Name" := Supp.Name
                else
                    "Supplier Name" := ''
            end;
        }
        field(39003909; "Supplier Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39003910; "Employee No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employees"."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if Emp.Get("Employee No") then
                    "Employee Name" := Emp."Full Name"
                else
                    "Employee Name" := '';
            end;
        }
        field(39003911; "Booking Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Ticket,Hotel';
            OptionMembers = Ticket,Hotel;
        }
        field(39003912; "Destination From"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(39003913; "Destination To"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(39003914; "Purpose of Travel"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(39003915; "Departure Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39003916; "Departure Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(39003917; "Return Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39003918; "Return Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(39003919; "From Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39003920; "To Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(39003921; "Hotel Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39003922; LineNo; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39003923; Category; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39003924; "Account Combination"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39003925; "Req No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39003926; "Quot No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39003927; "Contr. No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39003928; Currency; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39003929; "IFMIS Order No"; Code[50])
        {
            CalcFormula = lookup("Store Requistion Headers"."Purchase Order No" where("No." = field("Requistion No")));
            FieldClass = FlowField;
        }
        field(39003930; "Asset Code"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Type = Type::Asset then
                    "Asset Quantity" := 1;
                CalcFields("Asset Unit Cost");
                CalcFields("Approved Quantity");
                CalcFields("Received Quanity");
                "Unit Cost" := "Asset Unit Cost";
                "Line Amount" := "Asset Quantity" * "Unit Cost";
                "Remaining Quantity" := "Approved Quantity" - "Received Quanity";
            end;
        }
        field(39003931; "Approved Assset Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Store Requistion Line"."Asset Code" where("Request Status" = const(Released),
                                                                        Type = const(Asset));

            trigger OnValidate()
            begin

                if Type = Type::Asset then
                    "Asset Quantity" := 1;
                CalcFields("Asset Unit Cost");
                CalcFields("Approved Quantity");
                CalcFields("Received Quanity");
                "Unit Cost" := "Asset Unit Cost";
                "Line Amount" := "Asset Quantity" * "Unit Cost";
                "Remaining Quantity" := "Approved Quantity" - "Received Quanity";

                /*
                Rec.SETRANGE("Asset
                Code","Approved Assset Code");
                IF Rec.FIND('-') THEN
                   "Approved IFMIS No.":="IFMIS Order No"
                  */

            end;
        }
        field(39003932; "Asset Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39003933; "Asset Unit Cost"; Decimal)
        {
            CalcFormula = lookup("Store Requistion Line"."Unit Cost" where("Asset Code" = field("Approved Assset Code"),
                                                                            "Request Status" = const(Released)));
            FieldClass = FlowField;
        }
        field(39003934; "Received Status"; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled,Posted';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted;
            TableRelation = "Store Requistion Line"."Request Status" where("Approved Assset Code" = field("Asset Code"));
        }
        field(39003935; Approved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39003936; "Approved Quantity"; Decimal)
        {
            CalcFormula = lookup("Store Requistion Line"."Quantity Requested" where("Asset Code" = field("Approved Assset Code"),
                                                                                     "Request Status" = const(Released)));
            FieldClass = FlowField;
        }
        field(39003937; "Received Quanity"; Decimal)
        {
            CalcFormula = sum("Store Requistion Line"."Asset Quantity" where("Approved Assset Code" = field("Approved Assset Code"),
                                                                              "No." = field("No."),
                                                                              "Request Status" = filter(<> Open)));
            FieldClass = FlowField;
        }
        field(39003938; "Remaining Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(39003939; "Approved IFMIS No."; Code[50])
        {
            Caption = 'Approved PO No';
        }
        field(39003940; Supplier; Text[100])
        {
            CalcFormula = lookup("Store Requistion Line"."Supplier Name" where("Approved Assset Code" = field("Asset Code")));
            FieldClass = FlowField;
        }
        field(39003941; "IFMIS Nos"; Code[50])
        {
            Caption = 'PO Nos';
            DataClassification = ToBeClassified;
        }
        field(39003942; Hotel; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Hotels;

            trigger OnValidate()
            begin
                if HotelRec.Get(Hotel) then
                    "Hotel Name" := HotelRec.Description
                else
                    "Hotel Name" := ''
            end;
        }
        field(39003943; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39003944; Test; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Requistion No", "Line No.", "Asset Code")
        {
            Clustered = true;
            SumIndexFields = "Line Amount";
        }
        key(Key2; "No.", Type)
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        /* ReqHeader.RESET;
         ReqHeader.SETRANGE(ReqHeader."No.","Requistion No");
         IF ReqHeader.FIND('-') THEN
          IF ReqHeader.Status<>ReqHeader.Status::Open THEN
              ERROR('You Cannot Delete Entries if status is not Pending')
         */

    end;

    trigger OnInsert()
    begin
        "Quantity Requested" := 1;
        "Line Amount" := "Unit Cost" * "Quantity Requested";

        ReqHeader.Reset;
        ReqHeader.SetRange(ReqHeader."No.", "Requistion No");
        if ReqHeader.Find('-') then begin
            "Shortcut Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := ReqHeader."Shortcut Dimension 2 Code";
            "Dimension Set ID" := ReqHeader."Dimension Set ID";
            "Issuing Store" := ReqHeader."Issuing Store";
            "Purchasing Store" := ReqHeader."Purchasing Store";
            "Document Type" := ReqHeader."Document Type";
            if ReqHeader.Status <> ReqHeader.Status::Open then
                Error('You Cannot Enter Entries if status is not Pending')
        end;

        if Item.Get("No.") then
            "Unit of Measure" := Item."Base Unit of Measure";

        if Type = Type::Asset then
            "Unit of Measure" := 'NO'
    end;

    trigger OnModify()
    begin
        // IF Type=Type::Item THEN
        // "Line Amount":="Unit Cost"*Quantity;
        /*
         ReqHeader.RESET;
         ReqHeader.SETRANGE(ReqHeader."No.","Requistion No");
         IF ReqHeader.FIND('-') THEN BEGIN
          //"Shortcut Dimension 1 Code":=ReqHeader."Global Dimension 1 Code";
          //"Shortcut Dimension 2 Code":=ReqHeader."Shortcut Dimension 2 Code";
        //  "Shortcut Dimension 3 Code":=ReqHeader."Shortcut Dimension 3 Code";
        //  "Shortcut Dimension 4 Code":=ReqHeader."Shortcut Dimension 4 Code";
        //  IF ReqHeader.Status<>ReqHeader.Status::Open THEN
        //      ERROR('You Cannot Modify Entries if status is not Pending')
         END;
         */

    end;

    var
        GLAccount: Record "G/L Account";
        GenLedSetup: Record 98;
        QtyStore: Record Item;
        GenPostGroup: Record 252;
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "Store Requistion Headers";
        BudgetDate: Date;
        YrBudget: Decimal;
        RequisitionLine: Record "Store Requistion Line";
        Text031: label 'You cannot define item tracking on this line because it is linked to production order %1.';
        ReservePurchLine: Codeunit 99000834;
        DimMgt: Codeunit 408;
        Item: Record Item;
        FA: Record "Fixed Asset";
        ItemLedger: Record "Item Ledger Entry";
        InventoryRec: Decimal;
        Supp: Record Vendor;
        ReqLine: Record "Store Requistion Line";
        HotelRec: Record Hotels;
        Emp: Record 52193433;


    procedure OpenItemTrackingLines()
    begin
        /*
        TESTFIELD(Type,Type::Item);
        TESTFIELD("No.");
        IF "Lot No." <> '' THEN
          ERROR(Text031,"Lot No.");
        
        TESTFIELD(Quantity);
        
        ReservePurchLine.CallItemTrackingS11(Rec);
        */

    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Payment', "Line No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
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
}

