#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193539 "prmassList Translines"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = ListPart;
    SourceTable = "PR Employee Transactions";
    ApplicationArea = All;
    Caption = 'prmassList Translines';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';

                }
                field(Names; Names)
                {
                    ApplicationArea = Basic;
                    Caption = 'Names';
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';

                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field("No of Units"; Rec."No of Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Units field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                    trigger OnValidate()
                    begin
                        if (blnIsLoan = true) and (Rec.Balance > 0) and (Rec.Amount > 0) then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                    trigger OnValidate()
                    begin
                        if (blnIsLoan = true) and (Rec.Balance > 0) and (Rec.Amount > 0) then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }
                field("#of Repayments"; Rec."#of Repayments")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the #of Repayments field.';
                    trigger OnValidate()
                    begin
                        if blnIsLoan = true then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }
                field("Amortized Loan Total Repay Amt"; Rec."Amortized Loan Total Repay Amt")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amortized Loan Total Repay Amt field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field(Membership; Rec.Membership)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership field.';
                }
                field("Loan Number"; Rec."Loan Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Number field.';
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Suspended; Rec.Suspended)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Suspended field.';
                }
                field("Stop for Next Period"; Rec."Stop for Next Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stop for Next Period field.';
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer Amount field.';
                }
                field("Employer Balance"; Rec."Employer Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer Balance field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        Names := '';
        Employee.Reset();
        Employee.SetRange(Employee."Employeee Code", Rec."Employee Code");
        if Employee.Find('-') then;
        ////Names:=Employee."Payroll Period"+' '+Employee."Employeee Code"+' '+Employee.Amount;
    end;

    trigger OnInit()
    begin

        objPeriod.Reset();
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            SelectedPeriod := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
            PeriodMonth := objPeriod."Period Month";
            PeriodYear := objPeriod."Period Year";
            //objEmpTrans.RESET;
            //objEmpTrans.SETRANGE("Payroll Period",SelectedPeriod);
        end;

        //Filter per period  - Dennis
        Rec.SetFilter(Rec."Payroll Period", Format(objPeriod."Date Opened"));
    end;

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Rec."Payroll Period", Format(objPeriod."Date Opened"));
    end;

    var
        objTransCodes: Record "PR Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        blnIsLoan: Boolean;
        objEmpTrans: Record "PR Employee Transactions";
        transType: Text[30];
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
        Employee: Record "PR Salary Arrears22";
        EmpTrans: Record "PR Employee Transactions";
        VitalSetUp: Record "PR Vital Setup Info";
        SalaryCard: Record "PR Salary Card";
        TotalEarnings: Decimal;
        ArreasAmount: Decimal;
        ArrearsDays: Integer;
        NoOfMonthDays: Integer;
        i: Integer;
        RemainingDays: Integer;
        TDate: Date;
        Names: Text;
}
