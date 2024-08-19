#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193446 "HR Employee Kin"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SaveValues = true;
    SourceTable = "HR Employees";
    ApplicationArea = All;
    Caption = 'HR Employee Kin';
    layout
    {
        area(Content)
        {
            group("Employee Details")
            {
                Caption = 'Employee Details';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(FullName; Rec.FullName())
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    StyleExpr = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
            }
            part(Control1102755008; "HR Employee Kin SF")
            {
                SubPageLink = "Employee Code" = field("No.");
            }
        }
        area(FactBoxes)
        {
            part(Control1102755004; "HR Employees Factbox")
            {
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1102755002; Outlook) { }
        }
    }

    actions { }

    var
        D: Date;
        EmpNames: Text[30];
        HREmp: Record "HR Employees";
        Text19032351: Label 'Next Of Kin/Beneficiaries';
}
