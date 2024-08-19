#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193483 "HR Leave Balance1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Balance1.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Leave Balance1';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.", "Responsibility Center", "Global Dimension 1 Code", "Global Dimension 2 Code", Status;
            column(ReportForNavId_1; 1) { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(LeaveTypeFilter; LeaveTypeFilter) { }
            column(DaysAllocated; DaysAllocated) { }
            column(DaysTaken; DaysTaken) { }
            column(LeaveBalance; LeaveBalance) { }
            column(ReimbursedLeaveDays_HREmployees; "HR Employees"."Reimbursed Leave Days") { }
            column(AllocatedLeaveDays_HREmployees; "HR Employees"."Allocated Leave Days") { }
            column(AppliedFilters; AppliedFilters) { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(NClWeb; CompInfo."NLC Website")
            { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            /*  dataitem("HR Leave Ledger Entries";"HR Leave Ledger Entries")
             {
                 DataItemLink = "Staff No."=field("No.");
                 RequestFilterFields = "Posting Date";
                 column(ReportForNavId_15; 15)
                 {
                 }
             } */

            trigger OnAfterGetRecord()
            begin
                //Initialize
                DaysAllocated := 0;
                DaysTaken := 0;
                LeaveBalance := 0;

                HRCalendar.Reset();
                HRCalendar.SetRange(HRCalendar.Current, true);
                if HRCalendar.Find('-') then begin


                    //Allocated Leave Days
                    HRLeaveLedger.Reset();
                    HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Employees"."No.");
                    HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type", HRLeaveLedger."Leave Entry Type"::Positive);
                    //HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Calendar Code",'2020/2021');

                    ////HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Calendar Code",HRCalendar.Code);
                    HRLeaveLedger.SetFilter(HRLeaveLedger."Posting Date", '%1..%2', HRCalendar."Start Date", HRCalendar."End Date");
                    HRLeaveLedger.SetRange(HRLeaveLedger."Leave Type", LeaveTypeFilter);
                    // HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Posting Description",'Leave Allocation on 05-07-17');
                    if HRLeaveLedger.Find('-') then begin
                        HRLeaveLedger.CalcSums(HRLeaveLedger."No. of days");
                        DaysAllocated := HRLeaveLedger."No. of days";
                    end;

                    //Days Taken
                    HRLeaveLedger.Reset();
                    HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Employees"."No.");
                    HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type", HRLeaveLedger."Leave Entry Type"::Negative);
                    //HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Calendar Code",'2017/2018');
                    //HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Calendar Code",'2020/2021');

                    ////HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Calendar Code",HRCalendar.Code);

                    HRLeaveLedger.SetFilter(HRLeaveLedger."Posting Date", '%1..%2', HRCalendar."Start Date", HRCalendar."End Date");
                    HRLeaveLedger.SetRange(HRLeaveLedger."Leave Type", LeaveTypeFilter);
                    if HRLeaveLedger.Find('-') then begin
                        HRLeaveLedger.CalcSums(HRLeaveLedger."No. of days");
                        DaysTaken := Abs(HRLeaveLedger."No. of days");
                    end;

                    //Leave Balance
                    LeaveBalance := DaysAllocated - DaysTaken;

                    if (DaysAllocated = 0) and (DaysTaken = 0) and (LeaveBalance = 0) then
                        CurrReport.Skip();
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field(LeaveTypeFilter; LeaveTypeFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Type Filter';
                    TableRelation = "HR Leave Types".Code;
                    ToolTip = 'Specifies the value of the Leave Type Filter field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        if LeaveTypeFilter = '' then
            Error('Please select leave type');
        AppliedFilters := LeaveTypeFilter + ' Leave, ' + "HR Employees".GetFilters;

        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        LeaveTypeFilter: Code[20];
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        DaysAllocated: Decimal;
        DaysTaken: Decimal;
        LeaveBalance: Decimal;
        AppliedFilters: Text;
        CompInfo: Record "Company Information";
        LeaveCode: Code[20];
        HRCalendar: Record "HR Calendar";
}
