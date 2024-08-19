#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193809 Tender
{
    DrillDownPageId = "Tender List";
    LookupPageId = "Tender List";
    Caption = 'Tender';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tender ID"; Code[20])
        {
            NotBlank = true;
            Caption = 'Tender ID';
        }
        field(2; Description; Text[250])
        {
            NotBlank = true;
            Caption = 'Description';
        }
        field(3; "Date Created"; Date)
        {
            Editable = true;
            Caption = 'Date Created';
        }
        field(4; "Created By"; Code[20])
        {
            Editable = true;
            Caption = 'Created By';
        }
        field(5; "Tender Type"; Option)
        {
            OptionCaption = ',General,Services,Works,Goods';
            OptionMembers = ,General,Services,Works,Goods;
            Caption = 'Tender Type';
        }
        field(6; Open; Boolean)
        {
            Caption = 'Open';
        }
        field(7; Category; Option)
        {
            OptionCaption = ',Services,Consumables,General';
            OptionMembers = ,Services,Consumables,General;
            Caption = 'Category';
        }
        field(8; "Valid From"; Date)
        {
            Caption = 'Valid From';
        }
        field(9; "Valid To"; Date)
        {
            Caption = 'Valid To';
        }
    }

    keys
    {
        key(Key1; "Tender ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
