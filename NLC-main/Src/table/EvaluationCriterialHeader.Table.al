#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193827 "Evaluation Criterial Header"
{
    Caption = 'Evaluation Criterial Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Evaluation Year"; Integer)
        {
            TableRelation = "Evaluation Year";
            Caption = 'Evaluation Year';
        }
        field(3; "Actual Weight Assigned"; Decimal)
        {
            Caption = 'Actual Weight Assigned';
        }
        field(4; Description; Code[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
