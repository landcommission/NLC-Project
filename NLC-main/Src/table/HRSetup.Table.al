#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193466 "HR Setup"
{
    Caption = 'HR Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Employee Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Nos.';
        }
        field(3; "Training Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Training Application Nos.';
        }
        field(4; "Leave Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Leave Application Nos.';
        }
        field(6; "Disciplinary Cases Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Disciplinary Cases Nos.';
        }
        field(7; "Base Calendar"; Code[10])
        {
            TableRelation = "HR Calendar";
            Caption = 'Base Calendar';
        }
        field(13; "Transport Req Nos"; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Transport Req Nos';
        }
        field(14; "Employee Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Requisition Nos.';
        }
        field(15; "Leave Posting Period[FROM]"; Date)
        {
            Caption = 'Leave Posting Period[FROM]';
        }
        field(16; "Leave Posting Period[TO]"; Date)
        {
            Caption = 'Leave Posting Period[TO]';
        }
        field(17; "Job Application Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Job Application Nos';
        }
        field(18; "Exit Interview Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Exit Interview Nos';
        }
        field(19; "Appraisal Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Appraisal Nos';
        }
        field(20; "Company Activities"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Company Activities';
        }
        field(21; "Default Leave Posting Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
            Caption = 'Default Leave Posting Template';
        }
        field(22; "Positive Leave Posting Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch".Name;
            Caption = 'Positive Leave Posting Batch';
        }
        field(23; "Leave Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Template";
            Caption = 'Leave Template';
        }
        field(24; "Leave Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch".Name;
            Caption = 'Leave Batch';
        }
        field(25; "Job Interview Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Job Interview Nos';
        }
        field(26; "Company Documents"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Company Documents';
        }
        field(27; "HR Policies"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'HR Policies';
        }
        field(28; "Notice Board Nos."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Notice Board Nos.';
        }
        field(29; "Leave Reimbursment Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Leave Reimbursment Nos.';
        }
        field(30; "Min. Leave App. Months"; Integer)
        {
            Caption = 'Minimum Leave Application Months';
        }
        field(31; "Negative Leave Posting Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch".Name;
            Caption = 'Negative Leave Posting Batch';
        }
        field(32; "Appraisal Method"; Option)
        {
            OptionCaption = ' ,Normal Appraisal,360 Appraisal,BSC Appraisal';
            OptionMembers = " ","Normal Appraisal","360 Appraisal","BSC Appraisal";
            Caption = 'Appraisal Method';
        }
        field(33; "Appraisal Template"; Code[10])
        {
            TableRelation = "HR Appraisal Journal Template";
            Caption = 'Appraisal Template';
        }
        field(34; "Appraisal Batch"; Code[10])
        {
            TableRelation = "HR Appraisal Journal Batch".Name;
            Caption = 'Appraisal Batch';
        }
        field(35; "Appraisal Posting Period[FROM]"; Date)
        {
            Caption = 'Appraisal Posting Period[FROM]';
        }
        field(36; "Appraisal Posting Period[TO]"; Date)
        {
            Caption = 'Appraisal Posting Period[TO]';
        }
        field(37; "Target Setting Month"; Integer)
        {
            Caption = 'Target Setting Month';
        }
        field(38; "Appraisal Interval"; DateFormula)
        {
            Caption = 'Appraisal Interval';
        }
        field(39; "Job ID Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Job ID Nos';
        }
        field(40; "HR Loan Nos."; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'HR Loan Nos.';
        }
        field(41; "Loan Batch Nos."; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Loan Batch Nos.';
        }
        field(42; "Overtime Req Nos."; Code[10])
        {
            Caption = 'Overtime Requisition Nos.';
            TableRelation = "No. Series";
        }
        field(43; "Overtime Payroll Code"; Code[20])
        {
            Caption = 'Overtime Payroll Code';
        }
        field(50000; "Loan Application Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Loan Application Nos.';
        }
        field(50001; "Leave Carry Over App Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Leave Carry Over App Nos.';
        }
        field(50002; "Pay-change No."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Pay-change No.';
        }
        field(50003; "Max Appraisal Rating"; Decimal)
        {
            Caption = 'Max Appraisal Rating';
        }
        field(50004; "Medical Claims Nos"; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Medical Claims Nos';
        }
        field(50005; "Employee Transfer Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Transfer Nos.';
        }
        field(50006; "Leave Planner Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Leave Planner Nos.';
        }
        field(50007; "Employee Asset Transfer No."; Code[30])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Asset Transfer No.';
        }
        field(50008; "Company Additional Amount"; Decimal)
        {
            Caption = 'Company Additional Amount';
        }
        field(50009; "Employee Confirmation No."; Code[30])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Confirmation No.';
        }
        field(50010; "Employee Promotion No."; Code[30])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Promotion No.';
        }
        field(50011; "Professional Bodies No."; Code[30])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Professional Bodies No.';
        }
        field(50012; "Employee Grievance Nos."; Code[30])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Grievance Nos.';
        }
        field(50013; "Proffessional Bodies Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Proffessional Bodies Nos.';
        }
        field(50014; "Traning Needs Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Traning Needs Nos.';
        }
        field(50015; "Induction Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Induction Nos';
        }
        field(50018; AppDocNo; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'AppDocNo';
        }
        field(50019; "Back To Office Nos."; Code[20])
        {
            Caption = 'Back To Office Nos.';
        }
        field(50020; "Clearance Nos"; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Clearance Nos';
        }
        field(50021; "Exit Questionnaire Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Exit Questionnaire Nos.';
        }
        field(50022; "Payroll Change Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Payroll Change Nos.';
        }
        field(50023; "Separation Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Separation Nos.';
        }
        field(50024; "Acceleration Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Acceleration Nos.';
        }
        field(50025; "Training Needs Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Training Needs Nos.';
        }
        field(39004269; "Retirement Age"; DateFormula)
        {
            Caption = 'Retirement Age';
        }
        field(39004270; "Portal Administrator Username"; Code[20])
        {
            Caption = 'Portal Administrator Username';
        }
        field(39004271; "Promotion Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Promotion Nos.';
        }
        field(39004272; "Transfer Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Transfer Nos';
        }
        field(39004273; "Portal Files Path"; Text[250])
        {
            Caption = 'Portal Files Path';
        }
        field(4000; "EducaQual Setup"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(4001; "Staff Emp Changes"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40002; "Contract Emp NOs"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40003; "PNP Nos"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40004; "Casual NOs"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40005; "Intern Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40006; "Probation Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40007; "Deployed Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40008; "Transfer Allowance"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
        }
        field(40009; "Promotion Allowance"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
        }
        field(40010; "Case Nos"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(40011; "Min Employee Age"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(40012; "VAT %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40013; "Disabled Retirement Age"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(40014; "Min. Member Age"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(400015; "Hardship Allowance"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));

        }


    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
