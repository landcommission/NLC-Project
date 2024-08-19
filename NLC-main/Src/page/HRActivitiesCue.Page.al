page 81283 "HR Activities Cue"
{
    PageType = CardPart;
    SourceTable = "HR Activities Cue";
    ApplicationArea = All;
    Caption = 'HR Activities Cue';
    layout
    {
        area(Content)
        {
            cuegroup("Performance Appraisal System Activities")
            {
                Caption = 'Performanceaisal System Activities';
                ShowCaption = true;
                Visible = false;
            }
            cuegroup(JobsActivities)
            {
                Caption = 'Jobs Dashboard';
                ShowCaption = true;
                Visible = false;
                field("All Jobs"; Rec."All Jobs")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the All Jobs field.';
                }
            }

            cuegroup(EmployeeActivitiesActive)
            {
                Caption = 'Employee Dashboard';
                ShowCaption = true;
                Visible = true;
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Active Employees';
                    ToolTip = 'Specifies the value of the Active Employees field.';
                }
                field("In-Active Employees"; Rec."In-Active Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Exited Employees';
                    ToolTip = 'Specifies the value of the Exited Employees field.';
                }
                field("Suspended Employees"; Rec."Suspended Employees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Suspended Employees field.';
                }
                field("Interdicted Employees"; Rec."Interdicted Employees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interdicted Employees field.';
                }
                field("Dismissed Employees"; Rec."Dismissed Employees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dismissed Employees field.';
                }
                field("Contract Staff"; Rec."Contract Staff")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Staff';
                    ToolTip = 'Specifies the value of the Contract Staff field.';
                }

                field("Permanent Staff"; Rec."Permanent Staff")
                {
                    ApplicationArea = All;
                    Caption = 'Permanent Staff';
                    ToolTip = 'Specifies the value of the Permanent Staff field.';
                }
                field("Seconded Staff"; Rec."Seconded Staff")
                {
                    Caption = 'Seconded Staff';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Seconded Staff field.';
                }
            }


            cuegroup(EmployeeActivitiesGender)
            {
                Caption = 'Gender Dashboard';
                ShowCaption = false;
                Visible = true;


                field("Male Employees"; Rec."Male Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Male Employees';
                    ToolTip = 'Specifies the value of the Male Employees field.';
                }

                field("Female Employees"; Rec."Female Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Female Employees';
                    ToolTip = 'Specifies the value of the Female Employees field.';
                }
            }
            cuegroup(DueEmployeesGroup)
            {
                Caption = 'Staff Dashboard';
                ShowCaption = true;
                Visible = true;


                field("Staff on Leave"; Rec."Staff on Leave")
                {
                    ApplicationArea = All;
                    Caption = 'Staff On Leave';
                    ToolTip = 'Specifies the value of the Staff On Leave field.';
                }

                field("Contracts Due"; Rec."Contracts Due")
                {
                    ApplicationArea = All;
                    Caption = 'Contracts Due';
                    ToolTip = 'Specifies the value of the Contracts Due field.';
                }
                field("Ending Probations"; Rec."Ending Probations")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ending Probations field.';
                }

                field("Retirement Report"; Rec."Retirement Report")
                {
                    ApplicationArea = All;
                    Caption = 'Retirement';
                    ToolTip = 'Specifies the value of the Retirement field.';
                }

                field("Probation Report"; Rec."Probation Report")
                {
                    ApplicationArea = All;
                    Caption = 'Probation Report';
                    ToolTip = 'Specifies the value of the Probation Report field.';
                }

            }
            cuegroup(Leave)
            {
                field("Staff on Leave Count"; Rec."Staff on Leave Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff on Leave Count field.';
                }
            }

        }

    }



    trigger OnOpenPage();
    begin

        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}




