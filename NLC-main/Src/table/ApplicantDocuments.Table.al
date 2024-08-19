#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193589 "Applicant Documents"
{
    Caption = 'Applicant Documents';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Doc No"; Code[50])
        {
            Caption = 'Doc No';
        }
        field(10; Id; Integer)
        {
            AutoIncrement = true;
            Caption = 'Id';
        }
        field(20; ApplicantNo; Text[250])
        {
            Caption = 'ApplicantNo';
        }
        field(30; DocType; Text[250])
        {
            Caption = 'DocType';
        }
        field(40; FileName; Text[250])
        {
            Caption = 'FileName';
        }
        field(41; "Document No"; Text[100])
        {
            Caption = 'Document No';
        }
        field(42; DocumentURL; Text[250])
        {
            Caption = 'DocumentURL';
        }
        field(43; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(44; Company; Text[250])
        {
            Caption = 'Company';
        }
        field(45; Section; Option)
        {
            OptionCaption = 'None,Education Background,Testimonial and Supporting';
            OptionMembers = None,"Education Background","Testimonial and Supporting";
            Caption = 'Section';
        }
        field(50000; "Document Notes"; Text[250])
        {
            Caption = 'Document Notes';
        }
        field(50001; RandomMapperEduBackGr; Text[250])
        {
            Caption = 'RandomMapperEduBackGr';
        }
        field(50002; MyRecId; RecordId)
        {
            Caption = 'MyRecId';
        }
        field(50003; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
        }
    }

    keys
    {
        key(Key1; "Doc No")
        {
            Clustered = true;
        }
        key(Key2; ApplicantNo) { }
        key(Key3; Id) { }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if "Doc No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup.AppDocNo);
            NoSeriesMgt.InitSeries(HRSetup.AppDocNo, xRec."No. Series", 0D, "Doc No", "No. Series");
        end;

        if ApplicantNo = '' then begin
            AttachmentIDBuffer.Reset();
            ApplicantNo := AttachmentIDBuffer."ID Number";
        end;

        //**Changes** To add a record id of the rec to enable flow field with the record links table
        MyRecRef.GetTable(Rec);
        MyRecId := MyRecRef.RecordId;
    end;

    var
        MyRecRef: RecordRef;
        AppDocs: Record "Applicant Documents";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AttachmentIDBuffer: Record "Attachment ID Buffer";
}
