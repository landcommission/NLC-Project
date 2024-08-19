#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193811 "Tender Specifications"
{
    Caption = 'Tender Specifications';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tender No"; Code[20])
        {
            TableRelation = Tender."Tender ID";
            Caption = 'Tender No';
        }
        field(3; Specification; Text[250])
        {
            NotBlank = true;
            Caption = 'Specification';
        }
        field(4; "Notification Header"; Boolean)
        {
            Caption = 'Notification Header';
        }
        field(50000; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.';
        }
    }

    keys
    {
        key(Key1; "Tender No", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
