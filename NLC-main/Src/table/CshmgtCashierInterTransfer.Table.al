#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193654 "Cshmgt Cashier InterTransfer"
{
    DrillDownPageId = "Vote Transfer";
    LookupPageId = "Vote Transfer";
    Caption = 'Cshmgt Cashier InterTransfer';
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
                    NoSeriesMgt.TestManual(GenLedgerSetup."Cashier Transfer Nos");
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
            TableRelation = if ("Receiving Transfer Type" = const("Intra-Company")) "Bank Account"
            else
            if ("Receiving Transfer Type" = const("Inter-Company")) "IC Partner";
            Caption = 'Receiving Account';
            trigger OnValidate()
            begin

                if "Receiving Transfer Type" = "Receiving Transfer Type"::"Intra-Company" then begin
                    BankAcc.Reset();
                    if BankAcc.Get("Receiving Account") then begin
                        "Receiving Bank Account Name" := BankAcc.Name;
                        "Currency Code Destination" := BankAcc."Currency Code";
                    end;
                end
                else
                    if "Receiving Transfer Type" = "Receiving Transfer Type"::"Inter-Company" then begin
                        ICPartner.Reset();
                        if ICPartner.Get("Receiving Account") then begin
                            "Receiving Bank Account Name" := ICPartner.Name;
                            "Currency Code Destination" := ICPartner."Currency Code";
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
        field(13; "Posted By"; Code[20])
        {
            Caption = 'Posted By';
        }
        field(14; Remarks; Text[250])
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
                "Amount 2" := Amount;
            end;
        }
        field(17; "Paying Account"; Code[20])
        {
            TableRelation = if ("Source Transfer Type" = const("Intra-Company")) "Bank Account"
            else
            if ("Source Transfer Type" = const("Inter-Company")) "IC Partner";
            Caption = 'Paying Account';
            trigger OnValidate()
            begin

                if "Source Transfer Type" = "Source Transfer Type"::"Intra-Company" then begin
                    BankAcc.Reset();
                    if BankAcc.Get("Paying Account") then begin
                        "Paying  Bank Account Name" := BankAcc.Name;
                        "Currency Code Source" := BankAcc."Currency Code";
                    end;
                end
                else
                    if "Source Transfer Type" = "Source Transfer Type"::"Inter-Company" then begin
                        ICPartner.Reset();
                        if ICPartner.Get("Paying Account") then begin
                            "Paying  Bank Account Name" := ICPartner.Name;
                            "Currency Code Source" := ICPartner."Currency Code";
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
                    "Source Depot Name" := DimVal.Name;
                "Receiving Depot Code" := "Source Depot Code";
                Validate("Receiving Depot Code");
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
                    "Receiving Depot Name" := DimVal.Name;
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
        }
        field(35; "Currency Code Source"; Code[20])
        {
            Editable = false;
            TableRelation = Currency;
            Caption = 'Currency Code Source';
        }
        field(36; "Amount 2"; Decimal)
        {
            Caption = 'Amount 2';
        }
        field(37; "Exch. Rate Source"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 5 : 5;
            MinValue = 0;
            Caption = 'Exch. Rate Source';
            trigger OnValidate()
            begin
                "Reciprical 1" := 1 / "Exch. Rate Source";
            end;
        }
        field(38; "Exch. Rate Destination"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            MinValue = 0;
            Caption = 'Exch. Rate Destination';
            trigger OnValidate()
            begin
                "Reciprical 2" := 1 / "Exch. Rate Destination";
            end;
        }
        field(39; "Reciprical 1"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;
            Caption = 'Reciprical 1';
        }
        field(40; "Reciprical 2"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;
            Caption = 'Reciprical 2';
        }
        field(41; "Balance 1"; Decimal)
        {
            Caption = 'Balance 1';
        }
        field(42; "Balance 2"; Decimal)
        {
            Caption = 'Balance 2';
        }
        field(43; "Recipient Account"; Code[20])
        {
            TableRelation = "Bank Account"."No." where("Bank Type" = const(Cash));
            Caption = 'Recipient Account';
            trigger OnValidate()
            begin
                BankAcc.Reset();
                BankAcc.Get("Recipient Account");
                "Recipient Name" := BankAcc.Name;
            end;
        }
        field(44; "Recipient Name"; Text[60])
        {
            Caption = 'Recipient Name';
        }
        field(45; "Created By"; Code[20])
        {
            Caption = 'Created By';
        }
        field(46; "Created Date Time"; DateTime)
        {
            Caption = 'Created Date Time';
        }
        field(47; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
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
            GenLedgerSetup.TestField(GenLedgerSetup."Cashier Transfer Nos");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Cashier Transfer Nos", xRec."No. Series", Today, No, "No. Series");
        end;

        "Receiving Account" := GenLedgerSetup."Interim Transfer Account";
        Validate("Receiving Account");
        //get the user's default account
        CTemp.Reset();
        CTemp.SetRange(CTemp.UserID, UserId);
        if CTemp.FindFirst() then begin
            "Paying Account" := CTemp."Default Receipts Bank";
            Validate("Paying Account");
        end;

        //save the details of the creation of the record in the database
        "Created By" := UserId;
        "Created Date Time" := CreateDateTime(Today, Time);
    end;

    var
        GenLedgerSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BankAcc: Record "Bank Account";
        ICPartner: Record "IC Partner";
        DimVal: Record "Dimension Value";
        CTemp: Record "Cash Office User Template";
}
