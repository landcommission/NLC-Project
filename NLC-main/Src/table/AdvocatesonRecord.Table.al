#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 56098 "Advocates on Record"
{
    DrillDownPageId = "Advocate on record list";
    LookupPageId = "Advocate on record list";
    Caption = 'Advocates on Record';
    DataClassification = CustomerContent;
    fields
    {
        field(1; no; Code[10])
        {
            Caption = 'no';
        }
        field(2; "code"; Code[10])
        {
            Caption = 'code';
        }
        field(3; "advocate name"; Text[30])
        {
            Caption = 'advocate name';
        }
        field(4; "line no"; Integer)
        {
            AutoIncrement = true;
            Caption = 'line no';
        }
        field(5; Type; Option)
        {
            OptionCaption = ',Plaintiff,Defendant';
            OptionMembers = ,Plaintiff,Defendant;
            Caption = 'Type';
        }
        field(6; "Advocate Firm"; Text[30])
        {
            Caption = 'Advocate Firm';
        }
    }

    keys
    {
        key(Key1; no, "line no")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

