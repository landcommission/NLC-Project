#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 52193494 "HR Asset Transfer Header"
{

    fields
    {
        field(1; "No."; Code[50])
        {
            Editable = true;
        }
        field(2; "Document Date"; Date)
        {
            Editable = false;
        }
        field(5; "Issuing Admin/Asst"; Code[20])
        {
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            begin

                hremployee.Reset;
                if hremployee.Get("Issuing Admin/Asst") then begin
                    "Issuing Admin/Asst Name" := hremployee."First Name" + ' ' + hremployee."Last Name";
                end else begin
                    "Issuing Admin/Asst Name" := '';

                end;
            end;
        }
        field(6; "Issuing Admin/Asst Name"; Text[50])
        {
        }
        field(7; "Document Type"; Option)
        {
            OptionCaption = 'Asset Transfer,Asset Allocation,Asset Incidence';
            OptionMembers = "Asset Transfer","Asset Allocation","Asset Incidence";
        }
        field(8; "Currency Code"; Code[10])
        {
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Canceled,Posted,Pending Recommendation,Rejected,Issued';
            OptionMembers = Open,"Pending Approval",Approved,Canceled,Posted,"Pending Recommendation",Rejected,Issued;
        }
        field(11; Transfered; Boolean)
        {
        }
        field(12; "Date Transfered"; Date)
        {
        }
        field(13; "Transfered By"; Code[20])
        {
        }
        field(14; "Time Posted"; Time)
        {
        }
        field(50000; "User ID"; Code[50])
        {
            Editable = false;
        }
        field(50001; "Responsibility Center"; Code[50])
        {
            TableRelation = "Responsibility Center BR 2".Code;
        }
        field(50002; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Issue,Return,Transfer,Exchange,Allocation,Incidence';
            OptionMembers = " ",Issue,Return,Transfer,Exchange,Allocation,Incidence;
        }
        field(50003; Recommender; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin

                /*
              IF Recommender = "Employee No" THEN
              ERROR('It is not possible for an Employee to Recommende him/herself');
                */

                /*
                IF hremployee.GET(Recommender) THEN
                BEGIN
                   "Recommender Name":=hremployee."Full Name";
                END;
                
                IF Recommender='' THEN
                BEGIN
                  "Recommender Name":='';
                END;
                */

            end;
        }
        field(50004; "Recommender Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; Store; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;

            trigger OnValidate()
            begin
                /*
                ReqLines.RESET;
                ReqLines.SETRANGE(ReqLines."Requistion No","No.");
                IF ReqLines.FIND('-') THEN BEGIN
                REPEAT
                  ReqLines."Issuing Store":="Issuing Store";
                UNTIL ReqLines.NEXT=0;
                END;
                  */

            end;
        }
        field(50006; Rejected; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Rejected Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Rejection Reason"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; Received; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Received Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Received By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Rejected By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; Allocated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50015; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50016; "County Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Directorate Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50018; Returned; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Returned Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Returned By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; Transferred; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Transferred Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Transferred By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "User Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;
        }
        field(50025; "Date Signed"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin


        if "No." = '' then begin
            if "Document Type" = "document type"::"Asset Allocation" then begin
                fasetup.Get;
                fasetup.TestField(fasetup."Asset Allocation Nos");
                NoSeriesMgt.InitSeries(fasetup."Asset Allocation Nos", xRec."No. Series", 0D, "No.", "No. Series");
            end;

            if "Document Type" = "document type"::"Asset Incidence" then begin
                fasetup.Get;
                fasetup.TestField(fasetup."Asset Incidence Nos");
                NoSeriesMgt.InitSeries(fasetup."Asset Incidence Nos", xRec."No. Series", 0D, "No.", "No. Series");
            end;

            if "Document Type" = "document type"::"Asset Transfer" then begin
                if Type = Type::Issue then begin
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Issue");
                    NoSeriesMgt.InitSeries(fasetup."Asset Issue", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;

            if "Document Type" = "document type"::"Asset Transfer" then begin
                if Type = Type::Transfer then begin
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Transfer Nos.");
                    NoSeriesMgt.InitSeries(fasetup."Asset Transfer Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;

            if "Document Type" = "document type"::"Asset Transfer" then begin
                if Type = Type::Return then begin
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Return Nos.");
                    NoSeriesMgt.InitSeries(fasetup."Asset Return Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;
        end;

        "Document Date" := Today;
        "User ID" := UserId;
        "Responsibility Center" := 'SCM';
        Store := 'MAIN'
    end;

    var
        fasetup: Record "FA Setup";
        hremployee: Record 52193433;
        fasset: Record "Fixed Asset";
        NoSeriesMgt: Codeunit 396;
        DimValue: Record 349;
}

