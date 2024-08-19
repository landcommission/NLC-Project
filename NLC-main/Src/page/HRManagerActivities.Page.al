#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69077 "HR Manager Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            cuegroup("Employees By Category")
            {
                Caption = 'Employees By Category';
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "HR Employee List (ALL)";
                    ToolTip = 'Specifies the value of the Active Employees field.';
                }
                field("Inactive Employees"; Rec."Inactive Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "HR Employee List (Inactive)";
                    ToolTip = 'Specifies the value of the Inactive Employees field.';
                }
                field("Suspended Employees"; Rec."Suspended Employees")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Suspended Employees field.';
                }
                field("Seconded Employees"; Rec."Seconded Employees")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Seconded Employees field.';
                }
                field("Terminated Employees"; Rec."Terminated Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "HR Employee List (ALL)";
                    ToolTip = 'Specifies the value of the Terminated Employees field.';
                }
                field("Retired Employees"; Rec."Retired Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retired Employees field.';
                }
                field("Disciplinary Employees"; Rec."Disciplinary Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Employees field.';
                }

                actions
                {
                    action("New Employee")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Employee';
                        RunObject = page "HR Employee List (ALL)-New";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Employee action.';
                    }
                }
            }
            cuegroup("Employee Leave Applications")
            {
                Caption = 'Employee Leave Applications';
                field("Leave Application-Approved"; Rec."Leave Application-Approved")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "HR Leave Applications List";
                    LookupPageId = "HR Leave Applications List";
                    ToolTip = 'Specifies the value of the Leave Application-Approved field.';
                }
                field("Leave Application-Inprocess"; Rec."Leave Application-Inprocess")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Application-Inprocess field.';
                }
                // field("Posted Approved Leave"; "Posted Approved Leave")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Posted Leave Applications";
                //     ToolTip = 'Specifies the value of the Posted Approved Leave field.';
                // }
            }
            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                Visible = false;
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Requests to Approve";
                    ToolTip = 'Specifies the value of the Requests to Approve-Overdue field.';
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Approval Entries";
                    ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                }
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
