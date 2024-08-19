#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193799 "Contract Lines"
{
    DrillDownPageId = "Contract Line";
    LookupPageId = "Contract Line";
    Caption = 'Contract Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract Line Code"; Code[50])
        {
            Caption = 'Contract Line Code';
        }
        field(2; Description; Text[60])
        {
            Caption = 'Description';
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Fixed Assets,Services';
            OptionMembers = " ","Fixed Assets",Services;
            Caption = 'Type';
        }
        field(4; "Contract Type"; Code[50])
        {
            TableRelation = "Contract Types"."Contract Code";
            Caption = 'Contract Type';

        }
    }

    keys
    {
        key(Key1; "Contract Line Code", "Contract Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Des: Integer;
        Contract: Record "Contract Types";
}
