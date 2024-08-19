#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193474 "HR Company Attachments"
{
    Caption = 'HR Company Attachments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[30])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; "Document Description"; Text[200])
        {
            NotBlank = true;
            Caption = 'Document Description';
        }
        field(6; "Attachment No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Attachment No.';
        }
        field(7; "Language Code (Default)"; Code[10])
        {
            TableRelation = Language;
            Caption = 'Language Code (Default)';
        }
        field(8; Attachment; Option)
        {
            Editable = true;
            OptionMembers = No,Yes;
            Caption = 'Attachment';
        }
    }

    keys
    {
        key(Key1; "Code", "Document Description")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
