table 50511 "HR Activities Cue"
{
    Caption = 'HR Activities Cue';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[30])
        {
            Caption = 'Primary Key';
        }

        field(2; "Active Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where(Status = filter(Active)));
            Caption = 'Active Employees';
            Editable = false;
            //CalcFormula = Count("Employee" where(Status = filter(Active)));//, "Employees Type" = filter(<> Interns)));
        }

        field(3; "In-Active Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where(Status = filter(Inactive)));
            Caption = 'In-Active Employees';
            Editable = false;
            //CalcFormula = Count("Employee" WHERE(Status = CONST(InActive), "Employees Type" = filter(<> Interns)));
        }

        field(4; "All Jobs"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Jobs");
            Caption = 'All Jobs';
            Editable = false;
        }

        field(5; "Male Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where(Gender = const(Male)));
            Caption = 'Male Employees';
            Editable = false;
        }

        field(6; "Female Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where(Gender = const(Female)));
            Caption = 'Female Employees';
            Editable = false;
        }

        field(7; "Current Payroll Period"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("PR Payroll Periods"."Date Opened" where(Closed = const(false)));
            Caption = 'Current Payroll Period';
            Editable = false;
        }

        field(8; "Net Pay"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NPAY')));
            DecimalPlaces = 0 : 0;
            Caption = 'Net Pay';
            Editable = false;
        }

        field(9; "Basic Pay"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('BPAY')));

            DecimalPlaces = 0 : 0;
            Caption = 'Basic Pay';
            Editable = false;
        }


        field(10; "Contract Staff"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where("Contract Type" = filter(Contract)));
            Caption = 'Contract Staff';
            Editable = false;
            //CalcFormula = Count("Employee" WHERE("Employees Type" = filter(Contract)));
        }
        field(11; "Permanent Staff"; Integer)
        {
            BlankZero = true;
            CalcFormula = count("HR Employees" where("Contract Type" = filter("Permanent and Pensionable")));
            //CalcFormula = count("Employee" where(Status = filter(Active),
            //"Employees Type" = filter(Permanent)));

            FieldClass = FlowField;
            Caption = 'Permanent Staff';
            Editable = false;
        }

        field(12; "Seconded Staff"; Integer)
        {
            BlankZero = true;
            //CalcFormula = count("Employee" where(Status = filter(Active),
            //"Employees Type" = filter(Seconded)));
            CalcFormula = count("HR Employees" where("Contract Type" = filter("Seconded/Contract")));

            FieldClass = FlowField;
            Caption = 'Seconded Staff';
            Editable = false;
        }

        field(13; "Staff on Leave"; Integer)
        {
            Caption = 'Staff on Leave';
        }
        field(114; "Staff on Leave Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where("On Leave" = filter(true)));
            Caption = 'Staff on Leave Count';
            Editable = false;
        }

        field(14; "Contracts Due"; Integer)
        {
            Caption = 'Contracts Due';
        }

        field(15; "Retirement Report"; Integer)
        {
            Caption = 'Retirement Report';
        }

        field(16; Allowances; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Group Order" = const(3)));
            DecimalPlaces = 0 : 0;
            Caption = 'Allowances';
            Editable = false;
        }
        // field(17; "Deductions"; Decimal)
        // {
        //     BlankZero = true;
        //     FieldClass = FlowField;
        //     CalcFormula = sum("PR Period Transactions".Amount where("Group Text" = const('DEDUCTIONS'),
        //                     "Period Closed" = const(false)));
        //     DecimalPlaces = 0 : 0;
        // }

        field(18; NHIF; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NHIF')));

            DecimalPlaces = 0 : 0;
            Caption = 'NHIF';
            Editable = false;
        }

        field(19; NSSF; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NSSF')));

            DecimalPlaces = 0 : 0;
            Caption = 'NSSF';
            Editable = false;
        }

        field(20; PAYE; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('PAYE')));
            DecimalPlaces = 0 : 0;
            Caption = 'PAYE';
            Editable = false;
        }

        field(21; "Pension-Employee"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('ED005')));

            DecimalPlaces = 0 : 0;
            Caption = 'Pension-Employee';
            Editable = false;
        }

        field(22; "Pension-Employer"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Employer Deductions".Amount where("Transaction Code" = const('ED005')));
            Caption = 'Pension-Employer';
            Editable = false;
        }

        field(23; "Voluntary NSSF"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NSSFVOL')));

            DecimalPlaces = 0 : 0;
            Caption = 'Voluntary NSSF';
            Editable = false;
        }

        field(24; "Voluntary Pension"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('PENVL')));

            DecimalPlaces = 0 : 0;
            Caption = 'Voluntary Pension';
            Editable = false;
        }

        field(25; "Probation Report"; Integer)
        {
            BlankZero = true;
            Caption = 'Probation Report';
        }
        field(26; "Registered Male"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where(Gender = const(Male), Status = const(Active)));
            Caption = 'Registered Male';
            Editable = false;
        }
        field(27; "Registered Female"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where(Gender = const(Female), Status = const(Active)));
            Caption = 'Registered Female';
            Editable = false;
        }
        field(28; "Registered Disabled"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Employees" where(Disabled = const(Yes), Status = const(Active)));
            Caption = 'Registered Disabled';
            Editable = false;
        }

        field(29; "Ending Probations"; Integer)
        {
            BlankZero = true;
            Caption = 'Ending Probations';
            // FieldClass = FlowField;
            //CalcFormula = count("HR Employees" where("Employee Classification" = field(Probationend), Inducted = const(true)));
        }
        field(30; Probationend; Date)
        {

            FieldClass = FlowFilter;
            Caption = 'Probationend';
        }
        field(31; "Payroll Actuals"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = const('2110103')));
            Caption = 'Payroll Actuals';
            Editable = false;
        }
        field(32; "Budgeted Amount"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("G/L Budget Entry".Amount where("G/L Account No." = const('2110103')));
            Caption = 'Budgeted Amount';
            Editable = false;
        }
        field(33; "Housing Fund"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('HELVY')));
            Caption = 'Housing Fund';
            Editable = false;
        }
        field(34; NITA; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Employer Deductions".Amount where("Transaction Code" = const('NITA')));
            Caption = 'NITA';
            Editable = false;
        }
        //Departments\Centers PCs (80366, List)

        field(35; "Directors PAS"; Integer)
        {
            Caption = 'PMMU';
            BlankZero = true;
            //FieldClass = FlowField;
            //CalcFormula = count("Perfomance Contract Header"
            //where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Departmental)));
        }
        field(36; "Deputy Directors PAS"; Integer)
        {
            BlankZero = true;
            Caption = 'Deputy Directors PAS';
            //FieldClass = FlowField;
            //CalcFormula = count("Perfomance Contract Header"
            //where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Departmental),
            //"Target Type" = const(Director)));
        }
        field(37; "Assistant Directors PAS"; Integer)
        {
            BlankZero = true;
            Caption = 'Assistant Directors PAS';
            // FieldClass = FlowField;
            // CalcFormula = count("Perfomance Contract Header"
            // where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Departmental),
            // "Target Type" = const("Assistant Director")));
        }
        field(38; "Head of Section PAS"; Integer)
        {
            BlankZero = true;
            Caption = 'Head of Section PAS';
            //FieldClass = FlowField;
            // CalcFormula = count("Perfomance Contract Header"
            // where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Departmental),
            // "Target Type" = const("Head of Section")));
        }
        field(39; "Individual Targets PAS"; Integer)
        {
            Caption = 'Performance Appraisal System';
            BlankZero = true;
            FieldClass = FlowField;
            Editable = false;
            // CalcFormula = count("Perfomance Contract Header"
            // where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Staff),
            // "Target Type" = const("Individual Targets")));
        }
        field(40; "Suspended Employees"; Integer)
        {
            Caption = 'Suspended Employees';
            // FieldClass = FlowField;
            // CalcFormula = count("Employee" where("Employee Status 2" = const(Suspension)));
        }
        field(41; "Interdicted Employees"; Integer)
        {
            Caption = 'Interdicted Employees';
            // FieldClass = FlowField;
            // CalcFormula = count("Employee" where("Employee Status 2" = const(Interdiction)));
        }
        field(42; "Dismissed Employees"; Integer)
        {
            Caption = 'Dismissed Employees';
            // FieldClass = FlowField;
            // CalcFormula = count("Employee" where("Employee Status 2" = const(Dismissal)));
        }
        field(43; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = const(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
            Editable = false;
        }
        field(44; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
            Editable = false;
        }
        field(45; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
        field(46; "Open Appraisal"; Integer)
        {
            Caption = 'Open Appraisal';
            // FieldClass = FlowField;
            // CalcFormula = count("Perfomance Evaluation" where("Created By" = field("User ID Filter"),
            // "Approval Status" = filter(<> Released)));
        }
        field(47; "Released Appraisal"; Integer)
        {
            Caption = 'Released Appraisal';
            // FieldClass = FlowField;
            // CalcFormula = count("Perfomance Evaluation" where("Created By" = field("User ID Filter"),
            // "Approval Status" = filter(Released)));
        }
        // Perfomance Contract Header

        /*     Document Type (2, Option)
     Individual Scorecard
     TableViewFilters
     Score Card Type (41, Option)
     Departmental */
    }

    keys
    {
        key(Key1; "Primary Key") { }
    }

    fieldgroups { }
}

