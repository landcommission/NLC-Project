#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193480 "HR OSSafety Checklist"
{
    Caption = 'HR OSSafety Checklist';
    DataClassification = CustomerContent;
    fields
    {
        field(1; SafetyNo; Code[10])
        {
            Caption = 'SafetyNo';
        }
        field(2; "Safety Rules"; Text[200])
        {
            Caption = 'Safety Rules';
        }
        field(3; Observed; Boolean)
        {
            Caption = 'Observed';
            trigger OnValidate()
            begin
                if (Observed = true) and ("Not Observed" = true) then
                    Error('Both Option CANNOT apply');
            end;
        }
        field(4; "Not Observed"; Boolean)
        {
            Caption = 'Not Observed';
            trigger OnValidate()
            begin
                if (Observed = true) and ("Not Observed" = true) then
                    Error('Both Option CANNOT apply');
            end;
        }
        field(5; "Accident No"; Code[10])
        {
            Caption = 'Accident No';
        }
        field(6; "Incident No"; Code[10])
        {
            TableRelation = "HR OSIncident"."Incident No";
            Caption = 'Incident No';
        }
        field(7; "Observation Made"; Text[200])
        {
            Caption = 'Observation Made';
        }
    }

    keys
    {
        key(Key1; SafetyNo, "Incident No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
