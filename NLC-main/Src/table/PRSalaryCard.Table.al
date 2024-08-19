#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193544 "PR Salary Card"
{
    DrillDownPageId = "HR Employee List (Inactive)";
    LookupPageId = "HR Employee List (Inactive)";
    Caption = 'PR Salary Card';
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
            Caption = 'Basic Pay';
            trigger OnValidate()
            var
                Text0000: Label 'Do you want to change the Basic Pay for this Employee %1 and Update his/her Employee Card?';
                HREmp: Record "Bank Slip";
                Text0001: Label 'Aborted. Press F5 to discard the changes';
                Text0002: Label 'Employee %1 does not exist in HR Employees list. Please liase with HR Officer to Create this Employee';
            begin
                /*
    //*************************DW******************************************
    // TO ENSURE PR SALARY CARD BASIC PAY AND HR EMPLOYEES BASIC
    // PAY ARE SAME WHEN CHANGED
       IF HREmp.GET("Employee Code") THEN
       BEGIN
          HREmp."New Basic Pay":="Rate Per Day";
          HREmp."Basic Pay":="Basic Pay";
          HREmp.MODIFY;
       END ELSE
       BEGIN
          ERROR(Text0002,"Employee Code");
       END;

    // For NIB MWEA :: Function to check if Employee is Paid Daily
    // and place a check mark on the field is "Is Paid Daily" on this table
                //  fnIsEmployeePaidDaily;
    //*********************************************************************
                 */
                "1/3 Basic" := 1 / 3 * "Basic Pay";

            end;
        }
        field(3; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,FOSA';
            OptionMembers = "Bank Transfer",Cheque,Cash,FOSA;
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
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('BPAY'),
                                                                     "Employee Code" = field("Employee Code")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Cumm BasicPay';
        }
        field(10; "Cumm GrossPay"; Decimal)
        {
            Editable = false;
            Caption = 'Cumm GrossPay';
        }
        field(11; "Cumm NetPay"; Decimal)
        {
            Editable = false;
            Caption = 'Cumm NetPay';
        }
        field(12; "Cumm Allowances"; Decimal)
        {
            Editable = false;
            Caption = 'Cumm Allowances';
        }
        field(13; "Cumm Deductions"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
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
            Caption = 'Cumm PAYE';
        }
        field(20; "Cumm NSSF"; Decimal)
        {
            Caption = 'Cumm NSSF';
        }
        field(21; "Cumm Pension"; Decimal)
        {
            Caption = 'Cumm Pension';
        }
        field(22; "Cumm HELB"; Decimal)
        {
            Caption = 'Cumm HELB';
        }
        field(23; "Cumm NHIF"; Decimal)
        {
            Caption = 'Cumm NHIF';
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
            TableRelation = "prEmployee Posting Group".Code;
            Caption = 'Posting Group';
        }
        field(28; "No. Overtime Day(s) Worked"; Decimal)
        {
            Caption = 'No. Overtime Day(s) Worked';
        }
        field(29; "Identification Number"; Code[20])
        {
            Caption = 'Identification Number';
        }
        field(30; "Mobile Number"; Code[20])
        {
            Caption = 'Mobile Number';
        }
        field(31; Nationality; Code[20])
        {
            Caption = 'Nationality';
        }
        field(32; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(33; "Scheme Code 2"; Code[20])
        {
            Caption = 'Scheme Code 2';
        }
        field(34; "Job Title"; Code[20])
        {
            Caption = 'Job Title';
        }
        field(35; "Job Description"; Text[100])
        {
            Caption = 'Job Description';
        }
        field(36; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(37; "Employment Date"; Date)
        {
            Caption = 'Employment Date';
        }
        field(38; Status; Text[20])
        {
            Caption = 'Status';
        }
        field(39; "PIN No."; Code[20])
        {
            Caption = 'PIN No.';
        }
        field(40; "Bank Account No."; Text[100])
        {
            Caption = 'Bank Account No.';
        }
        field(41; "Contract End Date"; Date)
        {
            Caption = 'Contract End Date';
        }
        field(42; "Job Group"; Text[100])
        {
            Caption = 'Job Group';
        }
        field(43; "Company E-Mail"; Text[100])
        {
            Caption = 'Company E-Mail';
        }
        field(44; "Days Worked"; Decimal)
        {
            Caption = 'Days Worked';
        }
        field(60000; "Grade Level"; Code[20])
        {
            Caption = 'Grade Level';
        }
        field(60001; "Gratuity %"; Code[10])
        {
            Caption = 'Gratuity %';
        }
        field(60002; "Gratuity Amount"; Decimal)
        {
            Caption = 'Gratuity Amount';
        }
        field(60003; Gratuity; Integer)
        {
            Caption = 'Gratuity';
        }
        field(60004; "No.Of Days PDM"; Integer)
        {
            Caption = 'No.Of Days PDM';
        }
        field(60005; "Rate Per Day"; Decimal)
        {
            Caption = 'Rate Per Day';
        }
        field(60006; "Scheme Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('SCHEME'));
            Caption = 'Scheme Code';
        }
        field(60007; "Employee Contract Type"; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter("Contract Type"));
            Caption = 'Employee Contract Type';
        }
        field(60008; "No. of Days Worked"; Decimal)
        {
            Caption = 'No. of Days Worked';
        }
        field(60009; "Is Paid Daily?"; Boolean)
        {
            Description = 'FOR MWEA';
            Caption = 'Is Paid Daily?';
        }
        field(60010; "No. of Sundays / Holidays Work"; Decimal)
        {
            Description = 'FOR MWEA';
            Caption = 'No. of Sundays / Holidays Work';
        }
        field(60011; "Assign Resp Allowance"; Boolean)
        {
            Description = 'FOR MWEA';
            Caption = 'Assign Resp Allowance';
        }
        field(60012; "Not Based on Rates"; Boolean)
        {
            Description = 'FOR MWEA';
            Caption = 'Not Based on Rates';
        }
        field(60013; "Insurance Certificate?"; Boolean)
        {
            Caption = 'Insurance Certificate?';
        }
        field(60014; "PAYE Relief?"; Boolean)
        {
            Caption = 'PAYE Relief?';
        }
        field(60015; Gender; Option)
        {
            CalcFormula = lookup("HR Employees".Gender where("No." = field("Employee Code")));
            FieldClass = FlowField;
            OptionCaption = 'Female,Male';
            OptionMembers = Female,Male;
            Caption = 'Gender';
            Editable = false;
        }
        field(60016; "Is Security?"; Boolean)
        {
            Description = 'FOR MIAD';
            Caption = 'Is Security?';
        }
        field(60017; "Emp Name"; Text[60])
        {
            CalcFormula = lookup("HR Employees"."Full Name" where("No." = field("Employee Code")));
            FieldClass = FlowField;
            Caption = 'Emp Name';
            Editable = false;
        }
        field(60018; "Disable Personal Relief?"; Boolean)
        {
            Caption = 'Disable Personal Relief?';
        }
        field(60019; "Half Basic Pay?"; Boolean)
        {
            Caption = 'Half Basic Pay?';
            trigger OnValidate()
            begin
                if "Half Basic Pay?" then
                    "Basic Pay" := "Basic Pay" / 2;

                if not "Half Basic Pay?" then
                    "Basic Pay" := "Basic Pay" * 2;
            end;
        }
        field(60020; "1/3 Basic"; Decimal)
        {
            Caption = '1/3 Basic';
        }
    }

    keys
    {
        key(Key1; "Employee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HREmp: Record "HR Employees";


    procedure fnIsEmployeePaidDaily()
    var
        PaidDaily: Boolean;
    begin
        PaidDaily := false;
        if ("Basic Pay" <= 0) and ("Rate Per Day" <= 0) then
            PaidDaily := false;

        if ("Basic Pay" <= 0) and ("Rate Per Day" > 0) then
            PaidDaily := true;
        if ("Basic Pay" > 0) and ("Rate Per Day" <= 0) then
            PaidDaily := false;
        if ("Basic Pay" > 0) and ("Rate Per Day" > 0) then
            Error('Both "Rate per Day" and "Basic Pay" CANNOT be filled');


        if PaidDaily = true then begin
            "Is Paid Daily?" := true;
            Modify();
        end else begin
            PaidDaily := false;
            if PaidDaily = false then begin
                "Is Paid Daily?" := false;
                Modify();
            end;
        end;
    end;
}
