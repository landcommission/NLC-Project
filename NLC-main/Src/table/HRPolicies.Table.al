#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193473 "HR Policies"
{
    Caption = 'HR Policies';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[22])
        {
            Caption = 'Code';
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
        }
        field(3; "Rules & Regulations"; Text[250])
        {
            Caption = 'Rules & Regulations';
        }
        field(4; "Document Link"; Text[200])
        {
            Caption = 'Document Link';
        }
        field(5; Remarks; Text[200])
        {
            NotBlank = false;
            Caption = 'Remarks';
        }
        field(6; "Language Code (Default)"; Code[10])
        {
            Caption = 'Language Code (Default)';
        }
        field(7; Attachment; Option)
        {
            OptionMembers = No,Yes;
            Caption = 'Attachment';
        }
        field(8; Type; Option)
        {
            OptionCaption = 'Is Rules & Regulation,Is Policy,Is Hr Procedure';
            OptionMembers = "Is Rules & Regulation","Is Policy","Is Hr Procedure";
            Caption = 'Type';
        }
        field(9; "Document Description"; Text[31])
        {
            Caption = 'Document Description';
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
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

    trigger OnInsert()
    begin
        if Code = '' then begin
            HRSetup.Get();
            HRSetup.TestField("HR Policies");
            NoSeriesMgt.InitSeries(HRSetup."HR Policies", xRec."No. Series", 0D, Code, "No. Series");
        end;
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
