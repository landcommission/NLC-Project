#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193482 "HR Leave Statement1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Statement1.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Leave Statement1';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_6075; 6075) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; "HR Employees"."Employee UserID") { }
            column(HR_Employees__No__; "HR Employees"."No.") { }
            column(HR_Employees__FullName; "HR Employees"."Full Name") { }
            column(HR_Employees__HR_Employees___Leave_Balance_; "HR Employees"."Leave Balance") { }
            column(EmployeeCaption; EmployeeCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Employee_Leave_StatementCaption; Employee_Leave_StatementCaptionLbl) { }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl) { }
            column(HR_Employees__No__Caption; "HR Employees".FieldCaption("HR Employees"."No.")) { }
            column(NameCaption; NameCaptionLbl) { }
            column(Leave_BalanceCaption; Leave_BalanceCaptionLbl) { }
            column(Day_s_Caption; Day_s_CaptionLbl) { }
            column(Picture; CompanyInformation.Picture) { }
            column(Tel; CompanyInformation."Phone No.") { }
            column(Company_Email; CompanyInformation."E-Mail") { }
            column(Website; CompanyInformation."Home Page") { }
            column(floor; CompanyInformation."Ship-to Address 2") { }
            column(Locations; CompanyInformation.City) { }
            column(addess2; CompanyInformation."Address 2") { }
            column(Adress; CompanyInformation.Address) { }
            column(County; CompanyInformation.County) { }
            column(Name; CompanyInformation.Name) { }
            column(NLCWeb; CompanyInformation."NLC Website") { }
            column(No; No) { }
            dataitem("HR Leave Ledger Entries"; "HR Leave Ledger Entries")
            {
                DataItemLink = "Staff No." = field("No.");
                DataItemTableView = sorting("Entry No.");
                RequestFilterFields = "Leave Type", "Leave Calendar Code";
                column(ReportForNavId_4961; 4961) { }
                column(HR_Leave_Ledger_Entries__Leave_Period_; "HR Leave Ledger Entries"."Leave Calendar Code") { }
                column(HR_Leave_Ledger_Entries__Leave_Entry_Type_; "HR Leave Ledger Entries"."Leave Entry Type") { }
                column(HR_Leave_Ledger_Entries__Leave_Type_; "HR Leave Ledger Entries"."Leave Type") { }
                column(HR_Leave_Ledger_Entries__No__of_days_; "HR Leave Ledger Entries"."No. of days") { }
                column(HR_Leave_Ledger_Entries__Leave_Posting_Description_; "HR Leave Ledger Entries"."Leave Posting Description") { }
                column(HR_Leave_Ledger_Entries__Posting_Date_; "HR Leave Ledger Entries"."Posting Date") { }
                column(HR_Leave_Ledger_Entries__Leave_Entry_Type_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Leave Entry Type")) { }
                column(HR_Leave_Ledger_Entries__Leave_Type_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Leave Type")) { }
                column(HR_Leave_Ledger_Entries__No__of_days_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."No. of days")) { }
                column(HR_Leave_Ledger_Entries__Leave_Posting_Description_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Leave Posting Description")) { }
                column(HR_Leave_Ledger_Entries__Posting_Date_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Posting Date")) { }
                column(HR_Leave_Ledger_Entries_Entry_No_; "HR Leave Ledger Entries"."Entry No.") { }
                column(HR_Leave_Ledger_Entries_Staff_No_; "HR Leave Ledger Entries"."Staff No.") { }

                trigger OnAfterGetRecord()
                begin
                    No := No + 1;
                end;

            }

        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        // CI.GET();
        // CI.CALCFIELDS(CI.Picture);
        CompanyInformation.Get();
        CompanyInformation.CalcFields(CompanyInformation.Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        LeaveBalance: Decimal;
        EmployeeCaptionLbl: Label 'Employee';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employee_Leave_StatementCaptionLbl: Label 'Employee Leave Statement';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        NameCaptionLbl: Label 'Name';
        Leave_BalanceCaptionLbl: Label 'Leave Balance';
        Day_s_CaptionLbl: Label 'Day(s)';
        No: Decimal;
}
