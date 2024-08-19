#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193546 "PR Salary List (ALL)"
{
    ApplicationArea = Basic;
    CardPageId = "PR Header Salary Card - ALL";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Earnings/Deductions,Budgetary Control,Cancellation,Navigate,Earnings/Deductions,AssignEarnings/Deductions,Earnings/Deductions,Earnings/Deductions,Earnings/Deductions,Update Increaments';
    SourceTable = "HR Employees";
    SourceTableView = where(Comment = const(false),
                            Status = filter(Active));
    UsageCategory = Lists;
    Caption = 'PR Salary List (ALL)';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(DAge; Rec.DAge)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DAge field.';
                }
                field(DPension; Rec.DPension)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DPension field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Status';
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Employment Status field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incremental Month field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("New Basic Pay"; Rec."New Basic Pay")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the New Basic Pay field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Transactions)
            {
                Caption = 'Transactions';
                action("Assign Earning/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Earning/Deductions';
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category12;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = page "PR Employee Transactions";
                    RunPageLink = "Employee Code" = field("No.");
                    ToolTip = 'Executes the Assign Earning/Deductions action.';
                }
                action("Assign Salary Arrears")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Salary Arrears';
                    Image = SelectEntries;
                    Promoted = true;
                    PromotedCategory = Category12;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = page "PR Salary Arrears";
                    RunPageLink = "Employee Code" = field("No.");
                    ToolTip = 'Executes the Assign Salary Arrears action.';
                }
            }
        }
        area(Processing)
        {
            action(ViewPayslip)
            {
                ApplicationArea = Basic;
                Caption = 'View Payslip';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the View Payslip action.';
                trigger OnAction()
                begin

                    PRPeriod.Reset();
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.Find('-') then
                        SelectedPeriod := PRPeriod."Date Opened"
                    else
                        Error('No Payroll period found');

                    //Display payslip report
                    PRSalaryCard.SetRange("Employee Code", Rec."No.");
                    PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);

                    Report.Run(Report::"PR Individual Payslip Portal", true, false, PRSalaryCard);
                end;
            }
            action(ProcessPayroll)
            {
                ApplicationArea = Basic;
                Caption = 'Process Payroll';
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Process Payroll action.';
                trigger OnAction()
                var
                    Text000: Label '@1@@@@@@@@@@@@@@@@@@@@@';
                begin
                    //IF USERID <> 'LC\CORETEC2' THEN ERROR('You must login using USERID CORETEC2');
                    /*
                    HREmp.RESET;
                    HREmp.SETRANGE(HREmp."No.","No.");
                    HREmp.SETRANGE(HREmp.Status,Status::Active);
                    IF HREmp.FIND('-') THEN
                     //MESSAGE(FORMAT(DaystoProbaton));

                      BEGIN
                      if "HR Employees"."Contract End Date"<>0D  then
                        DaystoProbaton:="HR Employees"."Contract End Date"-TODAY;
                       IF DaystoProbaton>20 THEN
                     */

                    Question := 'Are you sure you want to process the entire payroll?';

                    Answer := Dialog.Confirm(Question, false);
                    if Answer = true then begin


                        PRPeriod.Reset();
                        PRPeriod.SetRange(PRPeriod.Closed, false);
                        if PRPeriod.Find('-') then
                            SelectedPeriod := PRPeriod."Date Opened"
                        else
                            Error('No Payroll period found');

                        if PRSalaryCard.Get(Rec."No.") then begin
                            HREmployeePR.Reset();
                            HREmployeePR.SetRange(HREmployeePR.Status, HREmployeePR.Status::Active);
                            HREmployeePR.SetRange(HREmployeePR."Commisioner?", false);
                            //HREmployeePR.SetRange("No.", 'NLC20150178');
                            //SETFILTER("Contract End Date",'>=%1',today);
                            if HREmployeePR.Find('-') then begin
                                //Mandatory fields as requested and Singed by NLC
                                HREmployeePR.TestField(HREmployeePR."Full Name");
                                HREmployeePR.TestField(HREmployeePR."ID Number");
                                HREmployeePR.TestField(HREmployeePR."PIN No.");
                                HREmployeePR.TestField(HREmployeePR."No.");
                                HREmployeePR.TestField(HREmployeePR."Date Of Birth");
                                HREmployeePR.TestField(HREmployeePR."Date Of Joining the Company");
                                //Mandatory fields as requested and Singed by NLC

                                ProgressWindow.Open('Processing Salary #1#################################################################');
                                repeat
                                    ProgressWindow.Update(1, HREmployeePR."No." + ':' + HREmployeePR."Full Name");
                                    if PRSalaryCard.Get(HREmployeePR."No.") then
                                        ProcessPayroll.fnProcesspayroll(HREmployeePR."No.", HREmployeePR."Date Of Joining the Company"
                                        , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                        , SelectedPeriod, SelectedPeriod, '', '', HREmployeePR."Date Of Leaving", true,
                                        HREmployeePR.County, PRSalaryCard."Insurance Certificate?")
                                    //Tick as prorated for current period
                                    /* HREMP.RESET;
                                      HREMP.SETRANGE(HREMP."No.",HREmployeePR."No.") ;
                                       BEGIN
                                         HREMP."Prorated?":=TRUE;
                                         HREMP."Prorated Payroll Period":= SelectedPeriod;
                                         HREMP.MODIFY
                                       END;*///HOSEA
                                    else
                                        ;
                                //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                until HREmployeePR.Next() = 0;
                                ProgressWindow.Close();
                            end;

                            Commit();

                            //CODEUNIT
                            PRSalaryCard.Reset();
                            PRSalaryCard.SetRange("Employee Code", Rec."No.");
                            PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);

                            //AFTER SUCCESS PROCSSING PRINT INDIVIDUAL PAYSLIP
                            Report.Run(Report::"PR Individual Payslip", true, false, PRSalaryCard);
                        end;
                    end

                end;
            }
            action(ProcessCurrent)
            {
                ApplicationArea = Basic;
                Caption = 'Process Current';
                Image = CalculateWhseAdjustment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Process Current action.';
                trigger OnAction()
                var
                    Text000: Label '@1@@@@@@@@@@@@@@@@@@@@@';
                begin
                    //IF USERID <> 'LC\CORETEC2' THEN ERROR('You must login using USERID CORETEC2');
                    Question := 'Are you sure you want to process the current payroll?';

                    Answer := Dialog.Confirm(Question, false);
                    if Answer = true then begin


                        PRPeriod.Reset();
                        PRPeriod.SetRange(PRPeriod.Closed, false);
                        if PRPeriod.Find('-') then
                            SelectedPeriod := PRPeriod."Date Opened"
                        else
                            Error('No Payroll period found');

                        if PRSalaryCard.Get(Rec."No.") then begin
                            HREmployeePR.Reset();
                            HREmployeePR.SetRange(HREmployeePR.Status, HREmployeePR.Status::Active);
                            HREmployeePR.SetRange(HREmployeePR."No.", Rec."No.");
                            if HREmployeePR.Find('-') then begin
                                ProgressWindow.Open('Processing Salary #1#################################################################');
                                repeat
                                    ProgressWindow.Update(1, HREmployeePR."No." + ':' + HREmployeePR."Full Name");
                                    if PRSalaryCard.Get(HREmployeePR."No.") then
                                        ProcessPayroll.fnProcesspayroll(HREmployeePR."No.", HREmployeePR."Date Of Joining the Company"
                                        , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                        , SelectedPeriod, SelectedPeriod, '', '', HREmployeePR."Date Of Leaving", true,
                                        HREmployeePR.County, PRSalaryCard."Insurance Certificate?")
                                    //Tick as prorated for current period
                                    /*HREMP.RESET;
                                    HREMP.SETRANGE(HREMP."No.",HREmployeePR."No.");
                                     BEGIN
                                       HREMP."Prorated?":=TRUE;
                                       HREMP."Prorated Payroll Period":= SelectedPeriod;
                                       HREMP.MODIFY;
                                     END;*///HOSEA
                                    else
                                        ;
                                //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                until HREmployeePR.Next() = 0;
                                ProgressWindow.Close();
                            end;

                            Commit();

                            //CODEUNIT
                            PRSalaryCard.Reset();
                            PRSalaryCard.SetRange("Employee Code", Rec."No.");
                            PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);

                            //AFTER SUCCESS PROCSSING PRINT INDIVIDUAL PAYSLIP
                            Report.Run(Report::"PR Individual Payslip Portal", true, false, PRSalaryCard);
                        end;
                    end

                end;
            }
            action("Update Salary Increments")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Update Salary Increments action.';
                Promoted = true;
                PromotedCategory = Category13;
                PromotedIsBig = true;
                Image = UpdateUnitCost;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    //ERROR('Disabled');

                    if Confirm('Update Basic Pay with Values from New Basic Pay, This process cannot be Reversed?') = false then
                        Error('Process Aboreted');

                    HREMP.Reset();
                    HREMP.SetFilter(HREMP."New Basic Pay", '<>%1', 0);
                    if HREMP.Find('-') then begin
                        repeat
                            PRSalCard.Reset();
                            PRSalCard.SetRange(PRSalCard."Employee Code", HREMP."No.");
                            if PRSalCard.Find('-') then begin
                                PRSalCard."Basic Pay" := HREMP."New Basic Pay";
                                PRSalCard.Modify();
                            end;
                            HREMP."New Basic Pay" := 0;
                            HREMP.Modify();
                        until HREMP.Next() = 0;
                        Message('%1 Records Updated', HREMP.Count);
                    end;
                end;
            }
            action(CalculateIncrementalMonth)
            {
                ApplicationArea = Basic;
                Caption = 'Calculate Incremental Month';
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = true;
                ToolTip = 'Executes the Calculate Incremental Month action.';
                trigger OnAction()
                var
                    MonthJoin: Integer;
                    i: Integer;
                    Text00001: Label 'Calculate Incremental Month for all Permanent and Contracted Employees?';
                    DayJoin: Integer;
                begin
                    //DW
                    HREMP.Reset();
                    HREMP.SetRange(Status, HREMP.Status::Active);
                    if HREMP.FindFirst() then
                        repeat
                            HREMP."Incremental Month" := 0;
                            HREMP."Incremental Month" := Rec."Incremental Month"::None;
                            HREMP.Modify();
                        until HREMP.Next() = 0;

                    //IF NOT CONFIRM(Text00001,FALSE) THEN
                    //BEGIN
                    //    ERROR('Process Aborted by %1',USERID);
                    //    EXIT;
                    //END;

                    HREMP.Reset();
                    HREMP.SetFilter(HREMP."Contract Type", '%1|%2', Rec."Contract Type"::"Permanent and Pensionable", Rec."Contract Type"::Contract);
                    HREMP.SetRange(HREMP.Status, HREMP.Status::Active);
                    if HREMP.FindFirst() then begin
                        i := 0;
                        repeat
                            i := i + 1;
                            //HREMP.TESTFIELD(HREMP."Date of Current Employment");
                            if HREMP."Date of Current Employment" <> 0D then begin

                                MonthJoin := Date2DMY(HREMP."Date of Current Employment", 2);
                                DayJoin := Date2DMY(HREMP."Date of Current Employment", 1);
                                //        HREMP.TESTFIELD(HREMP."Date Of Joining the Company");
                                //        MonthJoin:=DATE2DMY(HREMP."Date Of Joining the Company",2);
                                //        DayJoin:=DATE2DMY(HREMP."Date Of Joining the Company",1);


                                //ERROR('%1',DayJoin);

                                //********************DECEMBER = JULY ******************
                                if MonthJoin = 12 then begin
                                    HREMP."Incremental Month" := 12;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::December;
                                    HREMP.Modify();
                                end;
                                //********************************************************
                                //********************JANUARY = APRIL ******************
                                if MonthJoin = 1 then begin
                                    HREMP."Incremental Month" := 1;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::January;
                                    HREMP.Modify();
                                end;
                                //********************************************************

                                //********************FEBUARY = APRIL ******************
                                if MonthJoin = 2 then begin
                                    HREMP."Incremental Month" := 2;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::February;
                                    HREMP.Modify();
                                end;
                                //********************************************************
                                //******************** MARCH = APRIL ******************
                                if MonthJoin = 3 then begin
                                    HREMP."Incremental Month" := 3;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::March;
                                    HREMP.Modify();
                                end;
                                //********************************************************
                                //******************** APRIL = JULY ******************
                                if (MonthJoin = 4) then begin
                                    HREMP."Incremental Month" := 4;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::April;
                                    HREMP.Modify();
                                end;
                                //********************************************************

                                //******************** MAY = JULY ******************
                                if MonthJoin = 5 then begin
                                    HREMP."Incremental Month" := 5;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::May;
                                    HREMP.Modify();
                                end;
                                //********************************************************
                                //******************** JUNE = JULY ******************
                                if MonthJoin = 6 then begin
                                    HREMP."Incremental Month" := 6;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::June;
                                    HREMP.Modify();
                                end;
                                //********************************************************

                                //******************** JULY = OCTOBER ******************
                                if MonthJoin = 7 then begin
                                    HREMP."Incremental Month" := 7;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::July;
                                    HREMP.Modify();
                                end;
                                //********************************************************
                                //******************** AUGUST = OCTOBER ******************
                                if MonthJoin = 8 then begin
                                    HREMP."Incremental Month" := 8;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::August;
                                    HREMP.Modify();
                                end;
                                //********************************************************
                                //******************** SEPTEMBER = OCTOBER ******************
                                if MonthJoin = 9 then begin
                                    HREMP."Incremental Month" := 9;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::September;
                                    HREMP.Modify();
                                end;
                                //********************************************************

                                //******************** OCOTOBER = JANUARY ******************
                                if MonthJoin = 10 then begin
                                    HREMP."Incremental Month" := 10;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::October;

                                    HREMP.Modify();
                                end;
                                //********************************************************
                                //******************** NOVEMBER = JANUARY ******************
                                if MonthJoin = 11 then begin
                                    HREMP."Incremental Month" := 11;
                                    HREMP."Incremental Month" := Rec."Incremental Month"::November;
                                    HREMP.Modify();
                                end;
                                //********************************************************
                            end;
                        until HREMP.Next() = 0;
                        Message('Update Completed Successfully. %1 records have been updated', i);
                    end;
                end;
            }
            action("Update Basic Pay")
            {
                ApplicationArea = Basic;
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Visible = true;
                ToolTip = 'Executes the Update Basic Pay action.';
                trigger OnAction()
                begin
                    //ERROR('Disabled');

                    if Confirm('Update Basic Pay with Values from New Basic Pay, This process cannot be Reversed?') = false then
                        Error('Process Aboreted');

                    HREMP.Reset();
                    HREMP.SetFilter(HREMP."New Basic Pay", '<>%1', 0);
                    if HREMP.Find('-') then
                        repeat
                            PRSalCard.Reset();
                            if PRSalCard.Get(HREMP."No.") then begin
                                PRSalCard."Basic Pay" := HREMP."New Basic Pay";
                                PRSalCard.Modify();
                            end;
                        until HREMP.Next() = 0;
                    Message('done');
                end;
            }
            action("Clear New  Basic Pay")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = true;
                ToolTip = 'Executes the Clear New  Basic Pay action.';
                trigger OnAction()
                begin
                    //eRROR('Disabled');

                    HREMP.Reset();
                    if HREMP.Find('-') then
                        repeat
                            HREMP."New Basic Pay" := 0;
                            HREMP.Modify();
                        until HREMP.Next() = 0;
                end;
            }
            action("Salary Increment")
            {
                ApplicationArea = Basic;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = report "PR Employee Salary Increments1";
                ToolTip = 'Executes the Salary Increment action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if (Rec."Date Of Birth" <> 0D) then
            Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
    end;

    trigger OnOpenPage()
    begin
        /*IF USERID <>'LC\DWESA' THEN
         IF USERID <>'LC\ZIPPORAH.KIGUTA' THEN ERROR('You are not authorised to access this page');
        */

        //Code to restrict access to payroll
        UserSetup.Reset();
        UserSetup.SetRange(UserSetup."User ID", UserId);
        if UserSetup.Find('-') then
            if UserSetup."Payroll Access" = false then
                Error('UNAUTHORISED ACCESS TO THIS PAGE!!!!PLEASE CONTACT THE SYSTEM ADMINISTRATOR');





        /*
        HREMP.RESET;
        HREMP.SETRANGE(HREMP."No.","No.");
        HREMP.SETRANGE(HREMP.Status,Status::Active);
        IF HREMP.FIND('-') THEN
        //  ERROR(HREMP."No.")    ;
          BEGIN
          IF HREMP."Contract End Date"<>0D THEN
            DaystoProbaton:=HREMP."Contract End Date"-TODAY;
           IF DaystoProbaton<60 THEN
          ERROR(HREMP."No.");
        REPEAT
        smtp.CreateMessage(HREMP."Company E-Mail",HREMP."Company E-Mail",HREMP."Company E-Mail",
          'Probation End Date Notification','Dear'+' '+ HREMP."First Name"+'<br>'+
           'Your probation period will be coming to an end on,' +' '+FORMAT(HREMP."Contract End Date")+ FORMAT(HREMP."ID Number") +'  '+
            HREMP."Full Name"+' ',TRUE);

        // HREmailParam.Subject,'Dear'+' '+ HREmp."First Name" +'<br>'+
        //            Text0002+' '+ "Job Description" +' '+ 'is open for application to all Internal Staff'+'<br><br>Regards',TRUE);
          smtp.Send();
          UNTIL HREMP.NEXT=0;
        MESSAGE('[%1] Employees have been notified about this vacancy',HREMP.COUNT);
            END;  */

    end;

    var
        //Text000: ;
        PRSalaryCard: Record "PR Salary Card";
        PRPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        HREmployeePR: Record "HR Employees";
        ProgressWindow: Dialog;
        PREmployeeTrans: Record "PR Employee Transactions";
        HREMP: Record "HR Employees";
        i: Integer;
        PRPeriodT: Record "PR Period Transactions";
        PRTransCodes: Record "PR Transaction Codes";
        PrevPayrollPeriod: Date;
        LoanStatus: Option " ","Fully Paid","Partly Paid";
        LoanTransCode: Code[10];
        InterestTransCode: Code[10];
        PREmployeeTrans_2: Record "PR Employee Transactions";
        PREmployeeTrans_3: Record "PR Employee Transactions";
        PREmployeeTrans_4: Record "PR Employee Transactions";
        PRTransCodes_2: Record "PR Transaction Codes";
        LoanTransCode_2: Code[10];
        InterestTransCode_2: Code[10];
        ApprovalEntry: Record "Approval Entry";
        PRBasicPay: Record "PR Basic Pay";
        HREmp_2: Record "HR Employees";
        NEW_BasicPay: Decimal;
        PRSalCard: Record "PR Salary Card";
        DaystoProbaton: Integer;
        //smtp: Codeunit "SMTP Mail";
        Question: Text;
        Answer: Boolean;
        UserSetup: Record "User Setup";
        Dates: Codeunit "HR Dates";
}

