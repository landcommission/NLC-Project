#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193705 "Investment Setup"
{
    Caption = 'Investment Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Text[30])
        {
            Caption = 'Primary Key';
        }
        field(2; "Investment Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Investment Nos';
        }
        field(3; "Investment Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
            Caption = 'Investment Template';
        }
        field(4; "Investment Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch";
            Caption = 'Investment Batch';
        }
        field(5; "Investment G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Investment G/L Account';
        }
        field(6; "Interest G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Interest G/L Account';
        }
        field(7; "Withholding Tax G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Withholding Tax G/L Account';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
