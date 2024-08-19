#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193469 "HR Calendar List"
{
    DrillDownPageId = "HR Calendar Lines";
    LookupPageId = "HR Calendar Lines";
    Caption = 'HR Calendar List';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Day; Text[40])
        {
            Editable = false;
            Caption = 'Day';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; "Non Working"; Boolean)
        {
            Caption = 'Non Working';
        }
        field(5; Reason; Text[40])
        {
            Caption = 'Reason';
        }
    }

    keys
    {
        key(Key1; Date, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
