#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 70010 "Human Resources Setup" extends "Human Resources Setup"
{
    fields
    {
        field(50000; "Shift overtime rate"; Decimal)
        {
            MinValue = 0;
            Caption = 'Shift overtime rate';
            DataClassification = CustomerContent;
        }
        field(50001; "Holiday overtime rate"; Decimal)
        {
            MinValue = 0;
            Caption = 'Holiday overtime rate';
            DataClassification = CustomerContent;
        }
        field(50002; "Housing Earned Limit"; Decimal)
        {
            Caption = 'Housing Earned Limit';
            DataClassification = CustomerContent;
        }
        field(50003; "Pension Limit Percentage"; Decimal)
        {
            Caption = 'Pension Limit Percentage';
            DataClassification = CustomerContent;
        }
        field(50004; "Pension Limit Amount"; Decimal)
        {
            Caption = 'Pension Limit Amount';
            DataClassification = CustomerContent;
        }
        field(50005; "Round Down"; Boolean)
        {
            Caption = 'Round Down';
            DataClassification = CustomerContent;
        }
        field(50006; "Working Hours"; Decimal)
        {
            Caption = 'Working Hours';
            DataClassification = CustomerContent;
        }
        field(50008; "Payroll Rounding Precision"; Decimal)
        {
            Caption = 'Payroll Rounding Precision';
            DataClassification = CustomerContent;
        }
        field(50009; "Payroll Rounding Type"; Option)
        {
            OptionMembers = Nearest,Up,Down;
            Caption = 'Payroll Rounding Type';
            DataClassification = CustomerContent;
        }
        field(50010; "Special Duty Table"; Code[10])
        {
            Caption = 'Special Duty Table';
            DataClassification = CustomerContent;
            // TableRelation = Table26004012;
        }
        field(50011; "CFW Round Deduction code"; Code[20])
        {
            Caption = 'CFW Round Deduction code';
            DataClassification = CustomerContent;
            //TableRelation = DeductionsX;
        }
        field(50012; "BFW Round Earning code"; Code[20])
        {
            Caption = 'BFW Round Earning code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX;
        }
        field(50013; "Company overtime hours"; Decimal)
        {
            Caption = 'Company overtime hours';
            DataClassification = CustomerContent;
        }
        field(50014; "Loan Product Type Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Loan Product Type Nos.';
            DataClassification = CustomerContent;
        }
        field(50015; "Tax Relief Amount"; Decimal)
        {
            Caption = 'Tax Relief Amount';
            DataClassification = CustomerContent;
        }
        field(50016; "General Payslip Message"; Text[100])
        {
            Caption = 'General Payslip Message';
            DataClassification = CustomerContent;
        }
        field(50017; "Tax Table"; Code[10])
        {
            Caption = 'Tax Table';
            DataClassification = CustomerContent;
            //TableRelation = "Bracket Tablesx";
        }
        field(50018; "Corporation Tax"; Decimal)
        {
            Caption = 'Corporation Tax';
            DataClassification = CustomerContent;
        }
        field(50020; "Incoming Mail Server"; Text[30])
        {
            Caption = 'Incoming Mail Server';
            DataClassification = CustomerContent;
        }
        field(50021; "Outgoing Mail Server"; Text[30])
        {
            Caption = 'Outgoing Mail Server';
            DataClassification = CustomerContent;
        }
        field(50022; "Email Text"; Text[250])
        {
            Caption = 'Email Text';
            DataClassification = CustomerContent;
        }
        field(50023; "Sender User ID"; Text[30])
        {
            Caption = 'Sender User ID';
            DataClassification = CustomerContent;
        }
        field(50024; "Sender Address"; Text[100])
        {
            Caption = 'Sender Address';
            DataClassification = CustomerContent;
        }
        field(50025; "Email Subject"; Text[100])
        {
            Caption = 'Email Subject';
            DataClassification = CustomerContent;
        }
        field(50026; "Template Location"; Text[100])
        {
            Caption = 'Template Location';
            DataClassification = CustomerContent;
        }
        field(50027; "Applicants Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Applicants Nos.';
            DataClassification = CustomerContent;
        }
        field(50028; "Leave Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Leave Application Nos.';
            DataClassification = CustomerContent;
        }
        field(50029; "Recruitment Needs Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Recruitment Needs Nos.';
            DataClassification = CustomerContent;
        }
        field(50030; "Disciplinary Cases Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Disciplinary Cases Nos.';
            DataClassification = CustomerContent;
        }
        field(50031; "No. Of Days in Month"; Decimal)
        {
            Caption = 'No. Of Days in Month';
            DataClassification = CustomerContent;
        }
        field(50032; "Transport Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Transport Request Nos';
            DataClassification = CustomerContent;
        }
        field(50033; "Cover Selection Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Cover Selection Nos';
            DataClassification = CustomerContent;
        }
        field(50034; "Qualification Days (Leave)"; Decimal)
        {
            Caption = 'Qualification Days (Leave)';
            DataClassification = CustomerContent;
        }
        field(50035; "Leave Allowance Code"; Code[10])
        {
            Caption = 'Leave Allowance Code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX;
        }
        field(50036; "Telephone Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Telephone Request Nos';
            DataClassification = CustomerContent;
        }
        field(50037; "Training Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Training Request Nos';
            DataClassification = CustomerContent;
        }
        field(50038; "Leave Recall Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Leave Recall Nos';
            DataClassification = CustomerContent;
        }
        field(50039; "Medical Claim Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Medical Claim Nos';
            DataClassification = CustomerContent;
        }
        field(50040; "Account No (Training)"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Account No (Training)';
            DataClassification = CustomerContent;
        }
        field(50041; "Training Evaluation Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Training Evaluation Nos';
            DataClassification = CustomerContent;
        }
        field(50042; "Off Days Code"; Code[10])
        {
            TableRelation = "HR Leave Types";
            Caption = 'Off Days Code';
            DataClassification = CustomerContent;
        }
        field(50043; "Appraisal Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Appraisal Nos';
            DataClassification = CustomerContent;
        }

        field(50044; "Leave Plan Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Leave Plan Nos';
            DataClassification = CustomerContent;
        }
        field(50045; "Keys Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Keys Request Nos';
            DataClassification = CustomerContent;
        }
        field(50046; "Incidences Nos"; Code[10])
        {
            Caption = 'Incidences Nos';
            DataClassification = CustomerContent;
        }
        field(50047; "Sick Of Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Sick Of Nos';
            DataClassification = CustomerContent;
        }
        field(50048; "Conveyance Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Conveyance Nos';
            DataClassification = CustomerContent;
        }
        field(50049; "Base Calender Code"; Code[20])
        {
            TableRelation = "Base Calendar".Code;
            Caption = 'Base Calender Code';
            DataClassification = CustomerContent;
        }
        field(50050; "Membership No."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Membership No.';
            DataClassification = CustomerContent;
        }
        field(50052; "Employee Absentism"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Employee Absentism';
            DataClassification = CustomerContent;
        }
        field(50053; "Overtime @1.5 Code"; Code[10])
        {
            Caption = 'Overtime @1.5 Code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50054; "Overtime @2.0 Code"; Code[10])
        {
            Caption = 'Overtime @2.0 Code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50055; "Lost Days Code"; Code[10])
        {
            Caption = 'Lost Days Code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50056; "Basic Salary Code"; Code[10])
        {
            Caption = 'Basic Salary Code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50057; "NHIF Code"; Code[10])
        {
            Caption = 'NHIF Code';
            DataClassification = CustomerContent;
            //TableRelation = DeductionsX.Code;
        }
        field(50058; "Wages Code"; Code[10])
        {
            Caption = 'Wages Code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50059; "Net Pay Advance Code"; Code[10])
        {
            Caption = 'Net Pay Advance Code';
            DataClassification = CustomerContent;
            //TableRelation = DeductionsX.Code;
        }
        field(50060; "Overtime Claim @1.5"; Code[10])
        {
            Caption = 'Overtime Claim @1.5';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50061; "Overtime Claim @2.0"; Code[10])
        {
            Caption = 'Overtime Claim @2.0';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50062; "Overtime Recovery @1.5"; Code[10])
        {
            Caption = 'Overtime Recovery @1.5';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50063; "Overtime Recovery @2.0"; Code[10])
        {
            Caption = 'Overtime Recovery @2.0';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50064; "Lost Hrs Recovery"; Code[10])
        {
            Caption = 'Lost Hrs Recovery';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50065; "Wages Claim"; Code[10])
        {
            Caption = 'Wages Claim';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50066; "Night Allowance Code"; Code[10])
        {
            Caption = 'Night Allowance Code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50067; "Lost Days Refund"; Code[10])
        {
            Caption = 'Lost Days Refund';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50068; "Training Allowance"; Code[10])
        {
            Caption = 'Training Allowance';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50069; "Wages Recovery"; Code[10])
        {
            Caption = 'Wages Recovery';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50070; "Functional Overtime@1.5"; Code[10])
        {
            Caption = 'Functional Overtime@1.5';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50071; "Functional Overtime@2.0"; Code[10])
        {
            Caption = 'Functional Overtime@2.0';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50072; "Pending Days"; Code[10])
        {
            Caption = 'Pending Days';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50073; "Lost Days Recovery"; Code[10])
        {
            Caption = 'Lost Days Recovery';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50074; "Tax Relief Code"; Code[10])
        {
            Caption = 'Tax Relief Code';
            DataClassification = CustomerContent;
            // TableRelation = EarningsX.Code;
        }
        field(50075; "Salary Advance"; Code[10])
        {
            Caption = 'Salary Advance';
            DataClassification = CustomerContent;
            //TableRelation = DeductionsX.Code;
        }
        field(50076; "Interest on Advance Code"; Code[10])
        {
            Caption = 'Interest on Advance Code';
            DataClassification = CustomerContent;
            //TableRelation = DeductionsX.Code;
        }
        field(50077; "Training Allowance Arrears"; Code[10])
        {
            Caption = 'Training Allowance Arrears';
            DataClassification = CustomerContent;
            // TableRelation = EarningsX.Code;
        }
        field(50078; "Night Shift Allowance Amount"; Decimal)
        {
            Caption = 'Night Shift Allowance Amount';
            DataClassification = CustomerContent;
        }
        field(50079; "Unpaid Leave Code"; Code[10])
        {
            Caption = 'Unpaid Leave Code';
            DataClassification = CustomerContent;
            //TableRelation = EarningsX.Code;
        }
        field(50080; "Annual Leave Days"; Decimal)
        {
            MaxValue = 30;
            MinValue = 0;
            Caption = 'Annual Leave Days';
            DataClassification = CustomerContent;
        }
        field(50082; "NSSF Tier I Code"; Code[10])
        {
            Caption = 'NSSF Tier I Code';
            DataClassification = CustomerContent;
            //TableRelation = DeductionsX.Code;
        }
        field(50083; "NSSF Tier II Code"; Code[10])
        {
            Caption = 'NSSF Tier II Code';
            DataClassification = CustomerContent;
            //TableRelation = DeductionsX.Code;
        }
        field(50084; "HR E-mail Address"; Text[150])
        {
            Caption = 'HR E-mail Address';
            DataClassification = CustomerContent;
        }
        field(50085; "Training Need Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Training Need Nos.';
            DataClassification = CustomerContent;
        }
        field(50086; "Payroll Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
            Caption = 'Payroll Journal Template';
            DataClassification = CustomerContent;
        }
        field(50087; "Payroll Journal Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Payroll Journal Template"));
            Caption = 'Payroll Journal Batch';
            DataClassification = CustomerContent;
        }
        field(50088; "Base Calendar"; Code[10])
        {
            Description = '//to cater for Leave';
            TableRelation = "Base Calendar".Code;
            Caption = 'Base Calendar';
            DataClassification = CustomerContent;
        }
        field(50089; "Leave Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Template".Name;
            Caption = 'Leave Template';
            DataClassification = CustomerContent;
        }
        field(50090; "Leave Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch".Name;
            Caption = 'Leave Batch';
            DataClassification = CustomerContent;
        }
        field(50091; "Leave Posting Period[FROM]"; Date)
        {
            Caption = 'Leave Posting Period[FROM]';
            DataClassification = CustomerContent;
        }
        field(50092; "Leave Posting Period[TO]"; Date)
        {
            Caption = 'Leave Posting Period[TO]';
            DataClassification = CustomerContent;
        }
        field(50093; "Company Documents"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Company Documents';
            DataClassification = CustomerContent;
        }
        field(50094; "Leave Planner Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Leave Planner Nos.';
            DataClassification = CustomerContent;
        }
        field(50095; "Training Application Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Training Application Nos.';
            DataClassification = CustomerContent;
        }
        field(50096; "Quarterly Appraisal Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Quarterly Appraisal Nos.';
            DataClassification = CustomerContent;
        }
        field(50097; "Annual Appraisal Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Annual Appraisal Nos.';
            DataClassification = CustomerContent;
        }
        field(50098; "Gratuity Percentage"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
            Caption = 'Gratuity Percentage';
            DataClassification = CustomerContent;
        }
        field(50099; "Gratuity Percentage."; Decimal)
        {
            DataClassification = CustomerContent;
            MaxValue = 100;
            MinValue = 0;
            Caption = 'Gratuity Percentage.';
        }
        field(50100; "Salary Advance Posting Group"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Employee Posting Group".Code;
            Caption = 'Salary Advance Posting Group';
        }
        field(56000; "CRM Training Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'CRM Training Nos.';
        }
        field(56001; "CRM Vacancies"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'CRM Vacancies';
        }
        field(56002; "CRM Applicants"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'CRM Applicants';
        }
        field(56003; "CRM Attendees"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'CRM Attendees';
        }
        field(69000; "Default Leave Posting Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
            Caption = 'Default Leave Posting Template';
            DataClassification = CustomerContent;
        }
        field(69001; "Default Leave Posting Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
            Caption = 'Default Leave Posting Batch';
            DataClassification = CustomerContent;
        }
        field(69002; "Amount Per Hour"; Decimal)
        {
            Caption = 'Amount Per Hour';
            DataClassification = CustomerContent;
        }
        field(69003; "Overtime Payroll Code"; Code[10])
        {
            Caption = 'Overtime Payroll Code';
            DataClassification = CustomerContent;
            // TableRelation = DeductionsX.Code;
        }
        field(69004; "Overtime Req Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Overtime Req Nos.';
            DataClassification = CustomerContent;
        }
        field(69005; "Employee Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Requisition Nos.';
            DataClassification = CustomerContent;
        }
        field(69006; "OP Paye Deduction %"; Decimal)
        {
            Caption = 'OP Paye Deduction %';
            DataClassification = CustomerContent;
        }
        field(69007; "Salary Voucher Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Salary Voucher Nos';
            DataClassification = CustomerContent;
        }
        field(69008; "Job Application Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Job Application Nos';
        }
        field(69009; "Medical Claims Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Medical Claims Nos';
        }
        field(69010; "Job Application No Series"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Job Application No Series';
        }
        field(69011; "Rating Nos."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
            Caption = 'Rating Nos.';
        }
        field(69012; "Excess Pension Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Excess Pension Code';
            //TableRelation = EarningsX.Code;
        }
        field(69013; "NSSF Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'NSSF Amount';
        }
        field(69014; "Transfer Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Transfer Nos';
        }
        field(69015; "Hardship Allowance Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Hardship Allowance Code';
            //TableRelation = EarningsX.Code;
        }
        field(69016; "Transfer Allowance Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Transfer Allowance Code';
            //TableRelation = EarningsX.Code;
        }
        field(69017; "Asset Transfer Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Asset Transfer Nos';
        }
        field(69018; "Disciplinary Committee Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Disciplinary Committee Nos';
        }
        field(69019; "Interns Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Interns Nos';
        }
        field(69020; "Temporary Employee Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Temporary Employee Nos';
        }
        field(69021; "Plaintiff Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Plaintiff Nos';
        }
        field(69022; "Defendant Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Defendant Nos';
        }
        field(69023; "Deputy Director HR Email"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Deputy Director HR Email';
        }
        field(69024; "Salary Icreament Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Salary Icreament Nos';
        }
        field(69025; "Legal Case Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Legal Case Nos';
        }
        field(69026; "Traning Planning Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Traning Planning Nos';
        }
        field(69027; "Temp Tax Relief Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Temp Tax Relief Code';
            //TableRelation = "EarningsX Temp-E".Code;
        }
        field(69028; "Temp NHIF Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Temp NHIF Code';
            //TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69029; "Temp Net Pay Advance Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Temp Net Pay Advance Code';
            //TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69030; "Temp NSSF Tier I Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Temp NSSF Tier I Code';
            //TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69031; "Temp NSSF Tier II Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Temp NSSF Tier II Code';
            //TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69032; "Regional HR E-mail Address"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Regional HR E-mail Address';
        }
        field(69033; "Temp Salary Voucher Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Temp Salary Voucher Nos.';
        }
        field(69034; "Training Expense Account"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
            Caption = 'Training Expense Account';
        }
        field(69035; "Manpower Planning Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Manpower Planning Nos.';
        }
        field(69036; "Job Advert Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Job Advert Nos.';
        }
        field(69037; "Handover Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Handover Nos.';
        }
        field(69038; "Annual Training Plan"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "HR Training App Header";
            Caption = 'Annual Training Plan';
        }
        field(69039; "Board Payable"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Vendor;
            Caption = 'Board Payable';
        }
        field(69040; "Director Journal Batch"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Directors Journal Template"));
            Caption = 'Director Journal Batch';
        }
        field(69041; "Directors Journal Template"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Template";
            Caption = 'Directors Journal Template';
        }
        field(69042; "Board Expense"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Job."No.";//where("Job Posting Group" = const('VOTE ITEMS'));
            Caption = 'Board Expense';
        }
        field(69043; "Training Deduction"; Code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Training Deduction';
            //TableRelation = DeductionsX;
        }
        field(69550; "Succession Plan Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
            Caption = 'Succession Plan Nos';
        }
        field(69551; "Succession Template Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
            Caption = 'Succession Template Nos';
        }
        field(69552; "Succession Log Nos"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
            Caption = 'Succession Log Nos';
        }
        field(69600; "Standard Recruitment Lead Time"; DateFormula)
        {
            Caption = 'Default Standard Recruitment Lead Time';
            DataClassification = CustomerContent;
        }
        field(69601; "Expe Recruitment Lead Time"; DateFormula)
        {
            Caption = 'Default Expedited Recruitment Lead Time';
            DataClassification = CustomerContent;
        }
        field(69602; "Strict Manpower Planning"; Boolean)
        {
            Caption = 'Disable Strict Manpower Planning';
            DataClassification = CustomerContent;
        }
        field(69603; "Months for Recruiter Fees"; Decimal)
        {
            Caption = 'No. of Months for Recruiter Fees';
            DataClassification = CustomerContent;
        }
        field(69604; "Recruiter Fees %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Recruiter Fees %';
        }
        field(69605; "Recruitment Plan Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Recruitment Plan Nos.';
        }
        field(69606; "Recruitment Requsition Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Recruitment Requsition Nos.';
        }
        field(69607; "Candidate No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Candidate No.';
        }
        field(69608; "Job Applicant No.s"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Job Applicant No.s';
        }
        field(69609; "Direct Hire Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Direct Hire Nos.';
        }
        field(69610; "Apptitude Selection Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Apptitude Selection Nos.';
        }
        field(69611; "Final Interview  Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Final Interview  Nos.';
        }
        field(69612; "Final Shortlist  Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Final Shortlist  Nos.';
        }
        field(69613; "Functional Plan Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Functional Plan Nos.';
        }
        field(69614; "Commiitee Appoint Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Commiitee Appoint Nos.';
        }
        field(69615; "Committee Terminate Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Committee Terminate Nos.';
        }
        field(69616; "HR Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'HR Template Nos.';
        }
        field(69617; "Prescreening Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Prescreening Template Nos.';
        }
        field(69618; "Apptitude Question Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Apptitude Question Nos.';
        }
        field(69619; "Medical Checks Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Medical Checks Template Nos.';
        }
        field(69620; "Ability Test Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Ability Test Nos.';
        }
        field(69621; "Ability Test Invitation Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Ability Test Invitation Nos.';
        }
        field(69622; "Phone Interview Report Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Phone Interview Report Nos.';
        }
        field(69623; "Ability Test Response Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Ability Test Response Nos.';
        }
        field(69624; "Shortlisting Voucher Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Shortlisting Voucher Nos.';
        }
        field(69625; "Interview Invitation Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Interview Invitation Nos.';
        }
        field(69626; "Background Checks Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Background Checks Nos.';
        }
        field(69627; "Referee Recomm Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Referee Recomm Nos.';
        }
        field(69628; "Prehire Medical Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Prehire Medical Nos.';
        }
        field(69629; "Employment Offer Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Employment Offer Nos.';
        }
        field(69630; "Benefit Package Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Benefit Package Nos.';
        }
        field(69631; "Phone Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Phone Template Nos.';
        }
        field(69632; "Applicant Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Applicant Template Nos.';
        }
        field(69633; "Scoresheet Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Scoresheet Template Nos.';
        }
        field(69634; "Interview Report Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Interview Report Nos.';
        }
        field(69635; "Vacancy Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Vacancy Nos.';
        }
        field(69636; "Cadre  Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Cadre  Nos.';
        }
        field(69637; "Retirement Age"; DateFormula)
        {
            DataClassification = CustomerContent;
            Caption = 'Retirement Age';
        }
        field(69638; "Pay-change No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Pay-change No.';
        }
        field(69639; "PR Allowance Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'PR Allowance Nos.';
        }
        field(69640; "PR Deduction Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'PR Deduction Nos.';
        }
        field(69641; "Portal Reports File Path"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Portal Reports File Path';
        }
        field(69642; "Reports File Path"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Reports File Path';
        }
        field(69643; "Employee Transfer Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Employee Transfer Nos';
        }
        //"Acting Nos"
        field(69644; "Acting Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Acting Nos';
            DataClassification = CustomerContent;
        }
        field(69645; "Organization Hierachy Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Organization Hierachy Nos';
            DataClassification = CustomerContent;
        }
        field(69646; "Induction Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Induction Nos';
            DataClassification = CustomerContent;
        }
        field(69647; "Current Global Staff Est"; Code[30])
        {
            //TableRelation = "Staff Establishment Plan";
            Caption = 'Current Global Staff Establishment';
            DataClassification = CustomerContent;
        }
        field(69648; "Meeting Room Req No.s"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Meeting Room Req No.s';
            DataClassification = CustomerContent;
        }
        field(69649; "Job Position No.s"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Job Position No.s';
            DataClassification = CustomerContent;
        }
        field(69650; "Staff Establishment No.s"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Staff Establishment No.s';
            DataClassification = CustomerContent;
        }
        field(69651; "Orientation Invitation Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Orientation Invitation Nos.';
        }
        field(69652; "Insurance Claim Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Insurance Claim Nos.';
        }
        field(69653; "Training Committee Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Training Committee Nos.';
        }
        field(69654; "PR Benefit Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'PR Benefit Nos';
            DataClassification = CustomerContent;
        }
        field(69655; "Individual Shortlist Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Individual Shortlist Nos.';
        }

        field(69656; "Exit HandOver Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Exit HandOver Nos';
        }
        field(69657; "Exit voucher Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Exit voucher Nos';
        }
        field(69658; "Exit Final Dues Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Exit Final Dues Nos';
        }
        field(69659; "Transfer Opinion Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Transfer Opinion Nos';
        }
        field(69660; "E-Recruitment Portal Link"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'E-Recruitment Portal Link';
        }

        field(69661; "Employment Appointment Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Employment Appointment Nos.';
        }
        field(69662; "Dependants Change Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Dependants Change Nos.';
        }
        field(69663; "Leave Adjustment Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Leave Adjustment Nos.';
        }
        field(69664; "Discipline Grievance Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Discipline Grievance Nos.';
        }
        field(69665; "Discipline Surcharge Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Discipline Surcharge Nos.';
        }
        field(69666; "Medical Cards Replacement"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Medical Cards Replacement';
        }
        field(69667; "Ex Gratia Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Ex Gratia Nos';
        }
        field(69668; "Attachee Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Attachee Nos.';
        }
        field(69669; "Casual Employee Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Casual Employee Nos.';
        }
        field(69670; "Intern Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Intern Nos.';
        }
        field(69671; "Pupillage Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Pupillage Nos.';
        }
        field(69672; "Temporary Employee Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Temporary Employee Nos.';
        }
        field(69673; "Casual Pay Sched Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Casual Pay Sched Nos';
            DataClassification = CustomerContent;
        }

        field(69674; "Minimum Station Yrs of Service"; Code[50])
        {
            Caption = 'Minimum Station Yrs of Service';
            DataClassification = CustomerContent;
        }


    }
}

