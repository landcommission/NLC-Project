#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Codeunit Insurance Notifications (ID 50005).
/// </summary>
codeunit 70000 "Insurance Notifications"
{

    trigger OnRun()
    begin
        InsuranceNotifications(ObjInsurance, '', Today);
        //TenderOpeningNotifications(ProcurementRequest);
    end;

    var
        SMTP: Codeunit "Email Message";
        TemplateFile: File;
        SenderName: Text[100];
        SenderAddress: Text[100];
        Recipient: Text[100];
        Subject: Text[100];
        Body: Text[1024];
        InStreamTemplate: InStream;
        InSReadChar: Text[1];
        CharNo: Text[4];
        I: Integer;
        FromUser: Text[100];
        MailCreated: Boolean;
        HRSEtup: Record "Human Resources Setup";
        Text001: Label 'Sales %1';
        Text002: Label 'Purchase %1';
        Text003: Label 'requires your approval.';
        Text004: Label 'To view your documents for approval, please use the following link:';
        Text005: Label 'Customer';
        Text007: Label 'Microsoft Dynamics NAV: %1 Mail';
        Text008: Label 'Approval';
        Text009: Label 'Cancellation';
        Text010: Label 'Rejection';
        Text011: Label 'Delegation';
        Text012: Label 'Overdue Approvals';
        Text013: Label 'Mwalimu Sacco Microsoft Dynamics NAV Document Approval System';
        Text014: Label 'has been cancelled.';
        Text015: Label 'To view the cancelled document, please use the following link:';
        Text016: Label 'has been rejected.';
        Text017: Label 'To view the rejected document, please use the following link:';
        Text018: Label 'Vendor';
        Text020: Label 'has been delegated.';
        Text021: Label 'To view the delegated document, please use the following link:';
        Text022: Label 'Overdue approval';
        Text030: Label 'Not yet overdue';
        Text033: Label 'Rejection comments:';
        Text040: Label 'You must import an Approval Template in Approval Setup.';
        Text041: Label 'You must import an Overdue Approval Template in Approval Setup.';
        Text042: Label 'Available Credit Limit (LCY)';
        Text043: Label 'Request Amount (LCY)';
        Text044: Label 'Times U Sacco Welfare: %1 Mail';
        Text045: Label 'Event Notification';
        Text046: Label 'Microsoft Dynamics NAV Event Notification System';
        Text047: Label 'Event ID :';
        Text048: Label 'Requires your attention';
        Text049: Label 'Welfare Message';
        Text050: Label ' Event Venue';
        Text051: Label ' .Kindly Contact the HR if you have any comments/queries regarding this event/activity';
        CompanyInformation: Record "Company Information";
        ObjInsurance: Record Insurance;
    //ProcurementRequest: Record "Procurement Request";


    procedure SendLeaveAppApprovalsMail(HRLeaveApp: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    begin
        SetTemplate(ApprovalEntry);
        Subject := StrSubstNo(Text007, Text008);
        Body := Text013;

        //SMTP.Create(SenderName, SenderAddress, Recipient, Subject, Body, true);
        Body := '';

        while InStreamTemplate.EOS() = false do begin
            InStreamTemplate.ReadText(InSReadChar, 1);
            if InSReadChar = '%' then begin
                //SMTP.AppendToBody(Body);
                Body := InSReadChar;
                if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
                if (InSReadChar >= '0') and (InSReadChar <= '9') then begin
                    Body := Body + '1';
                    CharNo := InSReadChar;
                    while (InSReadChar >= '0') and (InSReadChar <= '9') do begin
                        if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
                        if (InSReadChar >= '0') and (InSReadChar <= '9') then
                            CharNo := CharNo + InSReadChar;
                    end;
                end else
                    Body := Body + InSReadChar;
                FillLeaveApprovalNotMail(Body, CharNo, HRLeaveApp, ApprovalEntry, 0);
                //SMTP.AppendToBody(Body);
                Body := InSReadChar;
            end else begin
                Body := Body + InSReadChar;
                I := I + 1;
                if I = 500 then begin
                    //SMTP.AppendToBody(Body);
                    Body := '';
                    I := 0;
                end;
            end;
        end;
        //SMTP.AppendToBody(Body);
        //SMTP.Send;
    end;


    procedure SendLeaveAppCancellationsMail(HRLeaveApp: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    begin

        if MailCreated then begin
            GetEmailAddress(ApprovalEntry);
            if Recipient <> SenderAddress then
                //SMTP.AddCC(Recipient);
                Message('');
        end else begin
            SetTemplate(ApprovalEntry);
            Subject := StrSubstNo(Text007, Text009);
            Body := Text013;

            //SMTP.Create(SenderName, FromUser, SenderAddress, Subject, Body, true);
            if Recipient <> SenderAddress then
                //SMTP.AddCC(Recipient);

                Body := '';

            while InStreamTemplate.EOS() = false do begin
                InStreamTemplate.ReadText(InSReadChar, 1);
                if InSReadChar = '%' then begin
                    //SMTP.AppendToBody(Body);
                    Body := InSReadChar;
                    if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
                    if (InSReadChar >= '0') and (InSReadChar <= '9') then begin
                        Body := Body + '1';
                        CharNo := InSReadChar;
                        while (InSReadChar >= '0') and (InSReadChar <= '9') do begin
                            if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
                            if (InSReadChar >= '0') and (InSReadChar <= '9') then
                                CharNo := CharNo + InSReadChar;
                        end;
                    end else
                        Body := Body + InSReadChar;
                    FillLeaveApprovalNotMail(Body, CharNo, HRLeaveApp, ApprovalEntry, 1);
                    //SMTP.AppendToBody(Body);
                    Body := InSReadChar;
                end else begin
                    Body := Body + InSReadChar;
                    I := I + 1;
                    if I = 500 then begin
                        //SMTP.AppendToBody(Body);
                        Body := '';
                        I := 0;
                    end;
                end;
            end;
            //SMTP.AppendToBody(Body);
            MailCreated := true;
        end;
    end;

    procedure SendLeaveRejectionsMail(HRLeaveApp: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    var
        AppCommentLine: Record "Approval Comment Line";
    begin

        if MailCreated then begin
            GetEmailAddress(ApprovalEntry);
            if Recipient <> SenderAddress then
                //SMTP.AddCC(Recipient);
                Message('');
            SetTemplate(ApprovalEntry);
            Subject := StrSubstNo(Text007, Text010);
            Body := Text013;

            //SMTP.Create(SenderName, FromUser, SenderAddress, Subject, Body, true);
            //SMTP.AddCC(Recipient);
            Body := '';

            while InStreamTemplate.EOS() = false do begin
                InStreamTemplate.ReadText(InSReadChar, 1);
                if InSReadChar = '%' then begin
                    //SMTP.AppendToBody(Body);
                    Body := InSReadChar;
                    if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
                    if (InSReadChar >= '0') and (InSReadChar <= '9') then begin
                        Body := Body + '1';
                        CharNo := InSReadChar;
                        while (InSReadChar >= '0') and (InSReadChar <= '9') do begin
                            if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
                            if (InSReadChar >= '0') and (InSReadChar <= '9') then
                                CharNo := CharNo + InSReadChar;
                        end;
                    end else
                        Body := Body + InSReadChar;
                    FillLeaveApprovalNotMail(Body, CharNo, HRLeaveApp, ApprovalEntry, 2);
                    //SMTP.AppendToBody(Body);
                    Body := InSReadChar;
                end else begin
                    Body := Body + InSReadChar;
                    I := I + 1;
                    if I = 500 then begin
                        //SMTP.AppendToBody(Body);
                        Body := '';
                        I := 0;
                    end;
                end;
            end;
            //SMTP.AppendToBody(Body);

            // Append Comment Lines
            ApprovalEntry.CalcFields(Comment);
            if ApprovalEntry.Comment then begin
                AppCommentLine.SetCurrentKey("Table ID", "Document Type", "Document No.");
                AppCommentLine.SetRange("Table ID", ApprovalEntry."Table ID");
                AppCommentLine.SetRange("Document Type", ApprovalEntry."Document Type");
                AppCommentLine.SetRange("Document No.", ApprovalEntry."Document No.");
                if AppCommentLine.Find('-') then begin
                    Body := StrSubstNo('<p class="MsoNormal"><font face="Arial size 2"><b>%1</b></font></p>', Text033);
                    //SMTP.AppendToBody(Body);
                    repeat
                        BuildCommentLine(AppCommentLine);
                    until AppCommentLine.Next() = 0;
                end;
            end;
            MailCreated := true;
        end;
        //SMTP.Send;
    end;


    procedure SendLeaveDelegationsMail(HRLeaveApp: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    begin

        SetTemplate(ApprovalEntry);
        Subject := StrSubstNo(Text007, Text011);
        Body := Text013;

        //SMTP.Create(SenderName, FromUser, Recipient, Subject, Body, true);
        //SMTP.AddCC(SenderAddress);
        Body := '';

        while InStreamTemplate.EOS() = false do begin
            InStreamTemplate.ReadText(InSReadChar, 1);
            if InSReadChar = '%' then begin
                //SMTP.AppendToBody(Body);
                Body := InSReadChar;
                if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
                if (InSReadChar >= '0') and (InSReadChar <= '9') then begin
                    Body := Body + '1';
                    CharNo := InSReadChar;
                    while (InSReadChar >= '0') and (InSReadChar <= '9') do begin
                        if InStreamTemplate.ReadText(InSReadChar, 1) <> 0 then;
                        if (InSReadChar >= '0') and (InSReadChar <= '9') then
                            CharNo := CharNo + InSReadChar;
                    end;
                end else
                    Body := Body + InSReadChar;
                FillLeaveApprovalNotMail(Body, CharNo, HRLeaveApp, ApprovalEntry, 3);
                //SMTP.AppendToBody(Body);
                Body := InSReadChar;
            end else begin
                Body := Body + InSReadChar;
                I := I + 1;
                if I = 500 then begin
                    //SMTP.AppendToBody(Body);
                    Body := '';
                    I := 0;
                end;
            end;
        end;
        //SMTP.AppendToBody(Body);
        //SMTP.Send;
    end;


    procedure SetTemplate(AppEntry: Record "Approval Entry")
    begin
        /*AppSetup.GET;
        AppSetup.CALCFIELDS("Approval Template");
        IF NOT AppSetup."Approval Template".HASVALUE THEN
          ERROR(Text040);
        AppSetup."Approval Template".CREATEINSTREAM(InStreamTemplate);*/
        SenderName := CompanyName;
        Clear(SenderAddress);
        Clear(Recipient);
        GetEmailAddress(AppEntry);

    end;


    procedure FillLeaveApprovalNotMail(var Body: Text[254]; TextNo: Text[30]; HRLeaveApp: Record "HR Leave Application"; AppEntry: Record "Approval Entry"; CalledFrom: Option Approve,Cancel,Reject,Delegate)
    var
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application";
    begin

        case TextNo of
            '1':
                Body := StrSubstNo('', 'Leave Application');
            '2':
                Body := StrSubstNo(Body, HRLeaveApp."Application Code");
            '3':
                case CalledFrom of
                    CalledFrom::Approve:
                        Body := StrSubstNo(Body, Text003);
                    CalledFrom::Cancel:
                        Body := StrSubstNo(Body, Text014);
                    CalledFrom::Reject:
                        Body := StrSubstNo(Body, Text016);
                    CalledFrom::Delegate:
                        Body := StrSubstNo(Body, Text020);
                end;
            '4':
                case CalledFrom of
                    CalledFrom::Approve:
                        Body := '';
                    CalledFrom::Cancel:
                        Body := '';
                    CalledFrom::Reject:
                        Body := '';
                    CalledFrom::Delegate:
                        Body := '';
                end;
            '5':
                Body := '';
            '6':
                Body := '';
            '7':
                Body := StrSubstNo(Body, AppEntry.FieldCaption(Amount));
            '8':
                Body := StrSubstNo(Body, AppEntry."Currency Code");
            '9':
                Body := StrSubstNo(Body, AppEntry.Amount);
            '10':
                Body := StrSubstNo(Body, AppEntry.FieldCaption("Amount (LCY)"));
            '11':
                Body := StrSubstNo(Body, AppEntry."Amount (LCY)");
            '12':
                Body := StrSubstNo(Body, Text005);
            '13':
                Body := StrSubstNo(Body, HRLeaveApp."Application Code");
            //'14': Body := STRSUBSTNO(Body,Header.Payee);
            '15':
                Body := StrSubstNo(Body, AppEntry.FieldCaption("Due Date"));
            '16':
                Body := StrSubstNo(Body, AppEntry."Due Date");
            '17':
                Body := Text042;
            '18':
                Body := StrSubstNo(Body, AppEntry."Available Credit Limit (LCY)");
        end;
    end;


    procedure GetEmailAddress(AppEntry: Record "Approval Entry")
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(AppEntry."Sender ID");
        UserSetup.TestField("E-Mail");
        SenderAddress := UserSetup."E-Mail";
        UserSetup.Get(AppEntry."Approver ID");
        UserSetup.TestField("E-Mail");
        Recipient := UserSetup."E-Mail";
        UserSetup.Get(UserId);
        UserSetup.TestField("E-Mail");
        FromUser := UserSetup."E-Mail";
    end;


    procedure BuildCommentLine(Comments: Record "Approval Comment Line")
    var
        CommentLine: Text[500];
    begin
        CommentLine := '<p class="MsoNormal"><span style="font-family:Arial size 2">' +
          Comments.Comment + '</span></p>';
        //SMTP.AppendToBody(CommentLine);
    end;


    procedure SendLeaveApprovedMail(HRLeaveReq: Record "HR Leave Application"; ApprovalEntry: Record "Approval Entry")
    var
        CR: Char;
        LF: Char;
    begin
        SetTemplate(ApprovalEntry);

        Subject := StrSubstNo(Text007, Text008);//+'Testing -Please Ignore';
        //Body := Text013;
        //SMTP.Create(SenderName, SenderAddress, Recipient, Subject, Body, true);
        //SMTP.AppendToBody(Body);

        Body := 'Dear Sir/Madam ' + HRLeaveReq.Names;
        //SMTP.AppendToBody(Body);
        Body := 'Your leave has been approved to start from date ' + Format(HRLeaveReq."Start Date") + ' up to ' + Format(HRLeaveReq."Return Date");
        //SMTP.AppendToBody(Body);
        Body := 'your reliever is ' + HRLeaveReq."Reliever Name";
        //SMTP.AppendToBody(Body);
        //HRLeaveReq.CalcFields(HRLeaveReq.RelieverAddress);

        // //SMTP.AppendToBody(Body);
        //SMTP.AddCC(HRLeaveReq.RelieverAddress);
        //SMTP.AddCC(HRLeaveReq."Supervisor Email");
        //SMTP.Send;
        Message('Sent');
    end;


    procedure FnSendEmail(SenderEmailAddress: Text; SenderName: Text; RecepientsMail: Text; Subject: Text; Body: Text)
    var
        SMTPMail: Codeunit "Email Message";
    begin
        if (SenderEmailAddress <> '') and (RecepientsMail <> '') and (Subject <> '') then
            // SMTPMail.Create(SenderName, SenderEmailAddress, RecepientsMail, Subject, Body, true);
            //SMTPMail.Send();
            Message('');
    end;


    procedure InsuranceNotifications(Insurance: Record Insurance; InsuranceNo: Code[40]; EndDate: Date)
    var
        SenderName: Text[250];
        SenderEmailAddress: Text[250];
        Recipients: Text[250];
        Subject: Text[250];
        Body: Text[250];
    begin
        if Insurance."Expiration Date" = Today then begin
            //SenderEmailAddress := CompanyInformation."Administrator Email";
            SenderName := 'ERP SCHEDULED REMINDERS';
            Recipient := CompanyInformation."E-Mail";
            Subject := 'EXPIRY OF AN INSURANCE POLICY';
            Body := 'Please note that this insurance policy is expiring today.' + ' ' + Insurance."No.";
            Body := '<br>Kind Regards,</br>';
            Body := '<b>ERP REMINDERS</b>';
            FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
            Message('Successfully Sent');
        end;
    end;


    /* procedure TenderOpeningNotifications(ProcReq: Record "Procurement Request")
    var
        SenderName: Text[250];
        SenderEmailAddress: Text[250];
        Recipients: Text[250];
        Subject: Text[250];
        Body: Text[250];
    begin
        with ProcReq do begin
            if ProcReq."Tender Opening Date" = Today then begin
                Message(Format(ProcReq."Tender Opening Date"));
                SenderEmailAddress := CompanyInformation."Administrator Email";
                SenderName := 'ERP SCHEDULED REMINDERS';
                Recipient := CompanyInformation."E-Mail";
                Subject := 'TENDER OPENING DUE';
                Body := 'Please note that this RFQ/Tender is due for opening today.' + ' ' + ProcReq.No;
                Body := '<br>Kind Regards,</br>';
                Body := '<b>ERP REMINDERS</b>';
                FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                Message('Successfully Sent');
            end;
        end;
    end; */


    procedure CaseOpeningNotifications(CaseReq: Record "Case Register")
    var
        SenderName: Text[250];
        SenderEmailAddress: Text[250];
        Recipients: Text[250];
        Subject: Text[250];
        Body: Text[250];
    begin
        CompanyInformation.Get();
        //Recipient := CompanyInformation."Legal Head Email";
        if CaseReq."Next Hearing Date" = Today then begin
            Message(Format(CaseReq."Next Hearing Date"));
            SenderEmailAddress := 'notification@kasneb.or.ke';
            SenderName := 'ERP SCHEDULED REMINDERS';
            //Recipient := CompanyInformation."Legal Head Email";
            Subject := 'CASE HEARING OPENING DUE';
            Body := 'Please note that the  case:' + CaseReq."Case Number" + ' is due for mentioning today.';
            Body := '<br>Kind Regards,</br>';
            Body := '<b>ERP REMINDERS</b>';
            FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
            Message('Successfully Sent');
        end;
    end;
}

