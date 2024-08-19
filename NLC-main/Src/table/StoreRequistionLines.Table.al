#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193615 "Store Requistion Lines"
{
    DrillDownPageId = "Store Requisition Line";
    LookupPageId = "Store Requisition Line";
    Caption = 'Store Requistion Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Requistion No"; Code[20])
        {
            Caption = 'Requistion No';

        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Item,Asset';
            OptionMembers = Item,Asset;
        }
        field(5; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(Item)) Item where(Blocked = const(false))
            else
            if (Type = const(Asset)) "Fixed Asset" where(Blocked = const(false));

            trigger OnValidate()
            begin

                //Control: Don't Post Same Item Twice NOT GL's
                if Type = Type::Item then begin
                    RequisitionLine.Reset();
                    RequisitionLine.SetRange(RequisitionLine."Requistion No", "Requistion No");
                    RequisitionLine.SetRange(RequisitionLine."No.", "No.");
                    if RequisitionLine.Find('-') then
                        Error('You Cannot enter two lines for the same Item');
                end;
                //

                "Action Type" := "Action Type"::"Ask for Quote";

                /*
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
                            "Unit Cost" := Item."Unit Cost";
                            "Line Amount" := "Unit Cost" * Quantity;
                            Item.CalcFields(Item.Inventory);
                            "Qty in store" := Item.Inventory;
                            "Gen. Bus. Posting Group" := GenPostGroup."Gen. Bus. Posting Group";
                            "Gen. Prod. Posting Group" := QtyStore."Gen. Prod. Posting Group";
                        end;
                    Type::Asset:
                        begin
                            FA.Get("No.");
                            Description := FA.Description;
                            "Unit of Measure" := 'PCS';
                        end;
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

            end;
        }
        field(6; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(7; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin

                if Type = Type::Item then
                    "Line Amount" := "Unit Cost" * Quantity;

                if QtyStore.Get("No.") then
                    QtyStore.CalcFields(QtyStore.Inventory);
                "Qty in store" := QtyStore.Inventory;

                if "Last Quantity Issued" > "Qty in store" then
                    Error('You cannot request more  than what is in the store');
            end;
        }
        field(9; "Qty in store"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Qty in store';
        }
        field(10; "Request Status"; Option)
        {
            CalcFormula = lookup("Store Requistion Header".Status where("No." = field("Requistion No")));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled,Posted';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted;
            Caption = 'Request Status';
        }
        field(11; "Action Type"; Option)
        {
            OptionMembers = " ",Issue,"Ask for Quote";
            Caption = 'Action Type';
            trigger OnValidate()
            begin
                if Type = Type::Item then
                    if "Action Type" = "Action Type"::Issue then
                        Error('You cannot Issue a G/L Account please order for it');
                //Compare Quantity in Store and Qty to Issue
                if Type = Type::Item then
                    if "Action Type" = "Action Type"::Issue then
                        if Quantity > "Qty in store" then
                            Error('You cannot Issue More than what is available in store');
            end;
        }
        field(12; "Unit of Measure"; Code[20])
        {
            TableRelation = "Unit of Measure";
            Caption = 'Unit of Measure';
        }
        field(13; "Total Budget"; Decimal)
        {
            Caption = 'Total Budget';
        }
        field(14; "Current Month Budget"; Decimal)
        {
            Caption = 'Current Month Budget';
        }
        field(15; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            trigger OnValidate()
            begin
                // IF Type=Type::Item THEN
                "Line Amount" := "Unit Cost" * Quantity;
            end;
        }
        field(16; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
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
                "Line Amount" := "Unit Cost" * Quantity;

                if ReqHeader.Get("Requistion No") then
                    if ReqHeader."Document Type" = ReqHeader."Document Type"::SR then
                        if "Quantity Requested" > "Qty in store" then
                            Error('You cannot request more  than what is in the store');
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
            Caption = 'Current Actuals Amount';
        }
        field(27; Committed; Boolean)
        {
            Caption = 'Committed';
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
            TableRelation = Location;
            Caption = 'Issuing Store';
        }
        field(84; "Bin Code"; Code[20])
        {
            TableRelation = Bin.Code where("Location Code" = field("Issuing Store"));
            Caption = 'Bin Code';
        }
        field(85; "FA No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";
            Caption = 'FA No.';
        }
        field(86; "Maintenance Code"; Code[10])
        {
            Caption = 'Maintenance Code';
            TableRelation = Maintenance;

        }
        field(87; "Last Date of Issue"; Date)
        {
            Caption = 'Last Date of Issue';
        }
        field(88; "Last Quantity Issued"; Decimal)
        {
            Caption = 'Last Quantity Issued';
        }
        field(89; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions();
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
        field(39003900; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
            Editable = false;
        }
        field(39003901; "Item Status"; Option)
        {
            OptionMembers = ,Functional,Faulty;
            Caption = 'Item Status';
        }
        field(39003902; "Purchasing Store"; Code[20])
        {
            TableRelation = Location;
            Caption = 'Purchasing Store';
        }
        field(39003903; "Approved Qty"; Decimal)
        {
            Caption = 'Approved Qty';
        }
    }

    keys
    {
        key(Key1; "Requistion No", "Line No.")
        {
            Clustered = true;
            SumIndexFields = "Line Amount";
        }
        key(Key2; "No.", Type)
        {
            SumIndexFields = Quantity;
        }

    }

    fieldgroups { }


    trigger OnInsert()
    begin
        "Line Amount" := "Unit Cost" * Quantity;

        ReqHeader.Reset();
        ReqHeader.SetRange(ReqHeader."No.", "Requistion No");
        if ReqHeader.Find('-') then begin
            "Shortcut Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := ReqHeader."Shortcut Dimension 2 Code";
            "Dimension Set ID" := ReqHeader."Dimension Set ID";
            "Issuing Store" := ReqHeader."Issuing Store";
            "Purchasing Store" := ReqHeader."Purchasing Store";
            if ReqHeader.Status <> ReqHeader.Status::Open then
                Error('You Cannot Enter Entries if status is not Pending')
        end;
    end;

    trigger OnModify()
    begin
        if Type = Type::Item then
            "Line Amount" := "Unit Cost" * Quantity;
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
        GenLedSetup: Record "General Ledger Setup";
        QtyStore: Record Item;
        GenPostGroup: Record "General Posting Setup";
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "Store Requistion Header";
        BudgetDate: Date;
        YrBudget: Decimal;
        RequisitionLine: Record "Store Requistion Lines";
        Text031: Label 'You cannot define item tracking on this line because it is linked to production order %1.';
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
        DimMgt: Codeunit DimensionManagement;
        Item: Record Item;
        FA: Record "Fixed Asset";


    procedure OpenItemTrackingLines()
    begin
        TestField(Type, Type::Item);
        TestField("No.");
        if "Lot No." <> '' then
            Error(Text031, "Lot No.");

        TestField(Quantity);

        //ReservePurchLine.CallItemTrackingS11(Rec);
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

