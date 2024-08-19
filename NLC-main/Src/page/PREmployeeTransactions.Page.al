#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193529 "PR Employee Transactions"
{
    Caption = 'Transaction List';
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "PR Employee Transactions";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                    trigger OnValidate()
                    begin
                        blnIsLoan := false;

                        if PRTransactionCodes.Get(Rec."Transaction Code") then
                            Rec."Transaction Name" := PRTransactionCodes."Transaction Name";
                        Rec."Sacco loan" := PRTransactionCodes."IsCoop/LnRep";

                        Rec."Payroll Period" := SelectedPeriod;
                        Rec."Period Month" := PeriodMonth;
                        Rec."Period Year" := PeriodYear;

                        if PRTransactionCodes."Special Transactions" = 8 then
                            blnIsLoan := true;

                        if PRTransactionCodes."Is Formula" = true then begin
                            empCode := Rec."Employee Code";
                            //CLEAR(objOcx);
                            // curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,PRTransactionCodes.Formula);
                            Rec.Amount := curTransAmount;
                        end;

                        //*************ENTER IF EMPLOYER DEDUCTION IS SET UP
                        curTransAmount := 0;

                        if PRTransactionCodes."Include Employer Deduction" = true then
                            //  curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,PRTransactionCodes."Is Formula for employer");
                            Rec."Employer Amount" := curTransAmount;


                        //  ******************* FOR NIB MWEA *****************************************

                        //  **************************************************************************
                    end;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
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
                field(Stopped; Rec.Stopped)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stopped field.';
                }
                field("Sacco loan"; Rec."Sacco loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sacco loan field.';
                }
                field("Sacco share"; Rec."Sacco share")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sacco share field.';
                }
                field("Sacco Loan Interest"; Rec."Sacco Loan Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sacco Loan Interest field.';
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
                field("Original Amount"; Rec."Original Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Amount field.';
                }
                field("Loan Number"; Rec."Loan Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Number field.';
                }
                field("#of Repayments"; Rec."#of Repayments")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    ToolTip = 'Specifies the value of the Amortized Loan Total Repay Amt field.';
                }
                field(Membership; Rec.Membership)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership field.';
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
                field(Subledger; Rec.Subledger)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subledger field.';
                }
                field("Subledger Account"; Rec."Subledger Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subledger Account field.';
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
        Rec.SetFilter(Rec."Payroll Period", Format(objPeriod."Date Opened"));
        //objPeriod.SETFILTER(objPeriod.Closed,'FALSE');
    end;

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Rec."Payroll Period", Format(objPeriod."Date Opened"));
    end;

    var
        PRTransactionCodes: Record "PR Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        blnIsLoan: Boolean;
        transType: Text[30];
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
        PREmployeeTrans: Record "prEmployee Banks";
        i: Integer;
        HREmp: Record "HR Employees";
    //[RunOnClient]
    //MyValue: dotnet Interaction;
}
