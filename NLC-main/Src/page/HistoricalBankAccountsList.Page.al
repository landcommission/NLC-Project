#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194159 "Historical  Bank Accounts List"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Employee Bank Accounts History";
    ApplicationArea = All;
    Caption = 'Historical  Bank Accounts List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                Caption = 'Current Bank Details';
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Bank  Code"; Rec."Bank  Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank  Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("A/C  Number"; Rec."A/C  Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the A/C  Number field.';
                }
                field("From payroll Period"; Rec."From payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From payroll Period field.';
                }
                field("Percentage to Transfer"; Rec."Percentage to Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage to Transfer field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("No Payroll Period"; Rec."No Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No Payroll Period field.';
                }
            }
            group("Bank Accounts HistoryA")
            {
                Caption = 'Bank Accounts HistoryA';
                Visible = false;
                field("Show On Payslip"; Rec."Show On Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = 'Show On Payslip?';
                    ToolTip = 'Specifies the value of the Show On Payslip? field.';
                }
                field("Previous Bank  Code"; Rec."Previous Bank  Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Bank  Code field.';
                }
                field("Previous Bank Name"; Rec."Previous Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Bank Name field.';
                }
                field("Previous Branch Code"; Rec."Previous Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Branch Code field.';
                }
                field("Previous Branch Name"; Rec."Previous Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Branch Name field.';
                }
                field("Previous A/C  Number"; Rec."Previous A/C  Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous A/C  Number field.';
                }
                field("Previous Percentage to transfe"; Rec."Previous Percentage to transfe")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Percentage to transfer';
                    ToolTip = 'Specifies the value of the Previous Percentage to transfer field.';
                }
                field("To Payroll Period"; Rec."To Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Payroll Period field.';
                }
            }
            group("Bank Accounts HistoryB")
            {
                Caption = 'Bank Accounts HistoryB';
                Visible = false;
                field("Previous Bank  Code1"; Rec."Previous Bank  Code1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Bank  Code1 field.';
                }
                field("Previous Bank Name1"; Rec."Previous Bank Name1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Bank Name1 field.';
                }
                field("Previous Branch Code1"; Rec."Previous Branch Code1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Branch Code1 field.';
                }
                field("Previous Branch Name1"; Rec."Previous Branch Name1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Branch Name1 field.';
                }
                field("Previous Percentage to transf1"; Rec."Previous Percentage to transf1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Percentage to transf1 field.';
                }
                field("From payroll Period1"; Rec."From payroll Period1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From payroll Period1 field.';
                }
                field("To Payroll Period1"; Rec."To Payroll Period1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Payroll Period1 field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control10; Outlook) { }
            systempart(Control11; Notes) { }
        }
    }

    actions { }
}
