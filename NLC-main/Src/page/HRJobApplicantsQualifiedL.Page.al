#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193424 "HR Job Applicants Qualified L"
{
    ApplicationArea = Basic;
    CardPageId = "HR Job Applicants Qualified Ca";
    Editable = false;
    PageType = List;
    SourceTable = "HR Job Applications";
    SourceTableView = where(Qualified = filter(true),
                            Uploaded = const(false));
    UsageCategory = Lists;
    Caption = 'HR Job Applicants Qualified L';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application Ref. No.';
                    ToolTip = 'Specifies the value of the Application Ref. No. field.';
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job ID';
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("From Time"; Rec."From Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Time field.';
                }
                field("To Time"; Rec."To Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Time field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation Sent field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Applicant)
            {
                Caption = 'Applicant';
                action("Send Interview Invitation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Interview Invitation';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Send Interview Invitation action.';
                    trigger OnAction()
                    var
                        FN: Text;
                    begin
                        Rec.TestField(Rec.Qualified, true);
                        Rec.TestField(Rec."Date of Interview");
                        Rec.TestField(Rec."From Time");
                        Rec.TestField(Rec."To Time");
                        Rec.TestField(Rec.Venue);


                        FN := Rec."First Name" + ' ' + Rec."Middle Name" + ' ' + Rec."Last Name";
                        if not Confirm(Text002, false, FN) then
                            exit;



                        if Rec."Interview Invitation Sent" = true then
                            Error('Applicant has already been notified');
                        HRJobApplications.Reset();
                        HRJobApplications.SetRange(HRJobApplications."Job Application No.", Rec."Job Application No.");
                        CurrPage.SetSelectionFilter(HRJobApplications);

                        if HRJobApplications.Find('-') then
                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset();
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Interview Invitations");
                        if not HREmailParameters.Find('-') then
                            Error('Please setup Email Parameters');
                        begin
                            repeat
                                HRJobApplications.TestField(HRJobApplications."E-Mail");
                                EmailMessage.Create(HRJobApplications."E-Mail",
                                HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + '<BR><br>' + HREmailParameters.Body + ' '
                                + HRJobApplications."Job Applied for Description" + ' ' + 'applied on ' + Format(Rec."Date Applied") + ' ' + HREmailParameters."Body 2" + '<br>'
                                + HREmailParameters."Body 3" + ' ' + Format(HRJobApplications."Date of Interview") + ' '
                                + 'Starting at ' + Format(HRJobApplications."From Time") + ' to ' + Format(HRJobApplications."To Time") + ' Venue ' + HRJobApplications.Venue
                                + '<br><br>Best Regards' + '<br>' + CompanyName, true);

                                Email.Send(EmailMessage);
                            until HRJobApplications.Next() = 0;

                            Rec."Interview Invitation Sent" := true;
                            Rec.Modify();
                            Message('%1 has been invited for the Interview Invitation via E-Mail ', FN)
                        end;
                    end;
                }
                action("Job Interview details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Interview details';
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "HR Job Interview";
                    RunPageLink = "Applicant No" = field("Job Application No.");
                    ToolTip = 'Executes the Job Interview details action.';
                }
                action("Job Applicant Card")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Applicant Card';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "HR Job Applications Card";
                    RunPageLink = "Job Application No." = field("Job Application No.");
                    ToolTip = 'Executes the Job Applicant Card action.';
                }
                action("Applicant Qualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicant Qualifications';
                    Image = QualificationOverview;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = page "HR Applicant Qualifications";
                    RunPageLink = "Application No" = field("Job Application No.");
                    ToolTip = 'Executes the Applicant Qualifications action.';
                }
                action("Applicant Referees")
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicant Referees';
                    Image = ContactReference;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = page "HR Applicant Referees";
                    RunPageLink = "Application No." = field("Employee Requisition No");
                    ToolTip = 'Executes the Applicant Referees action.';
                }
                action("Applicant Hobbies")
                {
                    ApplicationArea = Basic;
                    Caption = 'Applicant Hobbies';
                    Image = Holiday;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = page "HR Applicant Hobbies";
                    RunPageLink = "Job Application No" = field("Employee Requisition No");
                    ToolTip = 'Executes the Applicant Hobbies action.';
                }
                action("Upload to Employees")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = report "HR Applicant to Employee";
                    Visible = false;
                    ToolTip = 'Executes the Upload to Employees action.';
                }
            }
        }
    }

    var
        Text001: Label 'Are you sure you want to upload "%1" to the Employee List?';
        Text002: Label 'Are you sure you want to Send this Interview invitation to\%1?';
        HRJobApplications: Record "HR Job Applications";
        //ApprovalmailMgt: Codeunit "Approvals Mgt Notification";
        //SMTP: Codeunit "SMTP Mail";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        CTEXTURL: Text[30];
        HREmailParameters: Record "HR E-Mail Parameters";
        Interview: Record "HR Job Interview";
        fn: Text;
}
