#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50132 "Asset Allocation Request Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = 52193494;
    SourceTableView = where("Document Type" = const("Asset Allocation"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestedID; "User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requested  ID';
                }
                field(Store; Store)
                {
                    ApplicationArea = Basic;
                    Caption = 'Store';
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(Allocated; Allocated)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control6; "Asset Allocation Request Lines")
            {
                Caption = 'Asset Allocation Request Lines';
                SubPageLink = "No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Control4; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control3; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
            systempart(Control2; Notes)
            {
            }
            systempart(Control1; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    DocumentType := Documenttype::HrAssetTrans;
                    ApprovalEntries.Setfilters(Database::"HR Asset Transfer Header", DocumentType, "No.");
                    ApprovalEntries.Run;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = "Status" = "Status"::Open;

                trigger OnAction()
                begin
                    //TESTFIELD(Type);

                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    // ApprovalMgt.SendHrAssetransAppApprovalReq(Rec)
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = "Status" = "Status"::"Pending Approval";

                trigger OnAction()
                begin

                    //IF CONFIRM('Cancel this Application?',TRUE)=FALSE THEN EXIT;
                    //ApprovalMgt.CancelHrAssetransAppRequest(Rec)
                    // ApprovalMgt.CancelHrAssetransAppRequest(Rec,true,true);
                end;
            }
            action(PrintReview)
            {
                ApplicationArea = Basic;
                Caption = 'Print Review';
                Visible = false;

                trigger OnAction()
                begin

                    RecHeader.Reset;
                    RecHeader.SetFilter(RecHeader."No.", xRec."No.");
                    Report.Run(39004371, true, true, RecHeader);
                end;
            }
            action(UpdateAssetAllocation)
            {
                ApplicationArea = Basic;
                Caption = 'Update Asset Allocation';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Allocated = true then Error('This Application %1 has already been Allocated', "No.");

                    if Status <> Status::Approved then
                        Error('The Application is not yet Approved');

                    TransferLinesReq.Reset;
                    TransferLinesReq.SetRange(TransferLinesReq."No.", "No.");
                    if TransferLinesReq.Find('-') then begin
                        repeat
                            fasset.Reset;
                            fasset.SetRange(fasset."No.", TransferLinesReq."Asset Code");
                            if fasset.Find('-') then begin
                                fasset."Global Dimension 2 Code" := TransferLinesReq."Global Dimension 2 Code";
                                //fasset."Responsible Department  Name" := TransferLinesReq."Dimension 2 Name";
                                fasset."Asset Movement Status" := fasset."asset movement status"::Allocated;
                                fasset.Modify;
                            end;
                            TransferLinesReq."Asset No." := TransferLinesReq."Asset Code";
                            TransferLinesReq.Modify;
                        until TransferLinesReq.Next = 0;
                        Allocated := true;
                        Modify;
                    end;
                end;
            }
            group(DocumentManagement)
            {
                Caption = 'Document Management';
                Description = 'Document Management';
                action("DMS Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = "Status" = "Status"::Open;

                    trigger OnAction()
                    begin
                        if CompanyInfo.Get then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
                action(ViewAttachedDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'View Attached Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page Attachment;
                    //RunPageLink = IFMIS_No = field("No.");
                    RunPageMode = View;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Updatecontrol;
    end;

    trigger OnAfterGetRecord()
    begin
        Updatecontrol;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Status <> Status::Open then
            Error('You are not allowed to delete at this level')
    end;

    trigger OnInit()
    begin
        Edit := true;
        Line := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"Asset Allocation";
        Type := Type::Allocation;
    end;

    trigger OnModifyRecord(): Boolean
    begin

        if Status <> Status::Open then
            Error('You are not allowed to modify at this level')
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Asset Allocation";
        Type := Type::Allocation;
    end;

    var
        RecHeader: Record 52193494;
        ApprovalEntries: Page "Approval Entries";
        ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        Edit: Boolean;
        Line: Boolean;
        CompanyInfo: Record "Company Information";
        Link: Text[250];
        HREmp: Record 52193433;
        TransferLinesReq: Record "HR Asset Transfer Lines";
        fasset: Record "Fixed Asset";


    procedure Updatecontrol()
    begin
        /*
        IF Status=Status::Open THEN BEGIN
        Edit:=TRUE;
        Line:=TRUE;
        END ELSE IF Status=Status::"Pending Approval" THEN BEGIN
        Edit:=FALSE;
        Line:=FALSE;
        END ELSE IF Status=Status::Approved THEN BEGIN
        Edit:=FALSE;
        Line:=FALSE;
        END
         */

    end;
}

