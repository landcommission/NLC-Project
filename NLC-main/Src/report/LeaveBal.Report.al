#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193610 "Leave Bal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Leave Bal.rdlc';
    ApplicationArea = All;
    Caption = 'Leave Bal';
    dataset
    {
        dataitem("HR Leave Ledger Entries"; "HR Leave Ledger Entries")
        {
            column(ReportForNavId_1; 1) { }
            column(LeaveCalendarCode_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Calendar Code") { }
            column(StaffNo_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Staff No.") { }
            column(StaffName_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Staff Name") { }
            column(PostingDate_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Posting Date") { }
            column(LeaveEntryType_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Entry Type") { }
            column(Noofdays_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."No. of days") { }
            column(LeaveTypeFilter; LeaveTypeFilter) { }
            column(DaysAllocated; DaysAllocated) { }
            column(DaysTaken; DaysTaken) { }
            column(LeaveBalance; LeaveBalance) { }
            column(Picture; CompInfo.Picture) { }
            column(Rcount; Rcount) { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Staff No.");
                column(ReportForNavId_13; 13) { }
                column(No_HREmployees; "HR Employees"."No.") { }
                column(FullName_HREmployees; "HR Employees"."Full Name") { }
            }

            trigger OnAfterGetRecord()
            begin
                //Initialize
                DaysAllocated := 0;
                DaysTaken := 0;
                LeaveBalance := 0;
                Rcount := Rcount + 1;

                //Allocated Leave Days
                HRLeaveLedger.Reset();
                HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Employees"."No.");
                HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Leave Ledger Entries"."Staff No.");
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Calendar Code", '2017/2018');
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type", HRLeaveLedger."Leave Entry Type"::Positive);
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Type", LeaveTypeFilter);
                // HRLeaveLedger.SETRANGE(HRLeaveLedger."Leave Posting Description",'Leave Allocation on 05-07-17');
                if HRLeaveLedger.Find('-') then begin
                    HRLeaveLedger.CalcSums(HRLeaveLedger."No. of days");
                    DaysAllocated := HRLeaveLedger."No. of days";
                end;

                //Days Taken
                HRLeaveLedger.Reset();
                HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Employees"."No.");
                HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Leave Ledger Entries"."Staff No.");
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Calendar Code", '2017/2018');
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type", HRLeaveLedger."Leave Entry Type"::Negative);
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
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        DaysAllocated: Decimal;
        DaysTaken: Decimal;
        LeaveBalance: Decimal;
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        LeaveTypeFilter: Code[20];
        CompInfo: Record "Company Information";
        Rcount: Integer;
}
