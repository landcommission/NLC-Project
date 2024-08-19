#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193718 "PR Employees Salary Scale1"
{
    Caption = 'PR Employees Salary Scale1';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Grade; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade';
        }
        field(2; "Basic Pay 1 - Minimum"; Decimal)
        {
            Caption = 'Basic Pay 1 - Minimum';
        }
        field(3; "IA to BP 2"; Decimal)
        {
            Description = 'Incremental Amount to Basic Pay 2';
            Caption = 'IA to BP 2';
            trigger OnValidate()
            begin
                "Basic Pay 2" := "Basic Pay 1 - Minimum" + "IA to BP 2";
            end;
        }
        field(4; "Basic Pay 2"; Decimal)
        {
            Caption = 'Basic Pay 2';
        }
        field(5; "IA to BP 3"; Decimal)
        {
            Caption = 'IA to BP 3';
            trigger OnValidate()
            begin
                "Basic Pay 3" := "Basic Pay 2" + "IA to BP 3";
            end;
        }
        field(6; "Basic Pay 3"; Decimal)
        {
            Caption = 'Basic Pay 3';
        }
        field(7; "IA to BP 4"; Decimal)
        {
            Caption = 'IA to BP 4';
            trigger OnValidate()
            begin
                "Basic Pay 4" := "Basic Pay 3" + "IA to BP 4";
            end;
        }
        field(8; "Basic Pay 4"; Decimal)
        {
            Caption = 'Basic Pay 4';
        }
        field(9; "IA to BP 5"; Decimal)
        {
            Caption = 'IA to BP 5';
            trigger OnValidate()
            begin
                "Basic Pay 5" := "Basic Pay 4" + "IA to BP 5";
            end;
        }
        field(10; "Basic Pay 5"; Decimal)
        {
            Caption = 'Basic Pay 5';
        }
        field(11; "IA to BP 6"; Decimal)
        {
            Caption = 'IA to BP 6';
            trigger OnValidate()
            begin
                "Basic Pay 6" := "Basic Pay 5" + "IA to BP 6";
            end;
        }
        field(12; "Basic Pay 6"; Decimal)
        {
            Caption = 'Basic Pay 6';
        }
        field(13; "IA to BP 7"; Decimal)
        {
            Caption = 'IA to BP 7';
            trigger OnValidate()
            begin
                "Basic Pay 7" := "Basic Pay 6" + "IA to BP 7";
            end;
        }
        field(14; "Basic Pay 7"; Decimal)
        {
            Caption = 'Basic Pay 7';
        }
        field(15; "IA to BP 8"; Decimal)
        {
            Caption = 'IA to BP 8';
            trigger OnValidate()
            begin
                "Basic Pay 8" := "Basic Pay 7" + "IA to BP 8";
            end;
        }
        field(16; "Basic Pay 8"; Decimal)
        {
            Caption = 'Basic Pay 8';
        }
        field(17; "IA BP 9"; Decimal)
        {
            Caption = 'IA BP 9';
            trigger OnValidate()
            begin
                "Basic Pay 9" := "Basic Pay 8" + "IA BP 9";
            end;
        }
        field(18; "Basic Pay 9"; Decimal)
        {
            Caption = 'Basic Pay 9';
        }
        field(19; "IA to BP 10"; Decimal)
        {
            Caption = 'IA to BP 10';
            trigger OnValidate()
            begin
                "Basic Pay 10" := "Basic Pay 9" + "IA to BP 10";
            end;
        }
        field(20; "Basic Pay 10"; Decimal)
        {
            Caption = 'Basic Pay 10';
        }
        field(21; "Maximum Basic Pay"; Decimal)
        {
            Caption = 'Maximum Basic Pay';
            trigger OnValidate()
            begin
                "Basic Pay 10" := "Basic Pay 9" + "IA to BP 10";
            end;
        }
        field(22; "Job Group Description"; Text[250])
        {
            Caption = 'Job Group Description';
        }
    }

    keys
    {
        key(Key1; Grade)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
