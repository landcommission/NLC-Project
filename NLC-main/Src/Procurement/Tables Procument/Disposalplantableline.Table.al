#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50139 "Disposal plan table line"
{

    fields
    {
        field(1; "Ref. No."; Code[10])
        {
        }
        field(2; "Sub. Ref. No."; Code[10])
        {
        }
        field(3; "Item description"; Text[50])
        {
        }
        field(4; "Unit of Issue"; Code[10])
        {
            TableRelation = "Unit of Measure".Code;
        }
        field(5; Quantity; Integer)
        {
        }
        field(6; "Disposal Unit price"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Price" := Quantity * "Disposal Unit price";
            end;
        }
        field(7; "Total Price"; Decimal)
        {
        }
        field(8; "Planned Date"; Date)
        {
        }
        field(9; "Disposal Method"; Code[20])
        {
            TableRelation = "Disposal Method";
        }
        field(10; Department; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(11; County; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(12; Approved; Boolean)
        {
            Editable = false;
        }
        field(50001; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(50002; "Item/Tag No"; Code[20])
        {

            trigger OnValidate()
            begin
                //Displine."Disposal Method":=Disheader."Disposal Method";
            end;
        }
        field(50004; "Unit of Measure"; Code[20])
        {
            TableRelation = "Unit of Measure".Code;
        }
        field(50005; "Serial No"; Text[50])
        {
        }
        field(50006; "Disposal Period"; Code[20])
        {
        }
        field(50007; "No."; Code[20])
        {
            TableRelation = if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            begin
                //IF Type=Type::"Fixed Asset" THEN
                FA3.Reset;
                FA3.SetRange(FA3."FA No.", "No.");
                if FA3.Find('-') then // BEGIN
                    "Date Of Acquisition" := FA3."Depreciation Starting Date";



                if Type = Type::"Fixed Asset" then
                    FA.Reset;
                FA.SetRange(FA."No.", "No.");
                if FA.Find('-') then begin
                    "Item description" := FA.Description;
                    "Serial No" := FA."Serial No.";
                    //get acquisition date from FA Ledger entry
                    FALedgerEntry.Reset;
                    FALedgerEntry.SetRange(FALedgerEntry."FA No.", "No.");
                    FALedgerEntry.SetRange(FALedgerEntry."FA Posting Type", FALedgerEntry."fa posting type"::"Acquisition Cost");
                    if FALedgerEntry.Find('-') then begin
                        "Date Of Acquisition" := FALedgerEntry."FA Posting Date";
                        "Value Of Purchase" := FALedgerEntry.Amount;
                    end;

                end else
                    FA1.Reset;
                FA1.SetRange(FA1."No.", "No.");
                if FA1.Find('-') then begin
                    "Item description" := FA1.Description;

                end;
            end;
        }
        field(50008; Type; Option)
        {
            OptionCaption = ' ,Item,Fixed Asset';
            OptionMembers = " ",Item,"Fixed Asset";
        }
        field(50009; "Reason for Disposal"; Text[150])
        {
            TableRelation = "Disposal Reasons".Description;
        }
        field(50010; "Date Of Acquisition"; Date)
        {
        }
        field(50011; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(50012; "Value Of Purchase"; Decimal)
        {
        }
        field(50013; Status; Option)
        {
            CalcFormula = lookup("Disposal Plan Table Headers".Status where("No." = field("Ref. No.")));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Posted,Pending Recommendation';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Posted,"Pending Recommendation";
        }
        field(50014; "Shortcut dimension 1 code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50015; "Shortcut dimension 2 code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50016; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center BR 2".Code;
        }
        field(50019; "Disposal Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Procurement,Departmental';
            OptionMembers = Procurement,Departmental;
        }
        field(50020; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Disposal Status"; Option)
        {
            CalcFormula = lookup("Disposal Plan Table Headers"."Disposal Status" where("No." = field("Ref. No.")));
            FieldClass = FlowField;
            OptionMembers = " Planning",CEO,"Tender Committee","Disposal implementation",Disposed;
        }
        field(50022; "Line Status"; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Posted,Pending Recommendation';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Posted,"Pending Recommendation";
        }
        field(50023; "Line Disposal Status"; Option)
        {
            OptionCaption = ' Planning,CEO,Tender Committee,Disposal implementation,Disposed';
            OptionMembers = " Planning",CEO,"Tender Committee","Disposal implementation",Disposed;
        }
        field(50024; "Disposal Comments"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Disposal Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Disposal Method Description"; Text[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disposal Method"."Disposal Description";
        }
        field(50027; "Salvage Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50028; "Estimated Shelf Life"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Rejection Comments"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Ref. No.", "Line No.", "Disposal Period")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        DisposalHeader.Reset;
        DisposalHeader.SetRange(DisposalHeader."No.", "Ref. No.");
        if DisposalHeader.Find('-') then begin
            Department := DisposalHeader."Shortcut dimension 1 code";
            County := DisposalHeader."Shortcut dimension 2 code";
            "Disposal Period" := DisposalHeader."Disposal Year";
        end;
    end;

    var
        DisposalHeader: Record "Disposal Plan Table Headers";
        FA: Record "Fixed Asset";
        FA1: Record Item;
        FA3: Record "FA Depreciation Book";
        FALedgerEntry: Record 5601;
}

