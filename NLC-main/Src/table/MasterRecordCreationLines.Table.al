#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193711 "Master Record Creation Lines"
{
    Caption = 'Master Record Creation Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Type; Option)
        {
            Caption = 'Master Type';
            OptionCaption = ' ,G/L Account,Dimension,Bank,Customer,Vendor,Item,Fixed Asset,Dimension Value,Job';
            OptionMembers = " ","G/L Account",Dimension,Bank,Customer,Vendor,Item,"Fixed Asset","Dimension Value",Job;
        }
        field(4; "Suggested No."; Code[20])
        {
            Description = 'For Type G/L';
            Caption = 'Suggested No.';
        }
        field(5; Reason; Text[100])
        {
            Caption = 'Reason';
        }
        field(6; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(7; "Created Document No."; Code[20])
        {
            Caption = 'Created Document No.';
        }
        field(8; "Created Document Name"; Text[100])
        {
            Caption = 'Created Document Name';
        }
        field(9; "Income/Balance Sheet A/C"; Option)
        {
            Description = 'For Type G/L';
            OptionCaption = 'Income Statement,Balance Sheet';
            OptionMembers = "Income Statement","Balance Sheet";
            Caption = 'Income/Balance Sheet A/C';
        }
        field(10; "Debit/Credit"; Option)
        {
            Description = 'For Type G/L';
            OptionCaption = 'Both,Debit,Credit';
            OptionMembers = Both,Debit,Credit;
            Caption = 'Debit/Credit';
        }
        field(11; "Account Type"; Option)
        {
            Description = 'For Type G/L';
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
            Caption = 'Account Type';
        }
        field(12; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(13; "General Posting Type"; Option)
        {
            OptionCaption = ' ,Purchase,Sale';
            OptionMembers = " ",Purchase,Sale;
            Caption = 'General Posting Type';
        }
        field(14; "Gen. Bus. Posting Group"; Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
            Caption = 'Gen. Bus. Posting Group';
        }
        field(15; "Gen. Prod. Posting Group"; Code[20])
        {
            TableRelation = "Gen. Product Posting Group";
            Caption = 'Gen. Prod. Posting Group';
        }
        field(16; "VAT. Bus. Posting Group"; Code[20])
        {
            TableRelation = "VAT Business Posting Group";
            Caption = 'VAT. Bus. Posting Group';
        }
        field(17; "VAT. Prod. Posting Group"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
            Caption = 'VAT. Prod. Posting Group';
        }
        field(18; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(19; "Post Code"; Text[30])
        {
            Caption = 'Post Code';
        }
        field(20; City; Text[50])
        {
            Caption = 'City';
        }
        field(21; "Country/Region Code"; Code[20])
        {
            Caption = 'Country/Region Code';
        }
        field(22; "Phone No."; Code[20])
        {
            Caption = 'Phone No.';
        }
        field(23; "Bank Branch No."; Code[20])
        {
            Description = 'Bank';
            Caption = 'Bank Branch No.';
        }
        field(24; "Bank Type"; Option)
        {
            Description = 'Bank';
            OptionCaption = 'Normal,Cash,Fixed Deposit,SMPA,Chq Collection';
            OptionMembers = Normal,Cash,"Fixed Deposit",SMPA,"Chq Collection";
            Caption = 'Bank Type';
        }
        field(25; "Fax No."; Code[20])
        {
            Caption = 'Fax No.';
        }
        field(26; Email; Text[50])
        {
            Caption = 'Email';
        }
        field(27; "Home Page"; Text[100])
        {
            Caption = 'Home Page';
        }
        field(28; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
            Caption = 'Currency Code';
        }
        field(29; "Bank Account Posting Groups"; Code[20])
        {
            TableRelation = "Bank Account Posting Group";
            Caption = 'Bank Account Posting Groups';
        }
        field(30; "Vendor/Customer Posting Group"; Code[20])
        {
            TableRelation = if (Type = filter(Customer)) "Customer Posting Group"
            else
            if (Type = filter(Vendor)) "Vendor Posting Group";
            Caption = 'Vendor/Customer Posting Group';
        }
        field(31; "Base Unit of Measure"; Code[20])
        {
            TableRelation = "Unit of Measure";
            Caption = 'Base Unit of Measure';
        }
        field(32; "Item G/L Budget Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Item G/L Budget Account';
        }
        field(33; "Inventory Posting Group"; Code[20])
        {
            TableRelation = "Inventory Posting Group";
            Caption = 'Inventory Posting Group';
        }
        field(34; "Depreciation Book"; Code[20])
        {
            TableRelation = "Depreciation Book";
            Caption = 'Depreciation Book';
        }
        field(35; "FA Posting Group"; Code[20])
        {
            TableRelation = "FA Posting Group";
            Caption = 'FA Posting Group';
        }
        field(36; "Depreciation Method"; Option)
        {
            OptionCaption = 'Straight-Line,Declining-Balance 1,Declining-Balance 2,DB1/SL,DB2/SL,User-Defined,Manual';
            OptionMembers = "Straight-Line","Declining-Balance 1","Declining-Balance 2","DB1/SL","DB2/SL","User-Defined",Manual;
            Caption = 'Depreciation Method';
        }
        field(37; "FA Class Code"; Code[20])
        {
            TableRelation = "FA Class";
            Caption = 'FA Class Code';
        }
        field(38; "FA Subclass Code"; Code[20])
        {
            TableRelation = "FA Subclass";
            Caption = 'FA Subclass Code';
        }
        field(39; "FA Location Code"; Code[20])
        {
            TableRelation = "FA Location";
            Caption = 'FA Location Code';
        }
        field(40; "Dimension Code"; Code[20])
        {
            TableRelation = Dimension;
            Caption = 'Dimension Code';
            trigger OnValidate()
            begin
                if Dimension.Get("Dimension Code") then
                    "Dimension Name" := Dimension.Name;
            end;
        }
        field(41; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
        }
        field(42; "Dimension Value Name"; Text[100])
        {
            Caption = 'Dimension Value Name';
        }
        field(43; "Dimension Name"; Code[20])
        {
            Caption = 'Dimension Name';
        }
        field(44; "Dimension Code Insert"; Code[20])
        {
            Caption = 'Dimension Code Insert';
        }
        field(45; "Dimension Name Insert"; Text[100])
        {
            Caption = 'Dimension Name Insert';
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }


    var
        Master: Record "Master Record Creation Lines";
        Dimension: Record Dimension;
}
