#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193801 "Contract Cycle"
{
    DrillDownPageId = "Contract Cycle";
    LookupPageId = "Contract Cycle";
    Caption = 'Contract Cycle';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "Probability Calculation"; Option)
        {
            OptionCaption = 'Multiply,Add,Chances of Success %,Completed %';
            OptionMembers = Multiply,Add,"Chances of Success %","Completed %";
            Caption = 'Probability Calculation';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(5; "No. of Opportunities"; Integer)
        {
            Caption = 'No. of Opportunities';
        }
        field(6; "Estimated Value (LCY)"; Decimal)
        {
            Caption = 'Estimated Value (LCY)';
        }
        field(7; "Calcd. Current Value (LCY)"; Decimal)
        {
            Caption = 'Calcd. Current Value (LCY)';
        }
        field(8; Comment; Boolean)
        {
            Caption = 'Comment';
        }
        field(9; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
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
