#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69014 "Salary Pointers"
{
    DrillDownPageId = "Salary pointers";
    LookupPageId = "Salary pointers";
    Caption = 'Salary Pointers';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Salary Pointer"; Code[10])
        {
            NotBlank = true;
            Caption = 'Salary Pointer';
        }
        field(2; "Basic Pay int"; Integer)
        {
            Caption = 'Basic Pay int';
        }
        field(3; "Basic Pay"; Decimal)
        {
            Caption = 'Basic Pay';
        }
        field(4; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
            Caption = 'Salary Scale';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(69600; Description1; Text[50])
        {
            Caption = 'Description1';
        }
        field(69601; "Min Salary"; Decimal)
        {
            Caption = 'Min Salary';
        }
        field(69602; "Max Salary"; Decimal)
        {
            Caption = 'Max Salary';
            trigger OnValidate()
            begin
                if "Min Salary" > "Max Salary" then
                    Error('The minimum salary cannot be greater than the maximum salary')
            end;
        }
        field(69603; "Gross Pay"; Decimal)
        {
            Caption = 'Gross Pay';
        }
        field(69604; "Employee Category"; Code[20])
        {
            Caption = 'Employee Category';
            //FieldClass = FlowField;
            //CalcFormula = lookup("Salary Scales"."Employee Category" where("Scale" = field("Salary Scale")));
            //TableRelation = "Employee Posting GroupX";
        }
        field(69605; Arrangement; Integer)
        {
            Caption = 'Arrangement';
        }

    }

    keys
    {
        key(Key1; "Salary Scale", "Salary Pointer")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

