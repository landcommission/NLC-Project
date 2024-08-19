#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193779 "Main Sub Component"
{
    Caption = 'Main Asset Component';
    PasteIsValid = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Main Sub No."; Code[20])
        {
            Caption = 'Main Asset No.';
            Editable = false;
            NotBlank = true;
            TableRelation = Vendor;
        }
        field(3; "No."; Code[20])
        {
            Caption = ' No.';
            NotBlank = true;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if ("No." = '') or ("Main Sub No." = '') then
                    exit;
                LockFixedAsset();
                FA.Get("No.");
                if "No." = "Main Sub No." then
                    CreateError("No.", 1);
                Description := FA.Name; //FA.Description;
                MainAssetComp.SetRange("Main Sub No.", "No.");
                if MainAssetComp.FindFirst() then
                    CreateError("No.", 1);
                MainAssetComp.SetRange("Main Sub No.");
                MainAssetComp.SetCurrentKey("No.");
                MainAssetComp.SetRange("No.", "No.");
                if MainAssetComp.FindFirst() then
                    CreateError("No.", 2);
                MainAssetComp.SetRange("No.", "Main Sub No.");
                if MainAssetComp.FindFirst() then
                    CreateError("No.", 1);
                UpdateMainAsset(FA, 2);
                FA.Get("Main Sub No.");
                if FA."Main Sub/Sub" <> FA."Main Sub/Sub"::"Main Sub" then
                    FA."Main Sub/Sub" := FA."Main Sub/Sub"::"Main Sub";
            end;
        }
        field(4; Description; Text[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Main Sub No.", "No.")
        {
            Clustered = true;
        }
        key(Key2; "No.") { }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        LockFixedAsset();
        if "No." <> '' then begin
            FA.Get("No.");
            UpdateMainAsset(FA, 0);
        end;
    end;

    trigger OnRename()
    begin
        Error(Text000, TableCaption);
    end;

    var
        Text000: Label 'You cannot rename a %1.';
        Text001: Label '%1 is not a %2.';
        Text002: Label '%1 is a %2.';
        FA: Record Vendor;
        FADeprBook: Record "Purchases & Payables Setup";
        MainAssetComp: Record "Main Sub Component";
        Text003: Label 'Main Sub,Sub';

    local procedure LockFixedAsset()
    begin
        FA.LockTable();
        FADeprBook.LockTable();
    end;

    local procedure UpdateMainAsset(var FA: Record Vendor; ComponentType: Option " ","Main Sub",Sub)
    var
        FA2: Record Vendor;
    begin
        if ComponentType = ComponentType::" " then begin
            FA."Main Sub/Sub" := FA."Main Sub/Sub"::" ";
            FA.Sub := '';
        end;
        if ComponentType = ComponentType::Sub then begin
            FA.Sub := "Main Sub No.";
            FA."Main Sub/Sub" := FA."Main Sub/Sub"::Sub;
        end;
        FA.Modify(true);

        FA.Reset();
        FA.SetCurrentKey(Sub);
        FA.SetRange(Sub, "Main Sub No.");
        FA.SetRange("Main Sub/Sub", FA2."Main Sub/Sub"::Sub);
        FA2.Get("Main Sub No.");
        if FA.Find('=><') then begin
            if FA2."Main Sub/Sub" <> FA2."Main Sub/Sub"::"Main Sub" then begin
                FA2."Main Sub/Sub" := FA2."Main Sub/Sub"::"Main Sub";
                FA2.Sub := FA2."No.";
                FA2.Modify(true);
            end;
        end else begin
            FA2."Main Sub/Sub" := FA2."Main Sub/Sub"::" ";
            FA2.Sub := '';
            FA2.Modify(true);
        end;
    end;

    local procedure CreateError(FANo: Code[20]; MainAssetComponent: Option " ","Main Sub",Sub)
    begin
        FA."No." := FANo;
        Error(
          Text002,
          FA, SelectStr(MainAssetComponent, Text003));
    end;
}
