#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193542 "prPayroll Type"
{
    DrillDownPageId = "FA Budget Entries";
    LookupPageId = "FA Budget Entries";
    Caption = 'prPayroll Type';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Payroll Code"; Code[10])
        {
            Caption = 'Payroll Code';
        }
        field(2; "Payroll Name"; Text[50])
        {
            Caption = 'Payroll Name';
        }
        field(3; Comment; Text[200])
        {
            Caption = 'Comment';
        }
        field(4; "Period Length"; DateFormula)
        {
            Caption = 'Period Length';
        }
        field(5; EntryNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'EntryNo';
        }
    }

    keys
    {
        key(Key1; "Payroll Code")
        {
            Clustered = true;
        }
        key(Key2; EntryNo) { }
    }

    fieldgroups { }
}
