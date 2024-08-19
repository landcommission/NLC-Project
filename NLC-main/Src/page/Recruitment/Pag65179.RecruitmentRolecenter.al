page 65179 "Recruitment Role center"
{
    Caption = 'Recruitment Role center';


    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part("HR Activities Cue"; "HR Activities Cue")
                {
                    Caption = 'HUMAN RESOURCE ACTIVITIES';
                    ApplicationArea = Basic, Suite;
                }
                part(Control1904652008; "HR Manager Activities")
                {
                    ApplicationArea = all;
                }
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
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group("Hr Activies")
            {
                group("Employee Management")
                {

                    action("Hardship Allowance Setup")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Hardship Allowance Setup';
                        RunObject = page "Hardship Allowance Setup";
                    }
                    action("Applicants Profiles")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Applicants Profiles';
                        RunObject = page "Applicants Profile List";
                    }

                    action("Employee Transfers History")
                    {
                        ApplicationArea = BasicHR;
                        Visible = false;
                        Caption = 'Employee Transfers History';
                        //RunObject = page "Employee Transfers History";
                    }
                    group("Reports2")
                    {
                        Caption = 'Reports and Analysis';
                        action("Employee List Per Region/Towns")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee List Per Region/Towns';
                            RunObject = page "Employee List";
                        }
                        action("Employee - Absences by Causes1")
                        {
                            ApplicationArea = BasicHR;
                            Visible = false;
                            Caption = 'Employee Absences by Causes';
                            //   RunObject = report "Employee - Absences by Causes";
                        }
                        action("Employee - Addresses1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Addresses';
                            RunObject = report "Employee - Addresses";
                        }
                        action("Employee - Alt. Addresses1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Alt. Addresses';
                            RunObject = report "Employee - Alt. Addresses";
                        }
                        action("Employee - Birthdays1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Birthdays';
                            RunObject = report "Employee - Birthdays";
                        }
                        action("Employee - Confidential Info.1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Confidential Info.';
                            RunObject = report "Employee - Confidential Info.";
                        }
                        action("Employee - Contracts1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Contracts';
                            RunObject = report "Employee - Contracts";
                        }
                        action("Employee - Labels1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Labels';
                            RunObject = report "Employee - Labels";
                        }
                        action("Employee - List1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee List';
                            RunObject = report "Employee - List";
                        }
                        action("Employee - Misc. Article Info.1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Misc. Article Info.';
                            RunObject = report "Employee - Misc. Article Info.";
                        }
                        action("Employee - Qualifications1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Qualifications';
                            RunObject = report "Employee - Qualifications";
                        }
                        action("Employee - Relatives1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Relatives';
                            RunObject = report "Employee - Relatives";
                        }
                        action("Employee - Staff Absences1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Staff Absences';
                            Visible = false;
                            // RunObject = report "Employee - Staff Absences";
                        }
                        action("Employee - Unions1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Unions';
                            RunObject = report "Employee - Unions";
                        }

                    }
                }
                group("HR Administration")
                {
                    Caption = 'HR Administration';
                    Image = Administration;
                    action(Dimensions)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions';
                        Image = Employee;
                        RunObject = Page Dimensions;
                        ToolTip = 'Executes the Dimensions action.';
                    }
                    action("Human ResourcesSetup")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Human Resources Setup';
                        Image = AccountingPeriods;
                        RunObject = Page "HR Setup";
                        ToolTip = 'Executes the Human Resources Setup action.';
                    }
                    action("Employee Posting Group")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Employee Posting Group';
                        Image = AccountingPeriods;
                        Visible = false;
                        // RunObject = Page "HR Employee Posting Group";
                        ToolTip = 'Executes the Employee Posting Group action.';
                    }
                    action("Leave Types")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Leave Types';
                        Image = AccountingPeriods;
                        RunObject = Page "HR Leave Types";
                        ToolTip = 'Executes the Leave Types action.';
                    }

                    action("Human Res. Units of Measure")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Human Res. Units of Measure';
                        Image = AccountingPeriods;
                        RunObject = Page "Human Res. Units of Measure";
                        ToolTip = 'Executes the Human Res. Units of Measure action.';
                    }
                    action("Registration Codes")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Registration Codes';
                        RunObject = Page "Causes of Absence";
                        ToolTip = 'Executes the Registration Codes action.';
                    }
                    action("Causesof Inactivity")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Causes of Inactivity';
                        Image = Currency;
                        RunObject = Page "Causes of Inactivity";
                        ToolTip = 'Executes the Causes of Inactivity action.';
                    }
                    action("Groundsfor Termination")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Grounds for Termination';
                        Image = AccountingPeriods;
                        RunObject = Page "Grounds for Termination";
                        ToolTip = 'Executes the Grounds for Termination action.';
                    }
                    action(Union)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Unions';
                        RunObject = Page Unions;
                        ToolTip = 'Executes the Unions action.';
                    }
                    action("Employment Contract")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Employment Contracts';
                        Image = Currency;
                        RunObject = Page "Employment Contracts";
                        ToolTip = 'Executes the Employment Contracts action.';
                    }
                    action(Relative)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Relatives';
                        Image = Employee;
                        RunObject = Page Relatives;
                        ToolTip = 'Executes the Relatives action.';
                    }
                    action("Misc Articles")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Misc. Articles';
                        RunObject = Page "Misc. Articles";
                        ToolTip = 'Executes the Misc. Articles action.';
                    }
                    action(Confidentials)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Confidential';
                        RunObject = Page Confidential;
                        ToolTip = 'Executes the Confidential action.';
                    }
                    action(Qualification)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Qualifications';
                        Image = Currency;
                        RunObject = Page Qualifications;
                        ToolTip = 'Executes the Qualifications action.';
                    }

                    action("Employee Statistics Group")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Employee Statistics Groups';
                        Image = Employee;
                        RunObject = Page "Employee Statistics Groups";
                        ToolTip = 'Executes the Employee Statistics Groups action.';
                    }
                    action("Base Calendar")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Base Calendar';
                        Image = Employee;
                        RunObject = Page "Base Calendar List";
                        ToolTip = 'Executes the Base Calendar action.';
                    }
                    action("HR LeaveTypes")
                    {
                        ApplicationArea = Basic;
                        Caption = 'HR Leave Types';
                        Image = Employee;
                        RunObject = Page "HR Leave Types";
                        ToolTip = 'Executes the HR Leave Types action.';
                    }

                    action("User Setup Permissions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'User Setup Permissions';
                        Image = Employee;
                        //  RunObject = Page "User Setup Permissions";
                        ToolTip = 'Executes the HR Leave Periods action.';
                    }
                }
                group("Recruitment  & Selection")
                {
                    Caption = 'Recruitment  & Selection';
                    group("Pre-Hire Preparation")
                    {
                        action("HR Officers")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'HR Officers';
                            RunObject = page "HR Officers";
                        }
                        action("Recruitment Agencies")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Recruitment Agencies';
                            Visible = false;
                            // RunObject = page "Recruitment Agencies";
                        }
                        action("Hr Guiding Principle")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hr Guiding Principle';
                            Visible = false;
                            //  RunObject = page "Hr Guiding Principle";
                        }
                        //"HR Document Type"
                        action("HR Document Type")
                        {
                            ApplicationArea = BasicHR;
                            Visible = false;
                            Caption = 'HR Document Types';
                            //RunObject = page "HR Document Type";
                        }
                        action("HR Document Template")
                        {
                            ApplicationArea = BasicHR;
                            Visible = false;
                            Caption = 'HR Document Template';
                            //    RunObject = page "Document Template-HR";
                        }
                        action("Recruitment Reasons")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Recruitment Reasons';
                            RunObject = page "Recruitment Reasons";
                        }
                        action("Job Boards")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Job Boards';
                            Visible = false;
                            // RunObject = page "Job Boards";
                        }
                        action("Functional Recruitment Plans")
                        {
                            ApplicationArea = BasicHR;
                            Visible = false;
                            Caption = 'Functional Recruitment Plans';
                            //   RunObject = page "Functional Recruitment Plans";
                        }
                        action("Annual Recruitment Plans")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Annual Recruitment Plans';
                            RunObject = page "Recruitment Plans";
                        }
                        action("Recruitment Requisitions")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Recruitment Requisitions';
                            RunObject = page "Recruitment Requisitions";
                        }
                        action("Employer Information")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employer Profile';
                            RunObject = page "Company Information";
                        }
                        action("Employee List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee List';
                            RunObject = page "Employee List";
                        }
                        action("Qualifications Invetory")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Qualifications Inventory';
                            RunObject = page "Qualifications";
                        }

                        action("Partially Filled Vacancies")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Partially Filled Vacancies';
                            RunObject = page "Vacancies";
                        }
                        action("Fully Filled Vacancies")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Fully Filled Vacancies';
                            RunObject = page "Vacancies";
                        }
                        group("reports123")
                        {
                            caption = 'Reports';

                            action("Detailed Manpower Plan")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Detailed Manpower Plan';
                                //  RunObject = report "Staff Establishment";
                            }
                            action("Recruitment  Requisition List")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Recruitment  Requisition List';
                                //  RunObject = report "Staff Establishment";
                            }
                            action("Vacancies List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Vacancies List';
                                Visible = false;
                                // RunObject = report "Vacancies List";
                            }
                            action("Vacancy Announcements List")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Vacancy Announcements List';
                                // RunObject = report "Vacancy Announcements List";
                            }
                        }
                    }
                    group("Application & Selection")
                    {

                        action("Open Vacancies")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Open Vacancies';
                            RunObject = page "Vacancies";
                        }
                        action("Job Applications")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Job Applications';
                            RunObject = page "Job Applications";
                        }

                        action("Commitee Appointment Vouchers")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Commitee Appointment Vouchers';
                            RunObject = page "Commitee Appointment Vouchers";
                        }
                        action("Consolidated Interview Records")
                        {
                            ApplicationArea = BasicHR;
                            Visible = false;
                            Caption = 'Consolidated Interview Records';
                            //  RunObject = page "Consolidated Interview Records";
                        }
                        action("Closed Vacancies")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Closed Vacancies';
                            RunObject = page "Vacancies";
                        }
                        action("Rejected Job Offers")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Rejected Job Offers';
                            RunObject = page "Vacancies";
                        }
                        group("Administration2121")
                        {
                            caption = 'Administration';
                            action("Job Board")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Job Board';
                                Visible = false;
                                //RunObject = page "Job Boards";
                            }
                            action("Hobby Types")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Hobby Types';
                                Visible = false;
                                //RunObject = page "Hobby Types";
                            }
                            action("Disability Code")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Disability Code';
                                Visible = false;
                                //RunObject = page "Disability Code";
                            }
                            action("Ethnic Groups")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Ethnic Groups';
                                Visible = false;
                                //RunObject = page "Ethnic Groups";
                            }
                            action("System Shortlisted Application")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'System Shortlisted Application';
                                //RunObject = page "System Shortlisted Application";
                            }
                            action("Background Checks")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Background Checks';
                                Visible = false;
                                //RunObject = page "Background Checks";
                            }
                            action("Medical Check Reports")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Medical Check Reports';
                                Visible = false;
                                //RunObject = page "Medical Check Reports";
                            }
                            action("Apptitude Question")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Apptitude Question';
                                //RunObject = page "Apptitude Question";
                            }
                            action("Ability Test Responses")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Ability Test Responses';
                                Visible = false;
                                //RunObject = page "Ability Responses";
                            }
                            action("Interview Scoresheet Templates")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Interview Scoresheet Templates';
                                //RunObject = page "Interview Scoresheet Templates";
                            }

                            action("Medical History Setup")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Medical History Setup';
                                //RunObject = page "Medical History Setup";
                            }
                            action("Medical Examination Type")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Medical Examination Type';
                                //RunObject = page "Medical Examination Type";
                            }
                            action("Referee Recommendation")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Referee Recommendation';
                                //RunObject = page "Referee Recommendation";
                            }
                            action("Medical Check Templates")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Medical Check Templates';
                                Visible = false;
                                //RunObject = page "Medical Check Templates";
                            }
                            action("Shortlisting Score Code")
                            {
                                ApplicationArea = BasicHR;
                                Visible = false;
                                Caption = 'Shortlisting Score Code';
                                //RunObject = page "Shortlisting Score Code";
                            }

                        }

                    }
                    group("Appointment & Onboarding")
                    {
                        action("Employees23")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employees';
                            RunObject = page "Employee List";
                        }
                        action("Employee Contracts")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Contracts';
                            RunObject = page "Contract List";
                        }
                        action("Employment Offers")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employment Offers';
                            Visible = false;
                            // RunObject = page "Employment Offers";
                        }
                        action("Terminated Employee Contracts")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Terminated Employee Contracts';
                            RunObject = page "Employee List";
                        }
                        action("Employee Statistics Groups1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Statistics Groups';
                            RunObject = page "Employee Statistics Groups";
                        }
                        action("Employee Contract Groups")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employee Contract Groups';
                            RunObject = page "Employee Statistics Groups";
                        }

                    }
                }
                group(PayrollGroup)
                {
                    Caption = 'PCA';
                    Image = AdministrationSalesPurchases;

                    action("Open Paychange Advice")
                    {
                        Caption = 'Open Paychange Advice';
                        ApplicationArea = basic;
                        Visible = false;
                        // RunObject = Page "prPCA list";
                        // RunPageView = where(Status = filter(Open));
                    }
                    action("Pending Paychange Advice")
                    {
                        Caption = 'Pending Paychange Advice';
                        ApplicationArea = basic;
                        Visible = false;
                        // RunObject = Page "prPCA list";
                        // RunPageView = where(Status = filter("Pending Approval"));
                    }
                    action("Approved Paychange Advice")
                    {
                        Caption = 'Approved Paychange Advice';
                        ApplicationArea = basic;
                        Visible = false;
                        // RunObject = Page "prPCA list";
                        // RunPageView = where(Status = filter(Approved));
                    }
                    action("Posted Paychange Advice")
                    {
                        Caption = 'Posted Paychange Advice';
                        ApplicationArea = basic;
                        Visible = false;
                        // RunObject = Page "prPCA list";
                        // RunPageView = where(Status = filter(Posted));
                    }

                }
                group("Discipline Case Files")
                {

                    action("Discplinary Files List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Discplinary Files List';
                        RunObject = page "Hr Discplinary List";
                    }


                }

            }
            group("Company Information1")
            {
                Caption = 'Company Information';
                action("Company Information")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Company Information';
                    RunObject = page "Company Information";
                }
                action("Base Calendar Card")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Base Calendar Card';
                    RunObject = page "Base Calendar Card";
                }
            }
            group(JobsManagement)
            {
                Caption = 'Jobs Management';
                Image = HumanResources;
                action("Jobs Management")
                {
                    ApplicationArea = Basic;
                    Caption = 'Jobs List';
                    Image = Employee;
                    // RunObject = Page "Job Card";
                    ToolTip = 'List the Jobs.';
                }
                action("Jobs Grade")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Grades';
                    Image = Employee;
                    // RunObject = Page "Job Grades";
                    ToolTip = 'List the Jobs.';
                }
                action("Salary Pointers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Pointers';
                    Image = Employee;
                    RunObject = Page "Salary pointers";
                    ToolTip = 'List the Jobs.';
                }
            }
            group("Hr Planning Management")
            {
                Caption = 'Hr Planning Management';
                action("Positions")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Positions';
                    Visible = false;
                    // RunObject = page "Positions";
                }
                action("Duty Stations")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Duty Stations';
                    RunObject = page "Duty Station";
                }
            }

            group("Establishment")
            {
                Caption = 'Organization Development';

                action("Job Grades")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Job Grades';
                    //  RunObject = page "Job Grades";
                }
                action("Commitee Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Commitee Types';
                    RunObject = page "Commitee Types";
                }
                action("Domain Area")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Domain Area';
                    RunObject = page "Domain Area";
                }
                action("HR Committee Appointment")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR Committee Appointment List';
                    RunObject = page "HR Committee Appointment List";
                }
                group("Reports11")
                {
                    caption = 'Reports';
                    Visible = false;
                    action("Staff Establishment")
                    {
                        ApplicationArea = BasicHR;
                        Visible = false;
                        Caption = 'Staff Establishment';
                        //   RunObject = report "Staff Establishment";
                    }
                    action("Detailed Staff Establishment")
                    {
                        ApplicationArea = BasicHR;
                        Visible = false;
                        Caption = 'Detailed Staff Establishment';
                        //   RunObject = report "Detailed Staff Establishment";
                    }
                }


            }

            group("Exit Management")
            {
                Caption = 'Exit Management';
                Image = HumanResources;
                Visible = false;
                action("Employee Exit Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Exit Vouchers';
                    Image = Loaners;
                    Visible = false;
                    //RunObject = Page "Employee Exit Vouchers";
                }
                action("Functional Hand Ov")
                {
                    ApplicationArea = Basic;
                    Caption = 'Clearance Form';
                    Image = Loaners;
                    Visible = false;
                    //RunObject = Page "Functional Hand Over Vouchers";
                }
                action("Exit Methods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exit Methods';
                    Image = Loaners;
                    Visible = false;
                    //RunObject = Page "Exit Methods";
                }
                action("Reasons for Exit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reasons for Exit';
                    Image = Loaners;
                    Visible = false;
                    //RunObject = Page "Reasons for Exit";
                }
                action("Position Exit Templates")
                {
                    ApplicationArea = Basic;
                    Caption = 'Position Exit Templates';
                    Image = Loaners;
                    Visible = false;
                    //RunObject = Page "Position Exit Templates";
                }

            }


        }
    }


}
