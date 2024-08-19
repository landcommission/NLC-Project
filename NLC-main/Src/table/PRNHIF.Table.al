#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193524 "PR NHIF"
{
    Caption = 'PR NHIF';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tier Code"; Code[10])
        {
            SqlDataType = Integer;
            Caption = 'Tier Code';
        }
        field(2; "NHIF Tier"; Decimal)
        {
            Caption = 'NHIF Tier';
        }
        field(3; Amount; Decimal)
        {
            MinValue = 0;
            Caption = 'Amount';
        }
        field(4; "Lower Limit"; Decimal)
        {
            Caption = 'Lower Limit';
        }
        field(5; "Upper Limit"; Decimal)
        {
            Caption = 'Upper Limit';
        }
        field(6; "Order"; Integer)
        {
            Caption = 'Order';
        }
    }

    keys
    {
        key(Key1; "Tier Code")
        {
            Clustered = true;
        }
        key(Key2; "Order") { }
    }

    fieldgroups { }


    var
        Text001: Label 'Deletion not allowed';
}
