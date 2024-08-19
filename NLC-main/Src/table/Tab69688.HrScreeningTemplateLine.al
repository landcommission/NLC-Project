#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69688 "Hr Screening Template Line"
{
    // LookupPageId = "Hr Screening Qn Group";
    // DrillDownPageId = "Hr Screening Qn Group";

    fields
    {
        field(1; "Template Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2; "Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Question Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Hr Screening Qn Group"."Question Category" where("Header No." = field("Template ID"));
        }
        field(4; "Question Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Question Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(7; "Closed-ended Question Sub-Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Weight; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10; "Minimum Points Accepted"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Maximum Points Accepted"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Default Rating Scale"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Close Ended Qn Type"."Type ID";
        }
        field(13; "Interview Area"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Technical Interview,Oral Interview';
            OptionMembers = "Technical Interview","Oral Interview";
        }
    }

    keys
    {
        key(Key1; "Template ID", "Line No.", "Template Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

