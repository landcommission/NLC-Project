#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193431 "HR Appraisal Period"
{
    Caption = 'HR Appraisal Period';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Appraisal Period"; Date)
        {
            Caption = 'Appraisal Period';
        }
        field(2; "Appraisal Period Description"; Text[100])
        {
            Caption = 'Appraisal Period Description';
        }
        field(3; "Appraisal Type"; Option)
        {
            OptionCaption = 'Appraisal Review,Target Setting,End Year Appraisal';
            OptionMembers = "Appraisal Review","Target Setting","End Year Appraisal";
            Caption = 'Appraisal Type';
        }
        field(4; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(5; "Date opened"; Date)
        {
            Caption = 'Date opened';
        }
        field(6; "Date closed"; Date)
        {
            Caption = 'Date closed';
        }
        field(7; "Appraisal Month"; Integer)
        {
            Caption = 'Appraisal Month';
        }
        field(8; "Appraisal Year"; Text[30])
        {
            Caption = 'Appraisal Year';
        }
    }

    keys
    {
        key(Key1; "Appraisal Period")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
