#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194196 "HR Role Centre (HR ALL)"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control29)
            {

                part(Control28; "HR Employee Cue")
                {
                    Caption = 'Employees Cue';
                }
                part(ApprovalsActivities; "Approvals Activities")
                {
                    ApplicationArea = Suite;
                }
            }
        }
    }

    actions
    {
        area(sections)
        {
            group("HR Activities")
            {

                group("HR Employee Recruitment")
                {
                    Caption = 'HR Employee Recruitment';
                    Image = HumanResources;
                    group("HR Employee Requisitions")
                    {
                        action("Open Employee Requisitions")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Open Employee Requisitions';
                            RunObject = page "HR Employee Requisitions List";
                            RunPageLink = Status = filter(New);
                            ToolTip = 'Executes the HR Employee Requisitions action.';
                        }
                        action("Pending Employee Requisitions")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Pending Employee Requisitions';
                            RunObject = page "HR Employee Requisitions List";
                            RunPageLink = Status = filter("Pending Approval");
                            ToolTip = 'Executes the HR Employee Requisitions action.';
                        }
                        action("Approved Employee Requisitions")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Employee Requisitions';
                            RunObject = page "Approved Requisitions";
                            ToolTip = 'Executes the HR Employee Requisitions action.';
                        }
                        action("Advertised Employee Requisitions")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Advertised Employee Requisitions';
                            RunObject = page "Advertised Requisitions";
                            RunPageLink = Status = filter(Approved), Advertised = const(true), Closed = const(false);

                            //Page::"HR Employee Requisitions List", 'Closing Date', Today, '>' /* Greater than */);
                            ToolTip = 'Executes the HR Employee Requisitions action.';
                        }
                        action("Closed Employee Requisitions")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Closed Employee Requisitions';
                            RunObject = page "HR Employee Requisitions List";
                            RunPageLink = Status = filter(Approved);
                            ToolTip = 'Executes the HR Employee Requisitions action.';
                        }
                    }
                    action("HR Job Applications")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Job Applications';
                        RunObject = page "HR Job Applications List";
                        ToolTip = 'Executes the HR Job Applications action.';
                    }
                    action("HR Shortlisting")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Shortlisting';
                        RunObject = page "HR Shortlisting List";
                        ToolTip = 'Executes the HR Shortlisting action.';
                    }
                    action("HR Job Applicants Qualified")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Job Applicants Qualified';
                        RunObject = page "HR Job Applicants Qualified L";
                        ToolTip = 'Executes the HR Job Applicants Qualified action.';
                    }
                    action("HR Approved Qualified Applicants")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Approved Qualified Applicants';
                        RunObject = page "HR  App Qualified Applicants";
                        ToolTip = 'Executes the HR Approved Qualified Applicants action.';
                    }
                    action("HR Job Applicants Unqualified")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Job Applicants Unqualified';
                        RunObject = page "HR Applicants UnQualified L";
                        ToolTip = 'Executes the HR Job Applicants Unqualified action.';
                    }
                }
                group("HR Employee Management")
                {
                    Caption = 'HR Employee Management';
                    Image = Departments;
                    group("Employee Registration")
                    {
                        action("Open Registrations")
                        {
                            ApplicationArea = all;
                            RunObject = page "Hr Employee Registration List";
                            RunPageLink = "Approval Status" = filter(open);
                            ToolTip = 'Executes Open applications';
                        }
                        action("Pending Registrations")
                        {
                            ApplicationArea = all;
                            RunObject = page "Hr Employee Registration List";
                            RunPageLink = "Approval Status" = filter("Pending Approval");
                            ToolTip = 'Executes Pending approvals applications';
                        }
                        action("Approved Registrations")
                        {
                            ApplicationArea = all;
                            RunObject = page "Hr Employee Registration List";
                            RunPageLink = "Approval Status" = filter(Approved);
                            ToolTip = 'Executes Approved applications';
                        }
                        action("Rejected Registrations")
                        {
                            ApplicationArea = all;
                            RunObject = page "Hr Employee Registration List";
                            RunPageLink = "Approval Status" = filter(Rejected);
                            ToolTip = 'Executes rejected applications';
                        }
                    }
                    action("HR Employees (ALL)")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Employee List (ALL) - Approved';
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
                    action("HR Induction Schedule")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Induction Schedule';
                        RunObject = page "HR Induction Schedule List";
                        ToolTip = 'Executes the HR Induction Schedule action.';
                    }
                    action("HR Employee List (ALL)-New")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Employee List (ALL-NEW)';
                        Visible = false;
                        RunObject = page "HR Employee List (ALL)-New";
                        ToolTip = 'Executes the HR Employee List (ALL)-New action.';
                    }
                    action("HR Employee List (ALL)-Pending")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        Caption = 'HR Employee List (ALL)-Pending';
                        RunObject = page "HR Employee List (ALL)-Pending";
                        ToolTip = 'Executes the HR Employee List (ALL)-Pending action.';
                    }
                    action("HR Employee List (ALL) - Approved")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        Caption = 'HR Employee List (ALL) - Approved';
                        RunObject = page "HR Employee List (ALL)";
                        ToolTip = 'Executes the HR Employee List (ALL) - Approved action.';
                    }
                    action("HR Employee Status InActivation")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Employee Status InActivation';
                        RunObject = page "Employee Status InActivation";
                        ToolTip = 'Executes the HR Employee Status InActivation action.';
                    }

                    /*  action("")
                     {
                         ApplicationArea = Basic;
                         Caption = '';
                         RunObject = Page ;
                     } */

                }
                group("HR Leave Management")
                {
                    Caption = 'HR Leave Management';
                    Image = HumanResources;
                    group("Leave Plan Management")
                    {

                        action("Leave Planner")
                        {
                            Image = Planning;
                            ApplicationArea = Basic;
                            Caption = 'New Leave Planner';
                            RunObject = page "HR Leave Planner List";
                            RunPageLink = Status = filter(New);
                            ToolTip = 'Executes the HR Leave Plannerr action.';
                        }
                        action("Pending Leave Planner")
                        {
                            Image = Planning;
                            ApplicationArea = Basic;
                            Caption = 'Pending Leave Planner';
                            RunObject = page "HR Leave Planner List";
                            RunPageLink = Status = filter("Pending Approval");
                            ToolTip = 'Executes the HR Leave Plannerr action.';
                        }
                        action("Approved Leave Planner")
                        {
                            Image = Planning;
                            ApplicationArea = Basic;
                            Caption = 'Approved Leave Planner';
                            RunObject = page "HR Leave Planner List";
                            RunPageLink = Status = filter(Approved);
                            ToolTip = 'Executes the HR Leave Plannerr action.';
                        }
                    }
                    group("HR Leave Application")
                    {
                        action("HR Leave Application New")
                        {
                            ApplicationArea = Basic;
                            Caption = 'HR Leave Application New';
                            RunObject = page "HR Leave Applications List";
                            RunPageLink = Status = const(New);
                            ToolTip = 'Executes the HR Leave Application action.';
                        }
                        action("HR Leave Application Pending")
                        {
                            ApplicationArea = Basic;
                            Caption = 'HR Leave Application Pending';
                            RunObject = page "HR Leave Applications List";
                            RunPageLink = Status = const("Pending Approval");
                            ToolTip = 'Executes the HR Leave Application action.';
                        }
                        action("HR Leave Application Approved")
                        {
                            ApplicationArea = Basic;
                            Caption = 'HR Leave Application Approved';
                            RunObject = page "HR Leave Applications List";
                            RunPageLink = Status = const(Approved);
                            ToolTip = 'Executes the HR Leave Application action.';
                        }
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
                group("HR Performance Management")
                {
                    Caption = 'HR Performance Management';
                    Image = ProductDesign;
                    action("HR Appraisals List - Target Setting")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Appraisals List - Target Setting';
                        RunObject = page "HR 360 Appraisals List - TS";
                        ToolTip = 'Executes the HR Appraisals List - Target Setting action.';
                    }
                    action("HR Appraisals List - Target Approval")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Appraisals List - Target Approval';
                        RunObject = page "HR 360 Appraisals List - TA";
                        ToolTip = 'Executes the HR Appraisals List - Target Approval action.';
                    }
                    action("Appraisal List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Appraisal List Report';
                        RunObject = page "Appraisal List";
                        ToolTip = 'Executes the Appraisal List Report action.';
                    }
                    action("HR Appraisals List - Target Evaluation")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Appraisals List - Target Evaluation';
                        RunObject = page "HR 360 Appraisals List - EV";
                        ToolTip = 'Executes the HR Appraisals List - Target Evaluation action.';
                    }
                }
                group("HR Transport Management")
                {
                    Caption = 'HR Transport Management';
                    Image = ResourcePlanning;
                    group("Transport Requisition")
                    {
                        action("Open Transport Requisition")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Open Transport Requests';
                            RunObject = page "HR Transport Requisition List";
                            RunPageLink = Status = filter(New);
                            ToolTip = 'Executes the HR Transport Requisition action.';
                        }
                        action("Pending Transport Requisition")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Pending Transport Requests';
                            RunObject = page "HR Transport Requisition List";
                            RunPageLink = Status = filter("Pending Approval");
                            ToolTip = 'Executes the HR Transport Requisition action.';
                        }
                        action("Approved Transport Requisition")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Transport Requests';
                            RunObject = page "HR Transport Requisition List";
                            RunPageLink = Status = filter(Approved);
                            ToolTip = 'Executes the HR Transport Requisition action.';
                        }
                        action("Released Transport Requisition")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Released Transport Requests';
                            RunObject = page "HR Transport Requisition List";
                            RunPageLink = Status = filter(Released), Released = const(true);
                            ToolTip = 'Executes the HR Transport Requisition action.';
                        }
                        action("Rejected Transport Requisition")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Rejected Transport Requests';
                            RunObject = page "HR Transport Requisition List";
                            RunPageLink = Status = filter(Rejected);
                            ToolTip = 'Executes the HR Transport Requisition action.';
                        }

                    }
                    group("Asset Repair Management")
                    {

                        action("Asset Repair")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Open Asset Repair List';
                            RunObject = page "Asset Repair List";
                            RunPageLink = Status = filter(New);
                            ToolTip = 'Executes the HR Transport Allocations action.';
                        }
                        action("Pending Repair")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Pending Asset Repair List';
                            RunObject = page "Asset Repair List";
                            RunPageLink = Status = filter("Pending Approval");
                            ToolTip = 'Executes the HR Transport Allocations action.';
                        }
                        action("Approved Repair")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Asset Repair List';
                            RunObject = page "Asset Repair List";
                            RunPageLink = Status = filter(Approved);
                            ToolTip = 'Executes the HR Transport Allocations action.';
                        }
                        action("Rejected Repair")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Rejected Asset Repair List';
                            RunObject = page "Asset Repair List";
                            RunPageLink = Status = filter(Rejected);
                            ToolTip = 'Executes the HR Transport Allocations action.';
                        }
                    }

                }
                group("HR Welfare Management")
                {
                    Caption = 'HR Welfare Management';
                    Image = ReferenceData;
                    action("Open HR Welfare List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open HR Welfare List';
                        RunObject = page "HR Company Activities List";
                        RunPageLink = Status = filter(New);
                        ToolTip = 'Executes the HR Welfare List action.';
                    }
                    action("Pending HR Welfare List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending HR Welfare List';
                        RunObject = page "HR Company Activities List";
                        RunPageLink = Status = filter("Pending Approval");
                        ToolTip = 'Executes the HR Welfare List action.';
                    }
                    action("Approved HR Welfare List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved HR Welfare List';
                        RunObject = page "HR Company Activities List";
                        RunPageLink = Status = filter(Approved);
                        ToolTip = 'Executes the HR Welfare List action.';
                    }
                }
                group("HR Training Management")
                {
                    Caption = 'HR Training Management';
                    Image = Job;
                    group("Training Needs")
                    {
                        action("Open Training Needs List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Open Training Needs List';
                            RunObject = page "HR Training Needs List";
                            RunPageLink = Status = const(Open);
                            ToolTip = 'Executes the HR Training Needs List action.';
                        }
                        action("Pending Training Needs List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Pending Training Needs List';
                            RunObject = page "HR Training Needs List";
                            RunPageLink = Status = const("Pending Approval");
                            ToolTip = 'Executes the HR Training Needs List action.';
                        }
                        action("Approved Training Needs List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Training Needs List';
                            RunObject = page "HR Training Needs List";
                            RunPageLink = Status = const(Approved);
                            ToolTip = 'Executes the HR Training Needs List action.';
                        }
                        action("Rejected Training Needs List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Rejected Training Needs List';
                            RunObject = page "HR Training Needs List";
                            RunPageLink = Status = const(Rejected);
                            ToolTip = 'Executes the HR Training Needs List action.';
                        }
                    }
                    group("Trainings Applications")
                    {
                        action("Open Training Application List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Open Training Application';
                            RunObject = page "HR Training Application List";
                            RunPageLink = Status = filter(New);
                            ToolTip = 'Executes the HR Training Application List action.';
                        }
                        action("Pending Training Application List")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Pending Training Application';
                            RunObject = page "HR Training Application List";
                            RunPageLink = Status = filter("Pending Approval");
                            ToolTip = 'Executes the HR Training Application List action.';
                        }
                        action("Approved Training Applications")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Approved Training Applications';
                            RunObject = page "HR Training App List -Approved";
                            ToolTip = 'Executes the HR Training Applications (Approved) action.';
                        }
                        action("Rejected Training Applications")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Rejected Training Application';
                            RunObject = page "HR Training Application List";
                            RunPageLink = Status = filter(Rejected);
                            ToolTip = 'Executes the HR Training Application List action.';
                        }
                    }
                    action("HR Employee Training Requisition List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Employee Training Requisition List';
                        RunObject = page "HR Emp Training Appl. Req List";
                        Visible = false;
                        ToolTip = 'Executes the HR Employee Training Requisition List action.';
                    }

                    action("HR Training Bonding Conditions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Training Bonding Conditions';
                        RunObject = page "HR Training Bonding Cond. List";
                        ToolTip = 'Executes the HR Training Bonding Conditions action.';
                    }

                }
                group("Disciplinary Management")
                {
                    Caption = 'Disciplinary Management';
                    Image = ReferenceData;
                    action("Disciplinary Cases Reported")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Disciplinary Cases Reported';
                        RunObject = page "HR Disciplinary Cases List NCA";
                        RunPageLink = Appealed = const(false), "Disciplinary Stage Status" = const(Reported);
                        ToolTip = 'Executes the HR Disciplinary Cases List action.';
                    }
                    action("HR Disciplinary List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Disciplinary Cases Responded';
                        RunObject = page "HR Disciplinary Cases List NCA";
                        RunPageLink = Appealed = const(false), "Disciplinary Stage Status" = const("Under Review");
                        ToolTip = 'Executes the HR Disciplinary Cases List action.';
                    }
                    action("HR Disciplinary InProgress")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Disciplinary Cases In Progress';
                        RunObject = page "HR Disciplinary Cases List NCA";
                        RunPageLink = "Disciplinary Stage Status" = const(Inprogress);
                        ToolTip = 'Executes the HR Disciplinary Cases List action.';
                    }
                    action("HR Disciplinary Closed")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Disciplinary Cases Closed';
                        RunObject = page "HR Disciplinary Cases List NCA";
                        RunPageLink = "Disciplinary Stage Status" = const(Closed);
                        ToolTip = 'Executes the HR Disciplinary Cases List action.';
                    }
                    action("Registered Cases")
                    {
                        ApplicationArea = all;
                        Caption = 'Disciplinary Registered Cases';
                        RunObject = page "Case Register List";
                        ToolTip = 'Cases Registered';
                    }
                    action("HR E-Mail Parameters List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR E-Mail Parameters List';
                        RunObject = page "HR E-Mail Parameters List";
                        ToolTip = 'Executes the HR E-Mail Parameters List action.';
                    }
                    action("HR Disciplinary Cases Appealled")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Disciplinary Cases Appealled';
                        RunObject = page "HR Disciplinary Cases List NCA";
                        RunPageLink = Appealed = const(true);
                        ToolTip = 'Executes the HR Employee Disciplinary Cases appealled.';
                    }
                    action("HR Cases Submitted;")
                    {
                        ApplicationArea = all;
                        Caption = 'HR Cases Submitted';
                        RunObject = page "Hr Disciplanary Cases Created";
                        ToolTip = 'specifies the submitted cases';
                    }

                }

                group("HR Promotion Management")
                {
                    action(PromoRecommend)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open HR Emp Promotion List';
                        RunObject = page "HR Promotion Recommend List";
                        RunPageLink = Status = filter(New);
                        ToolTip = 'Executes the HR Emp Transfer List action.';
                    }
                    action(PromoRecommends)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending HR Emp Promotion List';
                        RunObject = page "HR Promotion Recommend List";
                        RunPageLink = Status = filter("Pending Approval");
                        ToolTip = 'Executes the HR Emp Transfer List action.';
                    }
                    action(PromoRecommendss)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved HR Emp Promotion List';
                        RunObject = page "HR Promotion Recommend List";
                        RunPageLink = Status = filter(Approved);
                        ToolTip = 'Executes the HR Emp Transfer List action.';
                    }
                    action(PromoRecommendsREs)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected HR Emp Promotion List';
                        RunObject = page "HR Promotion Recommend List";
                        RunPageLink = Status = filter(Rejected);
                        ToolTip = 'Executes the HR Emp Transfer List action.';
                    }
                }
                group("Academic Qualifications Update")
                {
                    action("Open Employee Qualifications")
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the open Hr  Employees qualifications Update';
                        RunObject = page "Hr Emp Qualification Changes";
                        RunPageLink = Status = filter(Open);
                    }
                    action("Pending Employee Qualifications")
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the Pending Hr  Employees qualifications Update';
                        RunObject = page "Hr Emp Qualification Changes";
                        RunPageLink = Status = filter("Pending Approval");
                    }
                    action("Approved Employee Qualifications")
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the Pending Hr  Employees qualifications Update';
                        RunObject = page "Hr Emp Qualification Changes";
                        RunPageLink = Status = filter(Approved), Posted = const(false);
                    }
                    action("Updated Employee Qualifications")
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the Pending Hr  Employees qualifications Update';
                        RunObject = page "Hr Emp Qualification Changes";
                        RunPageLink = Status = filter(Approved), Posted = const(true);
                    }
                }
                group("Staff Employee Changes")
                {
                    action("Open Employee Changes")
                    {
                        ApplicationArea = all;
                        ToolTip = 'specifies the Open changes Employee  records ';
                        RunObject = page "Hr Staff Changes List";
                        RunPageLink = "Approval Status" = filter(Open);
                    }
                    action("Pending Employee Changes")
                    {
                        ApplicationArea = all;
                        ToolTip = 'specifies the Pending changes Employee  records ';
                        RunObject = page "Hr Staff Changes List";
                        RunPageLink = "Approval Status" = filter("Pending approval");
                    }
                    action("Approved Employee Changes")
                    {
                        ApplicationArea = all;
                        ToolTip = 'specifies the Pending changes Employee  records ';
                        RunObject = page "Hr Staff Changes List";
                        RunPageLink = "Approval Status" = filter(Approved);
                    }
                    action("Rejected Employee Changes")
                    {
                        ApplicationArea = all;
                        ToolTip = 'specifies the Pending changes Employee  records ';
                        RunObject = page "Hr Staff Changes List";
                        RunPageLink = "Approval Status" = filter(Rejected);
                    }
                }
            }
            group("HR Jobs Management")
            {
                Caption = 'HR Jobs Management';
                Image = Job;
                group("HR Jobs")
                {
                    action("HR Jobs Open")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Jobs Open';
                        RunObject = page "HR Jobs List";
                        RunPageLink = Status = filter(New);
                        ToolTip = 'Executes the HR Jobs action.';
                    }
                    action("HR Jobs Pending")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Jobs Pending';
                        RunObject = page "HR Jobs List";
                        RunPageLink = Status = filter("Pending Approval");
                        ToolTip = 'Executes the HR Jobs action.';
                    }
                    action("HR Jobs Approved")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Jobs Approved';
                        RunObject = page "HR Jobs List";
                        RunPageLink = Status = filter(Approved);
                        ToolTip = 'Executes the HR Jobs action.';
                    }
                }
                action("HR Job Qualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Job Qualifications';
                    RunObject = page "HR Job Qualifications";
                    ToolTip = 'Executes the HR Job Qualifications action.';
                }
            }
            group("Succession Planning")
            {
                Caption = 'Succession Planning';
                Visible = false;
                action("HR Jobs to Succeed list")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Jobs to Succeed list';
                    RunObject = page "HR Jobs to Succeed list";
                    ToolTip = 'Executes the HR Jobs to Succeed list action.';
                }
                action(Acceleration)
                {
                    ApplicationArea = Basic;
                    Caption = 'Acceleration Pool List';
                    RunObject = page "Acceleration Pool List";
                    ToolTip = 'Executes the Acceleration Pool List action.';
                }
                action("HR Succession Details list")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Succession Details list';
                    RunObject = page "HR Succession Details list";
                    ToolTip = 'Executes the HR Succession Details list action.';
                }
            }
            group("HR Approvals Management")
            {
                Caption = 'HR Approvals Management';
                Image = Administration;
                action("HR Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Approval Entries';
                    RunObject = page "Approval Entries";
                    ToolTip = 'Executes the HR Approval Entries action.';
                }

                action("HR Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Approval Request Entries';
                    RunObject = page "Approval Request Entries";
                    ToolTip = 'Executes the HR Approval Request Entries action.';
                }
                action("HR Requests to Approve")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Requests to Approve';
                    RunObject = page "Requests to Approve";
                    ToolTip = 'Executes the HR Requests to Approve action.';
                }
            }
            group("HR Exit Management")
            {
                Caption = 'Employee Separation';
                Image = ReferenceData;
                group("Employee Separation")
                {
                    action("New Separation List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Separation List';
                        RunObject = page "Separation List";
                        RunPageLink = Status = filter(New);
                        ToolTip = 'Executes the Separation List action.';
                    }
                    action("Pending Separation List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Separation List';
                        RunObject = page "Separation List";
                        RunPageLink = Status = filter("Pending Approval");
                        ToolTip = 'Executes the Separation List action.';
                    }
                    action("Approved Separation List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Separation List';
                        RunObject = page "Separation List";
                        RunPageLink = Status = filter(Approved);
                        ToolTip = 'Executes the Separation List action.';
                    }
                    action("Rejected Separation List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected Separation List';
                        RunObject = page "Separation List";
                        RunPageLink = Status = filter(Rejected);
                        ToolTip = 'Executes the Separation List action.';
                    }
                }
                group("Employee Clearance")
                {
                    action("Open Clearance List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Clearance List';
                        RunObject = page "Clearance List";
                        RunPageLink = Status = filter(New);
                        ToolTip = 'Executes the Open Clearance List action.';
                    }
                    action("Pending Clearance List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Clearance List';
                        RunObject = page "Clearance List";
                        RunPageLink = Status = filter("Pending Approval");
                        ToolTip = 'Executes the Pending Clearance List action.';
                    }
                    action("Approved Clearance List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Clearance List';
                        RunObject = page "Clearance List";
                        RunPageLink = Status = filter(Approved);
                        ToolTip = 'Executes the Approved Clearance List action.';
                    }
                    action("Rejected Clearance List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected Clearance List';
                        RunObject = page "Clearance List";
                        RunPageLink = Status = filter(Rejected);
                        ToolTip = 'Executes the Rejected Clearance List action.';
                    }
                }
                group("Employee Questionnaires")
                {
                    action("Open Questionnaire")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Questionnaires';
                        RunObject = page "Exit Questionnaire List";
                        RunPageLink = Status = filter(<> Approved);
                        ToolTip = 'Executes the Exit Questionnaires action.';
                    }
                    action("Exit Questionnaire")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Questionnaires';
                        RunObject = page "Exit Questionnaire List";
                        RunPageLink = Status = filter(Approved);
                        ToolTip = 'Executes the Exit Questionnaires action.';
                    }
                }
                action("HR Exit Interviews")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Exit Interviews';
                    RunObject = page "Employee Exit Interview list";
                    ToolTip = 'Executes the HR Exit Interviews action.';
                }
            }
            group("HR Employee Transfer")
            {
                Visible = false;
                group("Employee Transfer")
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
                        RunPageLink = Status = filter(Approved);
                        ToolTip = 'Executes the HR Emp Transfer List action.';
                    }
                    action("Rejected Transfer")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected Transfer Employees List';
                        RunObject = page "HR Emp Transfer List";
                        RunPageLink = Status = filter(Rejected);
                        ToolTip = 'Executes the HR Emp Transfer List action.';
                    }
                }

            }

            group("HR General Setup")
            {
                action("HR Setup")
                {
                    ApplicationArea = All;
                    Caption = 'HR Setup';
                    RunObject = page "HR Setup";
                    ToolTip = 'Executes the HR Setup action.';
                }
                action("Pr Transaction Code")
                {
                    ApplicationArea = all;
                    Caption = 'PR transaction List';
                    RunObject = page "PR Transaction Codes List";
                    ToolTip = 'PR Transaction code lists';
                }
                action("Dimension Value List - COUNTY")
                {
                    ApplicationArea = all;
                    Caption = 'Dimension Value List';
                    RunObject = page "Country Dimensions";
                    ToolTip = 'Dimension Value List';
                }
                action("HR Lookup Values List")
                {
                    ApplicationArea = All;
                    Caption = 'HR Lookup Values List';
                    RunObject = page "HR Lookup Values List";
                    ToolTip = 'Executes the HR Lookup Values List action.';
                }
                action("Leave Period")
                {
                    ApplicationArea = all;
                    Caption = 'Leave Period';
                    RunObject = page "HR Leave Period List";
                    ToolTip = 'Hr Leave Period period setup';
                }
                action("HR Committees")
                {
                    ApplicationArea = All;
                    Caption = 'HR Committees';
                    RunObject = page "HR Committees";
                    ToolTip = 'Executes the HR Committees action.';
                }

                action("HR E-Mail Parameter List")
                {
                    ApplicationArea = All;
                    Caption = 'HR E-Mail Parameters List';
                    RunObject = page "HR E-Mail Parameters List";
                    ToolTip = 'Executes the HR E-Mail Parameters List action.';
                }
                action("Causes of Absence")
                {
                    ApplicationArea = All;
                    Caption = 'Causes of Absence';
                    RunObject = page "Causes of Absence";
                    ToolTip = 'Executes the Causes of Absence action.';
                }
                action("Misc. Articles")
                {
                    ApplicationArea = All;
                    Caption = 'Misc. Articles';
                    RunObject = page "Misc. Articles";
                    ToolTip = 'Executes the Misc. Articles action.';
                }
                action("Responsibility Center List")
                {
                    ApplicationArea = all;
                    RunObject = page "Responsibility Center List BRN";
                    Caption = 'Responsibility Center List';
                    ToolTip = 'Specifies the departs in NLC';
                }
                action(Confidential)
                {
                    ApplicationArea = All;
                    Caption = 'Confidential';
                    RunObject = page Confidential;
                    Visible = false;
                    ToolTip = 'Executes the Confidential action.';
                }
                action("Company Information")
                {
                    ApplicationArea = All;
                    Caption = 'Company Information';
                    RunObject = page "Company Information";
                    ToolTip = 'Executes the Company Information action.';
                }
                action("HR Calendar List")
                {
                    ApplicationArea = All;
                    Caption = 'HR Calendar List';
                    RunObject = page "HR Calendar List";
                    ToolTip = 'Executes the HR Calendar List action.';
                }
                action("Company Vehicles")
                {
                    ApplicationArea = all;
                    Caption = 'Company Vehicles';
                    RunObject = page "Company Vehicles list";
                    ToolTip = 'Compnay Vehicle setup';
                }
                action("HR Leave Types Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Types';
                    RunObject = page "HR Leave Types";
                    ToolTip = 'Executes the HR Leave Types action.';
                }
                action("NLC Salry Grade Multiplier")
                {
                    ApplicationArea = all;
                    Caption = 'NLC Salry Grade Multiplier';
                    RunObject = page "NLC Multiplier";
                }
                action("Workflow setup")
                {
                    ApplicationArea = all;
                    Caption = 'Workflow Setup';
                    RunObject = page Workflows;
                    ToolTip = 'Specifies the workflow Setups';
                }
            }
        }
        area(Reporting)
        {

            group(Jobs)
            {
                action(Action25)
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Jobs';
                    Image = Job;
                    RunObject = report "HR Jobs";
                    ToolTip = 'Executes the HR Jobs action.';
                }
                action("HR Job Occupants")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Job Occupants';
                    Image = ExportSalesPerson;
                    RunObject = report "HR Job Occupants";
                    ToolTip = 'Executes the HR Job Occupants action.';
                }
                action("HR Job (Vacant)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Job (Vacant)';
                    Image = List;
                    RunObject = report "HR Jobs (Vacant)";
                    ToolTip = 'Executes the HR Job (Vacant) action.';
                }
                action("HR Job (Occupied)")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Job (Occupied)';
                    Image = CoupledOpportunitiesList;
                    RunObject = report "HR Jobs (Occupied)";
                    ToolTip = 'Executes the HR Job (Occupied) action.';
                }
            }
            group(Recruitment)
            {
                action(applicanttoemployee)
                {
                    ApplicationArea = All;
                    Caption = 'Applicant to Employee Upload';
                    RunObject = report "HR Applicant to Employee";
                    ToolTip = 'Executes the Applicant to Employee Upload action.';
                }
                action(cv)
                {
                    ApplicationArea = All;
                    Caption = 'Applicant CV';
                    RunObject = report "HR Applicant CV";
                    ToolTip = 'Executes the Applicant CV action.';
                }
                action(allapps)
                {
                    ApplicationArea = All;
                    Caption = 'All Job Applications';
                    RunObject = report "HR Job Applicantions - Long L";
                    ToolTip = 'Executes the All Job Applications action.';
                }
                action(shortl)
                {
                    ApplicationArea = All;
                    Caption = 'Job Applications-Qualified';
                    RunObject = report "HR Job Applications - Shortli";
                    ToolTip = 'Executes the Job Applications-Qualified action.';
                }
                action(UnqualifiedApplicants)
                {
                    ApplicationArea = All;
                    Caption = 'Unqualified Applicants';
                    RunObject = report "Unqualified Applicants";
                    ToolTip = 'Executes the Unqualified Applicants action.';
                }
                action(Sample)
                {
                    ApplicationArea = All;
                    Caption = 'Sample Format Long List';
                    RunObject = report "Sample Format Long List";
                    ToolTip = 'Executes the Sample Format Long List action.';
                }
                action(test)
                {
                    ApplicationArea = All;
                    Caption = 'Recruitment Applications';
                    RunObject = report "test recruitment1";
                    ToolTip = 'Executes the Recruitment Applications action.';
                }
            }
            group(empman)
            {
                Caption = 'Employee Management';
                action("HR Employees List")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employees List';
                    RunObject = report "HR Employee List";
                    Visible = false;
                    ToolTip = 'Executes the HR Employees List action.';
                }
                action("Employee Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Data';
                    RunObject = report "Employee Report";
                    ToolTip = 'Executes the Staff Data action.';
                }

                action("Employee Grades3")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Grades';
                    RunObject = report "Employee Grades3";
                    ToolTip = 'Executes the Employee Grades action.';
                }
                action("Employee Grades Count")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Grades Count';
                    RunObject = report "Employee Grades Count";
                    ToolTip = 'Executes the Employee Grades Count action.';
                }
                action("Staff Age Report.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Age Report';
                    RunObject = report "Staff Age Report";
                    ToolTip = 'Executes the Staff Age Report action.';
                }
                action("Seconded/Contract Report1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Seconded/Contract Report1';
                    RunObject = report "Seconded/Contract Report1";
                    ToolTip = 'Executes the Seconded/Contract Report1 action.';
                }
                action("Gender Report1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gender Report';
                    RunObject = report "Gender Report1";
                    ToolTip = 'Executes the Gender Report action.';
                }
                action("Acting Appointment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Acting Appointment';
                    RunObject = report "Acting Appointment";
                    ToolTip = 'Executes the Acting Appointment action.';
                }
                action("HR Employee Beneficiaries")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee Beneficiaries';
                    RunObject = report "HR Employee Beneficiaries";
                    ToolTip = 'Executes the HR Employee Beneficiaries action.';
                }
                action("HR Employee Qualifications N")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee Qualifications';
                    RunObject = report "HR Employee Qualifications N";
                    ToolTip = 'Executes the HR Employee Qualifications action.';
                }
                action("HR Employee Employment History")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee Employment History';
                    RunObject = report "HR Employee Employment History";
                    ToolTip = 'Executes the HR Employee Employment History action.';
                }
                action("HR Employee Office Equipment")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee Office Equipment';
                    RunObject = report "HR Employee Office Equipment";
                    ToolTip = 'Executes the HR Employee Office Equipment action.';
                }
                action("HR Employee Competence")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee Competence';
                    RunObject = report "HR Employee Competence";
                    ToolTip = 'Executes the HR Employee Competence action.';
                }
                action("HR Employee Referees")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee Referees';
                    RunObject = report "HR Employee Referees";
                    ToolTip = 'Executes the HR Employee Referees action.';
                }
                action("HR Employee Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Employee Status';
                    RunObject = report "HR Employee Status";
                    ToolTip = 'Executes the HR Employee Status action.';
                }
                action("HR Retirement Report2")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Retirement Report';
                    RunObject = report "HR Retirement Report2";
                    ToolTip = 'Executes the HR Retirement Report action.';
                }
                action("HR Separation Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Separation Report';
                    RunObject = report "HR Separation Report";
                    ToolTip = 'Executes the HR Separation Report action.';
                }
            }
            group("Leave Management")
            {
                action(Action32)
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Application';
                    Image = ImplementRegAbsence;
                    Promoted = true;
                    RunObject = report "HR Leave Applications List";
                    ToolTip = 'Executes the HR Leave Application action.';
                }
                action("HR Leave Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Balance';
                    Image = CalculateRemainingUsage;
                    Promoted = true;
                    RunObject = report "HR Leave Balance1";
                    ToolTip = 'Executes the HR Leave Balance action.';
                }
                action(Action3s2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Carry Forward';
                    RunObject = report "Leave Carry Forward";
                    ToolTip = 'Executes the Leave Carry Forward action.';
                }
                action(Actiona32)
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Statement';
                    RunObject = report "HR Leave Statement1";
                    ToolTip = 'Executes the HR Leave Statement action.';
                }
                action("Annual Leave Planner")
                {
                    ApplicationArea = all;
                    ToolTip = 'Annual Leave Planner Report';
                    RunObject = report "Annual Leave Plan Report";
                    Caption = 'Annual Leave Planner Report';
                }
            }
            group("Transport Management")
            {
                action(Action60)
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Transport Allocations';
                    Image = SalesShipment;
                    Promoted = true;

                    RunObject = report "HR Transport Allocations";
                    ToolTip = 'Executes the HR Transport Allocations action.';
                }
                action("HR Transport Requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Transport Requests';
                    Image = TransferOrder;
                    Promoted = true;
                    RunObject = report "HR Transport Requisitions";
                    ToolTip = 'Executes the HR Transport Requests action.';
                }

                action("Company Vehicles Report")
                {
                    ApplicationArea = All;
                    Caption = 'Company Vehicles';
                    RunObject = report "Company Vehicles";
                    ToolTip = 'Executes the Company Vehicles action.';
                }
                action("Group Transport  Requests")
                {
                    ApplicationArea = All;
                    Caption = 'Group Transport  Requests';
                    RunObject = report "Group Transport  Requests";
                    ToolTip = 'Executes the Group Transport  Requests action.';
                }
            }
            group(Training)
            {
                action("HR Training Needs")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Training Needs';
                    Image = Union;
                    Promoted = true;
                    RunObject = report "HR Training Needs1";
                    ToolTip = 'Executes the HR Training Needs action.';
                }

                action("Training Application List1")
                {
                    ApplicationArea = All;
                    Caption = 'Training Application List';
                    RunObject = report "Training Application List1";
                    ToolTip = 'Executes the Training Application List action.';
                }
                action("Training Applications")
                {
                    ApplicationArea = All;
                    Caption = 'Training Applications';
                    RunObject = report "Training Applications";
                    ToolTip = 'Executes the Training Applications action.';
                }
                action("Staff Needs From PMS")
                {
                    ApplicationArea = All;
                    Caption = 'Staff Needs From PMS';
                    RunObject = report "Staff Needs From PMS";
                    ToolTip = 'Executes the Staff Needs From PMS action.';
                }
            }
            action("HR Transfer Report")
            {
                ApplicationArea = All;
                Caption = 'HR Transfer Report';
                RunObject = report "HR Transfer Report";
                ToolTip = 'Executes the HR Transfer Report action.';
            }
            group("Succession Planning Reports")
            {
                action("Jobs To Succeed List")
                {
                    ApplicationArea = All;
                    Caption = 'Jobs To Succeed List';
                    RunObject = report "Jobs To Succeed List";
                    ToolTip = 'Executes the Jobs To Succeed List action.';
                }
                action("Succession Details")
                {
                    ApplicationArea = All;
                    Caption = 'Succession Details';
                    RunObject = report "Succession Details";
                    ToolTip = 'Executes the Succession Details action.';
                }
                action("Acceleration Pool Nomination")
                {
                    ApplicationArea = All;
                    Caption = 'Acceleration Pool Nomination';
                    RunObject = report "Acceleration Pool Nomination";
                    ToolTip = 'Executes the Acceleration Pool Nomination action.';
                }
            }
            action("Promotion Report")
            {
                ApplicationArea = All;
                Caption = 'Promotion Report';
                RunObject = report "Promotion Report";
                ToolTip = 'Executes the Promotion Report action.';
            }
            group("Appraisal Reports")
            {
                action("Appraisal Report NEW")
                {
                    ApplicationArea = All;
                    Caption = 'Appraisal Report NEW';
                    RunObject = report "Appraisal Report NEW";
                    ToolTip = 'Executes the Appraisal Report NEW action.';
                }
                action("Appraisal Scores Report")
                {
                    ApplicationArea = All;
                    Caption = 'Appraisal Scores List';
                    RunObject = report "Appraisal List Report";
                    ToolTip = 'Executes the Appraisal Scores List action.';
                }
                action("Appraisal List Report1")
                {
                    ApplicationArea = All;
                    Caption = 'Appraisal List Report';
                    RunObject = report "Appraisal List Report1";
                    ToolTip = 'Executes the Appraisal List Report action.';
                }
            }
            action("Disciplinary Cases")
            {
                ApplicationArea = All;
                Caption = 'Disciplinary Cases';
                RunObject = report "Disciplinary Cases";
                ToolTip = 'Executes the Disciplinary Cases action.';
            }
            group("Employee SeparationR")
            {
                action("Exit questionnaire report1")
                {
                    ApplicationArea = All;
                    Caption = 'Exit list';

                    RunObject = report "Exit questionnaire report1";
                    ToolTip = 'Executes the Exit list action.';
                }
                action("Exit Questionnaires")
                {
                    ApplicationArea = All;
                    Caption = 'Exit Questionnaire';
                    RunObject = report "Exit Questionnaire";
                    ToolTip = 'Executes the Exit Questionnaire action.';
                }
                action("Clearance List1")
                {
                    ApplicationArea = All;
                    Caption = 'Clearance List';
                    RunObject = report "Clearance List1";
                    ToolTip = 'Executes the Clearance List action.';
                }
                action("Clearance Certificate")
                {
                    ApplicationArea = All;
                    Caption = 'Clearance Certificate';
                    RunObject = report "Clearance Certificate";
                    ToolTip = 'Executes the Clearance Certificate action.';
                }
            }

            action("HR Employees Qualifications")
            {
                ApplicationArea = Basic;
                Caption = 'HR Employees Qualifications';
                RunObject = report "HR Employee Qualifications";
                ToolTip = 'Executes the HR Employees Qualifications action.';
            }


            action("HR Job Requirements")
            {
                ApplicationArea = Basic;
                Caption = 'HR Job Requirements';
                Image = CustomerContact;
                RunObject = report "HR Jobs(Conclusive)";
                ToolTip = 'Executes the HR Job Requirements action.';
            }
            action("HR Applicant to Employee")
            {
                ApplicationArea = Basic;
                Caption = 'HR Applicant to Employee';
                Image = CoupledOpportunitiesList;
                RunObject = report "HR Applicant to Employee";
                ToolTip = 'Executes the HR Applicant to Employee action.';
            }
            action("HR Appraisal Report")
            {
                ApplicationArea = Basic;
                Caption = 'HR Appraisal Report';
                Image = CalculateHierarchy;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = report "Appraisal Report OLD";
                ToolTip = 'Executes the HR Appraisal Report action.';
            }



        }
        area(Processing)
        {
            group(ActionGroup17)
            {
                Caption = 'HR Jobs Management';
                Visible = false;
                action("HR Job Requirement")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Job Requirement';
                    Promoted = true;
                    RunObject = page "HR Job Requirements";
                    ToolTip = 'Executes the HR Job Requirement action.';
                }
                action("HR HR Job Responsibilities")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR HR Job Responsibilities';
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = page "HR Job Responsibilities";
                    ToolTip = 'Executes the HR HR Job Responsibilities action.';
                }
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
}
