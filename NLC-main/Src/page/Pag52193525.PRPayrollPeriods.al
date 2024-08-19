#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193525 "PR Payroll Periods"
{
    ApplicationArea = Basic;
    Editable = true;
    PageType = List;
    SourceTable = "PR Payroll Periods";
    UsageCategory = Lists;
    Caption = 'PR Payroll Periods';
    PromotedActionCategories = 'New,Process,Report,Allow Proration';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field("Period Name"; Rec."Period Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Name field.';
                }
                field("Date Opened"; Rec."Date Opened")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Opened field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field(Control3; Rec."Variance Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variance Report field.';
                }
                field(Prorated; Rec.Prorated)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prorated field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Close Period")
            {
                ApplicationArea = Basic;
                Caption = 'Close Period';
                Image = ClosePeriod;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Close Period action.';
                trigger OnAction()
                begin
                    /*
                    Warn user about the consequence of closure - operation is not reversible.
                    Ask if he is sure about the closure.
                    */



                    UserSetup.Reset();
                    UserSetup.SetRange(UserSetup."User ID", UserId);
                    if UserSetup.Find('-') then
                        UserSetup.TestField(UserSetup."Close Payroll Period", true);

                    fnGetOpenPeriod();

                    Question := 'Once a period has been closed it can NOT be opened.\It is assumed that you have PAID out salaries.\'
                    + 'Do still want to close [' + strPeriodName + ']';

                    Answer := Dialog.Confirm(Question, false);
                    if Answer = true then begin
                        Clear(objOcx);
                        objOcx.fnClosePayrollPeriod(dtOpenPeriod);
                        Message('Process Complete');
                    end else
                        Message('You have selected NOT to Close the period');

                end;
            }
            action("Compute Variance")
            {
                ApplicationArea = Basic;
                Caption = 'Compute Variance';
                Image = RollUpCosts;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Compute Variance action.';
                trigger OnAction()
                begin
                    /*
                    i := 0;

                    PayPeriods.RESET;
                    PayPeriods.SETRANGE(PayPeriods."Variance Report",TRUE);
                    IF PayPeriods.FIND('-') THEN BEGIN
                    IF PayPeriods.COUNT = 2 THEN BEGIN
                    REPEAT
                    i := i + 1;

                    IF  i = 1 THEN BEGIN
                      PrevPeriod := PayPeriods."Date Opened";
                    END
                    ELSE BEGIN
                      CurrPeriod := PayPeriods."Date Opened";
                    END;

                    UNTIL PayPeriods.NEXT = 0
                    END
                    ELSE BEGIN
                    ERROR('Please select two periods to compare.');
                    END;
                    END
                    ELSE BEGIN
                    ERROR('Please select the periods.');
                    END;

                    //DELETE DATA
                    varianceTable.RESET;
                    //varianceTable.SETRANGE(varianceTable."User Name",UPPERCASE(USERID));
                    IF varianceTable.FIND('-') THEN BEGIN
                    varianceTable.DELETEALL;
                    END;

                    //Employees
                    Employee.RESET;
                    //Employee.SETRANGE(Employee.Status,Employee.Status::Normal);
                    IF Employee.FIND('-') THEN BEGIN
                    REPEAT

                    CurrAmnt:=0;
                    PrevAmnt:=0;

                    //BASIC SALARY
                    //Curr Period
                    salaryCard.RESET;
                    salaryCard.SETRANGE(salaryCard."Payroll Period",CurrPeriod);
                    salaryCard.SETRANGE(salaryCard."Employee Code",Employee."No.");
                    salaryCard.SETRANGE(salaryCard."Transaction Code",'BPAY');
                    IF salaryCard.FIND('-') THEN BEGIN
                    CurrAmnt:=salaryCard.Amount;
                    END;

                    //Prev Period

                    salaryCard.RESET;
                    salaryCard.SETRANGE(salaryCard."Payroll Period",PrevPeriod);
                    salaryCard.SETRANGE(salaryCard."Employee Code",Employee."No.");
                    salaryCard.SETRANGE(salaryCard."Transaction Code",'BPAY');
                    IF salaryCard.FIND('-') THEN BEGIN
                    PrevAmnt:=salaryCard.Amount
                    END;

                    Variance:=PrevAmnt-CurrAmnt;

                    //INSERT
                    varianceTable.INIT;
                    varianceTable."lineNo.":=varianceTable."lineNo."+1;
                    varianceTable."Trans Code":='BPAY';
                    varianceTable."Trans Name":='Basic Pay';
                    varianceTable."Employee code":=Employee."No.";
                    //varianceTable.Period:=CurrPeriod;
                    varianceTable."Curr Amount":=CurrAmnt;
                    varianceTable."Prev Amount":=PrevAmnt;
                    varianceTable.Variance:=Variance;
                    varianceTable."Current Period" := CurrPeriod;
                    varianceTable."Previous Period" :=  PrevPeriod;
                    varianceTable."User Name" := UPPERCASE(USERID);
                    varianceTable."Employee Name" := Employee."First Name" + ' ' +Employee."Middle Name" + ' ' +Employee."Last Name";
                    varianceTable.INSERT;


                    CurrAmnt:=0;
                    PrevAmnt:=0;

                    //NET SALARY
                    //Curr Period
                    salaryCard.RESET;
                    salaryCard.SETRANGE(salaryCard."Payroll Period",CurrPeriod);
                    salaryCard.SETRANGE(salaryCard."Employee Code",Employee."No.");
                    salaryCard.SETRANGE(salaryCard."Transaction Code",'NPAY');
                    IF salaryCard.FIND('-') THEN BEGIN
                    CurrAmnt:=salaryCard.Amount;
                    END;

                    //Prev Period

                    salaryCard.RESET;
                    salaryCard.SETRANGE(salaryCard."Payroll Period",PrevPeriod);
                    salaryCard.SETRANGE(salaryCard."Employee Code",Employee."No.");
                    salaryCard.SETRANGE(salaryCard."Transaction Code",'NPAY');
                    IF salaryCard.FIND('-') THEN BEGIN
                    PrevAmnt:=salaryCard.Amount
                    END;

                    Variance:=PrevAmnt-CurrAmnt;

                    //INSERT
                    varianceTable.INIT;
                    varianceTable."lineNo.":=varianceTable."lineNo."+1;
                    varianceTable."Trans Code":='NPAY';
                    varianceTable."Trans Name":='Net Pay';
                    varianceTable."Employee code":=Employee."No.";
                    //varianceTable.Period:=CurrPeriod;
                    varianceTable."Curr Amount":=CurrAmnt;
                    varianceTable."Prev Amount":=PrevAmnt;
                    varianceTable.Variance:=Variance;
                    varianceTable."Current Period" := CurrPeriod;
                    varianceTable."Previous Period" :=  PrevPeriod;
                    varianceTable."User Name" := UPPERCASE(USERID);
                    varianceTable."Employee Name" := Employee."First Name" + ' ' +Employee."Middle Name" + ' ' +Employee."Last Name";
                    varianceTable.INSERT;


                    //Transaction Codes
                    Transcode.RESET;
                    IF Transcode.FIND('-') THEN BEGIN
                    REPEAT

                    CurrAmnt:=0;
                    PrevAmnt:=0;


                    //Previous Period
                    PeriodTrans.RESET;
                    PeriodTrans.SETRANGE(PeriodTrans."Employee Code",Employee."No.");
                    PeriodTrans.SETRANGE(PeriodTrans."Transaction Code",Transcode."Transaction Code");
                    PeriodTrans.SETRANGE(PeriodTrans."Payroll Period",PrevPeriod);
                    IF PeriodTrans.FIND('-') THEN BEGIN
                    REPEAT
                    PrevAmnt := PeriodTrans.Amount;
                    UNTIL PeriodTrans.NEXT = 0
                    END;

                    //Current Period
                    PeriodTrans.RESET;
                    PeriodTrans.SETRANGE(PeriodTrans."Employee Code",Employee."No.");
                    PeriodTrans.SETRANGE(PeriodTrans."Transaction Code",Transcode."Transaction Code");
                    PeriodTrans.SETRANGE(PeriodTrans."Payroll Period",CurrPeriod);
                    IF PeriodTrans.FIND('-') THEN BEGIN
                    REPEAT
                    CurrAmnt := PeriodTrans.Amount;
                    UNTIL PeriodTrans.NEXT = 0
                    END;

                    //INSERT
                    Variance:=PrevAmnt-CurrAmnt;

                    //INSERT
                    varianceTable.INIT;
                    varianceTable."lineNo.":=varianceTable."lineNo."+1;
                    varianceTable."Trans Code":=Transcode."Transaction Code";
                    varianceTable."Trans Name":=Transcode."Transaction Name";
                    varianceTable."Employee code":=Employee."No.";
                    //varianceTable.Period:=CurrPeriod;
                    varianceTable."Curr Amount":=CurrAmnt;
                    varianceTable."Prev Amount":=PrevAmnt;
                    varianceTable.Variance:=Variance;
                    varianceTable."Current Period" := CurrPeriod;
                    varianceTable."Previous Period" :=  PrevPeriod;
                    varianceTable."User Name" := UPPERCASE(USERID);
                    varianceTable."Employee Name" := Employee."First Name" + ' ' +Employee."Middle Name" + ' ' +Employee."Last Name";
                    varianceTable.INSERT;

                    UNTIL Transcode.NEXT = 0
                    END;

                    UNTIL Employee.NEXT = 0
                    END;
                    */



                    Message('Variance Computed successfully. You can now run the Variance Report');

                end;
            }
            action("Variance Report")
            {
                ApplicationArea = Basic;
                Caption = 'Variance Report';
                Image = Report2;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = report "prMonthly Variance";
                ToolTip = 'Executes the Variance Report action.';
            }
            action(Action4)
            {
                ApplicationArea = Basic;
                Caption = 'Compute Variance';
                Image = RollUpCosts;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Compute Variance action.';
                trigger OnAction()
                begin
                    i := 0;

                    PayPeriods.Reset();
                    PayPeriods.SetRange(PayPeriods."Variance Report", true);
                    if PayPeriods.Find('-') then begin
                        if PayPeriods.Count = 2 then
                            repeat
                                i := i + 1;

                                if i = 1 then
                                    PrevPeriod := PayPeriods."Date Opened"
                                else
                                    CurrPeriod := PayPeriods."Date Opened";

                            until PayPeriods.Next() = 0
                        else
                            Error('Please select two periods to compare.');
                    end
                    else
                        Error('Please select the periods.');

                    //DELETE DATA
                    varianceTable.Reset();
                    //varianceTable.SETRANGE(varianceTable."User Name",UPPERCASE(USERID));
                    if varianceTable.Find('-') then
                        varianceTable.DeleteAll();

                    //Employees
                    Employee.Reset();
                    //Employee.SETRANGE(Employee.Status,Employee.Status::Normal);
                    if Employee.Find('-') then
                        repeat

                            CurrAmnt := 0;
                            PrevAmnt := 0;

                            //BASIC SALARY
                            //Curr Period
                            salaryCard.Reset();
                            salaryCard.SetRange(salaryCard."Payroll Period", CurrPeriod);
                            salaryCard.SetRange(salaryCard."Employee Code", Employee."No.");
                            salaryCard.SetRange(salaryCard."Transaction Code", 'BPAY');
                            if salaryCard.Find('-') then
                                CurrAmnt := salaryCard.Amount;

                            //Prev Period

                            salaryCard.Reset();
                            salaryCard.SetRange(salaryCard."Payroll Period", PrevPeriod);
                            salaryCard.SetRange(salaryCard."Employee Code", Employee."No.");
                            salaryCard.SetRange(salaryCard."Transaction Code", 'BPAY');
                            if salaryCard.Find('-') then
                                PrevAmnt := salaryCard.Amount;

                            Variance := PrevAmnt - CurrAmnt;

                            //INSERT
                            varianceTable.Init();
                            varianceTable."lineNo." := varianceTable."lineNo." + 1;
                            varianceTable."Trans Code" := 'BPAY';
                            varianceTable."Trans Name" := 'Basic Pay';
                            varianceTable."Employee code" := Employee."No.";
                            //varianceTable.Period:=CurrPeriod;
                            varianceTable."Curr Amount" := CurrAmnt;
                            varianceTable."Prev Amount" := PrevAmnt;
                            varianceTable.Variance := Variance;
                            varianceTable."Current Period" := CurrPeriod;
                            varianceTable."Previous Period" := PrevPeriod;
                            varianceTable."User Name" := UpperCase(UserId);
                            varianceTable."Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            varianceTable.Insert();


                            CurrAmnt := 0;
                            PrevAmnt := 0;

                            //NET SALARY
                            //Curr Period
                            salaryCard.Reset();
                            salaryCard.SetRange(salaryCard."Payroll Period", CurrPeriod);
                            salaryCard.SetRange(salaryCard."Employee Code", Employee."No.");
                            salaryCard.SetRange(salaryCard."Transaction Code", 'NPAY');
                            if salaryCard.Find('-') then
                                CurrAmnt := salaryCard.Amount;

                            //Prev Period

                            salaryCard.Reset();
                            salaryCard.SetRange(salaryCard."Payroll Period", PrevPeriod);
                            salaryCard.SetRange(salaryCard."Employee Code", Employee."No.");
                            salaryCard.SetRange(salaryCard."Transaction Code", 'NPAY');
                            if salaryCard.Find('-') then
                                PrevAmnt := salaryCard.Amount;

                            Variance := PrevAmnt - CurrAmnt;

                            //INSERT
                            varianceTable.Init();
                            varianceTable."lineNo." := varianceTable."lineNo." + 1;
                            varianceTable."Trans Code" := 'NPAY';
                            varianceTable."Trans Name" := 'Net Pay';
                            varianceTable."Employee code" := Employee."No.";
                            //varianceTable.Period:=CurrPeriod;
                            varianceTable."Curr Amount" := CurrAmnt;
                            varianceTable."Prev Amount" := PrevAmnt;
                            varianceTable.Variance := Variance;
                            varianceTable."Current Period" := CurrPeriod;
                            varianceTable."Previous Period" := PrevPeriod;
                            varianceTable."User Name" := UpperCase(UserId);
                            varianceTable."Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                            varianceTable.Insert();


                            //Transaction Codes
                            Transcode.Reset();
                            if Transcode.Find('-') then
                                repeat

                                    CurrAmnt := 0;
                                    PrevAmnt := 0;


                                    //Previous Period
                                    PeriodTrans.Reset();
                                    PeriodTrans.SetRange(PeriodTrans."Employee Code", Employee."No.");
                                    PeriodTrans.SetRange(PeriodTrans."Transaction Code", Transcode."Transaction Code");
                                    PeriodTrans.SetRange(PeriodTrans."Payroll Period", PrevPeriod);
                                    if PeriodTrans.Find('-') then
                                        repeat
                                            PrevAmnt := PeriodTrans.Amount;
                                        until PeriodTrans.Next() = 0;

                                    //Current Period
                                    PeriodTrans.Reset();
                                    PeriodTrans.SetRange(PeriodTrans."Employee Code", Employee."No.");
                                    PeriodTrans.SetRange(PeriodTrans."Transaction Code", Transcode."Transaction Code");
                                    PeriodTrans.SetRange(PeriodTrans."Payroll Period", CurrPeriod);
                                    if PeriodTrans.Find('-') then
                                        repeat
                                            CurrAmnt := PeriodTrans.Amount;
                                        until PeriodTrans.Next() = 0;

                                    //INSERT
                                    Variance := PrevAmnt - CurrAmnt;

                                    //INSERT
                                    varianceTable.Init();
                                    varianceTable."lineNo." := varianceTable."lineNo." + 1;
                                    varianceTable."Trans Code" := Transcode."Transaction Code";
                                    varianceTable."Trans Name" := Transcode."Transaction Name";
                                    varianceTable."Employee code" := Employee."No.";
                                    //varianceTable.Period:=CurrPeriod;
                                    varianceTable."Curr Amount" := CurrAmnt;
                                    varianceTable."Prev Amount" := PrevAmnt;
                                    varianceTable.Variance := Variance;
                                    varianceTable."Current Period" := CurrPeriod;
                                    varianceTable."Previous Period" := PrevPeriod;
                                    varianceTable."User Name" := UpperCase(UserId);
                                    varianceTable."Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                                    varianceTable.Insert();

                                until Transcode.Next() = 0;

                        until Employee.Next() = 0;

                    Message('Variance Computed successfully. You can now run the Variance Report');
                end;
            }
            action("Allow Proration")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Allow Proration action.';
                trigger OnAction()
                begin
                    PayPeriod.Reset();
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then begin
                        PayPeriod.Prorated := false;
                        PayPeriod.Modify();
                    end;
                end;
            }
        }
    }

    var
        PayPeriod: Record "PR Payroll Periods";
        strPeriodName: Text[30];
        Text000: Label '''Leave without saving changes?''';
        Text001: Label '''You selected %1.''';
        Question: Text[250];
        Answer: Boolean;
        objOcx: Codeunit "PR Payroll Processing";
        dtOpenPeriod: Date;
        PayrollType: Record "prPayroll Type";
        Selection: Integer;
        PayrollDefined: Text[30];
        PayrollCode: Code[10];
        NoofRecords: Integer;
        i: Integer;
        ContrInfo: Record "Control-Information";
        UserSetup: Record "User Setup";
        PrPeriodTrans: Record "PR Period Transactions";
        HrEmp: Record "HR Employees";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition;
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        Transcode: Record "PR Transaction Codes";
        //SendMail: Codeunit "SMTP Mail";
        pr: Record "PR Salary Card";
        PayPeriods: Record "PR Payroll Periods";
        CurrPeriod: Date;
        PrevPeriod: Date;
        varianceTable: Record "prMonthly Variance";
        Employee: Record "HR Employees";
        salaryCard: Record "PR Period Transactions";
        PeriodTrans: Record "PR Period Transactions";
        CurrAmnt: Decimal;
        PrevAmnt: Decimal;
        Variance: Decimal;


    procedure fnGetOpenPeriod()
    begin

        //Get the open/current period
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then begin
            strPeriodName := PayPeriod."Period Name";
            dtOpenPeriod := PayPeriod."Date Opened";
        end;
    end;
}
