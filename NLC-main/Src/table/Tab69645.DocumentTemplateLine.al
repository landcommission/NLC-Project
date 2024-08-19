#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69645 "Document Template Line"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Document Template";
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"HR Process";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Profile Registration,Job Application,Contract Issuance,Promotion/Transfers,Disciplinary,Staff Exit';
            OptionMembers = "Profile Registration","Job Application","Contract Issuance","Promotion/Transfers",Disciplinary,"Staff Exit";
        }
        field(4;"HR Document Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Document Type";
        }
        field(5;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1;"Template ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

