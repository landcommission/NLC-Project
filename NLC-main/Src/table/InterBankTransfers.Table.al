#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193627 "InterBank Transfers"
{
    DrillDownPageId = "InterBank Transfers List";
    LookupPageId = "InterBank Transfers List";
    Caption = 'InterBank Transfers';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."InterBank Transfer No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 1","Custom 2","Custom 3","Custom 4","Custom 5";
            Caption = 'Pay Mode';
        }
        field(5; "Receiving Account"; Code[20])
        {
            TableRelation = if ("Receiving Transfer Type" = const("Intra-Company")) "Bank Account" where("Responsibility Center" = field("Reciept Responsibility Center"))
            else
            if ("Receiving Transfer Type" = const("Inter-Company")) "IC Partner";
            Caption = 'Receiving Account';
            trigger OnValidate()
            begin
                "Amount 2" := 0;
                "Exch. Rate Destination" := 0;
                "Request Amt LCY" := 0;
                "Reciprical 2" := 0;
                Remarks := '';
                "Receiving Bank Account Name" := '';

                if "Receiving Transfer Type" = "Receiving Transfer Type"::"Intra-Company" then begin
                    BankAcc.Reset();
                    if BankAcc.Get("Receiving Account") then begin
                        "Receiving Bank Account Name" := BankAcc.Name;
                        "Currency Code Destination" := BankAcc."Currency Code";
                        //******
                        //Added to Validate "Currency Code Destination" and Insert "Exchange Rate Destination Amount"
                        //from the "Currency Exchange Rates Table"
                        Validate("Currency Code Destination");
                        //*********
                    end;
                end
                else
                    if "Receiving Transfer Type" = "Receiving Transfer Type"::"Inter-Company" then begin
                        ICPartner.Reset();
                        if ICPartner.Get("Receiving Account") then begin
                            "Receiving Bank Account Name" := ICPartner.Name;
                            "Currency Code Destination" := ICPartner."Currency Code";

                            //******
                            //Added to Validate "Currency Code Destination" and Insert "Exchange Rate Destination Amount"
                            //from the "Currency Exchange Rates Table"
                            Validate("Currency Code Destination");
                            //*****

                        end;
                    end;
            end;
        }
        field(6; "Received From"; Text[100])
        {
            Caption = 'Received From';
        }
        field(8; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(9; "Receiving Bank Account Name"; Text[150])
        {
            Caption = 'Receiving Bank Account Name';
        }
        field(10; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(11; "Date Posted"; Date)
        {
            Caption = 'Date Posted';
        }
        field(12; "Time Posted"; Time)
        {
            Caption = 'Time Posted';
        }
        field(13; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
        }
        field(14; Remarks; Text[50])
        {
            Caption = 'Remarks';
        }
        field(15; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
        }
        field(16; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin
                /*---denno comments IF "Currency Code Source"='' THEN
                    "Pay Amt LCY":=Amount;

                IF "Exch. Rate Source"<>0 THEN
                    VALIDATE("Exch. Rate Source");
                ----------denno*/
                //*****
                Validate("Currency Code Source");
                //*****

            end;
        }
        field(17; "Paying Account"; Code[20])
        {
            TableRelation = if ("Source Transfer Type" = const("Intra-Company")) "Bank Account" where("Responsibility Center" = field("Sending Responsibility Center"))
            else
            if ("Source Transfer Type" = const("Inter-Company")) "IC Partner";
            Caption = 'Paying Account';
            trigger OnValidate()
            begin
                Amount := 0;
                "Exch. Rate Source" := 0;
                "Reciprical 1" := 0;
                "Exch. Rate Source" := 0;
                "Pay Amt LCY" := 0;
                "Paying  Bank Account Name" := '';

                if "Source Transfer Type" = "Source Transfer Type"::"Intra-Company" then begin
                    BankAcc.Reset();
                    if BankAcc.Get("Paying Account") then begin
                        "Paying  Bank Account Name" := BankAcc.Name;
                        "Currency Code Source" := BankAcc."Currency Code";
                        //******
                        //Added to Validate "Currency Code Source" and Insert "Exchange Rate Destination Amount"
                        //from the "Currency Exchange Rates Table" if exchange rate is not LCY
                        Validate("Currency Code Source");
                        //*****

                    end;
                end
                else
                    if "Source Transfer Type" = "Source Transfer Type"::"Inter-Company" then begin
                        ICPartner.Reset();
                        if ICPartner.Get("Paying Account") then begin
                            "Paying  Bank Account Name" := ICPartner.Name;
                            "Currency Code Source" := ICPartner."Currency Code";
                            //******
                            //Added to Validate "Currency Code Source" and Insert "Exchange Rate Destination Amount"
                            //from the "Currency Exchange Rates Table" if exchange rate is not LCY
                            Validate("Currency Code Source");
                            //*****

                        end;
                    end;
            end;
        }
        field(19; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
            Caption = 'Bank Type';
        }
        field(20; "Source Depot Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Source Funtion Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin


                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "Source Depot Code");
                if DimVal.Find('-') then
                    "Source Depot Name" := DimVal.Name
            end;
        }
        field(21; "Source Department Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Source Budget Center Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(22; "Source Depot Name"; Text[50])
        {
            Caption = 'Source Depot Name';
        }
        field(24; "Receiving Depot Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Receiving Depot Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin

                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "Receiving Depot Code");
                if DimVal.Find('-') then
                    "Receiving Depot Name" := DimVal.Name
            end;
        }
        field(25; "Receiving Department Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Receiving Department Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(26; "Receiving Depot Name"; Text[50])
        {
            Caption = 'Receiving Depot Name';
        }
        field(27; "Receiving Department Name"; Text[50])
        {
            Caption = 'Receiving Department Name';
        }
        field(28; "Source Department Name"; Text[50])
        {
            Caption = 'Source Department Name';
        }
        field(29; "Paying  Bank Account Name"; Text[50])
        {
            Caption = 'Paying  Bank Account Name';
        }
        field(30; "Inter Bank Template Name"; Code[10])
        {
            Caption = 'Inter Bank Template Name';
            NotBlank = true;
            TableRelation = "Gen. Journal Template";
        }
        field(31; "Inter Bank Journal Batch"; Code[10])
        {
            Caption = 'Inter Bank Journal Batch';
            NotBlank = true;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Inter Bank Template Name"));
        }
        field(32; "Receiving Transfer Type"; Option)
        {
            OptionMembers = "Intra-Company","Inter-Company";
            Caption = 'Receiving Transfer Type';
        }
        field(33; "Source Transfer Type"; Option)
        {
            OptionMembers = "Intra-Company","Inter-Company";
            Caption = 'Source Transfer Type';
        }
        field(34; "Currency Code Destination"; Code[20])
        {
            Editable = false;
            TableRelation = Currency;
            Caption = 'Currency Code Destination';
            trigger OnValidate()
            begin
                //****

                if "Currency Code Destination" <> '' then begin
                    //If "Currency Code Destination" is NOT LCY
                    Currency_Exch_Rate.Reset();
                    Currency_Exch_Rate.SetRange(Currency_Exch_Rate."Currency Code", "Currency Code Destination");
                    if Currency_Exch_Rate.Find('+') then  //Find Last Currency
                    begin
                        "Exch. Rate Destination" := 1 / Currency_Exch_Rate."Relational Exch. Rate Amount";
                        "Request Amt LCY" := "Amount 2" / "Exch. Rate Destination"; //Convert to LCY
                    end else
                        Error(Text002, "Currency Code Destination");
                    //Where Text002 = Exchange Rate for Currency Code "%1" not defined in Currency Exchange Rates Setup
                end else begin
                    //If "Currency Code Destination" is LCY
                    "Exch. Rate Destination" := 1;
                    "Request Amt LCY" := "Amount 2" / "Exch. Rate Destination";
                end;

                //****
            end;
        }
        field(35; "Currency Code Source"; Code[20])
        {
            Editable = false;
            TableRelation = Currency;
            Caption = 'Currency Code Source';
            trigger OnValidate()
            begin
                //****

                if "Currency Code Source" <> '' then begin
                    //If  "Currency Code Source" is NOT LCY
                    Currency_Exch_Rate.Reset();
                    Currency_Exch_Rate.SetRange(Currency_Exch_Rate."Currency Code", "Currency Code Source");
                    if Currency_Exch_Rate.Find('+') then  //Find Last Currency
                    begin
                        "Exch. Rate Source" := 1 / Currency_Exch_Rate."Relational Exch. Rate Amount";
                        "Pay Amt LCY" := Amount / "Exch. Rate Source"; //Convert to LCY
                    end else
                        Error(Text002, "Exch. Rate Source");
                    //Where Text002 = Exchange Rate for Currency Code "%1" not defined in Currency Exchange Rates Setup
                end else begin
                    //If "Currency Code Source" is LCY
                    "Exch. Rate Source" := 1;
                    "Pay Amt LCY" := Amount / "Exch. Rate Source";
                end;

                //****
            end;
        }
        field(36; "Amount 2"; Decimal)
        {
            Caption = 'Amount 2';
            trigger OnValidate()
            begin
                /*
                IF "Currency Code Destination"='' THEN
                   "Request Amt LCY":="Amount 2";

                IF "Exch. Rate Destination"<>0 THEN
                    VALIDATE("Exch. Rate Destination");
                */

                //*****
                Validate("Currency Code Destination");
                //*****

            end;
        }
        field(37; "Exch. Rate Source"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0 : 15;
            MinValue = 0;
            Caption = 'Exch. Rate Source';
            trigger OnValidate()
            begin
                "Reciprical 1" := 1 / "Exch. Rate Source";
                Validate("Reciprical 1");
            end;
        }
        field(38; "Exch. Rate Destination"; Decimal)
        {
            DecimalPlaces = 0 : 15;
            MinValue = 0;
            Caption = 'Exch. Rate Destination';
            trigger OnValidate()
            begin
                "Reciprical 2" := 1 / "Exch. Rate Destination";
                Validate("Reciprical 2");
            end;
        }
        field(39; "Reciprical 1"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;
            Caption = 'Reciprical 1';
            trigger OnValidate()
            begin
                "Pay Amt LCY" := Round(Amount * "Reciprical 1");
            end;
        }
        field(40; "Reciprical 2"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;
            Caption = 'Reciprical 2';
            trigger OnValidate()
            begin
                "Request Amt LCY" := Round("Amount 2" * "Reciprical 2");
            end;
        }
        field(41; "Balance 1"; Decimal)
        {
            Caption = 'Balance 1';
        }
        field(42; "Balance 2"; Decimal)
        {
            Caption = 'Balance 2';
        }
        field(43; "Current Source A/C Bal."; Decimal)
        {
            Caption = 'Current Source A/C Bal.';
        }
        field(44; "Register Number"; Integer)
        {
            Caption = 'Register Number';
        }
        field(45; "From No"; Integer)
        {
            Caption = 'From No';
        }
        field(46; "To No"; Integer)
        {
            Caption = 'To No';
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                DimVal.Reset();
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 3 Code");
                if DimVal.Find('-') then
                    Dim3 := DimVal.Name
            end;
        }
        field(82; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                DimVal.Reset();
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 4 Code");
                if DimVal.Find('-') then
                    Dim4 := DimVal.Name
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
        field(85; "Shortcut Dimension 3 Code1"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                DimVal.Reset();
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 3 Code1");
                if DimVal.Find('-') then
                    Dim31 := DimVal.Name
            end;
        }
        field(86; "Shortcut Dimension 4 Code1"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                DimVal.Reset();
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 4 Code1");
                if DimVal.Find('-') then
                    Dim41 := DimVal.Name
            end;
        }
        field(87; Dim31; Text[250])
        {
            Caption = 'Dim31';
        }
        field(88; Dim41; Text[250])
        {
            Caption = 'Dim41';
        }
        field(89; "Sending Responsibility Center"; Code[10])
        {
            Caption = 'Sending Responsibility Center';
            TableRelation = "Responsibility Center BR 2";

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Posted,FALSE);
                IF NOT UserMgt.CheckRespCenter(1,"Sending Responsibility Center") THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);

                Amount:=0;"Exch. Rate Source":=0;"Reciprical 1":=0;"Exch. Rate Source":=0;"Pay Amt LCY":=0;
                "Paying  Bank Account Name":='';"Sending Resp Centre":='';
                "Paying Account" :='';"Currency Code Source":='';
                */
                if RespCenter.Get("Sending Responsibility Center") then
                    "Sending Resp Centre" := RespCenter.Name;

            end;
        }
        field(90; "Reciept Responsibility Center"; Code[10])
        {
            Caption = 'Reciept Responsibility Center';
            TableRelation = "Responsibility Center BR 2";

            trigger OnValidate()
            begin

                TestField(Posted, false);
                if not UserMgt.CheckRespCenter(1, "Sending Responsibility Center") then
                    Error(
                      Text001,
                      RespCenter.TableCaption, UserMgt.GetPurchasesFilter());

                "Amount 2" := 0;
                "Exch. Rate Destination" := 0;
                "Request Amt LCY" := 0;
                "Reciprical 2" := 0;
                Remarks := '';
                "Receiving Bank Account Name" := '';
                "Receipt Resp Centre" := '';
                "Receiving Account" := '';
                "Currency Code Destination" := '';


                if RespCenter.Get("Reciept Responsibility Center") then
                    "Receipt Resp Centre" := RespCenter.Name;
            end;
        }
        field(91; "Sending Resp Centre"; Text[60])
        {
            Editable = false;
            Caption = 'Sending Resp Centre';
        }
        field(92; "Receipt Resp Centre"; Text[60])
        {
            Editable = false;
            Caption = 'Receipt Resp Centre';
        }
        field(93; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,Posted,Cancelled,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(94; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(95; "Request Amt LCY"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
            Caption = 'Request Amt LCY';
        }
        field(96; "Pay Amt LCY"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
            Caption = 'Pay Amt LCY';
        }
        field(97; "External Doc No."; Code[20])
        {
            Caption = 'External Doc No.';
        }
        field(98; "Transfer Release Date"; Date)
        {
            Caption = 'Transfer Release Date';
        }
        field(99; "Cancelled By"; Code[50])
        {
            Caption = 'Cancelled By';
        }
        field(100; "Date Cancelled"; Date)
        {
            Caption = 'Date Cancelled';
        }
        field(101; "Time Cancelled"; Time)
        {
            Caption = 'Time Cancelled';
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
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if No = '' then begin
            GenLedgerSetup.Get();
            //GenLedgerSetup.TESTFIELD(GenLedgerSetup."InterBank Transfer No.");
            TestNoSeries();
            NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."No. Series", 0D, No, "No. Series");
            //NoSeriesMgt.InitSeries(GenLedgerSetup."InterBank Transfer No.",xRec."No. Series",0D,No,"No. Series");
        end;
    end;

    var
        GenLedgerSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TempBatch: Record "Cash Office User Template";
        BankAcc: Record "Bank Account";
        DimVal: Record "Dimension Value";
        ICPartner: Record "IC Partner";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        RespCenter: Record "Responsibility Center BR 2";
        UserMgt: Codeunit "User Setup Management BR";
        DimMgt: Codeunit DimensionManagement;
        Currency_Exch_Rate: Record "Currency Exchange Rate";
        Text002: Label 'Exchange Rate for Currency Code "%1" not defined in Currency Exchange Rates Setup';

    local procedure TestNoSeries(): Boolean
    begin
        GenLedgerSetup.TestField(GenLedgerSetup."InterBank Transfer No.");
    end;

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSrsRel: Record "No. Series Relationship";
        NoSeriesCode: Code[20];
    begin
        NoSeriesCode := GenLedgerSetup."InterBank Transfer No.";

        NoSrsRel.SetRange(NoSrsRel.Code, NoSeriesCode);
        /*
        NoSrsRel.SETRANGE(NoSrsRel."Responsibility Center","Responsibility Center");
        IF NoSrsRel.FINDFIRST THEN
        EXIT(NoSrsRel."Series Code")
        ELSE
        EXIT(NoSeriesCode);
        */
        if NoSrsRel.FindSet() then begin
            if Page.RunModal(Page::"No. Series Relationships", NoSrsRel, NoSrsRel."Series Code") = Action::LookupOK then
                exit(NoSrsRel."Series Code")
        end
        else
            exit(NoSeriesCode);

    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Interbank Transfers', No));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 3 Code", "Shortcut Dimension 4 Code");
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
