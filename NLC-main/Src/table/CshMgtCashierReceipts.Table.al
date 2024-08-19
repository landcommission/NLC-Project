#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193656 "CshMgt Cashier Receipts"
{
    DrillDownPageId = "Vote Transfer List.";
    LookupPageId = "Vote Transfer List.";
    Caption = 'CshMgt Cashier Receipts';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Transfer Code"; Code[20])
        {
            TableRelation = "Cshmgt Cashier Transfer"."Transfer Code";
            Caption = 'Transfer Code';
        }
        field(3; "Receipt Date"; Date)
        {
            Caption = 'Receipt Date';
        }
        field(4; "Receipt Time"; Time)
        {
            Caption = 'Receipt Time';
        }
        field(5; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            trigger OnValidate()
            begin
                BankAcc.Reset();
                BankAcc.Get("Account No.");
                "Account Name" := BankAcc.Name;
            end;
        }
        field(6; "Interim Account"; Code[20])
        {
            Caption = 'Interim Account';
            trigger OnValidate()
            begin
                BankAcc.Reset();
                BankAcc.Get("Interim Account");
                "Interim Name" := BankAcc.Name;
            end;
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(8; "Receipt UserID"; Code[20])
        {
            Caption = 'Receipt UserID';
        }
        field(9; "Receipt Machine"; Text[30])
        {
            Caption = 'Receipt Machine';
        }
        field(10; "Amount Transferred"; Decimal)
        {
            Caption = 'Amount Transferred';
        }
        field(11; "Source Line No."; Integer)
        {
            TableRelation = "Cshmgt Cashier Transfer"."Line No." where("To Account No." = field("Account No."),
                                                                        "Amount Receipted" = filter(= 0),
                                                                        Rejected = const(false));
            Caption = 'Source Line No.';
            trigger OnValidate()
            begin
                STransfer.Reset();
                STransfer.SetRange(STransfer."Line No.", "Source Line No.");
                if STransfer.FindFirst() then begin
                    "Transfer Code" := STransfer."Transfer Code";
                    "Source Account" := STransfer."Account No.";
                    "Interim Account" := STransfer."Interim Account";
                    Validate("Source Account");
                    //VALIDATE("Interim Account");
                    "Amount Transferred" := STransfer.Amount;
                    Amount := STransfer.Amount;
                end;
            end;
        }
        field(12; "Source Account"; Code[20])
        {
            TableRelation = "Bank Account"."No." where("Bank Type" = const(Cash));
            Caption = 'Source Account';
            trigger OnValidate()
            begin
                BankAcc.Get("Source Account");
                "Source Account Name" := BankAcc.Name;
            end;
        }
        field(13; "Account Name"; Text[60])
        {
            Caption = 'Account Name';
        }
        field(14; "Interim Name"; Text[60])
        {
            Caption = 'Interim Name';
        }
        field(15; "Source Account Name"; Text[60])
        {
            Caption = 'Source Account Name';
        }
        field(16; Remarks; Text[50])
        {
            Caption = 'Remarks';
        }
        field(17; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(18; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
        }
        field(19; "Posted Time"; Time)
        {
            Caption = 'Posted Time';
        }
        field(20; "Posted Machine"; Text[30])
        {
            Caption = 'Posted Machine';
        }
        field(21; "Posted By"; Code[20])
        {
            Caption = 'Posted By';
        }
        field(22; Rejected; Boolean)
        {
            Caption = 'Rejected';
        }
        field(23; "Rejected By"; Code[20])
        {
            Caption = 'Rejected By';
        }
        field(24; "Rejected Date"; Date)
        {
            Caption = 'Rejected Date';
        }
        field(25; "Rejected Time"; Time)
        {
            Caption = 'Rejected Time';
        }
        field(26; "Rejected Machine"; Text[30])
        {
            Caption = 'Rejected Machine';
        }
    }

    keys
    {
        key(Key1; "Line No.", "Transfer Code")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        "Receipt Date" := Today;
        "Receipt Time" := Time;
        "Receipt UserID" := UserId;

        CTemp.Reset();
        CTemp.SetRange(CTemp.UserID, UserId);
        if CTemp.FindFirst() then begin
            "Account No." := CTemp."Default Receipts Bank";
            Validate("Account No.");
        end;
    end;

    var
        STransfer: Record "Cshmgt Cashier Transfer";
        BankAcc: Record "Bank Account";
        CTemp: Record "Cash Office User Template";
}
