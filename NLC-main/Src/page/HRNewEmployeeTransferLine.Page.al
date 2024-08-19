#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194015 "HR New Employee Transfer Line"
{
    PageType = ListPart;
    SourceTable = "HR Employee Transfer Lines";
    ApplicationArea = All;
    Caption = 'HR New Employee Transfer Line';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Request No"; Rec."Request No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Request No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("New Grade"; Rec."New Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Grade field.';
                }
                field("New Designation"; Rec."New Designation")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Job ID';
                    ToolTip = 'Specifies the value of the New Job ID field.';
                }
                field("New Job ID Name"; Rec."New Job ID Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Job ID Name field.';
                }
                field("New Global Dimension 1 Code"; Rec."New Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'New County Code';
                    ToolTip = 'Specifies the value of the New County Code field.';
                }
                field("New Region Name"; Rec."New Region Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'New County Name';
                    Visible = true;
                    ToolTip = 'Specifies the value of the New County Name field.';
                }
                field("New Global Dimension 2 Code"; Rec."New Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = ' New Directorate Code';
                    ToolTip = 'Specifies the value of the  New Directorate Code field.';
                }
                field("New Directorate Name"; Rec."New Directorate Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the New Directorate Name field.';
                }
                field("New Responsibility Center"; Rec."New Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Responsibility Center field.';
                }
                field("From payroll Period"; Rec."From payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From payroll Period field.';
                }
                field("To Payroll Period"; Rec."To Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Payroll Period field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field("Date Of Transfer"; Rec."Date Of Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Transfer field.';
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
