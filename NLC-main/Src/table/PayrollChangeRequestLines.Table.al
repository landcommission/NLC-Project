#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193695 "Payroll Change Request Lines"
{
    Caption = 'Payroll Change Request Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Payroll Change No"; Code[20])
        {
            Caption = 'Payroll Change No';
        }
        field(2; "Change Type"; Option)
        {
            OptionMembers = Income,Deduction,None;
            Caption = 'Change Type';
        }
        field(3; "Old Value"; Decimal)
        {
            Caption = 'Old Value';
        }
        field(4; "New Value"; Decimal)
        {
            Caption = 'New Value';
        }
        field(5; "Transaction Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = field("Change Type"));
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                "Old Value" := 0;
                "New Value" := 0;
                //"Transaction Name":='';
                //"Effective Payroll Period":=0D;


                PRTransCode.Reset();
                PRTransCode.SetRange(PRTransCode."Transaction Code", "Transaction Code");
                if PRTransCode.Find('-') then begin
                    CalcFields("Effective Payroll Period");
                    PREmpTrans.Reset();
                    PREmpTrans.SetRange(PREmpTrans."Employee Code", "Employee Code");
                    PREmpTrans.SetRange(PREmpTrans."Payroll Period", "Effective Payroll Period");
                    PREmpTrans.SetRange(PREmpTrans."Transaction Code", "Transaction Code");
                    if PREmpTrans.Find('-') then
                        //"Transaction Name":=PRTransCode."Transaction Name";
                        "Old Value" := PREmpTrans.Amount;
                end;


                /*
                PRTransCode.RESET;
                PRTransCode.SETRANGE(PRTransCode."Transaction Code",'BPAY');
                IF PRTransCode.FIND('-') THEN
                BEGIN
                //MESSAGE(PREmpTrans."Transaction Code");
                 */

                if "Transaction Code" = 'BPAY' then begin
                    PRSalary.Reset();
                    PRSalary.SetRange(PRSalary."Employee Code", "Employee Code");
                    if PRSalary.Find('-') then begin
                        "Transaction Name" := PRTransCode."Transaction Name";
                        "Old Value" := PRSalary."Basic Pay";
                    end;
                end;

            end;
        }
        field(6; "Transaction Name"; Text[50])
        {
            Caption = 'Transaction Name';
        }
        field(7; "Employee Code"; Code[20])
        {
            TableRelation = "HR Employees"."No." where(Status = const(Active));
            Caption = 'Employee Code';
        }
        field(8; "Effective Payroll Period"; Date)
        {
            CalcFormula = lookup("Payroll Change"."Payroll Period" where("Payroll Change No" = field("Payroll Change No")));
            FieldClass = FlowField;
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'Effective Payroll Period';
            Editable = false;
        }
        field(9; Reason; Option)
        {
            OptionCaption = ' ,Resignation,Non-Renewal Of Contract,Dismissal,Retirement,Death,Other';
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
            Caption = 'Reason';
        }
    }

    keys
    {
        key(Key1; "Payroll Change No", "Employee Code", "Transaction Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        PRTransCode: Record "PR Transaction Codes";
        PREmpTrans: Record "PR Employee Transactions";
        PRSalary: Record "PR Salary Card";
}
