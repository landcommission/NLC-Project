#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193701 "HR MID-Year Review"
{
    Caption = 'HR MID-Year Review';
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
        field(3; "Supervisor Comments"; Text[250])
        {
            Caption = 'Supervisor Comments';
        }
        field(4; "Appraisee Comments"; Text[250])
        {
            Caption = 'Appraisee Comments';
        }
        field(5; Ratings; Decimal)
        {
            Caption = 'Ratings';
        }
        field(6; Objectives; Text[250])
        {
            Caption = 'Objectives';
        }
        field(7; Performance; Text[250])
        {
            Caption = 'Performance';
        }
        field(8; Period; Text[30])
        {
            Caption = 'Period';
        }
        field(9; "For Next Period"; Boolean)
        {
            Caption = 'For Next Period';
        }
        field(10; Type; Option)
        {
            OptionCaption = 'Current Period,Next Period,Area of Improvement';
            OptionMembers = "Current Period","Next Period","Area of Improvement";
            Caption = 'Type';
        }
        field(11; Criteria; Text[10])
        {
            Caption = 'Criteria';
        }
        field(12; "Performance Indicator"; Text[250])
        {
            Caption = 'Performance Indicator';
        }
        field(50000; "Second Supervisor Comments"; Text[250])
        {
            Caption = 'Second Supervisor Comments';
        }
        field(50001; "Supervisor Ratings"; Decimal)
        {
            Caption = 'Supervisor Ratings';
        }
        field(50002; "Agreed Ratings"; Decimal)
        {
            Caption = 'Agreed Ratings';
        }
        field(50003; "Achievements Reviewed"; Text[250])
        {
            Caption = 'Achievements Reviewed';
        }
        field(50004; "Target Changed Or Added"; Text[250])
        {
            Caption = 'Target Changed Or Added';
        }
        field(50005; Remarks; Text[250])
        {
            Caption = 'Remarks';
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
