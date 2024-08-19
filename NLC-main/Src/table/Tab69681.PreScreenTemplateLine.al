#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69681 "Pre-Screen Template Line"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pre-Screen Template";
        }
        field(2;"Question Id";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Question Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(5;"Close Ended Qn Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Close Ended Qn Type";
        }
    }

    keys
    {
        key(Key1;"Template ID","Question Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

