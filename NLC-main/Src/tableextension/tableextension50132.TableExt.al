#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50132 tableextension50132 extends "Bank Account"
{
    fields
    {

        //Unsupported feature: Code Modification on "Name(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         BankLedEntry.RESET;
         BankLedEntry.SETRANGE(BankLedEntry."Bank Account No.","No.");
         IF BankLedEntry.FINDFIRST THEN BEGIN
            IF (Name)<>(xRec.Name) THEN
               ERROR('Bank Account '+"No."+' already has entries, Cannot change the Name');
         END;

        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
        */
        //end;


        //Unsupported feature: Code Insertion on ""Bank Acc. Posting Group"(Field 21)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
         BankLedEntry.RESET;
         BankLedEntry.SETRANGE(BankLedEntry."Bank Account No.","No.");
         IF BankLedEntry.FINDFIRST THEN BEGIN
            IF ("Bank Acc. Posting Group")<>(xRec."Bank Acc. Posting Group") THEN
               ERROR('Bank Account '+"No."+' already has entries, Cannot change the posting group');
         END;
        */
        //end;
        field(53000; test; Option)
        {
            OptionMembers = a,b;
            Caption = 'test';
            DataClassification = CustomerContent;
        }
        field(61002; "Credit Agreement?"; Boolean)
        {
            Caption = 'Credit Agreement?';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if not Rec."Credit Agreement?" then
                    Rec."Maximum Credit Limit" := 0;
            end;
        }
        field(61003; "Maximum Credit Limit"; Decimal)
        {
            Caption = 'Maximum Credit Limit';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec.TestField(Rec."Credit Agreement?", true);

                if Rec."Maximum Credit Limit" > 0 then
                    Error('Maximum Credit Limit must be less than zero');
            end;
        }
        field(39005975; "Bank Type"; Option)
        {
            OptionMembers = Normal,Cash,"Fixed Deposit",SMPA,"Chq Collection";
            Caption = 'Bank Type';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin

                Rec.TestNoEntriesExist(Rec.FieldCaption(Rec."Bank Type"));
            end;
        }
        field(39005976; "Pending Voucher Amount"; Decimal)
        {
            Caption = 'Pending Voucher Amount';
            DataClassification = CustomerContent;
        }
        field(39005977; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR 2";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if not UserMgt.CheckRespCenter(1, Rec."Responsibility Center") then
                    Error(
                      Text005,
                      RespCenter.TableCaption, UserMgt.GetPurchasesFilter());
            end;
        }
        field(39005978; "Bank Branch Name"; Text[250])
        {
            Caption = 'Bank Branch Name';
            DataClassification = CustomerContent;
        }
    }

    procedure TestNoEntriesExist(CurrentFieldName: Text[100])
    var
        ItemLedgEntry: Record "Bank Account Ledger Entry";
    begin

        //To prevent change of field
        ItemLedgEntry.SetCurrentKey(ItemLedgEntry."Bank Account No.");
        ItemLedgEntry.SetRange("Bank Account No.", Rec."No.");
        if ItemLedgEntry.Find('-') then
            Error(
              Text006,
              CurrentFieldName);
    end;

    var
        UserMgt: Codeunit "User Setup Management BR";
        RespCenter: Record "Responsibility Center BR 2";
        Text006: Label 'You cannot change %1 because there are one or more ledger entries for this bank account.';
        Text005: Label 'Your identification is set up to process from %1 %2 only.';
        BankLedEntry: Record "Bank Account Ledger Entry";
}
