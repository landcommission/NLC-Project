#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193869 "HR Employee Role Center Cue"
{
    Caption = 'HR Employee Role Center Cue';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Active; Integer)
        {
            CalcFormula = count("HR Employees" where(Status = const(Active),
                                                      Gender = filter(<> " ")));
            FieldClass = FlowField;
            TableRelation = "HR Employees".Status where(Status = filter(Active));
            Caption = 'Active';
            Editable = false;
        }
        field(2; Female; Integer)
        {
            CalcFormula = count("HR Employees" where(Gender = filter(Female),
                                                      Status = const(Active)));
            FieldClass = FlowField;
            Caption = 'Female';
            Editable = false;
        }
        field(3; Male; Integer)
        {
            CalcFormula = count("HR Employees" where(Gender = filter(Male),
                                                      Status = const(Active)));
            FieldClass = FlowField;
            TableRelation = "HR Employees".Gender where(Gender = filter(Male));
            Caption = 'Male';
            Editable = false;
        }
        field(4; "code"; Code[10])
        {
            Caption = 'code';
        }
        field(5; "Retiring in 3 Months"; Integer)
        {
            CalcFormula = count("HR Employees" where(Status = const(Active),
                                                      DPension = filter(<= '90')));
            FieldClass = FlowField;
            Caption = 'Retiring in 3 Months';
            Editable = false;
        }
        field(6; "Retiring in 6 Months"; Integer)
        {
            CalcFormula = count("HR Employees" where(Status = const(Active),
                                                      DPension = filter(> '90D' | <= '180D')));
            FieldClass = FlowField;
            Caption = 'Retiring in 6 Months';
            Editable = false;
        }
        field(7; "Retiring in 1 Year"; Integer)
        {
            CalcFormula = count("HR Employees" where(Status = const(Active),
                                                      DPension = filter(> '180D' | <= '360D')));
            FieldClass = FlowField;
            Caption = 'Retiring in 1 Year';
            Editable = false;
        }
        field(8; "Payroll Changes Pending"; Integer)
        {
            CalcFormula = count("Payroll Change" where(Status = const("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Payroll Changes Pending';
            Editable = false;
        }
        field(9; "Payroll Changes Approved"; Integer)
        {
            CalcFormula = count("Payroll Change" where(Status = const(Approved)));
            FieldClass = FlowField;
            Caption = 'Payroll Changes Approved';
            Editable = false;
        }
        field(10; "Payroll Changes New"; Integer)
        {
            CalcFormula = count("Payroll Change" where(Status = const(New)));
            FieldClass = FlowField;
            Caption = 'Payroll Changes New';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
