#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193527 "PR Header Salary Card - ALL"
{
    // strempcode,dtDOE,curbasicpay,blnpaye,blnnssf,blnnhif,selectedperio,dtopenperio,
    // membership,referenceno,dttermination,blngetspayereleif

    Caption = 'Salary Card';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Bank &Job Details,Bank &Job Details,Job &Bank Details,Bank &Job Details,Bank &Job Details,Bank/Job Details';
    SourceTable = "HR Employees";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group("Employee Details")
            {
                Caption = 'Employee Details';
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the NSSF No. field.';
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the NHIF No. field.';
                }
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PWD field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Type field.';
                }
                field("Stop Pay"; Rec."Stop Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stop Pay field.';
                }
                field(Status; Rec.Status)
                {
                    AccessByPermission = tabledata "PR Salary Card" = RIMD;
                    ApplicationArea = Basic;
                    Caption = 'Employment Status';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Employment Status field.';
                }
            }
            part(PaymentInfo; "PR Salary Information")
            {
                Caption = 'Payment Information';
                ShowFilter = true;
                SubPageLink = "Employee Code" = field("No.");
            }
            group(Posting)
            {
                Caption = 'Posting';
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(ActionGroup5) { }
            action("Current Bank Account")
            {
                ApplicationArea = Basic;
                Caption = 'Current Bank Account';
                Image = BankAccount;
                Promoted = true;
                PromotedCategory = Category11;
                RunObject = page "HR Bank Accounts List";
                RunPageLink = "Employee Code" = field("No.");
                RunPageMode = View;
                ToolTip = 'Executes the Current Bank Account action.';
            }
            action("Historical  Bank Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Historical  Bank Accounts';
                Image = BankAccount;
                Promoted = true;
                PromotedCategory = Category11;
                RunObject = page "Historical  Bank Accounts List";
                RunPageLink = "Employee Code" = field("No.");
                RunPageMode = View;
                ToolTip = 'Executes the Historical  Bank Accounts action.';
            }
            action("Current Job Information")
            {
                ApplicationArea = Basic;
                Caption = 'Current Job Information';
                Image = BankAccount;
                Promoted = true;
                PromotedCategory = Category11;
                RunObject = page "HR Employee Infor Change";
                RunPageLink = "No." = field("No.");
                RunPageMode = View;
                ToolTip = 'Executes the Current Job Information action.';
            }
            action("Historical Job Information")
            {
                ApplicationArea = Basic;
                Caption = ' Historical Job Information';
                Image = BankAccount;
                Promoted = true;
                PromotedCategory = Category11;
                RunObject = page "Historical Employee Changes";
                RunPageLink = "No." = field("No.");
                RunPageMode = View;
                ToolTip = 'Executes the  Historical Job Information action.';
            }
        }
    }

    trigger OnInit()
    begin

        objPeriod.Reset();
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            SelectedPeriod := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
            PeriodMonth := objPeriod."Period Month";
            PeriodYear := objPeriod."Period Year";
        end;
    end;

    var
        objEmp: Record "HR Employees";
        SalCard: Record "PR Salary Card";
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        HrEmployee: Record "HR Employees";
        ProgressWindow: Dialog;
        HREmpPR: Record "HR Employees";
}
