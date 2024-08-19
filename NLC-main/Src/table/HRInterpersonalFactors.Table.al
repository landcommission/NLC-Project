#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193581 "HR Interpersonal Factors"
{
    Caption = 'HR Interpersonal Factors';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No Series"; Integer)
        {
            AutoIncrement = true;
            Caption = 'No Series';
        }
        field(2; "Appraisal Code"; Code[50])
        {
            TableRelation = "HR Appraisal Header"."Appraisal No";
            Caption = 'Appraisal Code';
        }
        field(3; "Interpersonal Factors"; Code[200])
        {
            Caption = 'Interpersonal Factors';
        }
        field(4; "IF Description"; Text[250])
        {
            Caption = 'IF Description';
        }
        field(5; "Supervisor Comments"; Text[250])
        {
            Caption = 'Supervisor Comments';
        }
        field(6; "Appraisee Comments"; Text[250])
        {
            Caption = 'Appraisee Comments';
        }
        field(7; Ratings; Decimal)
        {
            Caption = 'Ratings';
        }
        field(8; "Examples Behaviours"; Text[250])
        {
            Caption = 'Examples Behaviours';
        }
        field(9; "Supervisor Ratings"; Decimal)
        {
            Caption = 'Supervisor Ratings';
        }
        field(50000; "Peer Comments"; Text[250])
        {
            Caption = 'Peer Comments';
        }
        field(50001; "Peer Ratings"; Decimal)
        {
            Caption = 'Peer Ratings';
        }
        field(50002; "Attribute Description"; Text[250])
        {
            Caption = 'Attribute Description';
        }
        field(50003; "Criteria Cluster"; Code[20])
        {
            Caption = 'Criteria Cluster';
        }
        field(50004; "Criteria Cluster Description"; Text[150])
        {
            Caption = 'Criteria Cluster Description';
        }
        field(50005; "Interpersonal Factors Text"; Text[100])
        {
            Caption = 'Interpersonal Factors Text';
        }
        field(50006; "Agreed Ratings"; Decimal)
        {
            Caption = 'Agreed Ratings';
        }
        field(50007; "Values Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No Series")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
