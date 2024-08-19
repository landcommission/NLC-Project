#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69516 "Case Defendants All"
{
    DrillDownPageId = "Defendants All";
    LookupPageId = "Defendants All";
    Caption = 'Case Defendants All';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[100])
        {
            Caption = 'No';
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
        field(6; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(7; "Second Name"; Text[30])
        {
            Caption = 'Second Name';
        }
        field(8; "Last name"; Text[30])
        {
            Caption = 'Last name';
        }
        field(9; Email; Text[30])
        {
            Caption = 'Email';
        }
        field(10; Address; Text[30])
        {
            Caption = 'Address';
        }
        field(11; "Postal Code"; Code[10])
        {
            Caption = 'Postal Code';
        }
        field(12; City; Text[30])
        {
            Caption = 'City';
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
        Type := Type::Defendant;

        if No = '' then begin
            HumanResourcesSetup.Get();
            HumanResourcesSetup.TestField("Defendant Nos");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Defendant Nos", xRec."No. Series", Today, No, "No. Series");
        end;
    end;


    var
        Plantiff: Record "Plaintive-Defentants";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PostCode: Record "Post Code";
        Country: Record "Country/Region";
        County: Text;
}

