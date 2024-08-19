#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193796 Contracts
{
    DrillDownPageId = "Contracts list";
    LookupPageId = "Contracts list";
    Caption = 'Contracts';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract No"; Code[20])
        {
            Caption = 'Contract No';
            trigger OnValidate()
            begin
                if "Contract No" <> xRec."Contract No" then begin
                    PurchSetup.Get();
                    NoSeriesMgt.TestManual(PurchSetup."Contract No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Type; Option)
        {
            OptionCaption = ' ,Vendor,Customer';
            OptionMembers = " ",Vendor,Customer;
            Caption = 'Type';
        }
        field(3; "Contractor No"; Code[60])
        {
            TableRelation = if (Type = const(Customer)) Customer."No."
            else
            if (Type = const(Vendor)) Vendor."No.";
            Caption = 'Contractor No';
            trigger OnValidate()
            begin

                Name := '';

                if Type in [Type::Customer, Type::Vendor]
                then
                    case Type of
                        Type::Customer:
                            begin
                                Cust.Get("Contractor No");
                                Name := Cust.Name;
                                Address := Cust.Address;
                                "Tel No." := Cust."Phone No.";
                                //"Contact Person":=Cust.Contact;
                            end;
                        Type::Vendor:
                            begin
                                Vend.Get("Contractor No");
                                Name := Vend.Name;
                                Address := Vend.Address;
                                "Tel No." := Vend."Phone No.";
                                // "Contact Person":=Vend.Contact;
                            end;
                    end;
            end;
        }
        field(4; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(5; Address; Code[30])
        {
            Caption = 'Address';
        }
        field(6; "Tel No."; Code[30])
        {
            Caption = 'Tel No.';
        }
        field(7; "Contact Person"; Time)
        {
            Caption = 'Contact Person';
        }
        field(8; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(9; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(10; Status; Option)
        {
            OptionCaption = ' ,Active,Renewed,Closed';
            OptionMembers = " ",Active,Renewed,Closed;
            Caption = 'Status';
        }
        field(11; Duration; DateFormula)
        {
            Caption = 'Duration';
        }
        field(12; "Contract Type"; Code[20])
        {
            TableRelation = "Contract Types";
            Caption = 'Contract Type';
        }
        field(13; "Contract Line"; Code[20])
        {
            TableRelation = "Contract Lines" where("Contract Type" = field("Contract Type"));
            Caption = 'Contract Line';
        }
        field(14; "Contract Value"; Decimal)
        {
            Caption = 'Contract Value';
        }
        field(15; Balance; Decimal)
        {
            Caption = 'Balance';
        }
        field(16; "Asset/Service No"; Code[20])
        {
            Caption = 'Asset/Service No';
        }
        field(17; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
        field(18; "Contract Cycle"; Code[20])
        {
            TableRelation = "Contract Cycle".Code;
            Caption = 'Contract Cycle';
        }
        field(19; "Renewal No"; Code[20])
        {
            Caption = 'Renewal No';
        }
        field(20; "Line Type"; Option)
        {
            OptionCaption = ' ,Fixed Asset,Services,Transport,Services Provided';
            OptionMembers = " ","Fixed Asset",Services,Transport,"Services Provided";
            Caption = 'Line Type';
        }
        field(21; "Review Date"; Date)
        {
            Caption = 'Review Date';
        }
        field(22; "Contract Line Type"; Code[20])
        {
            TableRelation = "Contract Lines Types";
            Caption = 'Contract Line Type';
        }
        field(23; "Payment Terms"; Option)
        {
            OptionCaption = ' ,Pre-Paid,Post-Paid';
            OptionMembers = " ","Pre-Paid","Post-Paid";
            Caption = 'Payment Terms';
        }
        field(24; "Assigned To"; Code[20])
        {
            TableRelation = User;
            Caption = 'Assigned To';
        }
        field(25; "Amount Paid"; Decimal)
        {
            Caption = 'Amount Paid';
        }
        field(26; "Amount Sales"; Decimal)
        {
            Caption = 'Amount Sales';
        }
        field(27; Remarks; Text[30])
        {
            Caption = 'Remarks';
        }
        field(28; Reasons; Text[100])
        {
            Caption = 'Reasons';
        }
        field(29; Advocates; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'Advocates';
        }
        field(30; "Quantum of Claim"; Decimal)
        {
            Caption = 'Quantum of Claim';
        }
        field(31; "Review Interval"; Code[20])
        {
            Caption = 'Review Interval';
        }
        field(32; "Next Review Date"; Date)
        {
            Caption = 'Next Review Date';
        }
        field(33; "Advocate Name"; Text[30])
        {
            Caption = 'Advocate Name';
        }
        field(34; "Last Review Date"; Date)
        {
            Caption = 'Last Review Date';
        }
        field(35; Comment; Boolean)
        {
            Caption = 'Comment';
        }
        field(50000; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

        }
        field(50001; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

        }
    }

    keys
    {
        key(Key1; "Contract No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Contract No" = '' then begin
            PurchSetup.Get();
            PurchSetup.TestField(PurchSetup."Contract No");
            NoSeriesMgt.InitSeries(PurchSetup."Contract No", xRec."No. Series", 0D, "Contract No", "No. Series");
        end;
    end;

    var
        Cust: Record Customer;
        Vend: Record Vendor;
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
