#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50143 "Disposal Plans"
{
    SourceTable = "Disposal Plan Table Headers";
    SourceTableView = where("Disposal Type" = const(Procurement));

    layout
    {
        area(content)
        {
            group(Control21)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Document Date';
                }
                field("Disposal Year"; "Disposal Year")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Description"; "Disposal Description")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date"; "Planned Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Department; "Shortcut dimension 1 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'County';
                }
                field(County; "Shortcut dimension 2 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control18; "Disposal Plan Table Lines")
            {
                SubPageLink = "Ref. No." = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send For Approval")
            {
                ApplicationArea = Basic;
                Caption = 'Send For Approval';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = "Status" = "Status"::Open;

                trigger OnAction()
                begin
                    if Status <> Status::Open then exit;
                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    // ApprovalMgt.SendPoolApprovalReq(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = "Status" <> "Status"::Approved;

                trigger OnAction()
                begin
                    if Confirm('Cancel  Approval for this Application?', true) = false then exit;
                    //ApprovalMgt.CancelPoolAppRequest(Rec, true, true);
                end;
            }
            action(Action9)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender",JV,"Employee Requisition","Leave Application","Training Requisition","Transport Requisition","Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project;
                begin
                    DocType := Doctype::Pool;
                    ApprovalEntries.Setfilters(Database::"Disposal Plan Table Headers", DocType, "No.");
                    ApprovalEntries.Run;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "Ref No");
                    Report.Run(50010, true, true, Rec);
                    Reset;
                end;
            }
            action("Post Disposal")
            {
                ApplicationArea = Basic;
                Caption = 'Post Disposal';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = "Status" = "Status"::Approved;

                trigger OnAction()
                begin
                    if Confirm('Disposal this Items / Assets contained in this Application?', true) = false then exit;
                    ReqLine.Reset;
                    ReqLine.SetRange(ReqLine."Ref. No.", "No.");
                    if ReqLine.Find('-') then begin
                        repeat
                            //Update Item as Disposed
                            if ReqLine.Type = ReqLine.Type::Item then begin
                                ItemRec.Reset;
                                ItemRec.SetRange(ItemRec."No.", ReqLine."No.");
                                if ItemRec.Find('-') then begin
                                    // ItemRec.Disposed := true;
                                    // ItemRec."Disposed By" := UserId;
                                    ItemRec."Disposal Date" := Today;
                                    ItemRec."Disposal Reason" := ReqLine."Reason for Disposal";
                                    ItemRec.Modify;
                                end;
                            end;
                            //Update Fixed Asset as Disposed
                            if ReqLine.Type = ReqLine.Type::"Fixed Asset" then begin
                                AssetRec.Reset;
                                AssetRec.SetRange(AssetRec."No.", ReqLine."No.");
                                if AssetRec.Find('-') then begin
                                    // AssetRec.Disposed := true;
                                    // AssetRec."Disposed By" := UserId;
                                    // AssetRec."Disposal Date" := Today;
                                    // AssetRec."Disposal Reason" := ReqLine."Reason for Disposal";
                                    //AssetRec."Asset Movement Status" := AssetRec."asset movement status"::Allocated;
                                    AssetRec.Modify;
                                end;
                            end;
                        until ReqLine.Next = 0;
                        Status := Status::Posted;
                        Modify
                    end;
                end;
            }
            action("Suggest Departmental Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Suggest Departmental Lines';
                Image = approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Approved Disposal Asset Lines";
                RunPageMode = Edit;
                Visible = "Status" = "Status"::open;

                trigger OnAction()
                begin
                    /*
                     IF CONFIRM('Disposal this Items / Assets contained in this Application?',TRUE)=FALSE THEN EXIT;
                       ReqLine.RESET;
                       ReqLine.SETRANGE(ReqLine."Ref. No.","No.");
                       IF ReqLine.FIND('-') THEN BEGIN
                       REPEAT
                       //Update Item as Disposed
                           IF ReqLine.Type=ReqLine.Type::Item THEN
                              BEGIN
                              ItemRec.RESET;
                              ItemRec.SETRANGE(ItemRec."No.",ReqLine."No.");
                              IF ItemRec.FIND('-') THEN
                                 ItemRec.Disposed:=TRUE;
                                 ItemRec."Disposed By":=USERID;
                                 ItemRec."Disposal Date":=TODAY;
                                 ItemRec."Disposal Reason":=ReqLine."Reason for Disposal";
                                 ItemRec.MODIFY;
                              END;
                       //Update Fixed Asset as Disposed
                           IF ReqLine.Type=ReqLine.Type::"Fixed Asset" THEN
                              BEGIN
                              AssetRec.RESET;
                              AssetRec.SETRANGE(AssetRec."No.",ReqLine."No.");
                              IF AssetRec.FIND('-') THEN
                                 AssetRec.Disposed:=TRUE;
                                 AssetRec."Disposed By":=USERID;
                                 AssetRec."Disposal Date":=TODAY;
                                 AssetRec."Disposal Reason":=ReqLine."Reason for Disposal";
                                 AssetRec.MODIFY;
                              END;
                      UNTIL ReqLine.NEXT=0;
                      Status:=Status::Posted;
                      MODIFY
                      END;
                     */

                end;
            }
            group("Document Management")
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
                action("View Attached Documents")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Attached Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Sharepoint Information";
                    RunPageLink = "Primary Key" = field("No.");
                    RunPageMode = View;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Disposal Type" := "disposal type"::Procurement;

        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Employee No" := HREmp."No.";
            "Employee Name" := HREmp."Full Name";
            "Shortcut dimension 1 code" := HREmp."Global Dimension 1 Code";
            "Shortcut dimension 2 code" := HREmp."Global Dimension 2 Code";
        end else begin
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Disposal Type" := "disposal type"::Procurement;

        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Employee No" := HREmp."No.";
            "Employee Name" := HREmp."Full Name";
            "Shortcut dimension 1 code" := HREmp."Global Dimension 1 Code";
            "Shortcut dimension 2 code" := HREmp."Global Dimension 2 Code";
        end else begin
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;
    end;

    var
        ApprovalMgt: Codeunit 439;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        CompanyInfo: Record "Company Information";
        Link: Text;
        ReqLine: Record "Disposal plan table line";
        ItemRec: Record Item;
        AssetRec: Record "Fixed Asset";
        HREmp: Record 52193433;
}

