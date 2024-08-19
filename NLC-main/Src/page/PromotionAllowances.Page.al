#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50046 "Promotion Allowances"
{
    ApplicationArea = All;
    Caption = 'Promotion Allowances';
    PageType = ListPart;
    SourceTable = "HR Promo. Recommend Lines";
    UsageCategory = None;
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("County Name"; "County Name")
                {
                    ApplicationArea = all;
                    Caption = 'Workstation Name';
                    Editable = false;
                }
                field("Job Title"; "Job Title")
                {
                    ApplicationArea = all;
                    Caption = 'Designation';
                    Editable = false;
                    Visible = false;
                }
                field("New Global Dimension 2 Code"; Rec."New Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Directorate Code';
                    ToolTip = 'Specifies the value of the New Directorate Code field.';
                    Visible = false;
                }
                field("New Job ID"; Rec."New Job ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'New Designation Code';
                    ToolTip = 'Specifies the value of the New Job ID field.';
                }
                field("Transaction Code"; "Transaction Code")
                {
                    ApplicationArea = all;
                }
                field("Transaction Name"; "Transaction Name")
                {
                    ApplicationArea = all;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = all;
                }
                field("From payroll Period"; Rec."From payroll Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Period';
                    ToolTip = 'Specifies the value of the From payroll Period field.';
                }

                field("Promotion Criteria"; Rec."Promotion Criteria")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Promotion Criteria field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions { }
}

