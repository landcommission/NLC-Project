#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193873 "HR Individual Objectives1"
{
    Caption = 'HR Individual Objectives1';
    DataClassification = CustomerContent;
    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; "Staff No"; Code[50])
        {
            Caption = 'Staff No';
        }
        field(3; Department; Text[100])
        {
            Caption = 'Department';
        }
        field(4; Objectives; Text[250])
        {
            Caption = 'Objectives';
        }
        field(5; Period; Code[50])
        {
            Caption = 'Period';
        }
        field(6; "Appraisal No"; Code[50])
        {
            Caption = 'Appraisal No';
        }
        field(7; "Directorate Code"; Text[50])
        {
            Caption = 'Directorate Code';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
