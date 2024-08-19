#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 52194060 "HR Training Needs Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Workflow Process,Training Cost';
    SourceTable = "HR Training Needs";
    ApplicationArea = All;
    Caption = 'HR Training Needs Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = FieldEditable;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Costs; Rec.Costs)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Costs field.';
                    Visible = false;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = all;
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec.TestField("Course Title");
                    end;
                }
                field("Re-Assessment Date"; Rec."Re-Assessment Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Re-Assessment Date field.';
                }
                field("Need Source"; Rec."Need Source")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Need Source field.';
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider field.';
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider Name field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }

                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                // field(Workstation; Rec."Global Dimension 1 Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Workstation';
                //     ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                // }
                field(Department; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Directorate Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }

                field("Early Bonded Exit?"; Rec."Early Bonded Exit?")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Early Bonded Exit Conditions?';
                    ToolTip = 'Specifies the value of the Early Bonded Exit Conditions? field.';

                }
                field("Bondage Required?"; Rec."Bondage Required?")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bondage Required? field.';
                }
                field("Bondage Start Date"; Rec."Bondage Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bondage Start Date field.';
                }
                field("Bondage Duration"; Rec."Bondage Duration")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bondage Duration field.';
                }
                field("Bondage Release Date"; Rec."Bondage Release Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bondage Release Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    //  Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                    trigger OnValidate()
                    begin
                        UpdateControls();
                    end;
                }
                field("Captured By"; Rec."Captured By")
                {
                    ApplicationArea = all;
                }
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                    ApplicationArea = all;
                    Caption = 'Estimated Cost + VAT';
                    Editable = false;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control26; Outlook) { }
            systempart(Control25; Notes) { }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Training Costs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Costs';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Training Cost List";
                    RunPageLink = "Training ID" = field(Code);
                    ToolTip = 'Executes the Training Costs action.';
                }


                action("Training Bonding Conditions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Bonding Conditions';
                    Image = BOM;
                    Promoted = true;
                    Visible = true;
                    PromotedCategory = Process;
                    RunObject = page "HR Training Bonding Cond. List";
                    RunPageLink = "Training Bonding Code" = field(Code);
                    ToolTip = 'Executes the Training Bonding Conditions action.';
                }
            }
            group("Workflow Process")
            {
                Caption = 'Workflow Process';

                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    begin
                        rec.TestField("Start Date");
                        Rec.TestField(Duration);
                        Rec.TestField(Location);
                        rec.TestField("Course Title");
                        rec.TestField(Status, rec.Status::Open);
                        if Confirm('Send Approval Request?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        CurrPage.Close();
                        //AppMgmt.SendTrainingApprovalRequest(Rec);
                    end;
                }

                action("teest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test';
                    Image = TaskList;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        PortalWeb.SumbitTrainingNeedForApproval(Rec.Code, 'GREENCOM\AUGUSTINE.ORWA');
                        //AppMgmt.CancelTrainingApprovalRequest(Rec,TRUE,TRUE);
                        Message('success');
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        rec.TestField(Status, rec.Status::"Pending Approval");
                        Rec.TestField(Status, rec.Status::"Pending Approval");
                        if Confirm('Cancel Approval Request?', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        //DocumentType: Enum "Approval Document Type";
                        //DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,"Exit Requisition","Training Need";
                        //ApprovalEntries: Page "Approval Entries";
                        Apprmgt: Codeunit "Approvals Mgmt.";
                    begin
                        Apprmgt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Caption = 'Approve Document';
                    Visible = rec.Status = Rec.Status::"Pending Approval";
                    PromotedOnly = true;
                    ToolTip = 'Executes the Approval of Document action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if Confirm('Do you want to approve this document?') = true then begin
                            ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                            CurrPage.Close();
                        end;
                    end;
                }
                action("Reject Document")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        if rec.Status = rec.Status::"Pending Approval" then
                            Error('Kindly cancell the approval request then reject');
                        if Confirm('Do you want to reject this documet?') = true then begin
                            Rec.Status := Rec.Status::Rejected;
                            Rec."Rejected By" := UserId;
                            Rec.Modify();
                            CurrPage.Close();
                        end;

                    end;
                }
                action(Attachment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Attachment action.';
                    trigger OnAction()
                    begin
                        DMSInt.Reset();
                        DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."DMS Link Type"::Training);
                        if DMSInt.Find('-') then
                            Hyperlink(DMSInt."DMS Link Path" + Rec.Code);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
    end;

    trigger OnInit()
    begin
        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        UpdateControls();
    end;

    var
        HRTrainingBondingCond: Record "HR Training Bonding Conditions";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";

        PortalWeb: codeunit PortalWebService;
        //AppMgmt: Codeunit "Export F/O Consolidation";
        FieldEditable: Boolean;
        DMSInt: Record DMS;

    local procedure UpdateControls()
    begin
        rec.CalcFields(Costs);
        FieldEditable := true;
        if rec.Status <> rec.Status::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

        /*
        IF Status <> Status::Open THEN
        BEGIN
            FieldEditable:=FALSE;
        END ELSE
        BEGIN
            FieldEditable:=TRUE;
        END;
        */

    end;
}

#pragma implicitwith restore
