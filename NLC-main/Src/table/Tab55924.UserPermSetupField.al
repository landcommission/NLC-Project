table 55924 "User Perm Setup (Field)"
{
    Caption = 'Change Log Setup (Field)';

    fields
    {
        field(1; "User ID"; Code[50])
        {
        }
        field(2; "Table No."; Integer)
        {
            Caption = 'Table No.';
            TableRelation = "Change Log Setup (Table)";
        }
        field(3; "Field No."; Integer)
        {
            Caption = 'Field No.';
            TableRelation = Field."No." where(TableNo = field("Table No."));
        }
        field(4; "Field Caption"; Text[100])
        {
            CalcFormula = lookup(Field."Field Caption" where(TableNo = field("Table No."),
                                                              "No." = field("Field No.")));
            Caption = 'Field Caption';
            FieldClass = FlowField;
        }
        field(5; "Block Insertion"; Boolean)
        {
            Caption = 'Block Insertion';
        }
        field(6; "Block Modification"; Boolean)
        {
            Caption = 'Block Modification';
        }
        field(7; "Block Deletion"; Boolean)
        {
            Caption = 'Block Deletion';
        }
    }

    keys
    {
        key(Key1; "User ID", "Table No.", "Field No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

