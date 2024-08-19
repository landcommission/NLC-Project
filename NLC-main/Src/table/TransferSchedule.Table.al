#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193712 "Transfer Schedule"
{
    Caption = 'Salutation';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = false;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Employee Code"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code';
            trigger OnValidate()
            begin
                if CompanyStaff.Get("Employee Code") then begin
                    Description := CompanyStaff."Full Name";
                    "Job ID" := CompanyStaff."Job ID";
                    Validate("Job ID");
                    "Curent Branch" := CompanyStaff."Global Dimension 1 Code";
                    //  "Current Supervisor":=CompanyStaff."Supervisor Staff ID";
                    "Current Status" := CompanyStaff.Status;
                    "Current Bank" := CompanyStaff."Main Bank";
                    "Current Bank Branch" := CompanyStaff."Branch Bank";
                    "Current Bank Account No." := CompanyStaff."Bank Account Number";
                    "Current Probation End Date" := CompanyStaff."End Of Probation Date";
                    "Current Department" := CompanyStaff."Responsibility Center";
                    //  "HOD Level":=CompanyStaff."HOD Level";
                    //  "New HOD Level":=CompanyStaff."HOD Level";
                    "Current Lock  Bank Details" := CompanyStaff."Lock Bank Details";
                    "Email Address" := CompanyStaff."Company E-Mail";
                    "Current Username" := CompanyStaff."User ID";
                    "Current CellPhone No" := CompanyStaff."Cell Phone Number";


                end;


                SalarySetUp.Reset();
                SalarySetUp.SetRange(SalarySetUp."Employee Code", "Employee Code");
                if SalarySetUp.Find('-') then
                    "Current Pay" := SalarySetUp."Basic Pay";
                //  "Rated Pay":=SalarySetUp."Rated Amount";
            end;
        }
        field(4; "Job ID"; Code[10])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID';
            trigger OnValidate()
            begin

                if HRJobs.Get("Job ID") then
                    "Job Title" := HRJobs."Job Description";
            end;
        }
        field(5; "Job Title"; Code[70])
        {
            Caption = 'Job Title';
        }
        field(6; "Curent Branch"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Curent Branch';
        }
        field(7; "New Branch"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'New Branch';
        }
        field(8; "Pay Change"; Decimal)
        {
            Caption = 'Pay Change';
        }
        field(9; "Date Requested"; Date)
        {
            Editable = false;
            Caption = 'Date Requested';
        }
        field(10; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
        }
        field(11; Remark; Text[100])
        {
            Caption = 'Remark';
        }
        field(12; "Transfer Status"; Option)
        {
            OptionCaption = 'Application,Pending Approval,Rejected,Approved,Cancelled';
            OptionMembers = Application,"Pending Approval",Rejected,Approved,Cancelled;
            Caption = 'Transfer Status';
        }
        field(13; Posted; Boolean)
        {
            Editable = true;
            Caption = 'Posted';
        }
        field(14; "Current Location"; Code[50])
        {
            Editable = true;
            FieldClass = Normal;
            Caption = 'Current Location';
        }
        field(15; "Approvals Remarks"; Text[150])
        {
            Caption = 'Approvals Remarks';
        }
        field(16; "Curent Branch Name"; Code[30])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Curent Branch")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Curent Branch Name';
        }
        field(17; "New Branch Name"; Code[30])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("New Branch")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'New Branch Name';
        }
        field(18; "Change Type"; Option)
        {
            OptionCaption = 'Loans,Payment Voucher,Imprest,Cash Receipts,Saving Refund,Petty Cash,Leave,Promotion,Transfer,Exit,Confirm,Demotion';
            OptionMembers = Loans,"Payment Voucher",Imprest,"Cash Receipts","Saving Refund","Petty Cash",Leave,Promotion,Transfer,"Exit",Confirm,Demotion;
            Caption = 'Change Type';
        }
        field(19; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
        field(20; "New Job ID"; Code[10])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'New Job ID';
            trigger OnValidate()
            begin

                if HRJobs.Get("New Job ID") then
                    "New Job Title" := HRJobs."Job Description";
            end;
        }
        field(21; "New Job Title"; Code[70])
        {
            Caption = 'New Job Title';
        }
        field(22; "Approved By"; Code[50])
        {
            Editable = false;
            TableRelation = "User Setup"."User ID";
            Caption = 'Approved By';
        }
        field(23; "Current Pay"; Decimal)
        {
            Editable = false;
            Caption = 'Current Pay';
        }
        field(24; "Current Supervisor"; Code[50])
        {
            Editable = false;
            Caption = 'Current Supervisor';
        }
        field(25; "New Supervisor"; Code[50])
        {
            Caption = 'New Supervisor';
        }
        field(26; "Transfer Type"; Option)
        {
            OptionCaption = ' ,Transfer,Confirmation,Promotion,Demotion,Basic Pay,Exits,Extend Probation,Bank Details,Leave,Rated Pay';
            OptionMembers = " ",Transfer,Confirmation,Promotion,Demotion,"Basic Pay",Exits,"Extend Probation","Bank Details",Leave,"Rated Pay";
            Caption = 'Transfer Type';
        }
        field(27; "Current Status"; Option)
        {
            OptionCaption = ' ,New,Probation,Active,InActive,Exited';
            OptionMembers = " ",New,Probation,Active,InActive,Exited;
            Caption = 'Current Status';
        }
        field(28; "New  status"; Option)
        {
            OptionCaption = 'New,Probation,Active,InActive,Exited';
            OptionMembers = New,Probation,Active,InActive,Exited;
            Caption = 'New  status';
        }
        field(29; "Extended Probation Duration"; Text[30])
        {
            Caption = 'Extended Probation Duration';
        }
        field(30; "Probation Extension Reason"; Text[200])
        {
            Caption = 'Probation Extension Reason';
        }
        field(31; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
        }
        field(32; "Current Probation End Date"; Date)
        {
            Caption = 'Current Probation End Date';
        }
        field(33; "Extended Probation End Date"; Date)
        {
            Caption = 'Extended Probation End Date';
        }
        field(34; "Current Bank"; Code[20])
        {
            Editable = false;
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Current Bank';
        }
        field(35; "Current Bank Branch"; Code[20])
        {
            Editable = false;
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Current Bank"));
            Caption = 'Current Bank Branch';
        }
        field(36; "Current Bank Account No."; Code[20])
        {
            Editable = false;
            Caption = 'Current Bank Account No.';
        }
        field(37; "New Bank"; Code[20])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'New Bank';
            trigger OnValidate()
            begin
                if "Current Lock  Bank Details" = true then
                    Error('Locked Bank accounts must be unlocked first')
            end;
        }
        field(38; "New Bank  Branch"; Code[20])
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("New Bank"));
            Caption = 'New Bank  Branch';
            trigger OnValidate()
            begin
                if "Current Lock  Bank Details" = true then
                    Error('Locked Bank accounts must be unlocked first')
            end;
        }
        field(39; "New Bank Account No"; Code[20])
        {
            Caption = 'New Bank Account No';
            trigger OnValidate()
            begin
                if "Current Lock  Bank Details" = true then
                    Error('Locked Bank accounts must be unlocked first')
            end;
        }
        field(40; "New Bank Name"; Text[40])
        {
            CalcFormula = lookup("PR Bank Accounts"."Bank Name" where("Bank Code" = field("New Bank")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "PR Bank Accounts"."Bank Name" where("Bank Code" = field("New Bank"));
            Caption = 'New Bank Name';
            trigger OnValidate()
            begin
                if "Current Lock  Bank Details" = true then
                    Error('Locked Bank accounts must be unlocked first')
            end;
        }
        field(41; "New Bank Branch Name"; Text[40])
        {
            CalcFormula = lookup("PR Bank Branches"."Branch Name" where("Branch Code" = field("New Bank  Branch")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "PR Bank Branches"."Branch Name" where("Branch Code" = field("New Bank  Branch"));
            Caption = 'New Bank Branch Name';
            trigger OnValidate()
            begin
                if "Current Lock  Bank Details" = true then
                    Error('Locked Bank accounts must be unlocked first')
            end;
        }
        field(42; "Current Bank  Branch Name"; Text[40])
        {
            CalcFormula = lookup("PR Bank Branches"."Branch Name" where("Branch Code" = field("Current Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "PR Bank Branches"."Branch Name" where("Branch Code" = field("Current Bank Branch"));
            Caption = 'Current Bank  Branch Name';
        }
        field(43; "Current Bank Name"; Text[40])
        {
            CalcFormula = lookup("PR Bank Accounts"."Bank Name" where("Bank Code" = field("Current Bank")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "PR Bank Accounts"."Bank Name" where("Bank Code" = field("Current Bank"));
            Caption = 'Current Bank Name';
        }
        field(44; "Current Department"; Code[50])
        {
            Editable = false;
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Current Department';
            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Responsibility Center BR NEW";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec."Current Department");
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;

        }
        field(45; "New Department"; Code[50])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = filter('DEPARTMENT'),
                                                          Code = filter(<> '1' | <> '2' | <> '3' | <> '4' | <> '5'));
            Caption = 'New Department';
        }
        field(46; "HOD Level"; Option)
        {
            OptionCaption = 'level one,Level Two';
            OptionMembers = "level one","Level Two";
            Caption = 'HOD Level';
        }
        field(47; "New HOD Level"; Option)
        {
            OptionCaption = 'level one,Level Two';
            OptionMembers = "level one","Level Two";
            Caption = 'New HOD Level';
        }
        field(48; "Leave Type"; Code[30])
        {
            TableRelation = "HR Leave Types".Code;
            Caption = 'Leave Type';

        }
        field(49; "Days Compensated"; Decimal)
        {
            Caption = 'Days Compensated';
        }
        field(50; "Leave Calendar Code"; Code[20])
        {
            Editable = true;
            TableRelation = "HR Calendar".Code;
            Caption = 'Leave Calendar Code';
        }
        field(51; "Leave Entry Type"; Option)
        {
            Caption = 'Leave Entry Type';
            OptionCaption = 'Positive,Negative,Reimbursement';
            OptionMembers = Positive,Negative,Reimbursement;
        }
        field(52; Effected; Boolean)
        {
            Caption = 'Effected';
        }
        field(53; "Rated Pay"; Decimal)
        {
            Caption = 'Rated Pay';
        }
        field(54; "New Rated Pay"; Decimal)
        {
            Caption = 'New Rated Pay';
        }
        field(55; "Current Lock  Bank Details"; Boolean)
        {
            Editable = false;
            Caption = 'Current Lock  Bank Details';
        }
        field(56; "New Lock  Bank Details"; Boolean)
        {
            Caption = 'New Lock  Bank Details';
        }
        field(57; "Email Address"; Text[50])
        {
            Caption = 'Email Address';
        }
        field(58; "New Email address"; Text[50])
        {
            Caption = 'New Email address';
        }
        field(59; "Current Username"; Code[50])
        {
            Caption = 'Current Username';
        }
        field(60; "New Username"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'New Username';
        }
        field(61; "Current CellPhone No"; Text[30])
        {
            Caption = 'Current CellPhone No';
        }
        field(62; "New CellPhone No"; Text[30])
        {
            Caption = 'New CellPhone No';
        }
        field(63; "KRA PIN"; Code[25])
        {
            Caption = 'KRA PIN';
        }
        field(64; "NHIF No"; Code[25])
        {
            Caption = 'NHIF No';
        }
        field(65; "NSSF No"; Code[25])
        {
            Caption = 'NSSF No';
        }
        field(66; "Termination Category"; Option)
        {
            OptionCaption = ' ,Resignation,Non-Renewal Of Contract,Dismissal,Retirement,Death,Termination,Other';
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Termination,Other;
            Caption = 'Termination Category';

        }
        field(67; "Department Name"; text[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }


    trigger OnInsert()
    begin
        //IF Code='' THEN BEGIN
        // NoseriesMgt.InitSeries('TS',xRec.Code,0D,Code,"No. Series");
        // Code:=NoseriesMgt.GetNextNo('TS',TODAY,FALSE);
        //END;


        if Code = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(SalesSetup."Blanket Order Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Blanket Order Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;
        "Date Requested" := Today
    end;

    var
        CompanyStaff: Record "HR Employees";
        HRJobs: Record "HR Jobs";
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalarySetUp: Record "PR Salary Card";
}
