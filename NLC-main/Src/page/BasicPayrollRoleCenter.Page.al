#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193568 "Basic Payroll Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                systempart(Control1901420308; Outlook) { }
                systempart(Control1901377608; MyNotes) { }
            }
        }
    }

    actions
    {
        area(embedding) { }
        area(sections)
        {
            group("HR Employee Management")
            {
                Caption = 'HR Employee Management';
                Image = ReferenceData;
                action("HR Employees (ALL)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employees (ALL)';
                    RunObject = page "HR Employee List (ALL)";
                    ToolTip = 'Executes the HR Employees (ALL) action.';
                }
                action("HR Employee List (Inactive)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee List (Inactive)';
                    RunObject = page "HR Employee List (Inactive)";
                    ToolTip = 'Executes the HR Employee List (Inactive) action.';
                }
            }
            group("PR Payroll Processing")
            {
                Caption = 'PR Payroll Processing';
                Image = Payroll;
                action("PR Salary List")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR Salary List';
                    RunObject = page "PR Salary List (ALL)";
                    ToolTip = 'Executes the PR Salary List action.';
                }
            }
            group("Payroll Setup")
            {
                Caption = 'Payroll Setup';
                Image = Payroll;
            }
            group(ActionGroup27)
            {
                Caption = 'Payroll Setup';
                Image = Payroll;
                action("NSSF Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF Setup';
                    RunObject = page "prNSSF List";
                    ToolTip = 'Executes the NSSF Setup action.';
                }
                action("NHIF Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'NHIF Setup';
                    RunObject = page "prNHIF SetUp";
                    ToolTip = 'Executes the NHIF Setup action.';
                }
                action("PAYE Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'PAYE Setup';
                    RunObject = page "prP.A.Y.E Setup";
                    ToolTip = 'Executes the PAYE Setup action.';
                }
                action("Transactions Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transactions Setup';
                    RunObject = page "PR Transaction Codes List";
                    ToolTip = 'Executes the Transactions Setup action.';
                }
                action("Bank Structure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Structure';
                    RunObject = page "PR Bank Accounts";
                    ToolTip = 'Executes the Bank Structure action.';
                }
                action("PR Payroll Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'PR Payroll Periods';
                    Image = AccountingPeriods;
                    RunObject = page "PR Payroll Periods";
                    ToolTip = 'Executes the PR Payroll Periods action.';
                }
            }
            group("HR Training Management")
            {
                Caption = 'HR Training Management';
                Image = Job;
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
            group("Succession Planning")
            {
                Caption = 'Succession Planning';
                action("HR Jobs to Succeed list")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Jobs to Succeed list';
                    RunObject = page "HR Jobs to Succeed list";
                    ToolTip = 'Executes the HR Jobs to Succeed list action.';
                }
                action("HR Succession Details list")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Succession Details list';
                    RunObject = page "HR Succession Details list";
                    ToolTip = 'Executes the HR Succession Details list action.';
                }
            }
        }
        area(Reporting)
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
                RunObject = report "PR P9";
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
            action("Company Payslip")
            {
                ApplicationArea = Basic;
                Caption = 'Company Payslip';
                Image = Accounts;
                Promoted = true;
                RunObject = report "PR Company Totals";
                ToolTip = 'Executes the Company Payslip action.';
            }
            action("PR Payroll Summary-Group Codes")
            {
                ApplicationArea = Basic;
                Caption = 'PR Payroll Summary-Group Codes';
                Image = Accounts;
                Promoted = true;
                RunObject = report "PR Payroll Summary-Group Codes";
                ToolTip = 'Executes the PR Payroll Summary-Group Codes action.';
            }
            action("Bank Payment report")
            {
                ApplicationArea = Basic;
                Caption = 'Bank Payment report';
                RunObject = report "PR Bank Payments";
                ToolTip = 'Executes the Bank Payment report action.';
            }
            action("CSV Report")
            {
                ApplicationArea = Basic;
                Caption = 'CSV Report';
                RunObject = report "PR iTax";
                ToolTip = 'Executes the CSV Report action.';
            }
            action("Bank Loan Payment Report")
            {
                ApplicationArea = Basic;
                Caption = 'Bank Loan Payment Report';
                RunObject = report "PR Payroll Summary-Group Codes";
                ToolTip = 'Executes the Bank Loan Payment Report action.';
            }
            action("Other PR Listing")
            {
                ApplicationArea = Basic;
                Caption = 'Other PR Listing';
                Image = CopyFixedAssets;
                RunObject = report "PR Payroll Summary - Listing";
                ToolTip = 'Executes the Other PR Listing action.';
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
        }
        area(Processing)
        {
            action("HR Succession Planning")
            {
                ApplicationArea = Basic;
                Caption = 'HR Succession Planning';
                RunObject = page "HR Succession Planning";
                ToolTip = 'Executes the HR Succession Planning action.';
            }
        }
    }
}
