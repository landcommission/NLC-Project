page 69845 "Employee Mobility Role center"
{

    Caption = 'Employee Mobility Role center';
    PageType = RoleCenter;
    ApplicationArea = All;
    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part("HR Activities Cue"; "HR Activities Cue")
                {
                    Caption = 'Employee Mobility Activities';
                    ApplicationArea = all;
                }
                part(Control1904652008; "HR Manager Activities")
                {
                    ApplicationArea = all;
                }
            }
            group(Approvals)
            {
                part(ApprovalsActivities; "Approvals Activities")
                {
                    ApplicationArea = Suite;
                }
            }
            group(Notes)
            {
                systempart(Control1000000050; MyNotes)
                {
                    ApplicationArea = all;
                }
                systempart(Control1901420308; Outlook)
                {
                    ApplicationArea = all;
                }
            }
            group(Control1900724708)
            {
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
            }
        }
    }
    actions
    {
        area(Sections)
        {

            group(" Self Employee Mobility")
            {
                Caption = 'Self Employee Mobility';

                action("Employee Transfers")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Open Self-Transfers';
                    RunObject = page "Employee Transfer List";
                    RunPageLink = Status = const(Open);
                    ToolTip = 'Executes the Self initiated Employee Transfers action.';
                }
                action("Transfers")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Pending Self-Transfers';
                    RunObject = page "Employee Transfer List";
                    RunPageLink = Status = const("Pending Approval");
                    ToolTip = 'Executes the Self initiated Employee Transfers action.';
                }
                action("Transfersr")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Approved Self-Transfers';
                    RunObject = page "Employee Transfer List";
                    RunPageLink = Status = const(Released);
                    ToolTip = 'Executes the Self initiated Employee Transfers action.';
                }
                action("Rejected TRANSFER")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Rejected Self-Transfers';
                    RunObject = page "Employee Transfer List";
                    RunPageLink = Status = const(Rejected);
                    ToolTip = 'Executes the Self initiated Employee Transfers action.';
                }
            }


            group("Management Mobility")
            {


                action(EmptransferList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open Transfer Employees List';
                    RunObject = page "HR Emp Transfer List";
                    RunPageLink = Status = filter(New);
                    ToolTip = 'Executes the HR Emp Transfer List action.';
                }
                action("Pending Transfer")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pending Transfer Employees List';
                    RunObject = page "HR Emp Transfer List";
                    RunPageLink = Status = filter("Pending Approval");
                    ToolTip = 'Executes the HR Emp Transfer List action.';
                }
                action("Approved Transfer")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Transfer Employees List';
                    RunObject = page "HR Emp Transfer List";
                    RunPageLink = Status = filter(Approved), "Transfer details Updated" = const(false);
                    ToolTip = 'Executes the HR Emp Transfer List action.';
                }
                action("Posted Transfer")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Transfer Employees List';
                    RunObject = page "HR Emp Transfer List";
                    RunPageLink = Status = filter(Approved), "Transfer details Updated" = const(true);
                    ToolTip = 'Executes the HR Emp Transfer List action.';
                }
                action("Rejected Transfer Management")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rejected Transfer Employees List';
                    RunObject = page "HR Emp Transfer List";
                    RunPageLink = Status = filter(Rejected);
                    ToolTip = 'Executes the HR Emp Transfer List action.';
                }
            }
            group("Periodic Activities")
            {

                // action("Employee Transfers2")
                // {
                //     ApplicationArea = BasicHR;
                //     Caption = 'HR Salary Increament List';
                //     RunObject = page "Promotion List";
                //     ToolTip = 'Executes the HR Salary Increament List action.';
                // }
                //"HR Salary Increament Closed"
                action("Employee Transfers6")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR Salary Increament Closed';
                    RunObject = page "Approved Promotions";
                    ToolTip = 'Executes the HR Salary Increament Closed action.';
                }

                //"Employee Transfer History"

                action(DutyStation)
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Duty Stations Setup';
                    RunObject = page "Duty Station";
                    ToolTip = 'Executes the Duty Stations Setup action.';
                }

                action("Hardship Areas")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Hardship Allowance Setup';
                    RunObject = page "Hardship Allowance Setup";
                    Visible = false;
                    ToolTip = 'Executes the Hardship Allowance Setup action.';
                }

                action("Acting Duties List ")
                {
                    RunObject = page "Acting Duties List";
                    ToolTip = 'Executes the Acting Duties List  action';
                    ApplicationArea = All;
                }
                action("Promotion List ")
                {
                    RunObject = page "Promotion List";
                    ToolTip = 'Executes the Promotion List  action';
                    ApplicationArea = All;
                }
            }

            group("Mobility Reports")
            {
                action("Employee Transfers3")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Transfer Report';
                    //RunObject = report "Employee Transfer Report";
                    RunObject = report "HR Transfer Report";
                    ToolTip = 'Executes the Employee Transfer Report action.';
                }
                action("Employee Transfers13")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Transfer History';
                    RunObject = report "Employee Transfer History";
                    ToolTip = 'Executes the Employee Transfer History action.';
                }
                action("Employee Transfer5")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee - Qualifications';
                    RunObject = report "HR Employee Qualifications";
                    ToolTip = 'Executes the Employee - Qualifications action.';
                }
                action("Employee Transfer6")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee - Addresses';
                    RunObject = report "Employee - Addresses";
                    ToolTip = 'Executes the Employee - Addresses action.';
                }
            }
            group(Archives)
            {
                action("Approved Acting Duties List ")
                {
                    RunObject = page "Approved Acting Positions";
                    ToolTip = 'Executes the Acting Duties List  action';
                    ApplicationArea = All;
                }
                action("Approved Promotion List ")
                {
                    RunObject = page "Approved Promotions";
                    ToolTip = 'Executes the Promotion List  action';
                    ApplicationArea = All;
                }

            }

        }


    }
}
