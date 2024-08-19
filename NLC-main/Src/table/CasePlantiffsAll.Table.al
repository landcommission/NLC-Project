#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69515 "Case Plantiffs All"
{
    DrillDownPageId = "Plaintiffs All";
    LookupPageId = "Plaintiffs All";
    Caption = 'Case Plantiffs All';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[100])
        {
            Caption = 'No';
            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    HumanResourcesSetup.Get();
                    NoSeriesManagement.TestManual(HumanResourcesSetup."Plaintiff Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Type; Option)
        {
            OptionCaption = ' ,Plaintiff,Defendant';
            OptionMembers = " ",Plaintiff,Defendant;
            Caption = 'Type';
        }
        field(3; Names; Code[250])
        {
            Caption = 'Names';
        }
        field(4; Contacts; Code[250])
        {
            Caption = 'Contacts';
        }
        field(5; "No. Series"; Code[40])
        {
            Caption = 'No. Series';
        }
        field(6; "Source Contact Code"; Code[10])
        {
            TableRelation = Contact."No." where("Company No." = field(No));
            Caption = 'Source Contact Code';
        }
        field(7; Address; Text[30])
        {
            Caption = 'Address';
        }
        field(8; "Postal Code"; Code[10])
        {
            Caption = 'Postal Code';
        }
        field(9; City; Text[30])
        {
            Caption = 'City';
        }
        field(10; Email; Text[30])
        {
            Caption = 'Email';
        }
        field(11; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(12; "Second Name"; Text[30])
        {
            Caption = 'Second Name';
        }
        field(13; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
    }

    keys
    {
        key(Key1; No, Names)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        Type := Type::Plaintiff;

        if No = '' then begin
            HumanResourcesSetup.Get();
            HumanResourcesSetup.TestField("Plaintiff Nos");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Plaintiff Nos", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
        Plantiff: Record "Plaintive-Defentants";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
}

