#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193554 "PR Salary List (Casuals)"
{
    CardPageId = "PR Salary Card Casual";
    PageType = List;
    SourceTable = "HR Employees";
    ApplicationArea = All;
    Caption = 'PR Salary List (Casuals)';
    layout
    {
        area(Content)
        {
            repeater(Control12)
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
            }
        }
        area(FactBoxes)
        {
            part(Control2; "HR Employees Factbox")
            {
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1; Outlook) { }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
          FILTERGROUP(0);
        END;
        */

        UserSetup.Get(UserId);
        Rec.SetRange("Payroll Code", UserSetup."Payroll Code");

    end;

    var
        objEmp: Record "HR Employees";
        SalCard: Record "prSalary Card Casual";
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        HrEmployee: Record "HR Employees";
        Employee: Record "HR Employees";
        ProgressWindow: Dialog;
        prPeriodTransactions: Record "PR Period Transactions";
        prEmployerDeductions: Record "PR Employer Deductions";
        PayrollType: Record "prPayroll Type";
        Selection: Integer;
        PayrollDefined: Text[30];
        PayrollCode: Code[10];
        NoofRecords: Integer;
        i: Integer;
        ContrInfo: Record "Control-Information";
        DepName: Text[200];
        DValues: Record "Dimension Value";
        VitalInfo: Record "PR Vital Setup Info";
        UserSetup: Record "User Setup";
        User: Code[100];
        //Text000: ;
        NormalHrs: Decimal;
        OvertimeHrs: Decimal;
        PHSWkndHrs: Decimal;
        TotalPay: Decimal;
        CasualSetup: Record "PrCasual Payroll Setup";
}

