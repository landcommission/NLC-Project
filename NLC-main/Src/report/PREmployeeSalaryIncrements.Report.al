#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193548 "PR Employee Salary Increments"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR Employee Salary Increments';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = const(Active));
            RequestFilterFields = "No.";
            column(ReportForNavId_1102755000; 1102755000) { }

            trigger OnAfterGetRecord()
            begin

                if IncrementalMonth = IncrementalMonth::None then
                    Error('Please specify Incremental Month on the request page');

                //FILTER BY PRE DEFINED FILTERS ON THE REQUEST PAGE
                HREmp.Reset();
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetRange(HREmp."Incremental Month", IncrementalMonth);
                if HREmp.Find('-') then
                    repeat
                        i := i + 1;

                        // IF HREmp."Date of Current Employment" = 0D THEN
                        if HREmp."Date Of Joining the Company" = 0D then
                            Error(Text001, HREmp."No.", HREmp."Full Name");

                        yearJ := Date2DMY(HREmp."Date Of Joining the Company", 3);
                        //  yearJ:= DATE2DMY(HREmp."Date of Current Employment",3);
                        yearToday := Date2DMY(Today, 3);
                        LOS := yearToday - yearJ;


                        if LOS > 0 then begin
                            HREmp.CalcFields(HREmp."Basic Pay");

                            CurrentEmployeeBasicPay := HREmp."Basic Pay";
                            CurrEmployeeName := HREmp."Full Name";
                            CurrentEmployeeJobGroup := HREmp.Grade;

                            // TIER 1
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 1 - Minimum", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 2";

                                //MODIFY BASIC PAY OF EMPLOYEE
                                HREmp2.Reset();
                                HREmp2.SetRange(HREmp2."No.", HREmp."No.");
                                if HREmp2.Find('-') then begin
                                    HREmp2."New Basic Pay" := NewEmployeeBasicPay;
                                    HREmp2.Modify();
                                end;

                            end;

                            // TIER 2
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 2", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 3";

                                //MODIFY BASIC PAY OF EMPLOYEE
                                HREmp2.Reset();
                                HREmp2.SetRange(HREmp2."No.", HREmp."No.");
                                if HREmp2.Find('-') then begin
                                    HREmp2."New Basic Pay" := NewEmployeeBasicPay;
                                    HREmp2.Modify();
                                end;

                            end;

                            // TIER 3
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 3", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 4";

                                //MODIFY BASIC PAY OF EMPLOYEE
                                HREmp2.Reset();
                                HREmp2.SetRange(HREmp2."No.", HREmp."No.");
                                if HREmp2.Find('-') then begin
                                    HREmp2."New Basic Pay" := NewEmployeeBasicPay;
                                    HREmp2.Modify();
                                end;

                            end;

                            // TIER 4
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 4", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 5";

                                //MODIFY BASIC PAY OF EMPLOYEE
                                HREmp2.Reset();
                                HREmp2.SetRange(HREmp2."No.", HREmp."No.");
                                if HREmp2.Find('-') then begin
                                    HREmp2."New Basic Pay" := NewEmployeeBasicPay;
                                    HREmp2.Modify();
                                end;

                            end;

                            // TIER 5
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 5", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 6";

                                //MODIFY BASIC PAY OF EMPLOYEE
                                HREmp2.Reset();
                                HREmp2.SetRange(HREmp2."No.", HREmp."No.");
                                if HREmp2.Find('-') then begin
                                    HREmp2."New Basic Pay" := NewEmployeeBasicPay;
                                    HREmp2.Modify();
                                end;


                            end;

                            // TIER 6
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 6", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 7";

                                //MODIFY BASIC PAY OF EMPLOYEE
                                HREmp2.Reset();
                                HREmp2.SetRange(HREmp2."No.", HREmp."No.");
                                if HREmp2.Find('-') then begin
                                    HREmp2."New Basic Pay" := NewEmployeeBasicPay;
                                    HREmp2.Modify();
                                end;

                            end;

                            // TIER 7
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 7", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 8";

                                //MODIFY BASIC PAY OF EMPLOYEE
                                HREmp2.Reset();
                                HREmp2.SetRange(HREmp2."No.", HREmp."No.");
                                if HREmp2.Find('-') then begin
                                    HREmp2."New Basic Pay" := NewEmployeeBasicPay;
                                    HREmp2.Modify();
                                end;
                            end;

                            // TIER 8
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 8", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 9";

                                //MODIFY BASIC PAY OF EMPLOYEE
                                HREmp2.Reset();
                                HREmp2.SetRange(HREmp2."No.", HREmp."No.");
                                if HREmp2.Find('-') then begin
                                    HREmp2."New Basic Pay" := NewEmployeeBasicPay;
                                    HREmp2.Modify();
                                end;

                            end;

                            // TIER 9
                            PRSalaryScale.Reset();
                            PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                            PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 9", CurrentEmployeeBasicPay);
                            if PRSalaryScale.Find('-') then begin
                                NewEmployeeBasicPay := PRSalaryScale."Basic Pay 10";

                                HREmp."New Basic Pay" := NewEmployeeBasicPay;
                                HREmp.Modify();
                            end;
                        end;

                        //          // TIER 10
                        PRSalaryScale.Reset();
                        PRSalaryScale.SetRange(PRSalaryScale.Grade, CurrentEmployeeJobGroup);
                        PRSalaryScale.SetRange(PRSalaryScale."Basic Pay 10", CurrentEmployeeBasicPay);
                        if PRSalaryScale.Find('-') then begin
                            NewEmployeeBasicPay := PRSalaryScale."Basic Pay 10";

                            HREmp."New Basic Pay" := NewEmployeeBasicPay;
                            HREmp.Modify();
                        end;
                    //END;

                    until HREmp.Next() = 0;
            end;

            trigger OnPostDataItem()
            begin
                Message(Text002);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group("PR Basic Salary Increments")
                {
                    Caption = 'PR Basic Salary Increments';
                    field(IncrementalMonth; IncrementalMonth)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Incremental Month';
                        ToolTip = 'Specifies the value of the Incremental Month field.';
                    }
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        if IncrementalMonth = 0 then
            Error('Please specify incremental month');

        //To Clear New Basic
        HREmp2.Reset();
        if HREmp2.FindFirst() then
            repeat
                HREmp2."New Basic Pay" := 0;
                HREmp2.Modify();
            until HREmp2.Next() = 0;
    end;

    var
        IncrementalMonth: Option None,January,February,March,April,May,June,July,August,September,October,November,December;
        HREmp: Record "HR Employees";
        DOJ: Date;
        i: Integer;
        HRDates: Codeunit "HR Dates";
        yearJ: Integer;
        yearToday: Integer;
        LOS: Integer;
        CurrentEmployeeBasicPay: Decimal;
        NewEmployeeBasicPay: Decimal;
        CurrentEmployeeJobGroup: Code[10];
        PRSalaryScale: Record "PR Employees Salary Scale";
        PRSalaryScale2: Record "PR Employees Salary Scale";
        HREmp2: Record "HR Employees";
        Text001: Label 'Date Of Joining the Company must have value in Employee %1 - %2';
        Text002: Label 'Process Complete';
        Text003: Label 'Employee No: %1 - %2....Joined NIB on: %3 ....Current Year is %4...Length of Service is: %5 Years';
        CurrEmployeeName: Text;
}
