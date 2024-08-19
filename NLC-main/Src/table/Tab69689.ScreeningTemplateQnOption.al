#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69689 "Screening Template Qn Option"
{

    fields
    {
        field(1;"Template Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Question Category";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Question Id";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Closed-ended Question Sub-Type";Code[30])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
        }
        field(6;"Option Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Raw Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template Type","Template ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

