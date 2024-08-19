codeunit 50036 "Scheduled Task"
{

    trigger OnRun()
    begin

    end;

    procedure fnLeaveReturnEmailNotificationToApproverAndStaff(empNo: Code[50]; leaveType: Code[50])

    begin

    end;

    procedure fnSendEmail(receiver: Text[50]; subject: Text[100]; message: Text[1000]) returnValue: Boolean
    var
        SMTPMail: Codeunit "Email Message";
        SendEmail: codeunit email;
        SendToList: List of [Text];
        HRSetup: Record "Human Resources Setup";
    begin
        HRSetup.Get();
        returnValue := FALSE;
        returnValue := false;
        SendToList.Add(receiver);
        SMTPMail.Create(SendToList, subject, message, true);
        SendEmail.Send(SMTPMail, Enum::"Email Scenario"::Default);
        returnValue := true;
    end;

    procedure fnGetApproverEmailFromApprovalEntry(empNo: Code[50]; leaveType: code[50]): Text
    var
        ApprovalEntry: Record "Approval Entry";
        HrLeaveApp: Record "HR Leave Application";
        UserSetup: Record "User Setup";
    begin
        HrLeaveApp.Reset();
        HrLeaveApp.SetRange("Employee No", empNo);
        HrLeaveApp.SetRange("Leave Type", leaveType);
        if HrLeaveApp.FindSet() then begin
            ApprovalEntry.Reset();
            ApprovalEntry.SetRange("Document No.", HrLeaveApp."Application Code");
            if ApprovalEntry.FindSet() then
                if UserSetup.Get(ApprovalEntry."Approver ID") then begin
                    UserSetup.TestField("E-Mail");
                    exit(UserSetup."E-Mail");
                end;
        end;
    end;

}
