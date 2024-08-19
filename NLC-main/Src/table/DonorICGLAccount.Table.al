#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193766 "Donor IC G/L Account"
{
    Caption = 'IC G/L Account';
    DrillDownPageId = "Donor I/C Account List";
    LookupPageId = "Donor I/C Account List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(4; "Income/Balance"; Option)
        {
            Caption = 'Income/Balance';
            OptionCaption = 'Income Statement,Balance Sheet';
            OptionMembers = "Income Statement","Balance Sheet";
        }
        field(5; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(6; "Map-to G/L Acc. No."; Code[20])
        {
            Caption = 'Map-to G/L Acc. No.';
            TableRelation = "G/L Account"."No." where("Grant Expense" = filter(true));
        }
        field(7; Indentation; Integer)
        {
            Caption = 'Indentation';
        }
        field(8; Donor; Code[30])
        {
            Caption = 'Donor';
        }
    }

    keys
    {
        key(Key1; "No.", Donor)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, "Income/Balance", Blocked, "Map-to G/L Acc. No.") { }
    }
}
