#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69514 "Case Plantiff-Defandants"
{
    Caption = 'Case Plantiff-Defandants';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case No"; Code[100])
        {
            TableRelation = "Case Register"."No.";
            Caption = 'Case No';
        }
        field(2; Type; Option)
        {
            OptionCaption = ' ,Plaintiff,Defendant';
            OptionMembers = " ",Plaintiff,Defendant;
            Caption = 'Type';
        }
        field(3; "Code"; Code[10])
        {
            Caption = 'Code';
            trigger OnValidate()
            var
                CasePlantiffsAll: Record "Case Plantiffs All";
            begin
                Plantiff.Reset();
                Plantiff.SetRange(No, Code);
                if Plantiff.Find('-') then begin
                    "First Name" := Plantiff."First Name";
                    "Second Name" := Plantiff."Second Name";
                    "Last Name" := Plantiff."Last name";
                    Email := Plantiff.Email;
                    Address := Plantiff.Address;
                    Names := (Plantiff."First Name" + '' + Plantiff."Second Name" + '' + Plantiff."Last name");
                    Contacts := Plantiff.Contacts;

                end;
                CasePlantiffsAll.Reset();
                CasePlantiffsAll.SetRange(No, Code);
                if CasePlantiffsAll.FindSet() then begin
                    "First Name" := CasePlantiffsAll."First Name";
                    "Second Name" := CasePlantiffsAll."Second Name";
                    "Last Name" := CasePlantiffsAll."Last Name";
                    //Names:=(CasePlantiffsAll."First Name"+''+CasePlantiffsAll."Second Name"+''+CasePlantiffsAll."Last Name");
                    Validate(Names);
                    Contacts := CasePlantiffsAll.Contacts;
                    "Source Firm" := CasePlantiffsAll."Source Contact Code";
                    Address := CasePlantiffsAll.Address;
                    Email := CasePlantiffsAll.Email;
                end;
            end;
        }
        field(4; Names; Code[100])
        {
            TableRelation = if (Type = const(Plaintiff)) "Case Plantiffs All".Names
            else
            if (Type = const(Defendant)) "Case Defendants All".Names;
            Caption = 'Names';
        }
        field(5; Contacts; Code[100])
        {
            Caption = 'Contacts';
        }
        field(6; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(7; "Source Firm"; Code[20])
        {
            TableRelation = Contact."No." where("Company No." = field(Code));
            Caption = 'Source Firm';
        }
        field(8; Address; Text[40])
        {
            Caption = 'Address';
        }
        field(9; Email; Text[50])
        {
            Caption = 'Email';
        }
        field(10; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(11; "Second Name"; Text[30])
        {
            Caption = 'Second Name';
        }
        field(12; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
    }

    keys
    {
        key(Key1; "Case No", Type, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Plantiff: Record "Case Defendants All";
}

