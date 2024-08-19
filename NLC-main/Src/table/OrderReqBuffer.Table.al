#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193813 "Order/Req Buffer"
{
    Caption = 'Order/Req Buffer';
    DataClassification = CustomerContent;
    fields
    {
        field(1; RequisitionNo; Code[20])
        {
            Caption = 'RequisitionNo';
        }
        field(2; TotalsonOrder; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document No." = field(OrderNo)));
            FieldClass = FlowField;
            Caption = 'TotalsonOrder';
            Editable = false;
        }
        field(3; TotalonReq; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document No." = field(RequisitionNo)));
            FieldClass = FlowField;
            Caption = 'TotalonReq';
            Editable = false;
        }
        field(4; UserID; Code[20])
        {
            Caption = 'UserID';
        }
        field(5; OrderNo; Code[20])
        {
            Caption = 'OrderNo';
        }
    }

    keys
    {
        key(Key1; RequisitionNo)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
