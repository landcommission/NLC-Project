#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69618 "Domain Area"
{
    // / DrillDownPageID = "Domain Area";
    // LookupPageID = "Domain Area";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Qualified Active Empl"; Integer)
        {
            Caption = 'No. of Qualified Active Employees';
            DataClassification = ToBeClassified;
        }
        field(5; "Qualified Job Applicants"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

