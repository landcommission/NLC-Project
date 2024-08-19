#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193544 "prPayroll Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            part(Control28; "HR Employee Cue")
            {
                Caption = 'Employees Cue';
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            group(Control1900724808)
            {
                systempart("employee cues"; Outlook) { }
            }
            group(Control1900724708)
            {
                part(Control17; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1903012608; "Copy Profile")
                {
                    Visible = false;
                }
                systempart(Control1901377608; MyNotes) { }
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            group("Payroll Reports")
            {
                action("PR NSSF")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR NSSF';
                    RunObject = report prNSSF;
                    ToolTip = 'Executes the PR NSSF action.';
                }
                action("PR NHIF")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR NHIF';
                    Promoted = true;
                    RunObject = report prNHIF;
                    ToolTip = 'Executes the PR NHIF action.';
                }
                action("PR P9A")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR P9A';
                    Promoted = true;
                    RunObject = report prP9A;
                    ToolTip = 'Executes the PR P9A action.';
                }
                action("PR P10A")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR P10A';
                    RunObject = report P10A;
                    ToolTip = 'Executes the PR P10A action.';
                }
                action("PR P10B")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR P10B';
                    RunObject = report "PR P10B";
                    ToolTip = 'Executes the PR P10B action.';
                }
                action("PR P10C")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR P10C';
                    RunObject = report "PR P10C";
                    ToolTip = 'Executes the PR P10C action.';
                }
                action("PR P10D")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR P10D';
                    RunObject = report "PR P10D";
                    ToolTip = 'Executes the PR P10D action.';
                }
                action("prCompany Payslip2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Payslip';
                    Image = Accounts;
                    Promoted = true;
                    RunObject = report "PR Company Totals";
                    ToolTip = 'Executes the Company Payslip action.';
                }
                action("Other PR Listing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Other PR Listing';
                    Image = CopyFixedAssets;
                    RunObject = report "PR Payroll Summary - Listing";
                    ToolTip = 'Executes the Other PR Listing action.';
                }
                action("PR Payroll Summary-Group Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR Payroll Summary-Group Codes';
                    Image = CopyFixedAssets;
                    RunObject = report "PR Payroll Summary-Group Codes";
                    ToolTip = 'Executes the PR Payroll Summary-Group Codes action.';
                }
                action("PR Trans  Variance Analysis-3")
                {
                    ApplicationArea = All;
                    Caption = 'PR Trans  Variance Analysis-3';
                    RunObject = report "PR Trans  Variance Analysis-3";
                    ToolTip = 'Executes the PR Trans  Variance Analysis-3 action.';
                }
                action("PR Employee Salary Increments")
                {
                    ApplicationArea = All;
                    Caption = 'PR Employee Salary Increments';
                    RunObject = report "PR Employee Salary Increments";
                    ToolTip = 'Executes the PR Employee Salary Increments action.';
                }
                action("PR Transfer To Journal")
                {
                    ApplicationArea = All;
                    Caption = 'PR Transfer To Journal';
                    RunObject = report "PR Transfer To Journal";
                    ToolTip = 'Executes the PR Transfer To Journal action.';
                }
                action("Muster Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Muster Payroll';
                    Image = Excel;
                    Promoted = true;
                    RunObject = report "PR Payroll Summary -  Muster";
                    ToolTip = 'Executes the Muster Payroll action.';
                }
                action(SRBS)
                {
                    ApplicationArea = All;
                    Caption = 'SRBS';
                    RunObject = report SRBS;
                    ToolTip = 'Executes the SRBS action.';
                }
                action("Allowances Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Allowances Report';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "prDeductions Report new1";
                    ToolTip = 'Executes the Allowances Report action.';
                }
                action("Gross Net Summary")
                {
                    ApplicationArea = Basic;
                    RunObject = report Analysis;
                    ToolTip = 'Executes the Gross Net Summary action.';
                }
                action("PAYE Schedule")
                {
                    ApplicationArea = Basic;
                    Image = TaxPayment;
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "PR P.A.Y.E Schedule1";
                    ToolTip = 'Executes the PAYE Schedule action.';
                }
                action("Salary ammendement Report")
                {
                    ApplicationArea = All;
                    Caption = 'Salary ammendement Report';
                    RunObject = report "Salary ammendement Report";
                    ToolTip = 'Executes the Salary ammendement Report action.';
                }
                action("PR Trans  Variance Analysis")
                {
                    ApplicationArea = All;
                    Caption = 'PR Trans  Variance Analysis';
                    RunObject = report "PR Trans  Variance Analysis";
                    ToolTip = 'Executes the PR Trans  Variance Analysis action.';
                }
                action(priTax)
                {
                    ApplicationArea = All;
                    Caption = 'priTax';
                    RunObject = report priTax;
                    ToolTip = 'Executes the priTax action.';
                }
                action("priTax-Disabled")
                {
                    ApplicationArea = All;
                    Caption = 'priTax-Disabled';
                    RunObject = report "priTax-Disabled";
                    ToolTip = 'Executes the priTax-Disabled action.';
                }
                action("PR P.A.Y.E Schedule")
                {
                    ApplicationArea = All;
                    Caption = 'PR P.A.Y.E Schedule';
                    RunObject = report "PR P.A.Y.E Schedule";
                    ToolTip = 'Executes the PR P.A.Y.E Schedule action.';
                }
                action(prAllowances_Deductions)
                {
                    ApplicationArea = All;
                    Caption = 'prAllowances_Deductions';
                    RunObject = report prAllowances_Deductions;
                    ToolTip = 'Executes the prAllowances_Deductions action.';
                }
                action("PR Individua Comparison Report")
                {
                    ApplicationArea = All;
                    Caption = 'PR Individua Comparison Report';
                    RunObject = report "PR Individua Comparison Report";
                    ToolTip = 'Executes the PR Individua Comparison Report action.';
                }
                action("prDeductions Report new")
                {
                    ApplicationArea = All;
                    Caption = 'prDeductions Report new';
                    RunObject = report "prDeductions Report new";
                    ToolTip = 'Executes the prDeductions Report new action.';
                }
                action("PR Payroll Summary - Grouped")
                {
                    ApplicationArea = All;
                    Caption = 'PR Payroll Summary - Grouped';
                    RunObject = report "PR Payroll Summary - Grouped";
                    ToolTip = 'Executes the PR Payroll Summary - Grouped action.';
                }
                action("Muster Summary")
                {
                    ApplicationArea = All;
                    Caption = 'Muster Summary';
                    RunObject = report "Muster Summary";
                    ToolTip = 'Executes the Muster Summary action.';
                }
                action("PR Bank Summary")
                {
                    ApplicationArea = All;
                    Caption = 'PR Bank Summary';
                    RunObject = report "PR Bank Summary";
                    ToolTip = 'Executes the PR Bank Summary action.';
                }
                action(Helb)
                {
                    ApplicationArea = All;
                    Caption = 'By-Products';
                    RunObject = report Helb;
                    ToolTip = 'Executes the By-Products action.';
                }
                action("By Products PAYE")
                {
                    ApplicationArea = All;
                    Caption = 'By Products PAYE';
                    RunObject = report "By Products PAYE";
                    ToolTip = 'Executes the By Products PAYE action.';
                }
                action("Helb 1")
                {
                    ApplicationArea = All;
                    Caption = 'By-Products(NSSF)';
                    RunObject = report "Helb 1";
                    ToolTip = 'Executes the By-Products(NSSF) action.';
                }
                action("Housing Levy")
                {
                    ApplicationArea = All;
                    Caption = 'Housing Levy';
                    RunObject = report "Housing Levy";
                    ToolTip = 'Executes the Housing Levy action.';
                }
                action("Employer Contributions Report")
                {
                    ApplicationArea = All;
                    Caption = 'Employer Contributions Report';
                    RunObject = report "Employer Contributions Report";
                    ToolTip = 'Executes the Employer Contributions Report action.';
                }
                action("Pension Voluntary Contribution")
                {
                    ApplicationArea = All;
                    Caption = 'Pension Voluntary Contribution';
                    RunObject = report "Pension Voluntary Contribution";
                    ToolTip = 'Executes the Pension Voluntary Contribution action.';
                }
                action("Staff Data")
                {
                    ApplicationArea = All;
                    Caption = 'Staff Data';
                    RunObject = report "Staff Data";
                    ToolTip = 'Executes the Staff Data action.';
                }
                action("Employee Report")
                {
                    ApplicationArea = All;
                    Caption = 'Employee Report';
                    RunObject = report "Employee Report";
                    ToolTip = 'Executes the Employee Report action.';
                }
                action("Contract Expiry report")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Expiry report';
                    RunObject = report "Contract Expiry report";
                    ToolTip = 'Executes the Contract Expiry report action.';
                }
                action("Retirement Report")
                {
                    ApplicationArea = All;
                    Caption = 'Retirement Report';
                    RunObject = report "Retirement Report";
                    ToolTip = 'Executes the Retirement Report action.';
                }
                action("Company Totals")
                {
                    ApplicationArea = All;
                    Caption = 'Company Totals';
                    RunObject = report "Company Totals";
                    ToolTip = 'Executes the Company Totals action.';
                }
                action("Company Totals Deductions")
                {
                    ApplicationArea = All;
                    Caption = 'Company Totals Deductions';
                    RunObject = report "Company Totals Deductions";
                    ToolTip = 'Executes the Company Totals Deductions action.';
                }
                action("Bank Total NetPay")
                {
                    ApplicationArea = All;
                    Caption = 'Bank Total NetPay';
                    RunObject = report "Bank Total NetPay";
                    ToolTip = 'Executes the Bank Total NetPay action.';
                }
                action("Salary Advance NLC")
                {
                    ApplicationArea = All;
                    Caption = 'Salary Advance NLC';
                    RunObject = report "Salary Advance NLC";
                    ToolTip = 'Executes the Salary Advance NLC action.';
                }
                action("PR Variance Report NLC")
                {
                    ApplicationArea = All;
                    Caption = 'PR Variance Report NLC';
                    RunObject = report "PR Variance Report NLC";
                    ToolTip = 'Executes the PR Variance Report NLC action.';
                }

                action("Commuter/Bpay")
                {
                    ApplicationArea = All;
                    Caption = 'Commuter/Bpay';
                    RunObject = report "Commuter/Bpay";
                    ToolTip = 'Executes the Commuter/Bpay action.';
                }
                action("Job Applications Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Applications Report';
                    RunObject = report "HR Job Applications - Shortlis";
                    ToolTip = 'Executes the Payslip action.';
                }

                action("Basic Salary")
                {
                    ApplicationArea = All;
                    Caption = 'Basic Salary';
                    RunObject = report "Basic Salary";
                    ToolTip = 'Executes the Basic Salary action.';
                }

                action(SRBS33)
                {
                    ApplicationArea = All;
                    Caption = 'SRBS33';
                    RunObject = report SRBS33;
                    ToolTip = 'Executes the SRBS33 action.';
                }

                action("Staff Negative Pay")
                {
                    ApplicationArea = All;
                    Caption = 'Staff Negative Pay';
                    RunObject = report "Staff Negative Pay";
                    ToolTip = 'Executes the Staff Negative Pay action.';
                }

                action("1/3 Basic Payroll Rule")
                {
                    ApplicationArea = All;
                    Caption = '1/3 Basic Payroll Rule';
                    RunObject = report "1/3 Basic Payroll Rule";
                    ToolTip = 'Executes the 1/3 Basic Payroll Rule action.';
                }
                action("PR Emp Trans  Variance1")
                {
                    ApplicationArea = All;
                    Caption = 'PR Emp Trans  Variance';
                    RunObject = report "PR Emp Trans  Variance1";
                    ToolTip = 'Executes the PR Emp Trans  Variance1 action.';
                }
                action("prPaye Schedule 2")
                {
                    ApplicationArea = All;
                    Caption = 'Paye Payroll Schedule';
                    RunObject = report "prPaye Schedule 2";
                    ToolTip = 'Executes the prPaye Schedule 2 action.';
                }

                action("Journal Transfer")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = page "prNSSF Card";
                    ToolTip = 'Executes the Journal Transfer action.';
                }
                action("Rates & Ceilings1")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "prRates & Ceilings";
                    ToolTip = 'Executes the Rates & Ceilings1 action.';
                }
                action("Control Information1")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "Control-Information List";
                    ToolTip = 'Executes the Control Information1 action.';
                }
                action("Payroll Setup1")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "prPayroll Setup";
                    ToolTip = 'Executes the Payroll Setup1 action.';
                }
                action("PR P9 Client")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR P9 Client';
                    RunObject = report "PR P9 Client";
                    ToolTip = 'Executes the PR P9 Client action.';
                }
            }
        }
        area(embedding)
        {
            action("HR Employee List - Changes")
            {
                ApplicationArea = All;
                Caption = 'Employee Bank Changes';
                RunObject = page "HR Employee List - Changes";
                ToolTip = 'Executes the Employee Bank Changes action.';
            }
            action("Payroll Change List Existing")
            {
                ApplicationArea = All;
                Caption = 'Modifying Staff Payroll';
                RunObject = page "Payroll Change Lists Existing";
                ToolTip = 'Executes the Payroll Changes Existing Staff action.';
            }
            group("Payroll Change Lists New")
            {
                action("Open Change Lists New")
                {
                    ApplicationArea = All;
                    Caption = 'New Payroll Transaction ';
                    RunObject = page "Payroll Change Lists New";
                    RunPageLink = Status = filter(New);
                    ToolTip = 'Executes the Payroll Changes New Staff action.';
                }
                action("Pending Approval Change Lists")
                {
                    ApplicationArea = All;
                    Caption = 'Pending Approval Change Lists';
                    RunObject = page "Payroll Change Lists New";
                    RunPageLink = Status = filter("Pending Approval");
                    ToolTip = 'Executes the Payroll Changes New Staff action.';
                }
                action("Approved Approval Change Lists")
                {
                    ApplicationArea = All;
                    Caption = 'Approved Approval Change Lists';
                    RunObject = page "Payroll Change Lists New";
                    RunPageLink = Status = filter(Approved);
                    ToolTip = 'Executes the Payroll Changes New Staff action.';
                }
            }
            action("Salary Card")
            {
                ApplicationArea = Basic;
                Caption = 'Salary Card';
                RunObject = page "PR Salary List (ALL)";
                ToolTip = 'Executes the Salary Card action.';
            }
            action("General Journals")
            {
                ApplicationArea = Basic;
                Caption = 'General Journals';
                Image = Journal;
                RunObject = page "General Journal Batches";
                RunPageView = where("Template Type" = const(General),
                                    Recurring = const(false));
                ToolTip = 'Executes the General Journals action.';
            }
            action("Payment Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Payment Journals';
                Image = Journals;
                RunObject = page "General Journal Batches";
                RunPageView = where("Template Type" = const(Payments),
                                    Recurring = const(false));
                ToolTip = 'Executes the Payment Journals action.';
            }
        }
        area(sections)
        {
            group("HR Employee Management")
            {
                Caption = 'HR Employee Management';
                Image = Departments;
                action("HR Employees (ALL)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employees (ALL)';
                    RunObject = page "HR Employee List (ALL)";
                    ToolTip = 'Executes the HR Employees (ALL) action.';
                }
                action("HR Employees(P'/Pensionable)")
                {
                    ApplicationArea = all;
                    Caption = 'HR Employees(P''/Pensionable)';
                    RunObject = page "HR Employees(P'/Pensionable)";
                    ToolTip = 'Specifies permanent and pennsionable Staffs';
                }
                action("Hr Employee(Deployed)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the the list of deployed employees';
                    RunObject = page "HR Employees(Deployed)";
                }
                action("HR Employees (Interns)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employees (Interns)';
                    RunObject = page "HR Employee List (Commisioners";
                    ToolTip = 'Executes the HR Employees (Interns) action.';
                }
                action("HR Employees (Contract)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employees (Contract)';
                    RunObject = page "HR Employee List (Contract)";
                    ToolTip = 'Executes the HR Employees (Contract) action.';
                }
                action("HR Employees (Casuals)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employees (Casuals)';
                    RunObject = page "HR Employee List (Casuals)";
                    ToolTip = 'Executes the HR Employees (Casuals) action.';
                }
                action("HR Employee List (Inactive)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee List (Inactive)';
                    RunObject = page "HR Employee List (Inactive)";
                    ToolTip = 'Executes the HR Employee List (Inactive) action.';
                }
            }
            group("Payroll Management")
            {
                Caption = 'Payroll Management';
                action("Pr Salary List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pr Salary List';
                    RunObject = page "PR Salary List (ALL)";
                    ToolTip = 'Executes the Salary List action.';
                }
                action("E-mail status")
                {
                    ApplicationArea = Basic;
                    RunObject = page "PR Email Status";
                    ToolTip = 'Executes the E-mail status action.';
                }
            }
            group("Payroll Setups")
            {
                action("Payroll Posting")
                {
                    ApplicationArea = Basic;
                    RunObject = page prEmployeePosting;
                    ToolTip = 'Executes the Payroll Posting action.';
                }
                action("PR Trans Codes Groups - List")
                {
                    ApplicationArea = All;
                    Caption = 'PR Trans Codes Groups - List';
                    RunObject = page "PR Trans Codes Groups - List";
                    ToolTip = 'Executes the PR Trans Codes Groups - List action.';
                }
                action("PR Employee Allowances List")
                {
                    ApplicationArea = All;
                    Caption = 'PR Employee Allowances List';
                    RunObject = page "PR Employee Allowances List";
                    ToolTip = 'Executes the PR Employee Allowances List action.';
                }
                action("PR Employee Salary Rates List")
                {
                    ApplicationArea = All;
                    Caption = 'PR Employee Salary Rates List';
                    RunObject = page "PR Employee Salary Rates List";
                    ToolTip = 'Executes the PR Employee Salary Rates List action.';
                }
                action("PR Transaction Codes List")
                {
                    ApplicationArea = All;
                    Caption = 'PR Transaction Codes List';
                    RunObject = page "PR Transaction Codes List";
                    ToolTip = 'Executes the PR Transaction Codes List action.';
                }
                action("prRates & Ceilings")
                {
                    ApplicationArea = All;
                    Caption = 'prRates & Ceilings';
                    RunObject = page "prRates & Ceilings";
                    ToolTip = 'Executes the prRates & Ceilings action.';
                }
                action("PR Bank Branches")
                {
                    ApplicationArea = All;
                    Caption = 'PR Bank Branches';
                    RunObject = page "PR Bank Branches";
                    ToolTip = 'Executes the PR Bank Branches action.';
                }
                action("PrCasual Payroll Setup")
                {
                    ApplicationArea = All;
                    Caption = 'PrCasual Payroll Setup';
                    RunObject = page "PrCasual Payroll Setup";
                    ToolTip = 'Executes the PrCasual Payroll Setup action.';
                }
                action("prPayroll Setup")
                {
                    ApplicationArea = All;
                    Caption = 'PrPayroll Setup';
                    RunObject = page "prPayroll Setup";
                    ToolTip = 'Executes the prPayroll Setup action.';
                }
                action("PR Payroll Periods")
                {
                    ApplicationArea = All;
                    Caption = 'PR Payroll Periods';
                    RunObject = page "PR Payroll Periods";
                    ToolTip = 'Executes the PR Payroll Periods action.';
                }

                action("PAYE Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = page "prP.A.Y.E Setup";
                    ToolTip = 'Executes the PAYE Setup1 action.';
                }
                action("NHIF Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = page "prNHIF SetUp";
                    ToolTip = 'Executes the NHIF Setup action.';
                }
                action("NSSF Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = page "prNSSF List";
                    ToolTip = 'Executes the NSSF Setup action.';
                }
                action("Bank Structure1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Structure';
                    RunObject = page "PR Bank Accounts";
                    ToolTip = 'Executes the Bank Structure1 action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    RunObject = page Dimensions;
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("Salary Scale")
                {
                    ApplicationArea = Basic;
                    RunObject = page "prSalary Scale";
                    ToolTip = 'Executes the Salary Scale action.';
                }
                action("Workflow setup")
                {
                    ApplicationArea = all;
                    Caption = 'Workflow Setup';
                    RunObject = page Workflows;
                    ToolTip = 'Specifies the workflow Setups';
                }
            }
            group("Employee Tasks")
            {
                Caption = 'Employee Tasks';


                action("Pending Staff Advance Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pending Salary Advance Request';
                    RunObject = page "Salary Advance Request Lists";
                    RunPageLink = Status = filter(Pending);
                    ToolTip = 'Executes the Salary Advance Request action.';
                }
                action("Pending Approval Staff Advance Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pending Approval Salary Advance Request';
                    RunObject = page "Salary Advance Request Lists";
                    RunPageLink = Status = filter("Pending Approval");
                    ToolTip = 'Executes the Salary Advance Request action.';
                }

                action("Approved Staff Advance Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Salary Advance Request';
                    RunObject = page "Salary Advance Lists";
                    ToolTip = 'Executes the Approved Salary Advance Request action.';
                }
                action(Receipts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipts';
                    RunObject = page "Inspection List";
                    Visible = false;
                    ToolTip = 'Executes the Receipts action.';
                }
            }
            group(Approvals)
            {
                Caption = 'Approvals';
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    RunObject = page "Approval Entries";
                    ToolTip = 'Executes the Approval Entries action.';
                }
                action("Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Request Entries';
                    RunObject = page "Approval Request Entries";
                    ToolTip = 'Executes the Approval Request Entries action.';
                }
                action("HR Requests to Approve")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Requests to Approve';
                    RunObject = page "Requests to Approve";
                    ToolTip = 'Executes the HR Requests to Approve action.';
                }
            }
        }
        area(Creation)
        {

        }
        area(Processing)
        {
            separator(Action67)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("<Report 39003909>")
            {
                ApplicationArea = Basic;
                Caption = 'Journal Transfer';
                Image = TransferToGeneralJournal;
                RunObject = report "priTax-Disabled1";
                ToolTip = 'Executes the Journal Transfer action.';
            }
            action("Period Management")
            {
                ApplicationArea = Basic;
                Caption = 'Period Management';
                Image = AccountingPeriods;
                RunObject = page "Bank & Cash Transfers List";
                ToolTip = 'Executes the Period Management action.';
                Visible = false;
            }
            action("Company Vehicles list")
            {
                ApplicationArea = Basic;
                Caption = 'Company Vehicles list';
                Image = PayrollStatistics;
                Visible = false;
                RunObject = page "Company Vehicles list";
                ToolTip = 'Executes the Rates & Ceilings action.';
            }
            action("Allowance Variations")
            {
                ApplicationArea = Basic;
                Caption = 'Allowance Variations';
                Image = Allocations;
                RunObject = page Requisitions;
                ToolTip = 'Executes the Allowance Variations action.';
            }
            action("Deduction Variations")
            {
                ApplicationArea = Basic;
                Caption = 'Deduction Variations';
                Image = RemoveLine;
                RunObject = page "Close out Header";
                ToolTip = 'Executes the Deduction Variations action.';
            }
            action("Processed Allowance Variations")
            {
                ApplicationArea = Basic;
                Caption = 'Processed Allowance Variations';
                Image = CalculateCost;
                RunObject = page "Change General Journal";
                ToolTip = 'Executes the Processed Allowance Variations action.';
            }
            action("Processed Deduction Variations")
            {
                ApplicationArea = Basic;
                Caption = 'Processed Deduction Variations';
                Image = CalculateLines;
                RunObject = page "Close out Lines";
                ToolTip = 'Executes the Processed Deduction Variations action.';
            }
            separator(Action1102755043)
            {
                Caption = 'Reset';
            }
            separator(Action1102755047)
            {
                Caption = 'PAYE Reset';
            }
            action("Mark as Does Not Pay PAYE")
            {
                ApplicationArea = Basic;
                Caption = 'Mark as Does Not Pay PAYE';
                Image = CheckList;
                RunObject = report "HR Employee Bio Data";
                ToolTip = 'Executes the Mark as Does Not Pay PAYE action.';
            }
            action("Mark as Pays PAYE")
            {
                ApplicationArea = Basic;
                Caption = 'Mark as Pays PAYE';
                Image = CheckList;
                RunObject = report "Mark as PAYS PAYE";
                Visible = false;
                ToolTip = 'Executes the Mark as Pays PAYE action.';
            }
            action("Update Employee PAYE")
            {
                ApplicationArea = Basic;
                Caption = 'Update Employee PAYE';
                Image = UpdateDescription;
                RunObject = report "Update Employee PAYE";
                Visible = false;
                ToolTip = 'Executes the Update Employee PAYE action.';
            }
            action("Payroll For Exited Staff")
            {
                ApplicationArea = Basic;
                Caption = 'Payroll For Exited Staff';
                Image = "Report";
                Visible = false;
                RunObject = report "prPaySlip for Exited Staff";
                ToolTip = 'Executes the Payroll For Exited Staff action.';
            }
            action("Staff Age Report")
            {
                ApplicationArea = Basic;
                Caption = 'Payroll Summary for Exited Staff';
                Image = "Report";
                Visible = false;
                RunObject = report "Staff Age Report";
                ToolTip = 'Executes the Payroll Summary for Exited Staff action.';
            }
            group("HR Leave Management")
            {
                Caption = 'HR Leave Management';
                Image = HumanResources;
                Visible = false;
                action("HR Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Application';
                    RunObject = page "HR Leave Applications List";
                    ToolTip = 'Executes the HR Leave Application action.';
                }
                action("HR Leave Reimbursment ")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Reimbursment ';
                    RunObject = page "HR Leave Reimbursment List";
                    ToolTip = 'Executes the HR Leave Reimbursment  action.';
                }
                action("HR Leave Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Types';
                    RunObject = page "HR Leave Types";
                    ToolTip = 'Executes the HR Leave Types action.';
                }
            }
            group("HR Transport Management")
            {
                Caption = 'HR Transport Management';
                Image = ResourcePlanning;
                Visible = false;
                action("HR Transport Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Transport Requisition';
                    RunObject = page "HR Transport Requisition List";
                    ToolTip = 'Executes the HR Transport Requisition action.';
                }
                action("HR Transport Allocations")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Transport Allocations';
                    RunObject = page "HR Transport Allocations List";
                    ToolTip = 'Executes the HR Transport Allocations action.';
                }
            }
            group("HR Welfare Management")
            {
                Caption = 'HR Welfare Management';
                Image = ReferenceData;
                Visible = false;
                action("HR Welfare List")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Welfare List';
                    RunObject = page "HR Company Activities List";
                    ToolTip = 'Executes the HR Welfare List action.';
                }
            }
            group("HR Training Management")
            {
                Caption = 'HR Training Management';
                Image = Job;
                Visible = false;
                action("HR Employee Training Requisition List")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee Training Requisition List';
                    RunObject = page "HR Emp Training Appl. Req List";
                    ToolTip = 'Executes the HR Employee Training Requisition List action.';
                }
                action("HR Training Application List")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Training Application List';
                    RunObject = page "HR Training Application List";
                    ToolTip = 'Executes the HR Training Application List action.';
                }
                action("HR Training Applications (Approved)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Training Applications (Approved)';
                    RunObject = page "HR Training App List -Approved";
                    ToolTip = 'Executes the HR Training Applications (Approved) action.';
                }
                action("HR Training Needs List")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Training Needs List';
                    RunObject = page "HR Training Needs List";
                    ToolTip = 'Executes the HR Training Needs List action.';
                }
                action("HR Training Bonding Conditions")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Training Bonding Conditions';
                    RunObject = page "HR Training Bonding Cond. List";
                    ToolTip = 'Executes the HR Training Bonding Conditions action.';
                }
            }
        }
    }
}
