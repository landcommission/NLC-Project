#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193846 "Internal Return Header"
{
    Caption = 'Internal Return Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document type"; Option)
        {
            OptionMembers = "Internal Return Order";
            Caption = 'Document type';
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    InventorySetup.Get();
                    NoSeriesMgt.TestManual(InventorySetup."Internal Return Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(3; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Shortcut Dimension 1 Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('FUND'));
            Caption = 'Shortcut Dimension 1 Code';
        }
        field(6; "Shortcut Dimension 2 Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROJECT'));
            Caption = 'Shortcut Dimension 2 Code';
        }
        field(7; "Shortcut Dimension 3 Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('ACTIVITY'));
            Caption = 'Shortcut Dimension 3 Code';
        }
        field(8; "Shortcut Dimension 4 Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPT'));
            Caption = 'Shortcut Dimension 4 Code';
        }
        field(9; "Return to Store"; Code[10])
        {
            TableRelation = Location.Code where("Use As In-Transit" = filter(false));
            Caption = 'Return to Store';
            trigger OnValidate()
            begin

                ReturnLines.Reset();
                ReturnLines.SetRange(ReturnLines."Document No.", "No.");
                if ReturnLines.Find('-') then
                    repeat
                        ReturnLines."Destination Store" := "Return to Store";
                        ReturnLines.Insert();
                    until ReturnLines.Next() = 0;
            end;
        }
        field(10; "User ID"; Code[20])
        {
            Caption = 'User ID';
        }
        field(11; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
        }
        field(12; "Store Requisition No."; Code[10])
        {
            Caption = 'Store Requisition No.';
            //TableRelation = Table39005884.Field1;

            trigger OnValidate()
            begin
                SREQ.Reset();
                SREQ.SetRange(SREQ."Requistion No", "Store Requisition No.");
                if SREQ.Find('-') then begin
                    ReturnLines."Document No." := "No.";
                    ReturnLines."Item No." := SREQ."No.";
                    ReturnLines.Description := SREQ.Description;
                    ReturnLines.Quantity := SREQ.Quantity;
                    ReturnLines.Insert();


                end;
            end;
        }
        field(13; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled,Posted';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted;
            Caption = 'Status';
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
            InventorySetup.Get();
            InventorySetup.TestField(InventorySetup."Internal Return Nos");
            NoSeriesMgt.InitSeries(InventorySetup."Internal Return Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Document Date" := Today;
        "User ID" := UserId;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PurchPayablesSetup: Record "Purchases & Payables Setup";
        SREQ: Record "Store Requistion Lines";
        ReturnLines: Record "Internal Return Lines";
        InventorySetup: Record "Inventory Setup";
}
