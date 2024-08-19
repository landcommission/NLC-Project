#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193614 "Store Requistion Header"
{
    DrillDownPageId = "Store Requisitions List";
    LookupPageId = "Store Requisitions List";
    Caption = 'Store Requistion Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            NotBlank = false;
            Caption = 'No.';
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
            Caption = 'Request date';
            trigger OnValidate()
            begin
                if "Request date" < Today then
                    Error('Required date should be furturistic');
            end;
        }
        field(5; "Required Date"; Date)
        {
            Caption = 'Required Date';
        }
        field(6; "Requester ID"; Code[50])
        {
            Caption = 'Requester ID';
            Editable = false;

        }
        field(7; "Request Description"; Text[150])
        {
            Caption = 'Request Description';
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled,Posted';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted;
            Caption = 'Status';
        }
        field(11; Supplier; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'Supplier';
        }
        field(12; "Action Type"; Option)
        {
            OptionCaption = 'Item,Asset';
            OptionMembers = Item,Asset;
            Caption = 'Action Type';

        }
        field(29; Justification; Text[250])
        {
            Caption = 'Justification';
        }
        field(30; "User ID"; Code[50])
        {
            Caption = 'User ID';
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
                Dimval.Reset();
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
                Dimval.Reset();
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
            Caption = 'Function Name';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
            Caption = 'Budget Center Name';
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
                Dimval.Reset();
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
                Dimval.Reset();
                //Dimval.SETRANGE(Dimval."Global Dimension No.",4);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 4 Code");
                if Dimval.Find('-') then
                    Dim4 := Dimval.Name;

                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(83; Dim3; Text[250])
        {
            Caption = 'Dim3';
        }
        field(84; Dim4; Text[250])
        {
            Caption = 'Dim4';
        }
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR 2";

            trigger OnValidate()
            begin

                TestField(Status, Status::Open);
                if not UserMgt.CheckRespCenter(1, "Responsibility Center") then
                    Error(
                      Text001,
                      RespCenter.TableCaption, UserMgt.GetPurchasesFilter());
                /*
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
            CalcFormula = sum("Store Requistion Lines"."Line Amount" where("Requistion No" = field("No.")));
            FieldClass = FlowField;
            Caption = 'TotalAmount';
            Editable = false;
        }
        field(87; "Issuing Store"; Code[10])
        {
            TableRelation = Location;
            Caption = 'Issuing Store';
            trigger OnValidate()
            begin

                ReqLines.Reset();
                ReqLines.SetRange(ReqLines."Requistion No", "No.");
                if ReqLines.Find('-') then
                    repeat
                        ReqLines."Issuing Store" := "Issuing Store";
                    until ReqLines.Next() = 0;
            end;
        }
        field(88; "Job No"; Code[20])
        {
            TableRelation = "HR Employee Qualifications"."Employee No.";
            Caption = 'Job No';
        }
        field(89; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(90; "Document Type"; Option)
        {
            OptionCaption = 'PR,SR';
            OptionMembers = PR,SR;
            Caption = 'Document Type';
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
                ShowDimensions();
            end;
        }
        field(481; "Employee Code"; Code[20])
        {
            Editable = false;
            Caption = 'Employee Code';
        }
        field(482; "Employee Name"; Text[100])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(483; Received; Boolean)
        {
            Editable = false;
            Caption = 'Received';
        }
        field(484; "Received By"; Code[80])
        {
            Editable = false;
            Caption = 'Received By';
        }
        field(485; "Received Date"; Date)
        {
            Editable = false;
            Caption = 'Received Date';
        }
        field(486; "Invoice No"; Code[50])
        {
            Caption = 'Invoice No';
        }
        field(487; "Order No"; Code[50])
        {
            Caption = 'Order No';
        }
        field(488; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'Vendor No.';
            trigger OnValidate()
            begin
                if Vend.Get("Vendor No.") then
                    "Vendor Name" := Vend.Name
                else
                    "Vendor Name" := '-';
            end;
        }
        field(489; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(490; "Purchasing Store"; Code[20])
        {
            TableRelation = Location;
            Caption = 'Purchasing Store';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error('You Cannot DELETE an already released Requisition')
    end;

    trigger OnInsert()
    begin

        if "No." = '' then begin
            if "Document Type" = "Document Type"::PR then begin
                PurchSetup.Get();
                PurchSetup.TestField("Purchase Req No");
                NoSeriesMgt.InitSeries(PurchSetup."Purchase Req No", xRec."No.", 0D, "No.", "No. Series");
                //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
            end;

            if "Document Type" = "Document Type"::SR then begin
                PurchSetup.Get();
                PurchSetup.TestField(PurchSetup."Store Requisition Nos.");
                NoSeriesMgt.InitSeries(PurchSetup."Store Requisition Nos.", xRec."No.", 0D, "No.", "No. Series");
            end;
        end;

        if UsersRec.Get(UserId) then begin
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
        "Request date" := Today;
        "Posting Date" := Today;
        "User ID" := UserId;
        "Requester ID" := UserId;

        /*
        IF "No." = '' THEN BEGIN
          NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series",0D,"No.","No. Series");
        END;
        //EXIT(GetNoSeriesRelCode(NoSeriesCode));
        */

    end;


    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PurchSetup: Record "Purchases & Payables Setup";
        UserDept: Record "Imprest Surrender Details";
        RespCenter: Record "Responsibility Center BR 2";
        UserMgt: Codeunit "User Setup Management BR";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        Dimval: Record "Dimension Value";
        ReqLines: Record "Store Requistion Lines";
        DimMgt: Codeunit DimensionManagement;
        RequisitionHeader: Record "Store Requistion Header";
        GenLedgerSetup: Record "Purchases & Payables Setup";
        UsersRec: Record "User Setup";
        Empl: Record "HR Employees";
        Vend: Record Vendor;


    procedure GetNoSeriesRelCode(NoSeriesCode: Code[20]): Code[10]
    var
        GenLedgerSetup: Record "General Ledger Setup";
        RespCenter: Record "Responsibility Center BR 2";
        DimMgt: Codeunit DimensionManagement;
        NoSrsRel: Record "No. Series Relationship";
    begin
        //EXIT(GetNoSeriesRelCode(NoSeriesCode));
        GenLedgerSetup.Get();
        case GenLedgerSetup."Base No. Series" of
            GenLedgerSetup."Base No. Series"::"Responsibility Center":
                begin
                    NoSrsRel.Reset();
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Responsibility Center");
                    if NoSrsRel.FindFirst() then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."Base No. Series"::"Shortcut Dimension 1":
                begin
                    NoSrsRel.Reset();
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Global Dimension 1 Code");
                    if NoSrsRel.FindFirst() then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."Base No. Series"::"Shortcut Dimension 2":
                begin
                    NoSrsRel.Reset();
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 2 Code");
                    if NoSrsRel.FindFirst() then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."Base No. Series"::"Shortcut Dimension 3":
                begin
                    NoSrsRel.Reset();
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 3 Code");
                    if NoSrsRel.FindFirst() then
                        exit(NoSrsRel."Series Code")
                end;

            GenLedgerSetup."Base No. Series"::"Shortcut Dimension 4":
                begin
                    NoSrsRel.Reset();
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 4 Code");
                    if NoSrsRel.FindFirst() then
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
}
