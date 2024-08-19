#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193566 "prSalary Card Casual"
{
    Caption = 'prSalary Card Casual';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code';
        }
        field(2; "Basic Pay"; Decimal)
        {
            Editable = true;
            Enabled = true;
            Caption = 'Basic Pay';
            trigger OnValidate()
            begin
                if Employee.Get("Employee Code") then begin
                    "Location/Division" := Employee."Location/Division Code";
                    Department := Employee."Responsibility Center";
                    "Cost Centre" := Employee."Cost Center Code";
                    "Salary Grade" := Employee."Salary Grade";
                    "Salary Notch" := Employee."Salary Notch/Step";
                    "Employee Classification" := Employee."Employee Classification";
                    State := Employee."Post Code";
                end;
            end;
        }
        field(3; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
            Caption = 'Payment Mode';
        }
        field(4; Currency; Code[10])
        {
            Caption = 'Currency';
        }
        field(5; "Pays NSSF"; Boolean)
        {
            Caption = 'Pays NSSF';
        }
        field(6; "Pays NHIF"; Boolean)
        {
            Caption = 'Pays NHIF';
        }
        field(7; "Pays PAYE"; Boolean)
        {
            Caption = 'Pays PAYE';
        }
        field(8; "Payslip Message"; Text[100])
        {
            Caption = 'Payslip Message';
        }
        field(9; "Cumm BasicPay"; Decimal)
        {
            CalcFormula = sum("PR Employee P9 Info"."Basic Pay" where("Employee Code" = field("Employee Code")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Cumm BasicPay';
        }
        field(10; "Cumm GrossPay"; Decimal)
        {
            CalcFormula = sum("PR Employee P9 Info"."Gross Pay" where("Employee Code" = field("Employee Code")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Cumm GrossPay';
        }
        field(11; "Cumm NetPay"; Decimal)
        {
            CalcFormula = sum("PR Employee P9 Info"."Net Pay" where("Employee Code" = field("Employee Code")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Cumm NetPay';
        }
        field(12; "Cumm Allowances"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Group Order" = filter(3),
                                                                     "Employee Code" = field("Employee Code")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Cumm Allowances';
        }
        field(13; "Cumm Deductions"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Group Order" = filter(8),
                                                                     "Sub Group Order" = filter(0 | 1),
                                                                     "Employee Code" = field("Employee Code"),
                                                                     "Transaction Code" = filter(<> 'Total Deductions')));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Cumm Deductions';
        }
        field(14; "Suspend Pay"; Boolean)
        {
            Caption = 'Suspend Pay';
        }
        field(15; "Suspension Date"; Date)
        {
            Caption = 'Suspension Date';
        }
        field(16; "Suspension Reasons"; Text[200])
        {
            Caption = 'Suspension Reasons';
        }
        field(17; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Period Filter';
        }
        field(18; Exists; Boolean)
        {
            Caption = 'Exists';
        }
        field(19; "Cumm PAYE"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = filter('PAYE'),
                                                                     "Employee Code" = field("Employee Code")));
            FieldClass = FlowField;
            Caption = 'Cumm PAYE';
            Editable = false;
        }
        field(20; "Cumm NSSF"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = filter('NSSF'),
                                                                     "Employee Code" = field("Employee Code")));
            FieldClass = FlowField;
            Caption = 'Cumm NSSF';
            Editable = false;
        }
        field(21; "Cumm Pension"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = filter('0007'),
                                                                     "Employee Code" = field("Employee Code")));
            FieldClass = FlowField;
            Caption = 'Cumm Pension';
            Editable = false;
        }
        field(22; "Cumm HELB"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Employee Code" = field("Employee Code"),
                                                                     "Transaction Code" = filter('320')));
            FieldClass = FlowField;
            Caption = 'Cumm HELB';
            Editable = false;
        }
        field(23; "Cumm NHIF"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Employee Code" = field("Employee Code"),
                                                                     "Transaction Code" = filter('NHIF')));
            FieldClass = FlowField;
            Caption = 'Cumm NHIF';
            Editable = false;
        }
        field(24; "Bank Account Number"; Code[50])
        {
            Caption = 'Bank Account Number';
        }
        field(25; "Bank Branch"; Code[50])
        {
            Caption = 'Bank Branch';
        }
        field(26; "Employee's Bank"; Code[50])
        {
            Caption = 'Employee''s Bank';
        }
        field(27; "Posting Group"; Code[20])
        {
            NotBlank = false;
            TableRelation = "prEmployee Posting Group";
            Caption = 'Posting Group';
        }
        field(28; "Cumm Employer Pension"; Decimal)
        {
            CalcFormula = sum("PR Employer Deductions".Amount where("Employee Code" = field("Employee Code"),
                                                                     "Transaction Code" = const('0007')));
            FieldClass = FlowField;
            Caption = 'Cumm Employer Pension';
            Editable = false;
        }
        field(29; "Location/Division"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            Caption = 'Location/Division';
        }
        field(30; Department; Code[20])
        {
            // TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Department';
        }
        field(31; "Cost Centre"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Cost Centre';
        }
        field(32; "Salary Grade"; Code[20])
        {
            TableRelation = "PR Basic Pay"."Employee No";
            Caption = 'Salary Grade';
        }
        field(33; "Salary Notch"; Code[20])
        {
            Caption = 'Salary Notch';
            // TableRelation = "prSalary Review Lines".test where ("Line No."=field("Salary Grade"));
        }
        field(34; "Pension House Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "prInstitutional Membership"."Institution No" where("Group No" = const('PENSION'));
            Caption = 'Pension House Filter';
        }
        field(35; "Days Absent"; Decimal)
        {
            Caption = 'Days Absent';
        }
        /* field(323;"Payroll Type";Option)
        {
            CalcFormula = lookup("PR Salary Arrears22".Field323 where ("Payroll Period"=field("Employee Code")));
            FieldClass = FlowField;
            OptionCaption = 'General,Directors';
            OptionMembers = General,Directors;
        } */
        field(324; "Hourly Rate"; Decimal)
        {
            Caption = 'Hourly Rate';
        }
        field(325; "Employee Classification"; Code[20])
        {
            TableRelation = "Employee Class".Code;
            Caption = 'Employee Classification';
        }
        field(326; State; Code[20])
        {
            TableRelation = "Post Code";
            Caption = 'State';
        }
        field(327; "Non Taxable"; Decimal)
        {
            Caption = 'Non Taxable';
        }
        field(328; "Selected Period"; Date)
        {
            Caption = 'Selected Period';
        }
        field(329; "Hours Worked"; Decimal)
        {
            Caption = 'Hours Worked';
        }
        field(330; "Overtime Hours"; Decimal)
        {
            Caption = 'Overtime Hours';
        }
        field(331; "Public Holidays&Weekend Hours"; Decimal)
        {
            Caption = 'Public Holidays&Weekend Hours';
        }
    }

    keys
    {
        key(Key1; "Employee Code")
        {
            Clustered = true;
            SumIndexFields = "Basic Pay";
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        Error('Delete not allowed');
    end;

    var
        Employee: Record "HR Employees";
}
