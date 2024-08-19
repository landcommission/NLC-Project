#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 70004 "Store Object Name"
{
    Caption = 'Store Object Name';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Object ID"; Integer)
        {
            Caption = 'Object ID';
        }
        field(2; "Object Type"; Option)
        {
            OptionMembers = TableData,"Table",,"Report",,"Codeunit","XMLport",MenuSuite,"Page","Query",System,FieldNumber;
            Caption = 'Object Type';
        }
        field(3; "Object Name"; Text[50])
        {
            Caption = 'Object Name';
        }
    }

    keys
    {
        key(Key1; "Object ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
