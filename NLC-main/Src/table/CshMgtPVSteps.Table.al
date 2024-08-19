#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193647 "CshMgt PV Steps"
{
    DrillDownPageId = Requisitions;
    LookupPageId = Requisitions;
    Caption = 'CshMgt PV Steps';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Description = 'Stores the code of the status in the database';
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Description = 'Stores the description of the status in the database';
            Caption = 'Description';
        }
        field(3; Users; Integer)
        {
            CalcFormula = count("W/P Budget Buffer" where("Workplan Code" = field(Code)));
            Description = 'Stores the number of user for the steps';
            FieldClass = FlowField;
            Caption = 'Users';
            Editable = false;
        }
        field(67; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Letter of Credit","Custom 3","Custom 4","Custom 5";
            Caption = 'Pay Mode';
        }
        field(68; "Default Account"; Code[20])
        {
            Description = 'Stores the default account in the database';
            TableRelation = "Bank Account"."No.";
            Caption = 'Default Account';
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
