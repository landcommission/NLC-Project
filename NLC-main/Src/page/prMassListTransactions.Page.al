#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193538 "prMassList Transactions"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "PR Transaction Codes";
    SourceTableView = where("Transaction Type" = filter(Deduction));
    ApplicationArea = All;
    Caption = 'prMassList Transactions';
    layout
    {
        area(Content)
        {
            field("Transaction Code"; Rec."Transaction Code")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Transaction Code field.';
            }
            field("Transaction Name"; Rec."Transaction Name")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Transaction Name field.';
            }
            part(Control1000000002; "prmassList Translines")
            {
                SubPageLink = "Transaction Code" = field("Transaction Code");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Load Employees")
            {
                ApplicationArea = Basic;
                Caption = 'Load Employees';
                Image = CalculateRegenerativePlan;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Load Employees action.';
            }
        }
    }

    var
        objTransCodes: Record "PR Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        objEmpTrans: Record "PR Employee Transactions";
        transType: Text[30];
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
        Employee: Record "PR Salary Arrears22";
        SalaryCard: Record "PR Salary Card";
        "Period Amount": Decimal;
        "Period Balance": Decimal;
        objEmp: Record "PR Salary Arrears22";
        Names: Text;
}
