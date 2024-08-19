#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193435 "Leave Carry Forward"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Leave Carry Forward.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Leave Carry Forward';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_7; 7) { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(CompAddress; CompAddress)
            {

            }
            column(CompanyName; CompanyName)
            { }
            column(Picture; CompInfo.Picture)
            { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(ID_Number; "ID Number")
            {

            }
            column(Days; Days) { }
            column(DaysTocarryforward; DaysTocarryforward) { }
            column(Balance; Balance) { }
            column(Daysgreaterthanzero; Daysgreaterthanzero) { }

            trigger OnAfterGetRecord()
            begin
                DaysTocarryforward := 15;

                LeaveLedger.Reset();
                LeaveLedger.SetRange(LeaveLedger."Staff No.", "HR Employees"."No.");
                LeaveLedger.SetRange(LeaveLedger."Leave Type", 'ANNUAL');
                LeaveLedger.SetRange(LeaveLedger."Leave Calendar Code", '2020/2021');
                //LeaveLedger.SETRANGE(LeaveLedger."Staff No.",'NLC20150178');
                "HR Employees".SetRange("HR Employees".Status, "HR Employees".Status::Active);
                //LeaveLedger.SETRANGE(LeaveLedger.Status,LeaveLedger.Status::Active);
                //LeaveLedger.SETFILTER(Status,'<>%1',LeaveLedger.status::Active);
                if LeaveLedger.Find('-') then begin
                    Days := 0;
                    repeat
                        Days := LeaveLedger."No. of days" + Days;

                    until LeaveLedger.Next() = 0;

                end;
                //  error(format(Days));

                if Days < DaysTocarryforward
                 then
                    Balance := Days

                else





                    if Days > DaysTocarryforward then
                        Balance := DaysTocarryforward;
                //Balance:=Days-DaysTocarryforward;




                if Balance < 0 then
                    CurrReport.Skip();

                if Balance = 0 then
                    // IF Balance < 0 THEN
                    CurrReport.Skip();


                //Daysgreaterthanzero:=0;
                //Daysgreaterthanzero:=balance;



                LeaveJournalLine.Reset();
                LeaveJournalLine.SETRANGE("Journal Batch Name", 'POSITIVE');
                LeaveJournalLine.SetRange("Journal Template Name", 'LEAVE');
                LeaveJournalLine.SetRange("Staff No.", "HR Employees"."No.");
                IF LeaveJournalLine.Find('-') then
                    LeaveJournalLine.DeleteAll();
                LeaveJournalLine.Reset();
                if LeaveJournalLine.FindLast() then
                    LineN := LeaveJournalLine."Line No." + 1000;

                LeaveJournalLine.Init();
                LeaveJournalLine."Journal Template Name" := 'LEAVE';
                LeaveJournalLine."Journal Batch Name" := 'POSITIVE';
                LeaveJournalLine."Line No." := LeaveJournalLine."Line No." + 1000;
                LeaveJournalLine."Leave Period" := '2024/2025';
                LeaveJournalLine."Leave Period Start Date" := Today;
                LeaveJournalLine."Staff No." := "HR Employees"."No.";
                LeaveJournalLine."Staff Name" := "HR Employees"."Full Name";
                LeaveJournalLine."Posting Date" := Today;
                LeaveJournalLine.Description := 'Leave Carry forward 2024/2025';
                LeaveJournalLine."Leave Entry Type" := LeaveJournalLine."Leave Entry Type"::Positive;
                LeaveJournalLine."Leave Type" := 'ANNUAL';
                //Grade:="HR Employees".Grade;
                LeaveJournalLine."Document No." := "HR Employees"."No.";
                // "Station Code":="HR Employees"."Station Code";
                // "Global Dimension 2 Code":="HR Employees"."Global Dimension 2 Code";
                LeaveJournalLine."No. of Days" := Balance;


                LeaveJournalLine.Insert();
            end;
        }
    }


    requestpage
    {

        layout { }

        actions { }
    }


    labels { }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
        CompanyName := CompInfo.Name;
        CompAddress := CompInfo.Address;

    end;

    var
        LeaveLedger: Record "HR Leave Ledger Entries";
        Days: Decimal;
        CompAddress: Text;
        CompanyName: Text;
        LineN: Integer;
        DaysTocarryforward: Decimal;
        CompInfo: Record "Company Information";
        Balance: Decimal;
        LeaveJournalLine: Record "HR Leave Journal Line";
        Daysgreaterthanzero: Decimal;
}
