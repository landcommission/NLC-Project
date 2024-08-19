#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50054 "Asset Incidence Reporting Card"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = 52193494;
    SourceTableView = where("Document Type" = const("Asset Incidence"));

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
                field(IssuingAdminAsst; "Issuing Admin/Asst")
                {
                    ApplicationArea = Basic;
                }
                field(IssuingAdminAsstName; "Issuing Admin/Asst Name")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control3; "Asset Incidence Reporting Line")
            {
                Caption = 'Asset Incidence Reporting Lines';
                SubPageLink = "No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1; Links)
            {
                Visible = true;
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

                trigger OnAction()
                begin
                    TestField(Type);
                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    //ApprovalMgt.SendHrAssetransAppApprovalReq(Rec)
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

                trigger OnAction()
                begin
                    if Confirm('Cancel this Application?', true) = false then exit;
                    //ApprovalMgt.CancelHrAssetransAppRequest(Rec, true, true);
                end;
            }
            action(SubmitReport)
            {
                ApplicationArea = Basic;
                Caption = 'Submit Report';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin

                    if Confirm('Submit this Asset/s Incidence Report?', true) = false then exit;
                    // PortalWebService.ReportAssetIncidences("No.");
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

    trigger OnInit()
    begin
        Edit := true;
        Line := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"Asset Incidence";

        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Issuing Admin/Asst" := HREmp."No.";
            "Issuing Admin/Asst Name" := HREmp."Full Name";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
        end else begin
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Asset Incidence";

        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Issuing Admin/Asst" := HREmp."No.";
            "Issuing Admin/Asst Name" := HREmp."Full Name";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
        end else begin
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;
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
        PortalWebService: Codeunit 50002;


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

