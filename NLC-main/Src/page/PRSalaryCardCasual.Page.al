#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193553 "PR Salary Card Casual"
{
    // strempcode,dtDOE,curbasicpay,blnpaye,blnnssf,blnnhif,selectedperio,dtopenperio,
    // membership,referenceno,dttermination,blngetspayereleif

    Editable = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Navigate,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "HR Employees";
    ApplicationArea = All;
    Caption = 'PR Salary Card Casual';
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Mode field.';
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date Of Join field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Full / Part Time field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Employee Classification"; Rec."Employee Classification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Classification field.';
                }
                field("Main Bank"; Rec."Main Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Bank field.';
                }
                field("Branch Bank"; Rec."Branch Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Bank field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'ID Number';
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'PIN No.';
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF No. field.';
                }
                field("Hr Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Group';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
            }
            part(Control7; "PR Salary Info Casual")
            {
                Caption = 'Basic Pay';
                SubPageLink = "Employee Code" = field("No.");
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        DepName := '';
        DValues.Reset();
        DValues.SetRange(DValues.Code, Rec.County);
        if DValues.Find('-') then
            DepName := DValues.Name;
    end;

    trigger OnInit()
    begin
        PayrollCode := '';

        USetup.Reset();
        USetup.SetRange(USetup."User ID", UserId);
        if USetup.Find('-') then
            PayrollCode := USetup."Payroll Code";

        Rec.SetFilter(Rec."Payroll Code", PayrollCode);

        objPeriod.Reset();
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            SelectedPeriod := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
            PeriodMonth := objPeriod."Period Month";
            PeriodYear := objPeriod."Period Year";
        end;
    end;

    trigger OnOpenPage()
    begin
        CurrPage.Editable := true;
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
        USetup: Record "User Setup";
        NormalHrs: Decimal;
        OvertimeHrs: Decimal;
        PHSWkndHrs: Decimal;
        TotalPay: Decimal;
        CasualSetup: Record "PrCasual Payroll Setup";
}
