#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193764 "Re-Budgeting Condition"
{
    Caption = 'Re-Budgeting Condition';
    DataClassification = CustomerContent;
    fields
    {
        field(1; LineNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'LineNo';
        }
        field(2; "Re-Budgeting Condition"; Text[100])
        {
            Caption = 'Re-Budgeting Condition';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; "Project Code"; Code[10])
        {
            Caption = 'Project Code';
        }
    }

    keys
    {
        key(Key1; LineNo, "Project Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
