#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194189 "PR Salary List - Secondary"
{
    CardPageId = "PR Header Salary Card - ALL";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "HR Employees";
    SourceTableView = where(Status = const(Active),
                            "Employee Type" = const(Deployed));
    ApplicationArea = All;
    Caption = 'PR Salary List - Secondary';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Status';
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Employment Status field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin
        if UserId <> 'NLC\CORETEC' then
            Error('You are not authorized to access this page');
    end;

    var
        PRSalaryCard: Record "PR Salary Card";
        PRPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        HREmployeePR: Record "HR Employees";
        ProgressWindow: Dialog;
        PREmployeeTrans: Record "PR Employee Transactions";
        HREMP: Record "HR Employees";
        i: Integer;
        PRPeriodT: Record "PR Period Transactions";
        PRTransCodes: Record "PR Transaction Codes";
        PrevPayrollPeriod: Date;
        LoanStatus: Option " ","Fully Paid","Partly Paid";
        LoanTransCode: Code[10];
        InterestTransCode: Code[10];
        PREmployeeTrans_2: Record "PR Employee Transactions";
        PREmployeeTrans_3: Record "PR Employee Transactions";
        PREmployeeTrans_4: Record "PR Employee Transactions";
        PRTransCodes_2: Record "PR Transaction Codes";
        LoanTransCode_2: Code[10];
        InterestTransCode_2: Code[10];
        ApprovalEntry: Record "Approval Entry";
}
