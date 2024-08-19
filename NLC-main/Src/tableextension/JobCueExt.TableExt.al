#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 70025 "Job Cue Ext" extends "Job Cue"
{
    fields
    {
        field(39003900; "Concept Notes"; Integer)
        {
            CalcFormula = count("HR Employee Qualifications" where(Test = const('0'),
                                                                    Score = filter(0 | 1)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Concept Notes';
        }
        field(39003901; Proposals; Integer)
        {
            CalcFormula = count("HR Employee Qualifications" where(Test = const('1'),
                                                                    Score = filter(0 | 1)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Proposals';
        }
        field(39003902; Projects; Integer)
        {
            CalcFormula = count("HR Employee Qualifications" where(Test = const('2'),
                                                                    Score = filter(0 | 1)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Projects';
        }
        field(39003903; Compliance; Integer)
        {
            CalcFormula = count("HR OSAccident");
            FieldClass = FlowField;
            Caption = 'Compliance';
            Editable = false;
        }

        field(50000; "Imprest Requisition-Aproved"; Integer)
        {
            Caption = 'Imprest Requisition-Aproved';
            DataClassification = CustomerContent;
            // CalcFormula = count(Payments where(Status = const(Released),
            //                                     "Document Type" = filter(Imprest),
            //                                     "Created By" = field("User ID Filter")));
            // FieldClass = FlowField;
        }
        field(50001; "Imprest Memo-Approved"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest Memo-Approved';
        }
        field(50002; "Imprest Surender-Approved"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest Surender-Approved';
        }
        field(50003; "Imprest Request-P"; Integer)
        {
            Caption = 'Imprest Request-P';
            DataClassification = CustomerContent;
            // CalcFormula = count(Payments where(Status = const(Released),
            //                                     Posted = const(true),
            //                                     "Document Type" = filter(Imprest),
            //                                     "Created By" = field("User ID Filter")));
            // FieldClass = FlowField;
        }
        field(50004; "Imprest Request-Inprocess"; Integer)
        {
            Caption = 'Imprest Request-Inprocess';
            DataClassification = CustomerContent;
            // CalcFormula = count(Payments where(Status = filter(Open | "Pending Approval"),
            //                                     "Document Type" = filter(Imprest),
            //                                     "Created By" = field("User ID Filter")));
            // FieldClass = FlowField;
        }
        field(50005; "Imprest Surrender-P"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest Surrender-P';
        }
        field(50006; "Imprest Surender-Inprocess"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest Surender-Inprocess';
        }
        field(50007; "Imprest memo-P"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest memo-P';
        }
        field(50008; "Imprest Memo-inprocess"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest Memo-inprocess';
        }
        field(50009; "Imprest memo surr-inprocess"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest memo surr-inprocess';
        }
        field(50010; "Active Employees"; Integer)
        {
            CalcFormula = count(Employee where(Status = filter(Active)));
            FieldClass = FlowField;
            Caption = 'Active Employees';
            Editable = false;
        }
        field(50011; "Terminated Employees"; Integer)
        {
            CalcFormula = count(Employee where(Status = const(Terminated)));
            FieldClass = FlowField;
            Caption = 'Terminated Employees';
            Editable = false;
        }
        field(50012; "Inactive Employees"; Integer)
        {
            CalcFormula = count(Employee where(Status = const(Inactive)));
            FieldClass = FlowField;
            Caption = 'Inactive Employees';
            Editable = false;
        }
        field(50016; "Approved Leave"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Posted = const(false),
                                                              Status = const(Approved)));
            FieldClass = FlowField;
            Caption = 'Approved Leave';
            Editable = false;
        }
        field(50017; "Posted Approved Leave"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Posted = const(true)));
            FieldClass = FlowField;
            Caption = 'Posted Approved Leave';
            Editable = false;
        }
        field(50018; "Suspended Employees"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Suspended Employees';
        }
        field(50019; "Seconded Employees"; Integer)
        {
            CalcFormula = count("HR Employees" where("Contract Type" = filter("Seconded/Contract")));
            FieldClass = FlowField;
            Caption = 'Seconded Employees';
            Editable = false;
        }
        field(50021; "Imprest memo Surr-A"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest memo Surr-A';
        }
        field(50022; "Imprest memo Surr-p"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Imprest memo Surr-p';
        }
        field(50024; "Leave Application-Inprocess"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Status = filter(New | "Pending Approval"),
                                                              "User ID" = field("User ID Filter")));
            FieldClass = FlowField;
            Caption = 'Leave Application-Inprocess';
            Editable = false;
        }
        field(50025; "Leave Application-Approved"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Status = const(Approved),
                                                              Posted = const(false)));
            FieldClass = FlowField;
            Caption = 'Leave Application-Approved';
            Editable = false;
        }
        field(50027; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests to Approve-Overdue';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50028; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50033; "Salary Vouchers"; Integer)
        {
            Caption = 'Salary Vouchers';
            DataClassification = CustomerContent;
            // CalcFormula = count("Payroll Header" where(Status = filter(Open | "Pending Approval")));
            // FieldClass = FlowField;
        }
        field(50034; "Approved Salary Vouchers"; Integer)
        {
            Caption = 'Approved Salary Vouchers';
            DataClassification = CustomerContent;
            // CalcFormula = count("Payroll Header" where(Status = const(Released)));
            // FieldClass = FlowField;
        }
        field(50035; Visitors; Integer)
        {
            FieldClass = Normal;
            Caption = 'Visitors';
            DataClassification = CustomerContent;
        }
        field(50036; "Deployed Employees"; Integer)
        {
            FieldClass = Normal;
            Caption = 'Deployed Employees';
            DataClassification = CustomerContent;
        }
        field(50038; "Asigned ICT Requests"; Integer)
        {
            Caption = 'Asigned ICT Requests';
            DataClassification = CustomerContent;
            // CalcFormula = count("ICT Helpdesk" where(Status = const(Pending)));
            // FieldClass = FlowField;
        }
        field(50039; "Pending ICT Requests"; Integer)
        {
            Caption = 'Pending ICT Requests';
            DataClassification = CustomerContent;
            // CalcFormula = count("ICT Helpdesk" where(Status = const(Open)));
            // FieldClass = FlowField;
        }
        field(50040; "HOD ICT Requests"; Integer)
        {
            FieldClass = Normal;
            Caption = 'HOD ICT Requests';
            DataClassification = CustomerContent;
        }
        field(50041; "Pending Approval Leave"; Integer)
        {
            CalcFormula = count("HR Leave Application" where(Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Pending Approval Leave';
            Editable = false;
        }
        field(50042; "Retired Employees"; Integer)
        {
            Caption = 'Retired Employees';
            DataClassification = CustomerContent;
            // CalcFormula = count(Employee where (Status=const(Retired)));
            //FieldClass = FlowField;
        }
        field(50043; "Disciplinary Employees"; Integer)
        {
            Caption = 'Disciplinary Employees';
            DataClassification = CustomerContent;
            ///  CalcFormula = count(Employee where (Status=const("Under Disciplinary Action")));
            //FieldClass = FlowField;
        }
        field(50044; "Approved Staff Claims"; Integer)
        {
            Caption = 'Approved Staff Claims';
            DataClassification = CustomerContent;
            // CalcFormula = count(Payments where("Payment Type" = const("Staff Claim"),
            //                                     Status = const(Released),
            //                                     Posted = const(false)));
            // FieldClass = FlowField;
        }
        field(50045; "Unprocessed Staff Claims"; Integer)
        {
            Caption = 'Unprocessed Staff Claims';
            DataClassification = CustomerContent;
            // CalcFormula = count(Payments where("Payment Type" = const("Staff Claim"),
            //                                     Status = const(Released),
            //                                     Posted = const(true),
            //                                     "Payment processed" = const(false)));
            // FieldClass = FlowField;
        }
        field(50046; "Requests to Approve-Overdue"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Open),
                                                        "Due Date" = field("Overdue Date Filter")));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50047; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
        field(50048; "Approved Warrant Vouchers"; Integer)
        {
            Caption = 'Approved Warrant Vouchers';
            DataClassification = CustomerContent;
            // CalcFormula = count(Payments where("Payment Type" = filter("Warrant Voucher"),
            //                                     Status = filter(Released)));
            // FieldClass = FlowField;
        }
        field(50049; "Approved Payment Vouchers"; Integer)
        {
            Caption = 'Approved Payment Vouchers';
            DataClassification = CustomerContent;
            // CalcFormula = count(Payments where("Payment Type" = filter("Payment Voucher"),
            //                                     Status = filter(Released)));
            // FieldClass = FlowField;
        }
    }
}
