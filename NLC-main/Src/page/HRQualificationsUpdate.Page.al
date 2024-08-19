page 50037 "HR Qualifications Update"
{
    ApplicationArea = All;
    Caption = 'Academic Qualification Update';
    PageType = Card;
    SourceTable = "HR Emp Qualification Changes";
    PromotedActionCategories = 'New,Report,Process,Workflow Process,Update Changes,Comments,Doc Attachment';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Qualfi Code"; "Qualfi Code")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the Qualification number';
                }

                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Employee Status"; Rec."Employee Status")
                {
                    ToolTip = 'Specifies the value of the Employee Status field.';
                }
                field("Course of Study"; Rec."Course of Study")
                {
                    ToolTip = 'Specifies the value of the Course of Study field.';
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }

                field("Qualification Description"; Rec."Qualification Description")
                {
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field("Course Grade"; Rec."Course Grade")
                {
                    ToolTip = 'Specifies the value of the Course Grade field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ToolTip = 'Specifies the value of the Institution/Company field.';
                }
                field(Score; Score)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the score';
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the document status';
                }
                field(Posted; Posted)
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies if the document is updated';
                }
            }

        }

    }
    actions
    {
        area(Processing)
        {

            action("Send Approval")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the send approval entry of the document';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category4;
                Enabled = NoT OpenApprovalEntriesExist;
                PromotedOnly = true;
                Image = SendApprovalRequest;

                trigger OnAction();
                var
                    CustomAppr: Codeunit "Custom Approvals Codeunit";
                    Varvariant: Variant;
                    TransferLines: Record "HR Employee Transfer Lines";
                    EmplTransfer: Record "Employee Transfers";
                begin
                    Varvariant := Rec;
                    if CustomAppr.CheckApprovalsWorkflowEnabled(Varvariant) then
                        CustomAppr.OnSendDocForApproval(Varvariant);


                end;
            }
            action("Cancel Approval")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Enabled = OpenApprovalEntriesExist;
                PromotedIsBig = true;
                ToolTip = 'Specifies the cancel of Approval Entries of the document';
                Image = CancelApprovalRequest;

                trigger OnAction();
                var
                    CustomeAppro: Codeunit "Custom Approvals Codeunit";
                    Varvarient: Variant;
                    AppraisaComme: Record "HR Appraisal Comments";
                begin
                    rec.TestField(Status, Rec.Status::"Pending Approval");
                    Varvarient := Rec;
                    CustomeAppro.OnCancelDocApprovalRequest(Varvarient);
                    AppraisaComme.Reset();
                    AppraisaComme.SetRange(AppraisaComme."Sal No.", Rec."Employee No.");
                    AppraisaComme.SetRange(Commented, false);
                    if AppraisaComme.FindFirst() then begin
                        repeat
                            AppraisaComme.Commented := true;
                            AppraisaComme.Modify();
                        until AppraisaComme.Next() = 0;
                    end;
                    Message('You have cancelled Qualications of the employee');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                ToolTip = 'Specifies the Approval entries of the document';
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(rec.RecordId);
                end;
            }
            action("Re-open Document")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    // if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                    //     Error('cancell the approval Request');
                    if Confirm('Do you want to reopen this document?') = true then begin
                        rec.Status := rec.Status::Open;
                        Rec.Modify();
                        Message('Document Reopend successfully');
                        CurrPage.Close();
                    end;

                end;
            }
            action("Reject Approval")
            {
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                ToolTip = 'Specifis the rejection of the document';
                PromotedCategory = Category4;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    AppraisaComme: Record "HR Appraisal Comments";
                begin
                    if Rec.Status = Rec.Status::"Pending Approval" then
                        Error('kindly cancell the approval request and reject the application');
                    AppraisaComme.Reset();
                    AppraisaComme.SetRange(AppraisaComme."Sal No.", Rec."Employee No.");
                    AppraisaComme.SetRange(Commented, false);
                    if not AppraisaComme.FindFirst() then
                        Error('Appraisal Comments Must have a value');
                    if Confirm('Do you want to reject this applicaiton?') = true then begin
                        Rec.Status := Rec.Status::Rejected;
                        Rec.Modify();
                        AppraisaComme.Reset();
                        AppraisaComme.SetRange(AppraisaComme."Sal No.", Rec."Employee No.");
                        AppraisaComme.SetRange(Commented, false);
                        if AppraisaComme.Find('-') then begin
                            repeat
                                AppraisaComme.Commented := true;
                                AppraisaComme.Modify();
                            until AppraisaComme.Next() = 0;
                        end;
                        Message('Application Has been rejected');
                    end;

                end;
            }
            action("Update Changes")
            {
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Post;
                ToolTip = 'Specifies the action to Update Changes';
                trigger OnAction()
                var
                    HrQuali: Record "HR Employee Qualifications";
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Status::Approved);
                    if Confirm('Do you want to add Employee Qualifications?') = true then begin
                        HrQuali.Reset();
                        if HrQuali.FindLast() then begin
                            HrQuali.Init();
                            HrQuali."Employee No." := Rec."Employee No.";
                            HrQuali."Course Grade" := rec."Course Grade";
                            HrQuali."Line No." := HrQuali."Line No." + 1;
                            HrQuali.Score := Rec.Score;
                            HrQuali."Qualification Code" := Rec."Qualification Code";
                            HrQuali."Qualification Type" := Rec."Qualification Type";
                            HrQuali."Qualification Description" := Rec."Qualification Description";
                            HrQuali.Comment := Rec.Comment;
                            HrQuali."From Date" := Rec."From Date";
                            HrQuali."To Date" := Rec."To Date";
                            HrQuali."Institution/Company" := Rec."Institution/Company";
                            HrQuali.Insert(true);
                        end else begin
                            HrQuali.Init();
                            HrQuali."Employee No." := Rec."Employee No.";
                            HrQuali."Course Grade" := rec."Course Grade";
                            HrQuali."Line No." := HrQuali."Line No." + 1;
                            HrQuali.Score := Rec.Score;
                            HrQuali."Qualification Code" := Rec."Qualification Code";
                            HrQuali."Qualification Type" := Rec."Qualification Type";
                            HrQuali."Qualification Description" := Rec."Qualification Description";
                            HrQuali.Comment := Rec.Comment;
                            HrQuali."From Date" := Rec."From Date";
                            HrQuali."To Date" := Rec."To Date";
                            HrQuali."Institution/Company" := Rec."Institution/Company";
                            HrQuali.Insert(true);
                        end;
                        Rec.Posted := true;
                        Rec.Modify();
                        Message('Qualifications Added successfully');
                        CurrPage.Close();
                    end;

                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category7;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                    HrQuali: Record "HR Emp Qualification Changes";
                begin
                    HrQuali.Reset();
                    HrQuali.SetRange("Qualfi Code", rec."Qualfi Code");
                    if HrQuali.FindFirst() then begin
                        RecRef.GetTable(HrQuali);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                end;

            }

            action(TestReport)
            {
                ApplicationArea = all;
                PromotedOnly = true;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                trigger OnAction()
                var
                    prefix: Option " ",Prof,Doctor,Mr,Mrs,Miss,Ms;
                    applicantNumber: Text;
                    surname: Text;
                    minimumAcademicQualification: Code[50];
                    specializationArea: Text;
                    SkillsandCompetence: Text;
                    phonenumber2: Text;
                    HighestAcademicLevel: Code[50];
                    WorkExperience: Integer;
                    managementYears: Integer;
                    isdisable: Boolean;
                    postalcodes: Code[50];
                    firstname: Text;
                    disabilitysummary: Text[50];
                    disabilitycertificatet: Code[50];
                    address: Code[50];
                    maritalstatus: Option " ",Single,Married,Divorced,Others,Widowed,Separated;
                    krapin: Text;
                    othernames: Text;
                    gender: Option " ",Male,Female,Other;
                    idnumber: Integer;
                    passportnumber: Text;
                    nationality: Text;
                    mobilephonenumber: Text;
                    religion: Option " ",Christianity,Islam,Hinduism,Buddhism,"Folk Religion",Others;
                    dateofbirth: Date;
                    ethnicity: Text;
                    countyofresidence: Text;
                    ERecruitment: Codeunit eRecruitment;
                    Sttes: Text;
                begin
                    Sttes := ERecruitment.FnApplicantProfileRegistration(prefix::Doctor, '009', 'Kaimor', 'Sharks', 'Nickel', gender::Male, 3, '', '', religion::Christianity, 19980707D, '', '', '', '', '', maritalstatus::Married, '', '', '', '', false, '', 1, 2, 'DEGREE', '', '', '');
                    Message(Sttes);
                end;
            }

            action("Appraisal Comments")
            {
                ApplicationArea = Basic, Suite;
                Image = ViewComments;
                Caption = 'Comments';
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                RunObject = Page "Hr Appraisal Comments";
                RunPageLink = "Sal No." = field("Employee No.");
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        SetControlAppearance();
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        SetControlAppearance();
    end;

    local procedure SetControlAppearance()
    var

    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        if Rec.Status <> Status::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

}
