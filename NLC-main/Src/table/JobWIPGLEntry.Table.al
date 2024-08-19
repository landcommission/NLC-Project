#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193745 "Job-WIP G/L Entry"
{
    Caption = 'Job WIP G/L Entry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Jobs;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account";
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(6; "WIP Entry Amount"; Decimal)
        {
            Caption = 'WIP Entry Amount';
        }
        field(7; "Job Posting Group"; Code[10])
        {
            Caption = 'Job Posting Group';
            TableRelation = "Job-Posting Group";
        }
        field(8; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'WIP Sales,WIP Costs,Recognized Costs,Recognized Sales,Accrued Costs,Accrued Sales';
            OptionMembers = "WIP Sales","WIP Costs","Recognized Costs","Recognized Sales","Accrued Costs","Accrued Sales";
        }
        field(9; "G/L Bal. Account No."; Code[20])
        {
            Caption = 'G/L Bal. Account No.';
            TableRelation = "G/L Account";
        }
        field(10; "WIP Method Used"; Option)
        {
            Caption = 'WIP Method Used';
            Editable = false;
            OptionCaption = ' ,Cost Value,Sales Value,Cost of Sales,Percentage of Completion,Completed Contract';
            OptionMembers = " ","Cost Value","Sales Value","Cost of Sales","Percentage of Completion","Completed Contract";
        }
        field(12; "WIP Posting Date"; Date)
        {
            Caption = 'WIP Posting Date';
        }
        field(13; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(14; "G/L Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'G/L Entry No.';
            TableRelation = "G/L Entry";
        }
        field(15; Reversed; Boolean)
        {
            Caption = 'Reversed';
        }
        field(17; "WIP Transaction No."; Integer)
        {
            Caption = 'WIP Transaction No.';
        }
        field(18; "Reverse Date"; Date)
        {
            Caption = 'Reverse Date';
        }
        field(19; "Job Complete"; Boolean)
        {
            Caption = 'Job Complete';
        }
        field(21; "WIP Schedule (Total Cost)"; Decimal)
        {
            //AutoFormatType = 1;
            //BlankZero = true;
            Caption = 'WIP Schedule (Total Cost)';
            Editable = false;
        }
        field(22; "WIP Schedule (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'WIP Schedule (Total Price)';
            Editable = false;
        }
        field(23; "WIP Usage (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'WIP Usage (Total Cost)';
            Editable = false;
        }
        field(24; "WIP Usage (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'WIP Usage (Total Price)';
            Editable = false;
        }
        field(25; "WIP Contract (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'WIP Contract (Total Cost)';
            Editable = false;
        }
        field(26; "WIP Contract (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'WIP Contract (Total Price)';
            Editable = false;
        }
        field(27; "WIP (Invoiced Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'WIP (Invoiced Price)';
            Editable = false;
        }
        field(28; "WIP (Invoiced Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'WIP (Invoiced Cost)';
            Editable = false;
        }
        field(29; "WIP Posting Date Filter"; Text[250])
        {
            Caption = 'WIP Posting Date Filter';
            Editable = false;
        }
        field(30; "WIP Planning Date Filter"; Text[250])
        {
            Caption = 'WIP Planning Date Filter';
            Editable = false;
        }
        field(60; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(61; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Job No.", Reversed, "Job Complete", Type)
        {
            SumIndexFields = "WIP Entry Amount";
        }
        key(Key3; "Document No.", "Posting Date") { }
        key(Key4; "WIP Transaction No.") { }
    }

    fieldgroups { }

}
