#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193448 "HR Employee Requisition Card"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,WorkfloWs,Requisition,Document Attachment,Workflow Process';
    SourceTable = "HR Employee Requisitions";
    ApplicationArea = All;
    Caption = 'HR Employee Requisition Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = VAluesRE;
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }

                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Request field.';
                }
                field("Type of Contract Required"; Rec."Type of Contract Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Contract Required field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Required Positions field.';
                }
                field("Opening Date"; Rec."Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Date field.';
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Closing Date field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                }
                field(Advertised; Rec.Advertised)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertised field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    Caption = 'Captured By';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Captured By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Additional Information")
            {
                Editable = VAluesRE;
                Caption = 'Additional Information';
                field("Any Additional Information"; Rec."Any Additional Information")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Any Additional Information field.';
                }
                field("Reason for Request(Other)"; Rec."Reason for Request(Other)")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason for Request(Other) field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755020; Outlook) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Workflow Process")
            {
                Caption = 'Workflow Process';

                action("&Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::New);

                        if Confirm('Send this Requisition for Approval?', true) = false then
                            exit;


                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendEmpRequisitionApprovalRequest(Rec);
                        CurrPage.Close();
                    end;
                }
                action("&Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        rec.TestField(Status, rec.Status::"Pending Approval");
                        if Confirm('Cancel Approval Request?', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action("Reopen Document")
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Caption = 'Reopen Document';
                    PromotedOnly = true;
                    ToolTip = 'Executes the Reopen Document action.';
                    trigger OnAction()
                    begin
                        if (Rec.Status = Rec.Status::Rejected) or (rec.Status = rec.Status::Approved) then begin
                            Rec.Status := Rec.Status::New;
                            rec.Advertised := false;
                            Rec.Modify();
                            Message('Document has been Re-Openned');
                            CurrPage.Close();
                        end;
                    end;
                }
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
            }
            group(Requisition)
            {
                Caption = 'Requisition';
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = JobListSetup;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "HR Job Requirement Lines(RO)";
                    RunPageLink = "Job ID" = field("Job ID");
                    ToolTip = 'Executes the Requirements action.';
                }
                action(Responsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = field("Job ID");
                    ToolTip = 'Executes the Responsibilities action.';
                }
                action(Advertise)
                {
                    ApplicationArea = Basic;
                    Caption = 'Advertise';
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Advertise action.';
                    trigger OnAction()
                    var
                        msg: Text;
                        CompanyIInf: Record "Company Information";
                        EmailManger: Codeunit "Email Message";
                        CurrName: Text;
                    begin
                        rec.TestField(rec."Closing Date");
                        CompanyIInf.get();
                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        if Confirm(Text0001, false, Rec."Job ID", Rec."Job Description") = false then
                            exit;
                        HREmailParameters.Reset();
                        HREmailParameters.SetRange("Associate With", HREmailParameters."Associate With"::"Vacancy Advertisements");
                        if HREmailParameters.FindFirst() then begin
                            HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                            HREmp.SetFilter(HREmp."Contract Type", '<>%1', (HREmp."Contract Type"::Intern));
                            HREmp.SetRange(HREmp."No.", 'NLC20150178');
                            if HREmp.Find('-') then begin
                                repeat
                                    CurrName := HREmp."First Name";
                                    if HREmp."First Name" = '' then
                                        CurrName := HREmp."Middle Name";
                                    //Kkaimor Mails
                                    msg := 'Dear' + CurrName + 'Job ' + rec."Job Description" + ' has been Advertised kindly visit ' + CompanyIInf."Home Page" + ' to apply.The Deadline for submssion will be on ' + Format(rec."Closing Date") + '';
                                    EmailManger.Create(HREmp."Company E-Mail", HREmailParameters."Sender Name", msg, true);
                                    Email.Send(EmailManger, Enum::"Email Scenario"::Default);
                                    Message('[%1] Employees have been notified about this vacancy', HREmp.Count);
                                until HREmp.Next() = 0;
                            end;
                        end;
                        Rec.Advertised := true;
                        Rec.Modify();
                        CurrPage.Close();
                    end;
                }
                action(Attachment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Portal Attachment';
                    Image = attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Attachment action.';
                    trigger OnAction()
                    begin
                        DMSInt.Reset();
                        DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."DMS Link Type"::"Emp Req");
                        if DMSInt.Find('-') then
                            Hyperlink(DMSInt."DMS Link Path" + Rec."Requisition No.");
                    end;
                }
                action("BC Attchements")
                {
                    ApplicationArea = all;
                    Caption = 'Bc Attachment';
                    Image = attach;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;

                }
                action("Mark as Closed/Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mark as Closed/Open';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Mark as Closed/Open action.';
                    trigger OnAction()
                    begin
                        if Rec.Closed then begin
                            if not Confirm('Are you sure you want to Re-Open this Document', false) then
                                exit;
                            Rec.Closed := false;
                            Rec.Modify();
                            Message('Employee Requisition %1 has been Re-Opened', Rec."Requisition No.");

                        end else begin
                            if not Confirm('Are you sure you want to close this Document', false) then
                                exit;
                            Rec.Closed := true;
                            rec.Advertised := false;
                            Rec.Modify();
                            Message('Employee Requisition %1 has been marked as Closed', Rec."Requisition No.");
                        end;
                        CurrPage.Close();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        UpdateControls();
    end;

    var
        //DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL;
        DocumentType: Enum "Approval Document Type";
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        HREmpReq: Record "HR Employee Requisitions";
        //SMTP: Codeunit "SMTP Mail";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        HRSetup: Record "HR Setup";
        CTEXTURL: Text[30];
        HREmp: Record "HR Employees";
        HREmailParameters: Record "HR E-Mail Parameters";
        ContractDesc: Text[30];
        VAluesRE: Boolean;
        HRLookupValues: Record "HR Lookup Values";
        DimValue: Record "Dimension Value";
        objEmp: Record "HR Employees";
        OpenApprovalEntriesExist: Boolean;
        Text0001: Label 'Advertise Job position [ %1  - %2 ]to ALL staff and Notify them on Email?';
        DMSInt: Record DMS;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";


    procedure TESTFIELDS()
    begin
        Rec.TestField(Rec."Job ID");
        Rec.TestField(Rec."Closing Date");
        Rec.TestField(Rec."Type of Contract Required");
        Rec.TestField(Rec."Requisition Type");
        Rec.TestField(Rec."Required Positions");
        if Rec."Reason For Request" = Rec."Reason For Request"::Other then
            Rec.TestField(Rec."Reason for Request(Other)");
        Rec.TestField(Rec."Responsibility Center");
    end;

    local procedure UpdateControls()
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);

        if Rec.Status <> Rec.Status::New then
            VAluesRE := false
        else
            VAluesRE := true;
    end;
}
