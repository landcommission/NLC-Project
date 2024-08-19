#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50092 "Issued Asset Transfer Card"
{
    Caption = 'Issued Asset Transfer Card';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = where(Status = const(Issued));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = Edit;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = Edit;
                }
                field("Responsibility Center"; "Responsibility Center")
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
                field("User Signature"; "User Signature")
                {
                    ApplicationArea = Basic;
                    Caption = 'Acceptance Signature';
                    Editable = false;
                }
                field("Date Signed"; "Date Signed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            // part(Control9; "Asset Issue Request Line")
            // {
            //     Editable = Line;
            //     SubPageLink = "No." = field("No.");
            // }
        }
        area(factboxes)
        {
            systempart(Control16; Links)
            {
                Visible = true;
            }
            part(Control22; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control21; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
            systempart(Control20; Notes)
            {
            }
            systempart(Control19; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //IF ApprovalMgt.SendHrAssetransAppApprovalReq(Rec) THEN;
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //IF ApprovalMgt.CancelHrAssetransAppRequest(Rec,TRUE,TRUE) THEN;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approval;
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
            action("Print Review")
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
            action("Update Asset Movement")
            {
                ApplicationArea = Basic;
                Caption = 'Update Asset Movement';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.CalcFields("User Signature");

                    //IF Rec."User Signature".HASVALUE THEN
                    //BEGIN
                    if Confirm('Update the Asset Register for this Asasets?', true) = false then exit;
                    // PortalWeb.AssetMovementStores(Rec);
                    //END
                    //ELSE
                    //ERROR('Kindly ensure the user has signed');
                end;
            }
            action("Capture Signature")
            {
                ApplicationArea = Basic;
                Caption = 'Capture Signature';
                Ellipsis = true;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Acceptance Signature";
                RunPageLink = "No." = field("No.");

                trigger OnAction()
                var
                    SalesInvHeader: Record 112;
                begin
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

    trigger OnDeleteRecord(): Boolean
    begin

        if Status = Status::Approved
         then
            Error('You are not allowed to delete at this level')
    end;

    trigger OnInit()
    begin
        Edit := true;
        Line := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Status = Status::Approved
         then
            Error('You are not allowed to insert at this level')
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Status = Status::Approved
         then
            Error('You are not allowed to modify at this level')
    end;

    var
        RecHeader: Record "HR Asset Transfer Header";
        ApprovalEntries: Page "Approval Entries";
        ApprovalMgt: Codeunit 439;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        Edit: Boolean;
        Line: Boolean;
        PortalWeb: Codeunit 50002;


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

