#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193677 "Cash Purchase ass. doc."
{
    Caption = 'Cash Purchase ass. doc.';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            TableRelation = "Payments Header" where("Payment Type" = filter("Cash Purchase"));
            Caption = 'No.';
        }
        field(2; "Order No"; Code[20])
        {
            TableRelation = "Purchase Header"."No." where(Status = filter(Released),
                                                           "Document Type" = filter(Order));
            Caption = 'Order No';
        }
        field(3; "Customer No"; Code[20])
        {
            TableRelation = Customer;
            Caption = 'Customer No';
        }
    }

    keys
    {
        key(Key1; "No.", "Order No", "Customer No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
