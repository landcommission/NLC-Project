#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193585 "Applicant Register"
{
    Caption = 'Applicant Register';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Integer)
        {
            AutoIncrement = true;
            Caption = 'No';
        }
        field(2; UserName; Code[50])
        {
            Caption = 'UserName';
        }
        field(3; Password; Text[100])
        {
            Caption = 'Password';
        }
        field(4; EmailAddress; Text[150])
        {
            Caption = 'EmailAddress';
        }
        field(5; Verified; Boolean)
        {
            Caption = 'Verified';
        }
        field(50001; MyRecId; RecordId)
        {
            Caption = 'MyRecId';
        }
        field(50002; "Changed Password"; Boolean)
        {
            Caption = 'Changed Password';
        }
        field(50003; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(50004; "First Name"; Text[50])
        {
            Caption = 'First Name';
        }
        field(50005; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
        }
        field(50006; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
        }
        field(50007; Phone; Text[30])
        {
            Caption = 'Phone';
        }
        field(50008; DateCreated; DateTime)
        {
            Caption = 'DateCreated';
        }
    }

    keys
    {
        key(Key1; UserName)
        {
            Clustered = true;
        }
        key(Key2; No) { }
    }

    fieldgroups { }

    trigger OnInsert()
    begin


        if UserName = '' then begin
            AttachmentIDBuffer.Reset();
            UserName := AttachmentIDBuffer."ID Number";
        end;

        //**Changes** To add a record id of the rec to enable flow field with the record links table
        MyRecRef.GetTable(Rec);
        MyRecId := MyRecRef.RecordId;
    end;

    var
        AttachmentIDBuffer: Record "Attachment ID Buffer";
        MyRecRef: RecordRef;
}
