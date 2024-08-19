#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193528 "PR Salary Information"
{
    AutoSplitKey = false;
    Caption = 'Payment Information';
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = ListPart;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "PR Salary Card";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater("Payment Info")
            {
                Caption = 'Payment Info';
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Half Basic Pay?"; Rec."Half Basic Pay?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Half Basic Pay? field.';
                }
                field("1/3 Basic"; Rec."1/3 Basic")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 1/3 Basic field.';
                }
                field("Days Worked"; Rec."Days Worked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Worked field.';
                }
                field("Rate Per Day"; Rec."Rate Per Day")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate Per Day field.';
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Mode field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field("Pays NSSF"; Rec."Pays NSSF")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays NSSF field.';
                }
                field("Pays NHIF"; Rec."Pays NHIF")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays NHIF field.';
                }
                field("Pays PAYE"; Rec."Pays PAYE")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays PAYE field.';
                }
                field("Disable Personal Relief?"; Rec."Disable Personal Relief?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disable Personal Relief? field.';
                }
                field("Insurance Certificate?"; Rec."Insurance Certificate?")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Relief';
                    ToolTip = 'Specifies the value of the Insurance Relief field.';
                }
                field("Gratuity Amount"; Rec."Gratuity Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gratuity Amount field.';
                }
                field("Suspend Pay"; Rec."Suspend Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Suspend Pay field.';
                    trigger OnValidate()
                    begin

                        if Rec."Suspend Pay" = true then begin
                            Question := 'Suspending means the staff will NOT be paid for [' + PeriodName + '].';
                            Question := Question + '\If any transactions had been posted for [' + PeriodName + '], the system will delete them.\';
                            Question := Question + '\Do you wish to suspend the pay for the staff?';
                            Answer := Dialog.Confirm(Question, false);
                            if Answer = false then begin
                                Rec."Suspend Pay" := false;
                                Rec."Suspension Reasons" := '';
                                Rec."Suspension Date" := Today;
                            end;

                            if Answer = true then begin
                                PeriodTrans.Reset();
                                PeriodTrans.SetRange(PeriodTrans."Employee Code", Rec."Employee Code");
                                PeriodTrans.SetRange(PeriodTrans."Payroll Period", CurrentMonth);
                                PeriodTrans.DeleteAll();
                            end;
                        end;

                        if Rec."Suspend Pay" = false then
                            Rec."Suspension Reasons" := '';
                    end;
                }
                field("Suspension Date"; Rec."Suspension Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Suspension Date field.';
                }
                field("Suspension Reasons"; Rec."Suspension Reasons")
                {
                    ApplicationArea = Basic;
                    MultiLine = false;
                    ToolTip = 'Specifies the value of the Suspension Reasons field.';
                }
                field("Cumm BasicPay"; Rec."Cumm BasicPay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumm BasicPay field.';
                }
                field("Cumm GrossPay"; Rec."Cumm GrossPay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm GrossPay field.';
                }
                field("Cumm NetPay"; Rec."Cumm NetPay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm NetPay field.';
                }
                field("Cumm Allowances"; Rec."Cumm Allowances")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm Allowances field.';
                }
                field("Cumm Deductions"; Rec."Cumm Deductions")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumm Deductions field.';
                }
                field("Cumm PAYE"; Rec."Cumm PAYE")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumm PAYE field.';
                }
                field("Cumm NSSF"; Rec."Cumm NSSF")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumm NSSF field.';
                }
                field("Cumm Pension"; Rec."Cumm Pension")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumm Pension field.';
                }
                field("Cumm HELB"; Rec."Cumm HELB")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumm HELB field.';
                }
                field("Cumm NHIF"; Rec."Cumm NHIF")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cumm NHIF field.';
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
        Qtn: Label '''Leave without saving changes?''';
        Question: Text[200];
        Answer: Boolean;
        objPeriod: Record "PR Payroll Periods";
        CurrentMonth: Date;
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
}
