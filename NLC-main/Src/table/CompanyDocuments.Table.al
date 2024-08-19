#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193717 "Company Documents"
{
    Caption = 'Company Documents';
    DataClassification = CustomerContent;
    // //DrillDownPageID = UnknownPage39005688;
    // //LookupPageID = UnknownPage39005688;

    fields
    {
        field(1; "Doc No."; Code[20])
        {
            Caption = 'Doc No.';
        }
        field(2; "Document Description"; Text[200])
        {
            NotBlank = true;
            Caption = 'Document Description';
            trigger OnValidate()
            begin
                CompanyDocs.Reset();
                CompanyDocs.SetRange("Document Description", "Document Description");
                if CompanyDocs.FindFirst() then
                    Error('Document already exists');
            end;
        }
        field(3; "Document Link"; Text[200])
        {
            Caption = 'Document Link';
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
            Editable = false;
            OptionMembers = No,Yes;
            Caption = 'Attachment';
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(10; Type; Option)
        {
            OptionCaption = 'Company,Leave';
            OptionMembers = Company,Leave;
            Caption = 'Type';
        }
    }

    keys
    {
        key(Key1; "Doc No.", "Document Description")
        {
            Clustered = true;
        }
    }

    fieldgroups { }


    var
        CompanyDocs: Record "Company Documents";
        HRSetup: Record "Company Vehicles";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
