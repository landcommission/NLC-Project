#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193722 "Medium Plan"
{
    Caption = 'Medium Plan';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "financial year start"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
            Caption = 'financial year start';
        }
        field(4; "financial year end"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
            Caption = 'financial year end';
        }
        field(5; Station; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Station';
        }
        field(6; Process; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Process';
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
}
