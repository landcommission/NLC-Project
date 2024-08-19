#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193616 "Procurement Limit Code"
{
    DrillDownPageId = "Procurement Limit List";
    LookupPageId = "Procurement Limit List";
    Caption = 'Procurement Limit Code';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Procurement Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Procurement Code';
        }
        field(2; "Procurement Type"; Option)
        {
            OptionMembers = " ","Direct Procurement","Requset For Qoute","Low Value Procurement","Restricted Tendering","Open Tendering";
            Caption = 'Procurement Type';
        }
        field(3; "Procurement Amount Type"; Option)
        {
            OptionMembers = " ",Range,"Fixed";
            Caption = 'Procurement Amount Type';
        }
        field(4; "Min. Amount"; Decimal)
        {
            Caption = 'Min. Amount';
        }
        field(5; "Max Amount"; Decimal)
        {
            Caption = 'Max Amount';
        }
        field(6; "Fixed Amount"; Decimal)
        {
            Caption = 'Fixed Amount';
        }
    }

    keys
    {
        key(Key1; "Procurement Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
