#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193710 "Master Record Creation Header"
{
    Caption = 'Master Record Creation Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Master Record Form Nos");
                    "No." := '';
                end;
            end;
        }
        field(2; "Requestor ID"; Code[50])
        {
            Caption = 'Requestor ID';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(5; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2";
            Caption = 'Responsibility Center';
        }
        field(6; "Dimension 1"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Dimension 1';
            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Dimension 1");
                if DimVal.Find('-') then
                    "Dimension 1 Description" := DimVal.Name;
                Visible := true;
            end;
        }
        field(7; "Dimension 1 Description"; Text[50])
        {
            Caption = 'Dimension 1 Description';
        }
        field(8; "Dimension 2"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Dimension 2';
            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Dimension 2");
                if DimVal.Find('-') then
                    "Dimension 2 Description" := DimVal.Name;
            end;
        }
        field(9; "Dimension 2 Description"; Text[50])
        {
            Caption = 'Dimension 2 Description';
        }
        field(10; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(11; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
        field(12; Created; Boolean)
        {
            Caption = 'Created';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField(GenLedgerSetup."Master Record Form Nos");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Master Record Form Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Requestor ID" := UserId;
        Date := Today;
        Status := Status::Open;
    end;

    var
        GenLedgerSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimVal: Record "Dimension Value";
        Visible: Boolean;
}
