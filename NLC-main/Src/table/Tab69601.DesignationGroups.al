#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69601 "Designation Groups"
{
    // DrillDownPageID = "Designation Groups";
    //  LookupPageID = "Designation Groups";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No. of Positions"; Integer)
        {
            CalcFormula = count("Company Positions" where("Designation Group" = field(Code)));
            FieldClass = FlowField;
        }
        field(4; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Job Grade"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales".Scale;
        }
        field(8; "Overall Appointment Authority"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;// where ("Blocked?"=const(false),
                                                         //     "Organization Head Type"=filter(Board|CEO));
        }
        field(9; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Operational Level,Mid-Level,Senior-Level,Executive,Supervisory Level';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior Level",Executive,"Supervisory Level";
        }
        field(10; "Default Terms of Service"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Terms of Service";
        }
        field(11; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
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

