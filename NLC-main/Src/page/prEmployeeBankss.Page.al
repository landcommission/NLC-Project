#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193941 "prEmployee Bankss"
{
    PageType = List;
    SourceTable = "Employee Bankss";
    ApplicationArea = All;
    Caption = 'prEmployee Bankss';
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
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                    trigger OnValidate()
                    begin
                        //blnIsLoan:=FALSE;
                        //IF objTransCodes.GET("Transaction Code") THEN
                        // "Transaction Name":=objTransCodes."Transaction Name";
                        Rec."Payroll Period" := SelectedPeriod;
                        //"Period Month":=PeriodMonth;
                        //"Period Year":=PeriodYear;
                    end;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = feditable;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = feditable;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Salary Percentage"; Rec."Salary Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Percentage field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    Editable = feditable;
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
        objPeriod.SetFilter(objPeriod."Date Opened", '<>%1', 0D);
        if objPeriod.Find('-') then
            SelectedPeriod := objPeriod."Date Opened";
        /*PeriodName:=objPeriod."Period Name";
        PeriodMonth:=objPeriod."Period Month";
        PeriodYear:=objPeriod."Period Year";  */
        //objEmpTrans.RESET;
        //objEmpTrans.SETRANGE("Payroll Period",SelectedPeriod);

        //Filter per period  - Dennis
        Rec.SetFilter(Rec."Payroll Period", Format(objPeriod."Date Opened"));
        feditable := false;

    end;

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Rec."Payroll Period", Format(objPeriod."Date Opened"));
    end;

    var
        objPeriod: Record "PR Payroll Periods";
        feditable: Boolean;
        SelectedPeriod: Date;
}
