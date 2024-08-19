page 50190 "Discipline Role Center"
{

    Caption = 'Discipline Role Center';
    PageType = RoleCenter;
    ApplicationArea = Basic;
    layout
    {
        area(rolecenter)
        {


            part("Discipline Management Cue"; "Discipline Management Cue")
            {
                Caption = 'Discipline Management Activities';
                ApplicationArea = Basic, Suite;
            }


            //  part(Document Approvals)

            systempart(Control1000000050; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1901420308; Outlook)
            {
                ApplicationArea = Basic;
            }

            part(Control21; "My Job Queue")
            {
                Visible = false;
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(Sections)
        {

            group("Discplinary Case Management")
            {
                Caption = 'Discplinary Case Management';
                action("Employee Discplinary List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Discplinary List';
                    RunObject = page "Hr New Discplinary List";
                }
                action("Submitted Discplinary List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Submitted Discplinary List';
                    RunObject = page "Hr Sub Discplinary List";
                }
                action("Closed Discplinary List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Closed Discplinary Cases';
                    RunObject = page "Hr Cld Discplinary List";
                }
            }
            group("Discipline Case Files")
            {
                action("Appealed Discplinary List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Appealed Discplinary Cases';
                    RunObject = page "Hr Apld Discplinary List";
                }
                action("Discplinary Files List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Discplinary Files List';
                    RunObject = page "Hr Discplinary List";
                }

                action("Disciplinary Committee")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Committee';
                    RunObject = page "HR Committee Appointment List";
                }
            }
            group("HR Discipline Setup")
            {
                action("Disciplinary Deduction Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Deduction Setup';
                    RunObject = page "Disciplinary Status";
                }

                action("Discipline Document Stage Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Discipline Document Stage Setup';
                    Image = Document;

                    RunObject = Page "Discipline Document Stage";
                }
            }
            group("HR Discipline Report")
            {
                Caption = 'Reports & Analysis';
                action("Discipline Register")
                {
                    ApplicationArea = BasicHR;
                    RunObject = Report "Discipline Register";
                }
                action("Disciplinary Cases Report")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Cases Report';
                    //  RunObject = report "HR Cases Report";
                }
                action("Disciplinary Cases Report per Employee")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Cases Report per Employee';
                    //RunObject = Report "HR Cases Report - Employee Bas";
                }
                action("Disciplinary Cases Report per Dept")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Cases Report per Dept';
                    //RunObject = Report "HR Cases Report - Dept Based";
                }

            }

            group("Disciplinary Applications")
            {
                action("Grievance Document")
                {
                    Caption = 'Employee Grievance List';
                    ApplicationArea = BasicHR;
                    RunObject = Page "Discipline Document List";

                }
                action("Submitted Discipline Document")
                {
                    Caption = 'Submitted Employee Grievance List';
                    ApplicationArea = BasicHR;
                    RunObject = Page "Submitted Discipline Document";

                }

                action("Surcharge Document")
                {
                    Caption = 'Employee Surcharge List';
                    ApplicationArea = BasicHR;
                    RunObject = Page "Surcharge List";

                }
                action("Submitted Surcharge")
                {
                    Caption = 'Employee Submitted Surcharge List';
                    ApplicationArea = BasicHR;
                    RunObject = Page "Submitted Surcharge List";

                }

            }
        }
    }


}