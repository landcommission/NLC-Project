#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193802 "Contract Cycle Stage"
{
    DrillDownPageId = "Contract Cycle Stage List";
    LookupPageId = "Contract Cycle Stage List";
    Caption = 'Contract Cycle Stage';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Sales Cycle Code"; Code[10])
        {
            Caption = 'Contract Cycle Code';
            NotBlank = true;
            TableRelation = "Contract Cycle";
        }
        field(2; Stage; Integer)
        {
            BlankZero = true;
            Caption = 'Stage';
            MinValue = 1;
            NotBlank = true;
        }
        field(3; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(4; "Completed %"; Decimal)
        {
            Caption = 'Completed %';
            DecimalPlaces = 0 : 0;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5; "Activity Code"; Code[10])
        {
            Caption = 'Activity Code';
            TableRelation = Activity;
        }
        field(6; "Quote Required"; Boolean)
        {
            Caption = 'Quote Required';
        }
        field(7; "Allow Skip"; Boolean)
        {
            Caption = 'Allow Skip';
        }
        field(8; Comment; Boolean)
        {
            CalcFormula = exist("Rlshp. Mgt. Comment Line" where("Table Name" = const("Sales Cycle Stage"),
                                                                  "No." = field("Sales Cycle Code"),
                                                                  "Sub No." = field(Stage)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "No. of Opportunities"; Integer)
        {
            CalcFormula = count("Opportunity Entry" where(Active = const(true),
                                                           "Sales Cycle Code" = field("Sales Cycle Code"),
                                                           "Sales Cycle Stage" = field(Stage),
                                                           "Estimated Close Date" = field("Date Filter")));
            Caption = 'No. of Opportunities';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Estimated Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Opportunity Entry"."Estimated Value (LCY)" where(Active = const(true),
                                                                                 "Sales Cycle Code" = field("Sales Cycle Code"),
                                                                                 "Sales Cycle Stage" = field(Stage),
                                                                                 "Estimated Close Date" = field("Date Filter")));
            Caption = 'Estimated Value (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Calcd. Current Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Opportunity Entry"."Calcd. Current Value (LCY)" where(Active = const(true),
                                                                                      "Sales Cycle Code" = field("Sales Cycle Code"),
                                                                                      "Sales Cycle Stage" = field(Stage),
                                                                                      "Estimated Close Date" = field("Date Filter")));
            Caption = 'Calcd. Current Value (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Average No. of Days"; Decimal)
        {
            CalcFormula = average("Opportunity Entry"."Days Open" where(Active = const(false),
                                                                         "Sales Cycle Code" = field("Sales Cycle Code"),
                                                                         "Sales Cycle Stage" = field(Stage),
                                                                         "Estimated Close Date" = field("Date Filter")));
            Caption = 'Average No. of Days';
            DecimalPlaces = 0 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(14; "Date Formula"; DateFormula)
        {
            Caption = 'Date Formula';
        }
        field(15; "Contract Line Type"; Code[10])
        {
            NotBlank = true;
            TableRelation = "Contract Lines Types"."Contract Line Type";
            Caption = 'Contract Line Type';
        }
        field(16; "Payment Expected"; Option)
        {
            OptionMembers = " ",Yes,No;
            Caption = 'Payment Expected';
        }
        field(17; "%age of Payment"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Caption = '%age of Payment';
        }
    }

    keys
    {
        key(Key1; "Sales Cycle Code", Stage, "Contract Line Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
