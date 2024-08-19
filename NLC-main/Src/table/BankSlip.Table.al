#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193628 "Bank Slip"
{
    DrillDownPageId = "Bank Pay In Slip List";
    LookupPageId = "Bank Pay In Slip List";
    Caption = 'Bank Slip';
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
                    NoSeriesMgt.TestManual(GenLedgerSetup."Bank Deposit No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
        }
        field(8; "From Bank Code"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
            Caption = 'From Bank Code';
            trigger OnValidate()
            begin

                BankAcc.Reset();
                if BankAcc.Get("From Bank Code") then
                    "From Account Name" := BankAcc.Name;
            end;
        }
        field(9; "Received From"; Text[100])
        {
            Caption = 'Received From';
        }
        field(13; "To Bank Code"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
            Caption = 'To Bank Code';
            trigger OnValidate()
            begin

                BankAcc.Reset();
                if BankAcc.Get("To Bank Code") then
                    "To Account Name" := BankAcc.Name;
            end;
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "From Account Name"; Text[50])
        {
            Caption = 'From Account Name';
        }
        field(16; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(17; "Date Posted"; Date)
        {
            Caption = 'Date Posted';
        }
        field(18; "Time Posted"; Time)
        {
            Caption = 'Time Posted';
        }
        field(19; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
        }
        field(20; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(21; Remarks; Text[50])
        {
            Caption = 'Remarks';
        }
        field(26; "Source Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                /*
                    IF "Bank Pay in Type"="Bank Pay in Type"::" " THEN
                     ERROR('Bank Pay in Type should NOT be blank');
                */
                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Source Dimension 1 Code");
                if DimVal.Find('-') then
                    "Source Dimension 1 Name" := DimVal.Name;

            end;
        }
        field(27; "Source Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                /*
                    IF "Bank Pay in Type"="Bank Pay in Type"::" " THEN
                     ERROR('Bank Pay in Type should NOT be blank');
                */
                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Source Dimension 2 Code");
                if DimVal.Find('-') then
                    "Source Dimension 2 Name" := DimVal.Name;

            end;
        }
        field(28; "Source Dimension 1 Name"; Text[60])
        {
            Editable = false;
            Caption = 'Source Dimension 1 Name';
        }
        field(29; "Source Dimension 2 Name"; Text[60])
        {
            Editable = false;
            Caption = 'Source Dimension 2 Name';
        }
        field(30; "Destination Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                /*
                    IF "Bank Pay in Type"="Bank Pay in Type"::" " THEN
                     ERROR('Bank Pay in Type should NOT be blank');
                */
                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Source Dimension 1 Code");
                if DimVal.Find('-') then
                    "Source Dimension 1 Name" := DimVal.Name;

            end;
        }
        field(31; "Destination Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                /*
                    IF "Bank Pay in Type"="Bank Pay in Type"::" " THEN
                     ERROR('Bank Pay in Type should NOT be blank');
                */
                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Source Dimension 2 Code");
                if DimVal.Find('-') then
                    "Source Dimension 2 Name" := DimVal.Name;

            end;
        }
        field(32; "Destination Dimension 1 Name"; Text[60])
        {
            Editable = false;
            Caption = 'Destination Dimension 1 Name';
        }
        field(33; "Destination Dimension 2 Name"; Text[60])
        {
            Editable = false;
            Caption = 'Destination Dimension 2 Name';
        }
        field(34; "To Account Name"; Text[50])
        {
            Caption = 'To Account Name';
        }
        field(35; "Pay In Bank Template Name"; Code[10])
        {
            Caption = 'Inter Bank Template Name';
            NotBlank = true;
            TableRelation = "Gen. Journal Template";
        }
        field(36; "Pay In Bank Journal Batch"; Code[10])
        {
            Caption = 'Inter Bank Journal Batch';
            NotBlank = true;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Pay In Bank Template Name"));
        }
        field(37; "Bank Pay in Type"; Option)
        {
            OptionMembers = " ",Cash,Cheque;
            Caption = 'Bank Pay in Type';
        }
        field(38; "Bank Slip No."; Code[20])
        {
            Description = 'Stores the reference of the bank pay in slip no in the database';
            Caption = 'Bank Slip No.';
        }
        field(39; "Confirmed Amount"; Decimal)
        {
            CalcFormula = sum("Bank Slip Line".Amount where(No = field(No),
                                                             Select = const(true)));
            FieldClass = FlowField;
            Caption = 'Confirmed Amount';
            Editable = false;
        }
        field(40; Status; Option)
        {
            OptionMembers = New,Confirmation,Posted;
            Caption = 'Status';
        }
        field(41; Vaulted; Boolean)
        {
            Caption = 'Vaulted';
        }
        field(42; "Return Remarks"; Text[250])
        {
            Caption = 'Return Remarks';
        }
        field(43; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(44; "Created Date"; Date)
        {
            Caption = 'Created Date';
        }
        field(45; "Created Time"; Time)
        {
            Caption = 'Created Time';
        }
        field(46; "Created Machine"; Text[100])
        {
            Caption = 'Created Machine';
        }
        field(47; "Current Source A/C Bal."; Decimal)
        {
            Caption = 'Current Source A/C Bal.';
        }
        field(48; "Register Number"; Integer)
        {
            Caption = 'Register Number';
        }
        field(49; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
        }
        field(50; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
        }
        field(51; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR 2";

        }
        field(86; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
            Caption = 'Currency Code';
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
            GenLedgerSetup.TestField(GenLedgerSetup."Bank Deposit No.");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Bank Deposit No.", xRec."No. Series", 0D, No, "No. Series");

            //get the creation details
            "Created By" := UserId;
            "Created Date" := Today;
            "Created Time" := Time;
            //    "Created Machine":=ENVIRON('COMPUTERNAME');
        end;
    end;

    var
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";
        RecPayTypes: Record "Receipts and Payment Types";
        CashierLinks: Record "Cash Office User Template";
        DimVal: Record "Dimension Value";
        TempBatch: Record "Cash Office User Template";
}
