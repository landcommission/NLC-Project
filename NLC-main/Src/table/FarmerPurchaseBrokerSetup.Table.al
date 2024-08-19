#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193611 "Farmer Purchase Broker Setup"
{
    Caption = 'Farmer Purchase Broker Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Witholding Tax Rate (%)"; Decimal)
        {
            Editable = false;
            Caption = 'Witholding Tax Rate (%)';
        }
        field(2; "Witholding Tax Account"; Code[20])
        {
            Editable = false;
            NotBlank = true;
            Caption = 'Witholding Tax Account';
            //TableRelation = Table0;
        }
        field(3; "Brokerage Charge Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Item Charge"."No.";
            Caption = 'Brokerage Charge Code';
        }
        field(4; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(5; "Broker Rate in KES Per Bag"; Decimal)
        {
            Caption = 'Broker Rate in KES Per Bag';
        }
        field(6; "Min. Brokerage Amnt Taxable"; Decimal)
        {
            Caption = 'Min. Brokerage Amnt Taxable';
        }
        field(7; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tariff Codes".Code;
            Caption = 'Withholding Tax Code';
            trigger OnValidate()
            begin
                TCode.Reset();
                TCode.Get("Withholding Tax Code");
                "Witholding Tax Rate (%)" := TCode.Percentage;
                "Witholding Tax Account" := TCode."Account No.";
            end;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        TCode: Record "Tariff Codes";
}
