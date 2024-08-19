#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193503 "HR Applicants UnQualified L"
{
    ApplicationArea = Basic;
    CardPageId = "HR Applicants UnQualified Card";
    PageType = List;
    SourceTable = "HR Job Applications";
    SourceTableView = where(Qualified = filter(false));
    UsageCategory = Lists;
    Caption = 'HR Applicants UnQualified L';
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
                    Caption = 'Job Description';
                    ToolTip = 'Specifies the value of the Job Description field.';
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
                action("Send Regret Alert")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Regret Alert';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Regret Alert action.';
                    trigger OnAction()
                    begin

                        //IF CONFIRM('Send this Requisition for Approval?',TRUE)=FALSE THEN EXIT;
                        if not Confirm(Text003, false) then
                            exit;

                        Rec.TestField(Rec.Qualified, false);
                        HRJobApplications.SetRange(HRJobApplications."Job Application No.", Rec."Job Application No.");
                        CurrPage.SetSelectionFilter(HRJobApplications);
                        if HRJobApplications.Find('-') then
                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset();
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Regret Notification");
                        if HREmailParameters.Find('-') then begin
                            repeat
                                HRJobApplications.TestField(HRJobApplications."E-Mail");
                                EmailMessage.Create(HRJobApplications."E-Mail",
                                HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' + HREmailParameters.Body + ' ' + HRJobApplications."Job Applied for Description" + ' ' + 'applied on' + ' ' + Format(Rec."Date Applied") + ' ' + HREmailParameters."Body 2", true);
                                //HREmailParameters."Body 2"+' '+ FORMAT("Date Applied")+'. '+
                                // HREmailParameters.Body,TRUE);
                                Email.Send(EmailMessage);
                            until HRJobApplications.Next() = 0;

                            Message('All Unqualified  candidates have been sent regret alerts');
                        end;
                    end;
                }
            }
        }
    }

    var
        Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
        Text002: Label 'Are you sure you want to Send this Interview invitation?';
        HRJobApplications: Record "HR Job Applications";
        //ApprovalmailMgt: Codeunit "Approvals Mgt Notification";
        //SMTP: Codeunit "SMTP Mail";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        CTEXTURL: Text[30];
        HREmailParameters: Record "HR E-Mail Parameters";
        Text003: Label 'Are you sure you want to Send Regret Notification?';
}
