#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193530 "prSalary Ledger"
{
    PageType = List;
    SourceTable = "prEmployee Salary Ledger";
    ApplicationArea = All;
    Caption = 'prSalary Ledger';
    layout
    {
        area(Content)
        {
            repeater(Group)
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
                field("Transaction Name 2"; Rec."Transaction Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name 2 field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Original Amount"; Rec."Original Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Amount field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
            }
        }
    }

    actions { }

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
        Rec.SetFilter(Rec."Period Year", Format(objPeriod."Date Opened"));
    end;

    var
        objTransCodes: Record "PR Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
}
