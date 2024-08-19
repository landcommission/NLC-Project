#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193521 "HR Appraisal Company Target"
{
    Caption = 'HR Appraisal Company Target';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; Score; Decimal)
        {
            Caption = 'Score';

        }
        field(4; Recommendations; Text[200])
        {
            Caption = 'Recommendations';
        }
        field(5; "Description 2"; Text[250])
        {
            Caption = 'Description 2';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Description, Score) { }
    }

    fieldgroups { }

    var
        HRAppraisalRating: Record "HR Appraisal Company Target";
}
