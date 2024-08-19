#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193795 "Temp Budget Alloc G/L"
{
    Caption = 'Temp Budget Alloc G/L';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            Editable = false;
            NotBlank = true;
            TableRelation = "G/L Budget Name".Name;
        }
        field(2; Description; Text[80])
        {
            CalcFormula = lookup("G/L Budget Name".Description where(Name = field(Name)));
            Caption = 'Description';
            FieldClass = FlowField;
            Editable = false;
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(4; "Budget Dimension 1 Code"; Code[20])
        {
            CaptionClass = GetCaptionClass(1);
            Caption = 'Budget Dimension 1 Code';
            TableRelation = "Dimension Value".Code;
        }
        field(5; "Budget Dimension 2 Code"; Code[20])
        {
            CaptionClass = GetCaptionClass(2);
            Caption = 'Budget Dimension 2 Code';
            TableRelation = "Dimension Value".Code;
        }
        field(6; "Budget Dimension 3 Code"; Code[20])
        {
            CaptionClass = GetCaptionClass(3);
            Caption = 'Budget Dimension 3 Code';
            TableRelation = "Dimension Value".Code;
        }
        field(7; "Budget Dimension 4 Code"; Code[20])
        {
            CaptionClass = GetCaptionClass(4);
            Caption = 'Budget Dimension 4 Code';
            TableRelation = "Dimension Value".Code;
        }
        field(8; "Budget Dimension 5 Code"; Code[20])
        {
            Caption = 'Budget Dimension 5 Code';
            TableRelation = "Dimension Value".Code;
        }
        field(9; "Budget Dimension 6 Code"; Code[20])
        {
            Caption = 'Budget Dimension 6 Code';
            TableRelation = "Dimension Value".Code;
        }
        field(10; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(11; "Period Type"; Option)
        {
            OptionMembers = Daily,Weekly,Monthly,Quarterly,Annually;
            Caption = 'Period Type';
        }
        field(12; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(13; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'G/L Account';
        }
        field(14; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(15; Overwrite; Boolean)
        {
            Caption = 'Overwrite';
        }
        field(16; "Business Unit"; Code[20])
        {
            TableRelation = "Business Unit".Code;
            Caption = 'Business Unit';
        }
        field(17; "User ID"; Code[20])
        {
            Caption = 'User ID';
        }
        field(18; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(19; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

        }
        field(20; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

        }
        field(21; Processed; Boolean)
        {
            Caption = 'Processed';
        }
        field(22; "Analysis Area"; Option)
        {
            OptionMembers = Sales,Purchases;
            Caption = 'Analysis Area';
        }
        field(23; "Type of Entry"; Option)
        {
            NotBlank = true;
            OptionMembers = " ",Debit,Credit;
            Caption = 'Type of Entry';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        GLBudgetName: Record "G/L Budget Name";
        Text000: Label 'The dimension value %1 has not been set up for dimension %2.';
        Text001: Label '1,5,,Budget Dimension 1 Code';
        Text002: Label '1,5,,Budget Dimension 2 Code';
        Text003: Label '1,5,,Budget Dimension 3 Code';


    procedure GetCaptionClass(BudgetDimType: Integer): Text[250]
    begin
        if GLBudgetName.Get(Name) then
            case BudgetDimType of
                1:
                    begin
                        if GLBudgetName."Budget Dimension 1 Code" <> '' then
                            exit('1,5,' + GLBudgetName."Budget Dimension 1 Code");
                        exit(Text001);
                    end;
                2:
                    begin
                        if GLBudgetName."Budget Dimension 2 Code" <> '' then
                            exit('1,5,' + GLBudgetName."Budget Dimension 2 Code");
                        exit(Text002);
                    end;
                3:
                    begin
                        if GLBudgetName."Budget Dimension 3 Code" <> '' then
                            exit('1,5,' + GLBudgetName."Budget Dimension 3 Code");
                        exit(Text003);
                    end;
                4:
                    begin
                        if GLBudgetName."Budget Dimension 4 Code" <> '' then
                            exit('1,5,' + GLBudgetName."Budget Dimension 4 Code");
                        exit(Text003);
                    end;

            end;
    end;
}
