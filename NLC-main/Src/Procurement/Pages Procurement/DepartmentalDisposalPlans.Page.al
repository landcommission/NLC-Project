#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50119 "Departmental Disposal Plans"
{
    SourceTable = "Disposal Plan Table Headers";
    SourceTableView = where("Disposal Type" = const(Departmental));

    layout
    {
        area(content)
        {
            group(Control29)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Document Date';
                    Editable = false;
                }
                field("Disposal Year"; "Disposal Year")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Narration"; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Disposal Narration';
                }
                field("Planned Date"; "Planned Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee No"; "Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; "Shortcut dimension 1 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'County';
                    Editable = false;
                }
                field(County; "Shortcut dimension 2 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    Editable = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Disposal Status"; "Disposal Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Disposal Type"; "Disposal Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
            }
            part(Control8; "Disposal Plan Table Lines")
            {
                SubPageLink = "Ref. No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Control5; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control4; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
            systempart(Control3; Notes)
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
                    //  ApprovalMgt.SendPoolApprovalReq(Rec);
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
                    // ApprovalMgt.CancelPoolAppRequest(Rec, true, true);
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
            action("<Action1102755028>")
            {
                ApplicationArea = Basic;
                Caption = 'Post Disposal';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

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
                                    // AssetRec."Asset Movement Status" := AssetRec."asset movement status"::Allocated;
                                    // AssetRec.Modify;
                                end;
                            end;
                        until ReqLine.Next = 0;
                        Status := Status::Posted;
                        Modify
                    end;
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
                    RunObject = Page Attachment;
                    //RunPageLink = IFMIS_No = field("No.");
                    RunPageMode = View;
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        if Status <> Status::Open then
            Error('You are not allowed to delete at this level')
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Disposal Type" := "disposal type"::Departmental;

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

    trigger OnModifyRecord(): Boolean
    begin
        if Status <> Status::Open then
            Error('You are not allowed to modify at this level')
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Disposal Type" := "disposal type"::Departmental;

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

