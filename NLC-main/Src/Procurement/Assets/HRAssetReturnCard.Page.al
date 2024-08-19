#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50088 "HR Asset Return Card"
{
    Caption = 'Asset Return Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = where("Document Type" = const("Asset Transfer"),
                            Type = const(Return));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = Edit;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = Edit;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9; "Asset Issue Request Line")
            {
                Editable = Line;
                SubPageLink = "No." = field("No.");
            }
            systempart(Control16; Links)
            {
                Visible = true;
            }
        }
        area(factboxes)
        {
            part(Control21; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control20; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
            systempart(Control19; Notes)
            {
            }
            systempart(Control18; MyNotes)
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
                PromotedCategory = Process;
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
                Visible = IsVisible;

                trigger OnAction()
                begin
                    //if ApprovalMgt.SendHrAssetransAppApprovalReq(Rec) then;
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
                Visible = IsCancel;

                trigger OnAction()
                begin
                    //if ApprovalMgt.CancelHrAssetransAppRequest(Rec,true,true) then;
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
            action(UpdateAssetMovement)
            {
                ApplicationArea = Basic;
                Caption = 'Update Asset Movement';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = IsIssue;

                trigger OnAction()
                begin

                    /*
                   IF Status<>Status::Approved THEN
                       ERROR('The Application is not yet Approved');

                    TransferLinesReq.RESET;
                    TransferLinesReq.SETRANGE(TransferLinesReq."No.","No.");
                    IF TransferLinesReq.FIND('-') THEN BEGIN
                       REPEAT
                          fasset.RESET;
                          fasset.SETRANGE(fasset."No.",TransferLinesReq."Asset No.");
                       IF fasset.FIND('-') THEN BEGIN
                          fasset."Global Dimension 2 Code":=TransferLinesReq."Global Dimension 2 Code";
                          fasset."Responsible Department  Name" :=TransferLinesReq."Dimension 2 Name";
                          fasset."Asset Movement Status":=fasset."Asset Movement Status"::Allocated;
                          fasset.MODIFY;
                      END;
                     UNTIL TransferLinesReq.NEXT=0;
                     Allocated:=TRUE;
                     MODIFY;
                     END;
                    */

                end;
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


        "Document Type" := "document type"::"Asset Transfer";
        Type := Type::Return
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        "Document Type" := "document type"::"Asset Transfer";
        Type := Type::Return
    end;

    trigger OnOpenPage()
    begin
        IsVisible := true;
        IsCancel := true;
        IsIssue := true;
        if Status <> Status::Open then
            IsVisible := false;

        if Status <> Status::"Pending Approval" then
            IsCancel := false;

        if Status <> Status::Approved then
            IsIssue := false
    end;

    var
        RecHeader: Record "HR Asset Transfer Header";
        ApprovalEntries: Page "Approval Entries";
        ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        Edit: Boolean;
        Line: Boolean;
        TransferLinesReq: Record "HR Asset Transfer Lines";
        fasset: Record "Fixed Asset";
        IsVisible: Boolean;
        IsCancel: Boolean;
        IsIssue: Boolean;


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

