#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193800 "Contract Lines Types"
{
    DrillDownPageId = "Contract Lines Type";
    LookupPageId = "Contract Lines Type";
    Caption = 'Contract Lines Types';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract Line Code"; Code[20])
        {
            TableRelation = "Contract Lines"."Contract Line Code";
            Caption = 'Contract Line Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Fixed Assets,Services,Transport,Services Provided';
            OptionMembers = " ","Fixed Assets",Services,Transport,"Services Provided";
            Caption = 'Type';
        }
        field(4; "Contract Line Type"; Code[10])
        {
            Caption = 'Contract Line Type';
        }
        field(5; "Contract Cycle"; Code[10])
        {
            TableRelation = "Contract Cycle".Code;
            Caption = 'Contract Cycle';
        }
    }

    keys
    {
        key(Key1; "Contract Line Type", "Contract Line Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
