#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193622 "Tariff Codes"
{
    DrillDownPageId = "Tariff Codes";
    LookupPageId = "Tariff Codes";
    Caption = 'Tariff Codes';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; Percentage; Decimal)
        {
            Caption = 'Percentage';
        }
        field(4; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"."No."
            else
            if ("Account Type" = const(Vendor)) Vendor."No.";
            Caption = 'Account No.';
        }
        field(5; Type; Option)
        {
            OptionMembers = " ","W/Tax",VAT,Excise,Others,Retention;
            Caption = 'Type';
        }
        field(12; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";

        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        PaymentLine.Reset();
        PaymentLine.SetRange(PaymentLine."VAT Code", Code);
        if PaymentLine.Find('-') then
            Error('You cannot delete the %1 Code its already used', Type);

        PaymentLine.Reset();
        PaymentLine.SetRange(PaymentLine."Withholding Tax Code", Code);
        if PaymentLine.Find('-') then
            Error('You cannot delete the %1 Code its already used', Type);
    end;

    var
        PaymentLine: Record "Payment Line";
}
