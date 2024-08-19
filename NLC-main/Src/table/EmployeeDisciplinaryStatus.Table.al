#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 56036 "Employee Disciplinary Status"
{
    DrillDownPageId = "Employee Disciplinary Status.";
    LookupPageId = "Employee Disciplinary Status.";
    Caption = 'Employee Disciplinary Status';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[30])
        {
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                if Emp.Get("Employee No") then
                    "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(2; "Case Number"; Code[30])
        {
            Caption = 'Case Number';
        }
        field(3; "Disciplinary Status"; Text[30])
        {
            TableRelation = "Disciplinary Status Table"."Disciplinary Status";
            Caption = 'Disciplinary Status';
        }
        field(4; "Start Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Start Period';
            trigger OnValidate()
            begin
                "End Period" := CalcDate(Duration, "Start Period");
            end;
        }
        field(5; Duration; DateFormula)
        {
            Caption = 'Duration';
            trigger OnValidate()
            begin
                "End Period" := CalcDate(Duration, "Start Period");
            end;
        }
        field(6; "End Period"; Date)
        {
            Caption = 'End Period';
        }
        field(7; Stop; Boolean)
        {
            Caption = 'Stop';
        }
        field(8; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(9; "Effect on Payroll"; Boolean)
        {
            Caption = 'Effect on Payroll';


        }
    }

    keys
    {
        key(Key1; "Employee No", "Case Number", "Disciplinary Status")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Emp: Record "HR Employees";
        DisciplinaryStatus: Record "Disciplinary Status Table";
        Cases: Record "HR Disciplinary Cases";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Employee: Record Employee;
        HRDiscipMemb: Record "Disciplinary Committee Members";
        HRCases: Record "HR Disciplinary Cases";
        CaseRegister: Record "Case Register";
        //AssignmentMatrixX: Record "Assignment Matrix-X";
        PayPeriod: Record "PR Payroll Periods";
        CR: Record "Case Register";
        AmountDeducted: Decimal;
        //AssMatx: Record "Assignment Matrix-X";
        DiscStatus: Record "Employee Disciplinary Status";
}

