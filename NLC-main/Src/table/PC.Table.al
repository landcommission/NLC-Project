#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193721 PC
{
    Caption = 'PC';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "PC Code"; Code[20])
        {
            Caption = 'PC Code';
        }
        field(2; "PC Activities"; Text[250])
        {
            Caption = 'PC Activities';
        }
        field(6; "Business Unit Filter"; Code[10])
        {
            Caption = 'Business Unit Filter';
            FieldClass = FlowFilter;
            TableRelation = "Business Unit";
        }
        field(7; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(10; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(13; "PC Name"; Code[20])
        {
            Caption = 'PC Name';
            //TableRelation = Table39005759;
        }
        field(14; Weight; Code[10])
        {
            Caption = 'Weight';
        }
        field(15; Target; Code[10])
        {
            Caption = 'Target';
        }
        field(16; "Workplan Activities"; Code[20])
        {
            TableRelation = Workplan."Workplan Code";
            Caption = 'Workplan Activities';

        }
        field(17; "financial year start"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
            Caption = 'financial year start';
        }
        field(18; "financial year end"; Date)
        {
            TableRelation = "Accounting Period"."Starting Date";
            Caption = 'financial year end';
        }
        field(19; "Workplan Description"; Text[100])
        {
            Caption = 'Workplan Description';
        }
    }

    keys
    {
        key(Key1; "PC Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        workplan: Record "Workplan Budget Buffer";
}
