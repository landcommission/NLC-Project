#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194128 "HR Interview Candidates List"
{
    CardPageId = "HR Job Applications Card";
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Applicant,Functions,Print';
    SourceTable = "HR Job Applications";
    SourceTableView = where(Qualified = filter(true));
    ApplicationArea = All;
    Caption = 'HR Interview Candidates List';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Applied For field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualified field.';
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation Sent field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1102755009; "HR Job Applications Factbox")
            {
                SubPageLink = "Job Application No." = field("Job Application No.");
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
                action("Job Interview details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Interview details';
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "HR Job Interview";
                    RunPageLink = "Applicant No" = field("Job Application No.");
                    ToolTip = 'Executes the Job Interview details action.';
                }
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "HR Job Applications Card";
                    RunPageLink = "Job Application No." = field("Job Application No.");
                    ToolTip = 'Executes the Card action.';
                }
                action("&Upload to Employee Card")
                {
                    ApplicationArea = Basic;
                    Caption = '&Upload to Employee Card';
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Upload to Employee Card action.';

                }
                action("Send Interview Invitation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Interview Invitation';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Interview Invitation action.';
                    trigger OnAction()
                    begin

                        //IF CONFIRM('Send this Requisition for Approval?',TRUE)=FALSE THEN EXIT;
                        if not Confirm(Text002, false) then
                            exit;

                        Rec.TestField(Rec.Qualified, true);
                        HRJobApplications.SetRange(HRJobApplications."Job Application No.", Rec."Job Application No.");
                        if HRJobApplications.Find('-') then
                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset();
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Vacancy Advertisements");
                        if HREmailParameters.Find('-') then begin
                            repeat
                                HRJobApplications.TestField(HRJobApplications."E-Mail");
                                EmailMessage.Create(HRJobApplications."E-Mail",
                                HREmailParameters.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' + HREmailParameters.Body + HRJobApplications."Job Applied For" + 'applied on' + Format(Rec."Date Applied") + ' ' + HREmailParameters."Body 2", true);
                                //HREmailParameters."Body 2"+' '+ FORMAT("Date Applied")+'. '+
                                // HREmailParameters.Body,TRUE);
                                Email.Send(EmailMessage);
                            until HRJobApplications.Next() = 0;

                            Message('All Qualified shortlisted candidates have been invited for the interview ');
                        end;
                    end;
                }
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "HR Applicant Qualifications";
                    RunPageLink = "Application No" = field("Job Application No.");
                    ToolTip = 'Executes the Qualifications action.';
                }
                action(Referees)
                {
                    ApplicationArea = Basic;
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "HR Applicant Referees";
                    RunPageLink = "Application No." = field("Employee Requisition No");
                    ToolTip = 'Executes the Referees action.';
                }
                action(Hobbies)
                {
                    ApplicationArea = Basic;
                    Caption = 'Hobbies';
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "HR Applicant Hobbies";
                    RunPageLink = "Job Application No" = field("Job Application No.");
                    ToolTip = 'Executes the Hobbies action.';
                }
            }
        }
    }

    var
        HRJobApplications: Record "HR Job Applications";
        Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
        Text002: Label 'Are you sure you want to Send this Interview invitation?';
        //ApprovalmailMgt: Codeunit "Approvals Mgt Notification";
        //SMTP: Codeunit "SMTP Mail";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        CTEXTURL: Text[30];
        HREmailParameters: Record "HR E-Mail Parameters";
}
