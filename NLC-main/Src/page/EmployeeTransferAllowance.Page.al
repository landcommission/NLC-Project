#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193582 "Employee Transfer Allowance"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "HR Employee Transfer Lines";
    //SourceTableView = where("Employee No" = const('<>'''''));
    ApplicationArea = All;
    Caption = 'Employee Transfer Allowance';
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
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("HardShip Code"; "HardShip Code")
                {
                    ApplicationArea = all;
                    Caption = 'Hardship T Code';
                }
                field("HardShip TransName"; "HardShip TransName")
                {
                    ApplicationArea = all;
                }
                field("Hardship Amount"; "Hardship Amount")
                {
                    ApplicationArea = all;
                }
                field("From payroll Period"; Rec."From payroll Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'payroll Period';
                    ToolTip = 'Specifies the value of the From payroll Period field.';
                }
                field("To Payroll Period"; Rec."To Payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the To Payroll Period field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
            }
        }
    }

    actions { }
}
