#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193878 "HR Car Loan Setup"
{
    Caption = 'HR Car Loan Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "code"; Code[10])
        {
            Caption = 'code';
        }
        field(2; "Loan type"; Text[50])
        {
            TableRelation = "HR Staff Loan Types".Code;
            Caption = 'Loan type';
        }
        field(3; New; Boolean)
        {
            Caption = 'New';
        }
        field(4; Installments; Integer)
        {
            Caption = 'Installments';
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
