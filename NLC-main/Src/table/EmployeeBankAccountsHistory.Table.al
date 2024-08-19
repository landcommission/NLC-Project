#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193897 "Employee Bank Accounts History"
{
    DrillDownPageId = "HR Bank Accounts List";
    LookupPageId = "HR Bank Accounts List";
    Caption = 'Employee Bank Accounts History';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = true;
            Caption = 'Line No.';
        }
        field(2; "Employee Code"; Code[50])
        {
            Editable = true;
            Caption = 'Employee Code';
        }
        field(3; "Bank  Code"; Code[50])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Bank  Code';
            trigger OnValidate()
            begin
                "Bank Name" := '';
                "Branch Code" := '';
                "Branch Name" := '';

                prBankStructure.Reset();
                prBankStructure.SetRange(prBankStructure."Bank Code", "Bank  Code");
                if prBankStructure.Find('-') then
                    "Bank Name" := prBankStructure."Bank Name";
            end;
        }
        field(4; "Bank Name"; Text[100])
        {
            Editable = false;
            TableRelation = "PR Bank Accounts"."Bank Name";
            Caption = 'Bank Name';
        }
        field(5; "Branch Code"; Code[50])
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Bank  Code"));
            Caption = 'Branch Code';
            trigger OnValidate()
            begin
                "Branch Name" := '';
                PRBankBranches.Reset();
                PRBankBranches.SetRange(PRBankBranches."Branch Code", "Branch Code");
                if PRBankBranches.Find('-') then
                    "Branch Name" := PRBankBranches."Branch Name";
            end;
        }
        field(6; "Branch Name"; Text[100])
        {
            Editable = false;
            Caption = 'Branch Name';
        }
        field(7; "A/C  Number"; Code[50])
        {
            Caption = 'A/C  Number';
        }
        field(8; "Percentage to Transfer"; Decimal)
        {
            MaxValue = 100;
            Caption = 'Percentage to Transfer';

        }
        field(9; "Previous Bank  Code"; Code[50])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Previous Bank  Code';
            trigger OnValidate()
            begin
                "Previous Bank Name" := '';
                "Previous Branch Code" := '';
                "Previous Branch Name" := '';

                prBankStructure.Reset();
                prBankStructure.SetRange(prBankStructure."Bank Code", "Previous Bank  Code");
                if prBankStructure.Find('-') then
                    "Previous Bank Name" := prBankStructure."Bank Name";
            end;
        }
        field(10; "Previous Bank Name"; Text[100])
        {
            Editable = false;
            TableRelation = "PR Bank Accounts"."Bank Name";
            Caption = 'Previous Bank Name';
        }
        field(11; "Previous Branch Code"; Code[50])
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Bank  Code"));
            Caption = 'Previous Branch Code';
            trigger OnValidate()
            begin
                "Previous Branch Name" := '';
                PRBankBranches.Reset();
                PRBankBranches.SetRange(PRBankBranches."Branch Code", "Previous Branch Code");
                if PRBankBranches.Find('-') then
                    "Previous Branch Name" := PRBankBranches."Branch Name";
            end;
        }
        field(12; "Previous Branch Name"; Text[100])
        {
            Editable = false;
            Caption = 'Previous Branch Name';
        }
        field(13; "Previous A/C  Number"; Code[50])
        {
            Caption = 'Previous A/C  Number';
        }
        field(14; "From payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'From payroll Period';
        }
        field(15; "To Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'To Payroll Period';
        }
        field(17; "Previous Percentage to transfe"; Decimal)
        {
            MaxValue = 100;
            Caption = 'Previous Percentage to transfe';
        }
        field(18; "Previous Bank  Code1"; Code[50])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Previous Bank  Code1';
            trigger OnValidate()
            begin
                "Previous Bank Name1" := '';
                "Previous Branch Code1" := '';
                "Previous Branch Name1" := '';

                prBankStructure.Reset();
                prBankStructure.SetRange(prBankStructure."Bank Code", "Previous Bank  Code1");
                if prBankStructure.Find('-') then
                    "Previous Bank Name1" := prBankStructure."Bank Name";
            end;
        }
        field(19; "Previous Bank Name1"; Text[100])
        {
            Editable = false;
            TableRelation = "PR Bank Accounts"."Bank Name";
            Caption = 'Previous Bank Name1';
        }
        field(20; "Previous Branch Code1"; Code[50])
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Bank  Code"));
            Caption = 'Previous Branch Code1';
            trigger OnValidate()
            begin
                "Previous Branch Name1" := '';
                PRBankBranches.Reset();
                PRBankBranches.SetRange(PRBankBranches."Branch Code", "Previous Branch Code1");
                if PRBankBranches.Find('-') then
                    "Previous Branch Name1" := PRBankBranches."Branch Name";
            end;
        }
        field(21; "Previous Branch Name1"; Text[100])
        {
            Editable = false;
            Caption = 'Previous Branch Name1';
        }
        field(22; "Previous A/C  Number1"; Code[50])
        {
            Caption = 'Previous A/C  Number1';
        }
        field(23; "From payroll Period1"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'From payroll Period1';
        }
        field(24; "To Payroll Period1"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'To Payroll Period1';
        }
        field(25; "Previous A\C Number1"; Code[50])
        {
            Caption = 'Previous A\C Number1';
        }
        field(26; "Previous Percentage to transf1"; Decimal)
        {
            MaxValue = 100;
            Caption = 'Previous Percentage to transf1';
        }
        field(27; "Show On Payslip"; Boolean)
        {
            Caption = 'Show On Payslip';
        }
        field(28; "No Payroll Period"; Boolean)
        {
            Caption = 'No Payroll Period';
        }
    }

    keys
    {
        key(Key1; "Line No.", "Employee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        prBankStructure: Record "PR Bank Accounts";
        HREmployeeBankAcc: Record "HR Employee Bank Accounts";
        PRBankBranches: Record "PR Bank Branches";
}
