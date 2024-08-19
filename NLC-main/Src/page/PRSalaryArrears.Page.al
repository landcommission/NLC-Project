#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193540 "PR Salary Arrears"
{
    PageType = List;
    SourceTable = "PR Salary Arrears";
    ApplicationArea = All;
    Caption = 'PR Salary Arrears';
    layout
    {
        area(Content)
        {
            repeater(Control1102756000)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
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
                field("Is Basic Salary Arrears"; Rec."Is Basic Salary Arrears")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Basic Salary Arrears field.';
                }
                field("Is Allowance Arrears"; Rec."Is Allowance Arrears")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Allowance Arrears field.';
                }
                field("Arrears Payroll Period"; Rec."Arrears Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arrears Payroll Period field.';
                }
                field("Current Payroll Period"; Rec."Current Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Payroll Period field.';
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
            }
        }
    }

    actions { }
}
