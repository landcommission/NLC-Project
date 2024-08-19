#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193443 "HR Company Target Line"
{
    Caption = 'HR Company Target Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(2; "Appraisal No"; Code[50])
        {
            TableRelation = "HR Individual Targets Header"."Appraisal No";
            Caption = 'Appraisal No';
        }
        field(3; "Perspective Code"; Integer)
        {
            TableRelation = "HR Perspectives Setup"."Qualification Type";
            Caption = 'Perspective Code';

        }
        /* field(4;"Perspective Description";Text[250])
        {
            CalcFormula = lookup("HR Perspectives Setup".Code where ("Qualification Type"=field("Perspective Code")));
            FieldClass = FlowField;
        } */
        field(5; "Targeted Score"; Decimal)
        {
            Caption = 'Targeted Score';
        }
        /* field(6;"Perspective type";Option)
        {
            CalcFormula = lookup("HR Perspectives Setup".Field3 where ("Qualification Type"=field("Perspective Code")));
            FieldClass = FlowField;
            OptionCaption = ' ,Service Delivery,Financial Stewardship,Training and Development,Customer and Sales';
            OptionMembers = " ","Service Delivery","Financial Stewardship","Training and Development","Customer and Sales";
        } */
        field(7; "Achieved Score"; Decimal)
        {
            Caption = 'Achieved Score';
        }
        field(8; "Unachieved Targets"; Decimal)
        {
            Caption = 'Unachieved Targets';
        }
        field(9; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(10; "Review Line Reference"; Text[30])
        {
            Caption = 'Review Line Reference';
        }
    }

    keys
    {
        key(Key1; "Line No", "Appraisal No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
