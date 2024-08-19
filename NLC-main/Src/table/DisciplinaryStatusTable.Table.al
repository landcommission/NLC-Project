#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69517 "Disciplinary Status Table"
{
    DrillDownPageId = "Disciplinary Status";
    LookupPageId = "Disciplinary Status";
    Caption = 'Disciplinary Status Table';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Disciplinary Status"; Code[30])
        {
            Caption = 'Disciplinary Status';
        }
        field(2; "Deduction Code"; Code[30])
        {
            Caption = 'Deduction Code';
            //TableRelation = DeductionsX.Code;
        }
        field(3; "Deductions Based On"; Code[30])
        {
            Caption = 'Deductions Based On';
        }
        field(4; "Computation Method"; Option)
        {
            OptionCaption = 'Percentage,Flat Amount,Formula';
            OptionMembers = Percentage,"Flat Amount",Formula;
            Caption = 'Computation Method';
        }
        field(5; Percentage; Decimal)
        {
            Caption = 'Percentage';
        }
        field(6; Formula; Text[200])
        {
            Caption = 'Formula';
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(8; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(9; "Duration(Days)"; DateFormula)
        {
            Caption = 'Duration(Days)';
        }
        field(10; Type; Option)
        {
            OptionCaption = ',Employee,Payroll';
            OptionMembers = ,Employee,Payroll;
            Caption = 'Type';
        }

    }

    keys
    {
        key(Key1; "Disciplinary Status")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

