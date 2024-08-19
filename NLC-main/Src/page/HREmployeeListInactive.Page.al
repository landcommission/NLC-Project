#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193764 "HR Employee List (Inactive)"
{
    CardPageId = "HR Employee Card";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Employee';
    SourceTable = "HR Employees";
    SourceTableView = where(Status = filter(Inactive));
    ApplicationArea = All;
    Caption = 'HR Employee List (Inactive)';
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
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("No. of Employees"; Rec."No. of Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Employees field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Commisioner?"; Rec."Commisioner?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commisioner? field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company E-Mail field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("Exist IN User Setup"; Rec."Exist IN User Setup")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exist IN User Setup field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755003; Outlook) { }
        }
    }

    actions { }

    var
        HREmp: Record "HR Employees";
        EmployeeFullName: Text;
}
