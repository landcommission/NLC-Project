#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193638 "Cashier Link"
{
    Caption = 'Cashier Link';
    DataClassification = CustomerContent;
    // //DrillDownPageID = UnknownPage50121;
    // //LookupPageID = UnknownPage50121;

    fields
    {
        field(1; UserID; Code[20])
        {
            NotBlank = true;
            Caption = 'UserID';
            //TableRelation = Table2000000002.Field1;
        }
        field(2; "Bank Account No"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
            Caption = 'Bank Account No';
        }
        field(3; "Branch Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRANCHES'));
            Caption = 'Branch Code';
        }
    }

    keys
    {
        key(Key1; UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
