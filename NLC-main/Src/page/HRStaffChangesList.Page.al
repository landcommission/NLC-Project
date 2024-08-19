#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 50041 "Hr Staff Changes List"
{
    ApplicationArea = Basic;
    Caption = 'HR Employee List (ALL) - Approved';
    CardPageId = "HR Staff Changes";
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Employee';
    SourceTable = "HR Employee Staff Changes";
    //SourceTableView = where(Status = filter(Active));
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }

                field("County Name"; Rec."County Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation Name field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("Date of Current Employment"; Rec."Date of Current Employment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Current Employment field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Current Duty Station"; Rec."Current Duty Station")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allocated Leave Days field.';
                }
                field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days Carried Forward';
                    ToolTip = 'Specifies the value of the Leave Days Carried Forward field.';
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Total Leave Taken field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(DPension; Rec.DPension)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DPension field.';
                }
                field("Retirement date"; Rec."Retirement date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement date field.';
                }
                field(Ethnicity; Rec.Ethnicity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnicity field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }

            }
        }
        area(FactBoxes) { }
    }


    trigger OnAfterGetRecord()
    begin

        //if (Rec."Date Of Birth" <> 0D) then
        //  Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);



        //if Rec."Retirement date" <> 0D then
        // Rec.DPension := Dates.DetermineAge(Today, Rec."Retirement date");
    end;


    var
        HREmp: Record "HR Employees";
        EmployeeFullName: Text;
        PRSalCard: Record "PR Salary Card";
}

#pragma implicitwith restore


