#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193445 "Change Approved Leave Apps"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'Change Approved Leave Apps';
    dataset
    {
        dataitem("HR Leave Application"; "HR Leave Application")
        {
            DataItemTableView = where(Status = const("Pending Approval"));
            column(ReportForNavId_1; 1) { }
            column(ApplicationCode_HRLeaveApplication; "HR Leave Application"."Application Code") { }
            column(LeaveType_HRLeaveApplication; "HR Leave Application"."Leave Type") { }
            column(DaysApplied_HRLeaveApplication; "HR Leave Application"."Days Applied") { }
            column(StartDate_HRLeaveApplication; "HR Leave Application"."Start Date") { }
            column(ReturnDate_HRLeaveApplication; "HR Leave Application"."Return Date") { }
            column(ApplicationDate_HRLeaveApplication; "HR Leave Application"."Application Date") { }
            column(Status_HRLeaveApplication; "HR Leave Application".Status) { }
            column(AppEntry; AppEntry) { }

            trigger OnAfterGetRecord()
            begin
                AppEntry := '';

                ApprovalEntry.Reset();
                ApprovalEntry.SetCurrentKey("Table ID", "Document Type", "Document No.", "Sequence No.");
                ApprovalEntry.SetRange(ApprovalEntry."Document No.", "HR Leave Application"."Application Code");
                if ApprovalEntry.Find('-') then
                    repeat
                        if ApprovalEntry.Status <> ApprovalEntry.Status::Approved then
                            CurrReport.Skip();
                    until ApprovalEntry.Next() = 0;

                AppEntry := Format(ApprovalEntry.Status);

                //error("HR Leave Application"."Application Code");
                "HR Leave Application".Status := "HR Leave Application".Status::Approved;
                "HR Leave Application".Modify();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        ApprovalEntry: Record "Approval Entry";
        AppEntry: Text;
}
