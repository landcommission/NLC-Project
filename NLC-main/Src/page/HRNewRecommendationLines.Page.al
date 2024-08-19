#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA02HREmployeeInfo 06, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194014 "HR New Recommendation Lines"
{
    PageType = ListPart;
    SourceTable = "HR Promo. Recommend Lines";
    ApplicationArea = All;
    Caption = 'HR New Recommendation Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Salary Grade"; "Salary Grade")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the value of slary grade';
                }
                field(Worstation; Rec."New Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Worstation';
                    Editable = false;
                    ToolTip = 'Specifies the value of the New County Code field.';
                }
                field("County Name"; "County Name")
                {
                    ApplicationArea = all;
                    Caption = 'Workstation Name';
                    Editable = false;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = all;
                    Caption = 'Designation Code';
                    Editable = false;
                }
                field("Job Title"; "Job Title")
                {
                    ApplicationArea = all;
                    Caption = 'Designation';
                    Editable = false;
                }
                field("New Global Dimension 2 Code"; Rec."New Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Directorate Code';
                    ToolTip = 'Specifies the value of the New Directorate Code field.';
                    Visible = false;
                }
                field("Directorate Name"; "Directorate Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }
                field("New Responsibility Center"; Rec."New Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the New Responsibility Center field.';
                }
                field("New Job ID"; Rec."New Job ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Designation Code';
                    ToolTip = 'Specifies the value of the New Job ID field.';
                }
                field("New Job Title"; Rec."New Job Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Designation';
                    ToolTip = 'Specifies the value of the New Job Title field.';
                }
                field("New Salary Grade"; Rec."New Salary Grade")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the New Salary Grade field.';
                }
                field("From payroll Period"; Rec."From payroll Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Period';
                    ToolTip = 'Specifies the value of the From payroll Period field.';
                }
                field("Effective Date Of Transfer"; "Effective Date Of Transfer")
                {
                    ApplicationArea = all;
                    Caption = 'Effective Date';
                }
                field("To Payroll Period"; Rec."To Payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the To Payroll Period field.';
                }
                field("Promotion Criteria"; Rec."Promotion Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Promotion Criteria field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions { }
}
