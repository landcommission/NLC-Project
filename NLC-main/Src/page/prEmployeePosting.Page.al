#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193543 prEmployeePosting
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "prEmployee Posting Group";
    UsageCategory = Lists;
    Caption = 'prEmployeePosting';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Salary Account"; Rec."Salary Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Account field.';
                }
                field("Income Tax Account"; Rec."Income Tax Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Income Tax Account field.';
                }
                field("SSF Employer Account"; Rec."SSF Employer Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SSF Employer Account field.';
                }
                field("SSF Employee Account"; Rec."SSF Employee Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SSF Employee Account field.';
                }
                field("Net Salary Payable"; Rec."Net Salary Payable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Salary Payable field.';
                }
                field("Operating Overtime"; Rec."Operating Overtime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Operating Overtime field.';
                }
                field("Tax Relief"; Rec."Tax Relief")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Relief field.';
                }
                field("Employee Provident Fund Acc."; Rec."Employee Provident Fund Acc.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Provident Fund Acc. field.';
                }
                field("Pay Period Filter"; Rec."Pay Period Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Period Filter field.';
                }
                field("Pension Employer Acc"; Rec."Pension Employer Acc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Employer Acc field.';
                }
                field("Pension Employee Acc"; Rec."Pension Employee Acc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Employee Acc field.';
                }
                field("Earnings and deductions"; Rec."Earnings and deductions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earnings and deductions field.';
                }
                field("Staff Benevolent"; Rec."Staff Benevolent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Benevolent field.';
                }
                field(SalaryExpenseAC; Rec.SalaryExpenseAC)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SalaryExpenseAC field.';
                }
                field(DirectorsFeeGL; Rec.DirectorsFeeGL)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DirectorsFeeGL field.';
                }
                field(StaffGratuity; Rec.StaffGratuity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the StaffGratuity field.';
                }
                field("NHIF Employee Account"; Rec."NHIF Employee Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF Employee Account field.';
                }
                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Code field.';
                }
                field("Upload to Payroll"; Rec."Upload to Payroll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upload to Payroll field.';
                }
            }
        }
    }

    actions { }
}
