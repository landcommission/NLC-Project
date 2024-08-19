#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80021 "SPM General Setup"
{

    fields
    {
        field(1;"Primary key";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Corp Strategic Plan Nos";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3;"Work Plan Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4;"PM Plans Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5;"PET Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6;"PWork Plans";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7;"Corporate PC No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8;"Functional PC No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(9;"Individual Scorecard Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(10;"PC Target Revision Voucher Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(11;"Daily Performance Diary Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12;"Performance Evaluation Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(13;"Performance Appeals No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(14;"Enable Performance Appeals";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Performance Improv Review Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(16;"Review Duration";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Review Description";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"policy  Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(19;"PLog Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(20;"Appraisal Based On";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Direct Input,Plog Input';
            OptionMembers = " ","Direct Input","Plog Input";
        }
        field(21;"Allow Loading of  CSP";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Allow Loading of JD";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Workplan Revision No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Primary key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

