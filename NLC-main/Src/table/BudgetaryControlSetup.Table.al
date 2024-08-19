#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193612 "Budgetary Control Setup"
{
    Caption = 'Budgetary Control Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Current Budget Code"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
            Caption = 'Current Budget Code';
        }
        field(3; "Current Budget Start Date"; Date)
        {
            Caption = 'Current Budget Start Date';
        }
        field(4; "Current Budget End Date"; Date)
        {
            Caption = 'Current Budget End Date';
        }
        field(5; "Budget Dimension 1 Code"; Code[20])
        {
            Caption = 'Budget Dimension 1 Code';
            TableRelation = Dimension;

        }
        field(6; "Budget Dimension 2 Code"; Code[20])
        {
            Caption = 'Budget Dimension 2 Code';
            TableRelation = Dimension;

        }
        field(7; "Budget Dimension 3 Code"; Code[20])
        {
            Caption = 'Budget Dimension 3 Code';
            TableRelation = Dimension;

        }
        field(8; "Budget Dimension 4 Code"; Code[20])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;

        }
        field(9; "Budget Dimension 5 Code"; Code[20])
        {
            Caption = 'Budget Dimension 5 Code';
            TableRelation = Dimension;

        }
        field(10; "Budget Dimension 6 Code"; Code[20])
        {
            Caption = 'Budget Dimension 6 Code';
            TableRelation = Dimension;

        }
        field(11; "Analysis View Code"; Code[20])
        {
            TableRelation = "Analysis View".Code;
            Caption = 'Analysis View Code';
        }
        field(12; "Dimension 1 Code"; Code[20])
        {
            Caption = 'Dimension 1 Code';
            TableRelation = Dimension;

        }
        field(13; "Dimension 2 Code"; Code[20])
        {
            Caption = 'Dimension 2 Code';
            TableRelation = Dimension;

        }
        field(14; "Dimension 3 Code"; Code[20])
        {
            Caption = 'Dimension 3 Code';
            TableRelation = Dimension;

        }
        field(15; "Dimension 4 Code"; Code[20])
        {
            Caption = 'Dimension 4 Code';
            TableRelation = Dimension;

        }
        field(16; Mandatory; Boolean)
        {
            Caption = 'Mandatory';
        }
        field(17; "Allow OverExpenditure"; Boolean)
        {
            Caption = 'Allow OverExpenditure';
        }
        field(18; "Current Item Budget"; Code[10])
        {
            TableRelation = "Item Budget Name".Name;
            Caption = 'Current Item Budget';
        }
        field(19; "Budget Check Criteria"; Option)
        {
            OptionCaption = 'Current Month,Whole Year';
            OptionMembers = "Current Month","Whole Year";
            Caption = 'Budget Check Criteria';
        }
        field(20; "Actual Source"; Option)
        {
            OptionCaption = 'G/L Entry,Analysis View Entry';
            OptionMembers = "G/L Entry","Analysis View Entry";
            Caption = 'Actual Source';
            trigger OnValidate()
            begin
                if "Actual Source" = "Actual Source"::"G/L Entry" then begin
                    if not Confirm('Changing to Actual Source type G/L Entry will result in deletion of all Actuals Continue?', true, false) then
                        Error('Change to G/L Entry source cancelled');
                    "Analysis View Code" := '';
                    "Dimension 1 Code" := '';
                    "Dimension 2 Code" := '';
                    "Dimension 3 Code" := '';
                    "Dimension 4 Code" := '';
                    Modify();
                end;
            end;
        }
        field(21; "Partial Budgetary Check"; Boolean)
        {
            Caption = 'Partial Budgetary Check';
        }
        field(22; "Use Totaling Account"; Boolean)
        {
            Caption = 'Use Totaling Account';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
