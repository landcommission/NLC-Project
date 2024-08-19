#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193760 "Phase Reporting Schedules"
{
    Caption = 'Phase Reporting Schedules';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Phase; Code[20])
        {
            TableRelation = "Grant Phases";
            Caption = 'Phase';
        }
        field(2; "Table ID"; Option)
        {
            OptionMembers = Partner,Donor;
            Caption = 'Table ID';
        }
        field(3; "Partner/Donor"; Code[10])
        {
            TableRelation = if ("Table ID" = const(Partner)) "Project Partners" where("Grant No" = field(Project))
            else
            if ("Table ID" = const(Donor)) "Project Donors" where("Grant No" = field(Project));
            Caption = 'Partner/Donor';
        }
        field(4; Project; Code[10])
        {
            TableRelation = Jobs;
            Caption = 'Project';
        }
        field(5; Months; Text[130])
        {
            Caption = 'Months';
        }
        field(6; "Reporting Date"; Date)
        {
            Caption = 'Reporting Date';
        }
        field(7; Notified; Option)
        {
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
            Caption = 'Notified';
        }
        field(8; "Audit Dates"; Date)
        {
            Caption = 'Audit Dates';
        }
        field(50000; AlertSent; Boolean)
        {
            Caption = 'AlertSent';
        }
    }

    keys
    {
        key(Key1; Phase, "Table ID", Project, "Partner/Donor", "Reporting Date")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
