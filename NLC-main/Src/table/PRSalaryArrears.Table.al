#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193561 "PR Salary Arrears"
{
    Caption = 'PR Salary Arrears';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            Editable = false;
            Caption = 'Employee Code';
        }
        field(2; "Transaction Code"; Code[10])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                "Transaction Name" := '';
                "Period Month" := 0;
                "Period Year" := 0;
                "Current Payroll Period" := 0D;


                PRTransCode.Reset();
                if PRTransCode.Get("Transaction Code") then
                    "Transaction Name" := PRTransCode."Transaction Name";


                PRPayrollPeriods.Reset();
                PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
                if PRPayrollPeriods.Find('-') then begin
                    "Period Month" := PRPayrollPeriods."Period Month";
                    "Period Year" := PRPayrollPeriods."Period Year";
                    "Current Payroll Period" := PRPayrollPeriods."Date Opened";
                end;
            end;
        }
        field(3; "Start Date"; Date)
        {
            Description = 'From when do we back date';
            Caption = 'Start Date';
        }
        field(4; "End Date"; Date)
        {
            Description = 'Upto when do we back date';
            Caption = 'End Date';
        }
        field(5; "Salary Arrears"; Decimal)
        {
            Caption = 'Salary Arrears';
        }
        field(6; "PAYE Arrears"; Decimal)
        {
            Caption = 'PAYE Arrears';
        }
        field(7; "Period Month"; Integer)
        {
            Editable = false;
            Caption = 'Period Month';
        }
        field(8; "Period Year"; Integer)
        {
            Editable = false;
            Caption = 'Period Year';
        }
        field(9; "Current Basic"; Decimal)
        {
            Editable = false;
            Caption = 'Current Basic';
        }
        field(10; "Arrears Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Arrears Payroll Period';
        }
        field(11; Number; Integer)
        {
            AutoIncrement = true;
            NotBlank = true;
            Caption = 'Number';
        }
        field(12; "Transaction Name"; Text[100])
        {
            Editable = false;
            Caption = 'Transaction Name';
        }
        field(13; "Current Payroll Period"; Date)
        {
            Editable = false;
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Current Payroll Period';
        }
        field(14; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(15; "Is Basic Salary Arrears"; Boolean)
        {
            Caption = 'Is Basic Salary Arrears';
        }
        field(16; "Is Allowance Arrears"; Boolean)
        {
            Caption = 'Is Allowance Arrears';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get("Current Payroll Period") then
            if PRPayrollPeriods.Closed = true then
                Error(Text001, 'DELETE', "Current Payroll Period");
    end;

    trigger OnModify()
    begin
        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get("Current Payroll Period") then
            if PRPayrollPeriods.Closed = true then
                Error(Text001, 'MODIFY', "Current Payroll Period");
    end;

    trigger OnRename()
    begin
        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get("Current Payroll Period") then
            if PRPayrollPeriods.Closed = true then
                Error(Text001, 'RENAME', "Current Payroll Period");
    end;

    var
        PRPayrollPeriods: Record "PR Payroll Periods";
        PRTransCode: Record "PR Transaction Codes";
        Text001: Label 'You cannot [ %1  ] records in this Payroll Period [ %2  ] because it is CLOSED';
}
