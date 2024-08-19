#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193532 prInsurancePolicies
{
    Caption = 'prInsurancePolicies';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[10])
        {
            Caption = 'Employee Code';
            //TableRelation = Table52000.Field1;
        }
        field(2; "Policy Number"; Code[50])
        {
            NotBlank = true;
            Caption = 'Policy Number';
        }
        field(3; "Insurance Code"; Code[10])
        {
            TableRelation = "prInstitutional Membership"."Institution No";
            Caption = 'Insurance Code';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; "Deduct premium"; Boolean)
        {
            Caption = 'Deduct premium';
        }
        field(6; balance; Decimal)
        {
            Caption = 'balance';
        }
        field(7; lumpsumitems; Boolean)
        {
            Description = 'lump sum the values';
            Caption = 'lumpsumitems';
        }
        field(8; "Is Insurance policy"; Boolean)
        {
            Description = 'True if its an insurance policy';
            Caption = 'Is Insurance policy';
        }
        field(9; "Transaction Code"; Code[10])
        {
            Caption = 'Transaction Code';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Policy Number", "Insurance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
