#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193635 "Receipts Header"
{
    DrillDownPageId = "Receipts List";
    LookupPageId = "Receipts List";
    Caption = 'Receipts Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Description = 'Stores the code of the receipt in the database';
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Receipts No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Date; Date)
        {
            Description = 'Stores the date when the receipt was entered into the system';
            Caption = 'Date';
        }
        field(3; Cashier; Code[50])
        {
            Description = 'Stores the user id of the cashier';
            Caption = 'Cashier';
        }
        field(4; "Date Posted"; Date)
        {
            Caption = 'Date Posted';
        }
        field(5; "Time Posted"; Time)
        {
            Caption = 'Time Posted';
        }
        field(6; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account"."No." where("Responsibility Center" = field("Responsibility Center"),
                                                        "Currency Code" = field("Currency Code"));
            Caption = 'Bank Code';
            trigger OnValidate()
            begin
                if PayLinesExist() then
                    Error('You first need to delete the existing Receipt lines before changing the Currency Code'
                    );
                if bank.Get("Bank Code") then
                    "Bank Name" := bank.Name;
            end;
        }
        field(9; "Received From"; Text[100])
        {
            Caption = 'Received From';
        }
        field(10; "On Behalf Of"; Text[100])
        {
            Caption = 'On Behalf Of';
        }
        field(11; "Amount Recieved"; Decimal)
        {
            Caption = 'Amount Recieved';
        }
        field(26; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");

                DimVal.Reset();
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Global Dimension 1 Code");
                if DimVal.Find('-') then
                    Dim1 := DimVal.Name
            end;
        }
        field(27; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");

                DimVal.Reset();
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 2 Code");
                if DimVal.Find('-') then
                    Dim2 := DimVal.Name
            end;
        }
        field(29; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if PayLinesExist() then
                    Error('You first need to delete the existing Receipt lines before changing the Currency Code'
                    )
                else
                    "Bank Code" := '';
            end;
        }
        field(30; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(38; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Receipt Line"."Total Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Amount';
        }
        field(39; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
        }
        field(40; "Print No."; Integer)
        {
            Caption = 'Print No.';
        }
        field(41; Status; Option)
        {
            OptionMembers = " ",Normal,"Post Dated",Posted,Partial,"Pending Approval",Approved,Cancelled;
            Caption = 'Status';
        }
        field(42; "Cheque No."; Code[20])
        {
            Caption = 'Cheque No.';
        }
        field(43; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
        }
        field(44; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(45; "Created Date Time"; DateTime)
        {
            Caption = 'Created Date Time';
        }
        field(46; "Register No."; Integer)
        {
            Caption = 'Register No.';
        }
        field(47; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
        }
        field(48; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
        }
        field(49; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(81; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR 2";

            trigger OnValidate()
            begin
                if PayLinesExist() then
                    Error('You first need to delete the existing Receipt lines before changing the Currency Code'
                    )
                else
                    "Bank Code" := '';


                TestField(Status, Status::" ");
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
        field(83; "Shortcut Dimension 3 Code"; Code[20])
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
                DimVal.Reset();
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 3 Code");
                if DimVal.Find('-') then
                    Dim3 := DimVal.Name
            end;
        }
        field(84; "Shortcut Dimension 4 Code"; Code[20])
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
                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 4 Code");
                if DimVal.Find('-') then
                    Dim4 := DimVal.Name
            end;
        }
        field(86; Dim3; Text[250])
        {
            Caption = 'Dim3';
        }
        field(87; Dim4; Text[250])
        {
            Caption = 'Dim4';
        }
        field(88; "Bank Name"; Text[250])
        {
            Caption = 'Bank Name';
        }
        field(89; "Receipt Type"; Option)
        {
            OptionCaption = 'Bank,Cash';
            OptionMembers = Bank,Cash;
            Caption = 'Receipt Type';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions()
            end;
        }
        field(481; Dim1; Text[250])
        {
            Caption = 'Dim1';
        }
        field(482; Dim2; Text[250])
        {
            Caption = 'Dim2';
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
        Error('You Cannot Delete this record');
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            GenLedgerSetup.Get();
            TestNoSeries();
            NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."No. Series", 0D, "No.", "No. Series");
            //NoSeriesMgt.InitSeries(GenLedgerSetup."Receipts No",xRec."No. Series",0D,"No.","No. Series");
        end;

        UserTemplate.Reset();
        UserTemplate.SetRange(UserTemplate.UserID, UserId);
        if UserTemplate.FindFirst() then
            //"Bank Code":=UserTemplate."Default Receipts Bank";
            //VALIDATE("Bank Code");
            Cashier := UserId;
        //*****************************JACK**************************//
        "Created By" := UserId;
        "Created Date Time" := CreateDateTime(Today, Time);
        //*****************************END***************************//
    end;

    trigger OnModify()
    begin
        RLine.Reset();
        RLine.SetRange(RLine.No, "No.");
        if RLine.FindFirst() then
            repeat
                RLine."Global Dimension 1 Code" := "Global Dimension 1 Code";
                RLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                RLine."Dimension Set ID" := "Dimension Set ID";
                RLine.Modify();
            until RLine.Next() = 0;
    end;

    var
        GenLedgerSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserTemplate: Record "Cash Office User Template";
        RLine: Record "Receipt Line";
        RespCenter: Record "Responsibility Center BR 2";
        UserMgt: Codeunit "User Setup Management BR";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        DimVal: Record "Dimension Value";
        bank: Record "Bank Account";
        DimMgt: Codeunit DimensionManagement;


    procedure PayLinesExist(): Boolean
    begin
        RLine.Reset();
        RLine.SetRange(RLine.No, "No.");
        exit(RLine.FindFirst());
    end;

    local procedure TestNoSeries(): Boolean
    begin
        if "Receipt Type" = "Receipt Type"::Bank then
            GenLedgerSetup.TestField(GenLedgerSetup."Receipts No")
        else
            GenLedgerSetup.TestField(GenLedgerSetup."Cash Receipt Nos")
    end;

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSrsRel: Record "No. Series Relationship";
        NoSeriesCode: Code[20];
    begin
        if "Receipt Type" = "Receipt Type"::Bank then
            NoSeriesCode := GenLedgerSetup."Receipts No"
        else
            NoSeriesCode := GenLedgerSetup."Cash Receipt Nos";

        exit(GetNoSeriesRelCode(NoSeriesCode));
        /*
        NoSrsRel.SETRANGE(NoSrsRel.Code,NoSeriesCode);
        NoSrsRel.SETRANGE(NoSrsRel."Responsibility Center","Responsibility Center");

        IF NoSrsRel.FINDFIRST THEN
        EXIT(NoSrsRel."Series Code")
        ELSE
        EXIT(NoSeriesCode);

        IF NoSrsRel.FINDSET THEN BEGIN
          IF PAGE.RUNMODAL(458,NoSrsRel,NoSrsRel."Series Code") = ACTION::LookupOK THEN
          EXIT(NoSrsRel."Series Code")
        END
        ELSE
        EXIT(NoSeriesCode);
        */

    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Receipt', "No."));
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
}
