#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193620 "Receipts and Payment Types"
{
    DrillDownPageId = "Receipt and Payment Types List";
    LookupPageId = "Receipt and Payment Types List";
    Caption = 'Receipts and Payment Types';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            trigger OnValidate()
            begin

                PayLine.Reset();
                PayLine.SetRange(PayLine.Type, Code);
                if PayLine.Find('-') then
                    Error('This Transaction Code Is Already in Use You cannot Modify');

                PayLine.Reset();
                PayLine.SetRange(PayLine.Type, Code);
                if PayLine.Find('-') then
                    Error('This Transaction Code Is Already in Use You Cannot Delete');
            end;
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Staff,None,Item';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Staff,None,Item;

            trigger OnValidate()
            begin
                if "Account Type" = "Account Type"::"G/L Account" then
                    "Direct Expense" := true
                else
                    "Direct Expense" := false;

                PayLine.Reset();
                PayLine.SetRange(PayLine.Type, Code);
                if PayLine.Find('-') then
                    Error('This Transaction Code Is Already in Use You cannot Modify');
            end;
        }
        field(4; Type; Option)
        {
            NotBlank = true;
            OptionMembers = " ",Receipt,Payment,Imprest,Claim,Advance;
            Caption = 'Type';
        }
        field(5; "VAT Chargeable"; Option)
        {
            OptionMembers = No,Yes;
            Caption = 'VAT Chargeable';
        }
        field(6; "Withholding Tax Chargeable"; Option)
        {
            OptionMembers = No,Yes;
            Caption = 'Withholding Tax Chargeable';
        }
        field(7; "VAT Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
            Caption = 'VAT Code';
        }
        field(8; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
            Caption = 'Withholding Tax Code';
        }
        field(9; "Default Grouping"; Code[20])
        {
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else
            if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Posting Group"
            else
            if ("Account Type" = const("Fixed Asset")) "FA Posting Group"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner"
            else
            if ("Account Type" = const("G/L Account")) "Expense Code";
            Caption = 'Default Grouping';
        }
        field(10; "G/L Account"; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"."No.";
            Caption = 'G/L Account';
            trigger OnValidate()
            begin
                GLAcc.Reset();
                if GLAcc.Get("G/L Account") then begin

                    if Type = Type::Payment then
                        GLAcc.TestField(GLAcc."Budget Controlled", true);

                    if GLAcc."Direct Posting" = false then
                        Error('Direct Posting must be True');
                end;

                PayLine.Reset();
                PayLine.SetRange(PayLine.Type, Code);
                if PayLine.Find('-') then
                    Error('This Transaction Code Is Already in Use You Cannot Delete');
            end;
        }
        field(11; "Pending Voucher"; Boolean)
        {
            Caption = 'Pending Voucher';
        }
        field(12; "Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
            Caption = 'Bank Account';
            trigger OnValidate()
            begin
                if "Account Type" <> "Account Type"::"Bank Account" then
                    Error('You can only enter Bank No where Account Type is Bank Account');
            end;
        }
        field(13; "Transation Remarks"; Text[250])
        {
            NotBlank = true;
            Caption = 'Transation Remarks';
        }
        field(14; "Payment Reference"; Option)
        {
            OptionMembers = Normal,"Farmer Purchase",Grant;
            Caption = 'Payment Reference';
        }
        field(15; "Customer Payment On Account"; Boolean)
        {
            Caption = 'Customer Payment On Account';
        }
        field(16; "Direct Expense"; Boolean)
        {
            Editable = false;
            Caption = 'Direct Expense';
        }
        field(17; "Calculate Retention"; Option)
        {
            OptionMembers = No,Yes;
            Caption = 'Calculate Retention';
        }
        field(18; "Retention Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
            Caption = 'Retention Code';
        }
        field(19; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(20; "Based On Travel Rates Table"; Boolean)
        {
            Caption = 'Based On Travel Rates Table';
        }
        field(21; "VAT Withheld Code"; Code[10])
        {
            TableRelation = "Tariff Codes".Code;
            Caption = 'VAT Withheld Code';
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        PayLine.Reset();
        PayLine.SetRange(PayLine.Type, Code);
        if PayLine.Find('-') then
            Error('This Transaction Code Is Already in Use You Cannot Delete');
    end;

    trigger OnInsert()
    begin
        "Direct Expense" := true;
    end;

    var
        GLAcc: Record "G/L Account";
        PayLine: Record "Payment Line";
}
