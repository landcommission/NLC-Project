#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193807 "Workplan Name"
{
    Caption = 'Workplan Name';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Workplan Code"; Code[20])
        {
            Caption = 'Workplan Code';
        }
        field(2; "Workplan Description"; Text[100])
        {
            Caption = 'Workplan Description';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(4; "Budget Dimension 1 Code"; Code[20])
        {
            TableRelation = Dimension;
            Caption = 'Budget Dimension 1 Code';
        }
        field(5; "Budget Dimension 2 Code"; Code[20])
        {
            TableRelation = Dimension;
            Caption = 'Budget Dimension 2 Code';
        }
        field(6; "Budget Dimension 3 Code"; Code[20])
        {
            TableRelation = Dimension;
            Caption = 'Budget Dimension 3 Code';
        }
        field(7; "Budget Dimension 4 Code"; Code[20])
        {
            TableRelation = Dimension;
            Caption = 'Budget Dimension 4 Code';
        }
        field(8; "Last Year"; Boolean)
        {
            Caption = 'Last Year';
        }
        field(9; "Marked By"; Code[20])
        {
            Caption = 'Marked By';
        }
        field(10; "Mark On"; Date)
        {
            Caption = 'Mark On';
        }
    }

    keys
    {
        key(Key1; "Workplan Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
