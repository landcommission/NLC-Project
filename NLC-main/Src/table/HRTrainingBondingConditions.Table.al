#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193500 "HR Training Bonding Conditions"
{
    Caption = 'HR Training Bonding Conditions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Editable = false;
            Caption = 'Code';
        }
        field(2; "Condition Type"; Option)
        {
            OptionMembers = " ","Percentage of Training Cost","Total Training Cost",Duration;
            Caption = 'Condition Type';
        }
        field(3; "Minimum Amount"; Decimal)
        {
            Caption = 'Minimum Amount';
        }
        field(4; "Maximum Amount"; Decimal)
        {
            Caption = 'Maximum Amount';
        }
        field(5; "Condition Description"; Text[100])
        {
            Caption = 'Condition Description';
        }
        field(6; "Training Bonding Code"; Code[20])
        {
            Caption = 'Training Bonding Code';
        }
        field(7; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Line No.';
        }
    }

    keys
    {
        key(Key1; "Code", "Training Bonding Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HRTrainingNeeds: Record "HR Training Needs";
}
