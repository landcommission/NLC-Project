#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193777 "Institution Departments"
{
    Caption = 'Job Posting Group';
    DrillDownPageId = "Control-Information List";
    LookupPageId = "Control-Information List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(50000; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(50001; Institution; Option)
        {
            OptionCaption = ' ,MTRH,MU,OTHERS';
            OptionMembers = " ",MTRH,MU,OTHERS;
            Caption = 'Institution';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
