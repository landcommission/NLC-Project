#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193650 "Workplan Activities"
{
    DataCaptionFields = "Activity Code", "Workplan Code";
    DrillDownPageId = "Workplan Activities";
    LookupPageId = "Workplan Activities";
    Caption = 'Workplan Activities';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Activity Code"; Code[20])
        {
            Caption = 'Activity Code';
        }
        field(2; "Activity Description"; Text[250])
        {
            Caption = 'Activity Description';
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(4; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(5; Totaling; Text[250])
        {
            Caption = 'Totaling';
            TableRelation = "Workplan Activities";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

        }
        field(6; "Business Unit Filter"; Code[10])
        {
            Caption = 'Business Unit Filter';
            FieldClass = FlowFilter;
            TableRelation = "Business Unit";
        }
        field(7; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(10; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(11; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(12; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(13; "Workplan Code"; Code[20])
        {
            TableRelation = Workplan."Workplan Code" where(Blocked = const(false));
            Caption = 'Workplan Code';
        }
        field(14; "Converted to Budget"; Boolean)
        {
            Caption = 'Converted to Budget';
        }
        field(15; "Strategic Plan Code"; Code[20])
        {
            Caption = 'Strategic Plan Code';

        }
        field(16; "Strategic Plan Desc"; Text[100])
        {
            Caption = 'Strategic Plan Desc';
        }
        field(17; "Medium term Plan Code"; Code[20])
        {
            Caption = 'Medium term Plan Code';

        }
        field(18; "Medium term  Plan Desc"; Text[100])
        {
            Caption = 'Medium term  Plan Desc';
        }
        field(19; "PC Code"; Code[20])
        {
            Caption = 'PC Code';

        }
        field(20; "PC Name"; Text[100])
        {
            Caption = 'PC Name';
        }
        field(21; "Workplan Description"; Text[150])
        {
            CalcFormula = lookup(Workplan."Workplan Description" where("Workplan Code" = field("Activity Code")));
            FieldClass = FlowField;
            Caption = 'Workplan Description';
            Editable = false;
        }
        field(22; "Amount to Transfer"; Decimal)
        {
            Caption = 'Amount to Transfer';
        }
        field(23; "Uploaded to Procurement Workpl"; Boolean)
        {
            Caption = 'Uploaded to Procurement Workplan';
        }
        field(24; "Date to Transfer"; Date)
        {
            Caption = 'Date to Transfer';
            trigger OnValidate()
            begin
                //Added to ensure that Dates to be transfered are within budetary Control Dates
                BudgetControl.Reset();
                if BudgetControl.Get() then
                    if ("Date to Transfer" < BudgetControl."Current Budget Start Date") or ("Date to Transfer" > BudgetControl."Current Budget End Date")
                    then
                        Error(Text002, "Date to Transfer", BudgetControl."Current Budget Start Date", BudgetControl."Current Budget End Date");
            end;
        }
        field(25; Description; Text[100])
        {
            Editable = false;
            Caption = 'Description';
        }
        field(26; "Converted to Budget by:"; Text[100])
        {
            Caption = 'Converted to Budget by:';
        }
        field(50000; "Default RFP Code"; Code[20])
        {
            TableRelation = "Procurement Methods";
            Caption = 'Default RFP Code';
        }
        field(50001; "Proc. Method No."; Code[20])
        {
            Caption = 'Procurement Method';
            TableRelation = "Procurement Methods";
        }
        field(50002; "Budgeted Amount"; Decimal)
        {
            CalcFormula = sum("Workplan Entry".Amount where("Activity Code" = field("Activity Code")));
            Caption = 'Current Budgeted Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(50004; "Expense Code"; Code[30])
        {
            TableRelation = "Expense Code".Code;
            Caption = 'Expense Code';
        }
        field(50005; "No."; Code[50])
        {
            TableRelation = if (Type = const("G/L Account")) "G/L Account"."No." where(Blocked = const(false),
                                                                                      "Expense Code" = field("Expense Code"))
            else
            if (Type = const(Item)) Item."No." where(Blocked = const(false));
            Caption = 'No.';
            trigger OnValidate()
            begin
                if Type = Type::Item then begin
                    Item.Reset();
                    if Item.Get("No.") then
                        Description := UpperCase(Item.Description)
                    else
                        Description := '';
                end;

                if Type = Type::"G/L Account" then begin
                    GLAccount.Reset();
                    if GLAccount.Get("No.") then
                        Description := UpperCase(GLAccount.Name)
                    else
                        Description := '';
                end;
            end;
        }
        field(50006; Type; Option)
        {
            OptionCaption = ' ,G/L Account,Item';
            OptionMembers = " ","G/L Account",Item;
            Caption = 'Type';
        }
        field(50007; "Budget Filter"; Code[10])
        {
            Caption = 'Budget Filter';
        }
        field(50008; "Global Dimension 1 Filter"; Code[10])
        {
            Caption = 'Global Dimension 1 Filter';
        }
        field(50009; "Global Dimension 2 Filter"; Code[10])
        {
            Caption = 'Global Dimension 2 Filter';
        }
    }

    keys
    {
        key(Key1; "Activity Code")
        {
            Clustered = true;
        }
        key(Key2; "Shortcut Dimension 2 Code") { }
    }

    fieldgroups { }

    var
        Item: Record Item;
        GLAccount: Record "G/L Account";
        WorkplanActivities: Record "Workplan Activities";
        BudgetControl: Record "Budgetary Control Setup";
        Text002: Label 'The current date [%1 ] does not fall within the Budget Dates. Current Budget Dates are between [%2 upto %3]';
}
