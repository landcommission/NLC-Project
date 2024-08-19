#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193877 "HR Staff Loan Request"
{
    Caption = 'HR Staff Loan Request';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Loan No."; Code[50])
        {
            Caption = 'Loan No.';
        }
        field(2; "Loan Description"; Text[100])
        {
            Caption = 'Loan Description';
        }
        field(3; "Loan Type"; Code[50])
        {
            TableRelation = "HR Staff Loan Types".Code;
            Caption = 'Loan Type';
            trigger OnValidate()
            begin
                if HRLoanTypes.Get("Loan Type") then begin
                    "Loan Description" := HRLoanTypes."Product Description";
                    Interest := HRLoanTypes."Interest rate";
                    "No of Instalments" := HRLoanTypes."No of Installment";
                    "Repayment Frequency" := HRLoanTypes."Repayment Frequency";
                    "Grace Period - Principle (M)" := HRLoanTypes."Grace Period - Principle (M)";
                    "Grace Period - Interest (M)" := HRLoanTypes."Grace Period - Interest (M)";
                    "Payroll Code" := HRLoanTypes."Payroll Code";
                    HREmp.Reset();
                    HREmp.SetRange(HREmp."No.", "Emp No.");
                    if HREmp.Find('-') then begin
                        EmpDate := CalcDate(HRLoanTypes."Min Application Period", HREmp."Date Of Joining the Company");
                        if EmpDate > Today then
                            //IF (TODAY-HREmp."Date Of Joining the Company")<=HRLoanTypes."Min Application Period" THEN BEG IN
                            Error('You have not reached the minimum %1 years to take this loan', HRLoanTypes."Min Application Period");
                    end
                end;

                objLoanApps.Reset();
                objLoanApps.SetRange(objLoanApps."Emp No.", "Emp No.");
                objLoanApps.SetRange(objLoanApps."Loan Type", "Loan Type");
                objLoanApps.SetRange(objLoanApps.Posted, false);
                if objLoanApps.Find('-') then
                    repeat
                        if objLoanApps.Status <> objLoanApps.Status::Rejected then
                            if objLoanApps."Loan No." <> "Loan No." then
                                Error('You already have an existing %1 application: - %3', objLoanApps."Loan Description", objLoanApps."Loan No.");
                    until objLoanApps.Next() = 0;

                if "Loan Type" = 'HR001' then;

            end;
        }
        field(4; "Emp No."; Code[50])
        {
            Caption = 'Emp No.';
        }
        field(5; "Emp Name"; Text[200])
        {
            Caption = 'Emp Name';
        }
        field(6; "Request Date"; Date)
        {
            Caption = 'Request Date';
        }
        field(7; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Global Dimension 1 Code';
        }
        field(9; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Global Dimension 2 Code';
        }
        field(10; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Responsibility Center';
        }
        field(11; "Date Created"; Date)
        {
            Caption = 'Date Created';
        }
        field(12; "Amount Requested"; Decimal)
        {
            Caption = 'Amount Requested';
            trigger OnValidate()
            begin
                if "Amount Approved" > "Amount Requested" then
                    Error('AMount Approved cannot be more than Amount Requested')
            end;
        }
        field(13; "Amount Approved"; Decimal)
        {
            Editable = true;
            Caption = 'Amount Approved';
            trigger OnValidate()
            begin
                "Undisbursed Amount" := "Amount Approved" - "Amount Disbursed";
                if "Amount Approved" > "Amount Requested" then
                    Error('Requested Amount cannot be less than the approved amount');

                "flat rate interest" := 0;
                "Flat Rate Principal" := 0;
                Repayment := 0;
                "Total Repayment" := 0;

                if "No of Instalments" <= 0 then
                    Error('Number of installments must be greater than Zero.');


                TotalMRepay := 0;
                lPrincipal := 0;
                linterest := 0;
                InterestRate := Interest;
                LoanAmount := "Amount Approved";
                RepayPeriod := "No of Instalments";
                LBalance := "Amount Approved";

                //+++++++++++++++++++++++++If Amortization++++++++++++++++++++++++++

                if "Repayment Method" = "Repayment Method"::Amortised then begin
                    //IF "Loan Product Type"='DEFAULTER' THEN BEGIN
                    //LPrincipal:=ROUND(LoanAmount/RepayPeriod,1,'>');
                    //Repayment:=LPrincipal;
                    //END ELSE BEGIN
                    TestField(Interest);
                    TestField("No of Instalments");
                    TotalMRepay := Round((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -RepayPeriod)) * LoanAmount, 0.05, '>');
                    linterest := Round(LBalance / 100 / 12 * InterestRate, 0.05, '>');
                    lPrincipal := TotalMRepay - linterest;
                    Repayment := lPrincipal + linterest;
                    //"Adjust Repayment":=LPrincipal+LInterest;
                    "Loan Principal Repayment" := lPrincipal;
                    "Loan Interest Repayment" := linterest;
                    //END;
                end;

                if "Repayment Method" = "Repayment Method"::"Straight line" then begin
                    TestField("No of Instalments");
                    lPrincipal := Round(LoanAmount / RepayPeriod, 1, '>');
                    linterest := Round((InterestRate / 100 / 12) * LoanAmount, 1, '>');
                    Repayment := lPrincipal + linterest;
                    //"Adjust Repayment":=LPrincipal+LInterest;
                    "Loan Principal Repayment" := lPrincipal;
                    "Loan Interest Repayment" := linterest;
                end;

                //Repayments for reducing balance method
                if "Repayment Method" = "Repayment Method"::"Reducing Balance" then begin
                    TestField(Interest);
                    TestField("No of Instalments");
                    lPrincipal := LoanAmount / RepayPeriod;
                    linterest := (InterestRate / 12 / 100) * LBalance;
                    Repayment := lPrincipal + linterest;
                    //"Adjust Repayment":=LPrincipal+LInterest;
                    "Loan Principal Repayment" := lPrincipal;
                    "Loan Interest Repayment" := linterest;
                end;
            end;
        }
        field(14; Interest; Decimal)
        {
            Caption = 'Interest';
        }
        field(15; "Total Amount Approved"; Decimal)
        {
            Description = 'Total Amount Approved inclusive of interest';
            Caption = 'Total Amount Approved';
        }
        field(16; "Instalments Amount"; Decimal)
        {
            Caption = 'Instalments Amount';
        }
        field(17; "No of Instalments"; Decimal)
        {
            Caption = 'No of Instalments';
        }
        field(18; "Amount Paid"; Decimal)
        {
            TableRelation = "PR Period Transactions".Amount where("Loan Number" = field("Loan No."));
            Caption = 'Amount Paid';
        }
        field(19; Balance; Decimal)
        {
            Caption = 'Balance';
        }
        field(20; Picture; Blob)
        {
            Caption = 'Picture';
        }
        field(21; "Supervisor Email"; Text[50])
        {
            Caption = 'Supervisor Email';
        }
        field(22; Supervisor; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Supervisor';
        }
        field(23; "No series"; Code[30])
        {
            Caption = 'No series';
        }
        field(24; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(25; Status; Option)
        {
            Editable = true;
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
        field(26; "Number of Previous Attempts"; Text[200])
        {
            Caption = 'Number of Previous Attempts';
        }
        field(27; "Job Tittle"; Text[50])
        {
            Caption = 'Job Tittle';
        }
        field(28; "Repayment Frequency"; Option)
        {
            OptionMembers = Daily,Weekly,Monthly,Quaterly,Yearly;
            Caption = 'Repayment Frequency';
        }
        field(29; "Loan Disbursement Date"; Date)
        {
            Caption = 'Loan Disbursement Date';
            trigger OnValidate()
            begin
                if "Loan Disbursement Date" > Today then
                    Error('Disbursement date cannot be in the future');
            end;
        }
        field(30; "Repayment Start Date"; Date)
        {
            Caption = 'Repayment Start Date';
        }
        field(31; "Repayment Method"; Option)
        {
            OptionMembers = "Reducing Balance",Amortised,"Straight line",Constants;
            Caption = 'Repayment Method';
        }
        field(32; "Batch No."; Code[10])
        {
            TableRelation = "HR Batches"."Batch No.";
            Caption = 'Batch No.';
        }
        field(33; "Account No."; Code[30])
        {
            Caption = 'Account No.';
        }
        field(34; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(35; "Amount Disbursed"; Decimal)
        {
            Editable = false;
            Caption = 'Amount Disbursed';
            trigger OnValidate()
            begin
                "Undisbursed Amount" := "Amount Approved" - "Amount Disbursed";
            end;
        }
        field(36; "Fully Disbursed"; Boolean)
        {
            Editable = false;
            Caption = 'Fully Disbursed';
        }
        field(37; "Undisbursed Amount"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
            Caption = 'Undisbursed Amount';
        }
        field(38; "Amount to Disperse"; Decimal)
        {
            Caption = 'Amount to Disperse';
            trigger OnValidate()
            begin
                if ("Amount Disbursed" + "Amount to Disperse") > "Amount Approved" then
                    Error('Amount to Disburse cannot be more than Undisbursed Amount');
                if "Loan Type" = '105' then
                    if "Amount Disbursed" = 0 then
                        if "Amount to Disperse" > "Amount Approved" * 0.1 then
                            Error('You can only disburse 10% or less of the approved amount during the first disbursement');
            end;
        }
        field(39; "Car Reg No"; Code[20])
        {
            Caption = 'Car Reg No';
        }
        field(40; "Log Book No"; Code[20])
        {
            Caption = 'Log Book No';
        }
        field(41; "Driving Licence No"; Code[20])
        {
            Caption = 'Driving Licence No';
        }
        field(42; "Grace Period - Principle (M)"; Integer)
        {
            Caption = 'Grace Period - Principle (M)';

        }
        field(43; "Grace Period - Interest (M)"; Integer)
        {
            Caption = 'Grace Period - Interest (M)';
        }
        field(44; Repayment; Decimal)
        {
            Caption = 'Repayment';
        }
        field(45; "Loan Principal Repayment"; Decimal)
        {
            Caption = 'Loan Principal Repayment';
        }
        field(46; "Loan Interest Repayment"; Decimal)
        {
            Caption = 'Loan Interest Repayment';
        }
        field(47; "Insurance Company"; Text[30])
        {
            Caption = 'Insurance Company';
        }
        field(48; "Insurance No."; Code[10])
        {
            Caption = 'Insurance No.';
        }
        field(49; "Instalment Period"; DateFormula)
        {
            Caption = 'Instalment Period';
        }
        field(50; "New Car"; Boolean)
        {
            Caption = 'New Car';
            trigger OnValidate()
            begin
                CarLoan.Reset();
                CarLoan.SetRange(CarLoan."Loan type", "Loan Type");
                CarLoan.SetRange(CarLoan.New, "New Car");
                if CarLoan.Find('-') then
                    "No of Instalments" := CarLoan.Installments;
            end;
        }
        field(51; "Customer No."; Code[30])
        {
            Caption = 'Customer No.';
        }
        field(52; "Interest Due"; Decimal)
        {
            Caption = 'Interest Due';
        }
        field(53; "Interest Paid"; Decimal)
        {
            Caption = 'Interest Paid';
        }
        field(54; "Outstanding Interest"; Decimal)
        {
            Caption = 'Outstanding Interest';
        }
        field(55; "Payroll Code"; Code[10])
        {
            Caption = 'Payroll Code';
        }
        field(56; NetPay; Decimal)
        {
            Caption = 'NetPay';
        }
        field(57; Plot; Boolean)
        {
            Caption = 'Plot';
        }
        field(58; Building; Boolean)
        {
            Caption = 'Building';
        }
    }

    keys
    {
        key(Key1; "Loan No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        if Status <> Status::New then
            Error('This Loan has already been send for approval. You cannot Delete!');
    end;

    trigger OnInsert()
    begin
        //---------GENERATE NEW NUMBER FOR THE DOCUMENT-----------------------------------
        if "Loan No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Loan Application Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Loan Application Nos.", xRec."No series", 0D, "Loan No.", "No series");
        end;
        //GET APPLICANT DETAILS FROM HR EMPLOYEES TABLE AND COPY THEM TO THE LEAVE APPLICATION TABLE
        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            "Emp No." := HREmp."No.";

            //---------------------------------------------------------------------
            HREmp.Get(HREmp."No.");
            HREmp.CalcFields(HREmp.Picture);
            Picture := HREmp.Picture;
            "User ID" := UserId;
        end else
            Error('User id' + ' ' + '[' + UserId + ']' + ' has not been assigned to any employee. Please consult the HR officer for assistance');
        //GET LOAN APPROVER DETAILS FROM USER SETUP TABLE COPY THEM TO THE LOAN APPLICATION TABLE
        UserSetup.Reset();
        if UserSetup.Get(UserId) then begin
            UserSetup.TestField(UserSetup."Approver ID");
            Supervisor := UserSetup."Approver ID";
            UserSetup.Reset();
            if UserSetup.Get(Supervisor) then
                "Supervisor Email" := UserSetup."E-Mail";
        end;

        //POPULATE FIELDS
        "Date Created" := Today;
        "Request Date" := Today;
        if HREmp.Get("Emp No.") then begin
            "Emp Name" := HREmp."Full Name";//HREmp."First Name"+' '+HREmp."Middle Name"+' '+HREmp."Last Name";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
            "Responsibility Center" := HREmp."Responsibility Center";
            Account := HREmp."No.";//HREmp."Sacco Staff No";
        end;
    end;


    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HREmp: Record "HR Employees";
        HRLoanTypes: Record "HR Staff Loan Types";
        BaseCalendarChange: Record "Base Calendar Change";
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "HR Calendar List";
        HREmailParameters: Record "HR E-Mail Parameters";
        intEntryNo: Integer;
        Calendar: Record Date;
        empMonths: Integer;
        objLoanApps: Record "HR Staff Loan Request";
        Account: Code[20];
        member: Record "HR Employees";
        "flat rate interest": Integer;
        "Flat Rate Principal": Integer;
        Repayment: Decimal;
        "Total Repayment": Decimal;
        TotalMRepay: Decimal;
        lPrincipal: Decimal;
        linterest: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Decimal;
        LoanAmount: Decimal;
        LBalance: Decimal;
        Vend: Record Vendor;
        CarLoan: Record "HR Car Loan Setup";
        EmpDate: Date;
}
