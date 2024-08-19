#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193552 "PR Salary Info Casual"
{
    PageType = CardPart;
    SourceTable = "prSalary Card Casual";
    ApplicationArea = All;
    Caption = 'PR Salary Info Casual';
    layout
    {
        area(Content)
        {
            repeater("Payment Info")
            {
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Hours Worked"; Rec."Hours Worked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hours Worked field.';
                }
                field("Overtime Hours"; Rec."Overtime Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Hours field.';
                }
                field("Public Holidays&Weekend Hours"; Rec."Public Holidays&Weekend Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Public Holidays&Weekend Hours field.';
                }
                field("Non Taxable"; Rec."Non Taxable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non Taxable field.';
                }
                field("Pays PAYE"; Rec."Pays PAYE")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays PAYE field.';
                }
                field("Pays NHIF"; Rec."Pays NHIF")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays NHIF field.';
                }
                field("Pays NSSF"; Rec."Pays NSSF")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays NSSF field.';
                }
                field("Cumm BasicPay"; Rec."Cumm BasicPay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm BasicPay field.';
                }
                field("Cumm GrossPay"; Rec."Cumm GrossPay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm GrossPay field.';
                }
                field("Cumm Allowances"; Rec."Cumm Allowances")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm Allowances field.';
                }
                field("Cumm PAYE"; Rec."Cumm PAYE")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm PAYE field.';
                }
                field("Cumm Deductions"; Rec."Cumm Deductions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm Deductions field.';
                }
                field("Cumm NetPay"; Rec."Cumm NetPay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm NetPay field.';
                }
                field("Suspend Pay"; Rec."Suspend Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Suspend Pay field.';
                }
                field("Suspension Date"; Rec."Suspension Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Suspension Date field.';
                }
                field("Suspension Reasons"; Rec."Suspension Reasons")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Suspension Reasons field.';
                }
            }
        }
    }

    actions { }

    trigger OnInit()
    begin
        //Get the open period
        objPeriod.Reset();
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            CurrentMonth := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
        end;
    end;


    var
        BasicSalary: Decimal;
        Question: Text[200];
        Answer: Boolean;
        objPeriod: Record "PR Payroll Periods";
        CurrentMonth: Date;
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
}
