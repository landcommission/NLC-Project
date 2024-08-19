// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 50037 "Asset Movement Request Card"
// {
//     Caption = 'Asset Movement Request Card';
//     DeleteAllowed = true;
//     PageType = Card;
//     SourceTable = "HR Asset Transfer Header";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("No."; "No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Responsibility Center"; "Responsibility Center")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Type; Type)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Issuing Admin/Asst"; "Issuing Admin/Asst")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Issuing Admin/Asst Name"; "Issuing Admin/Asst Name")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Document Date"; "Document Date")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = true;
//                 }
//                 field("User ID"; "User ID")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Requested  ID';
//                     Editable = true;
//                 }
//                 field(Recommender; Recommender)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Recommender Name"; "Recommender Name")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Store; Store)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Store';
//                 }
//                 field(Status; Status)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Rejected; Rejected)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Rejected Date"; "Rejected Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Rejection Reason"; "Rejection Reason")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Received; Received)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Received Date"; "Received Date")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Received By"; "Received By")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Rejected By"; "Rejected By")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Global Dimension 1 Code"; "Global Dimension 1 Code")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = true;
//                 }
//                 field("Global Dimension 2 Code"; "Global Dimension 2 Code")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = true;
//                 }
//                 field("Document Type"; "Document Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action(Approvals)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Approvals';
//                 Image = Approve;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin


//                     DocumentType := Documenttype::HrAssetTrans;
//                     ApprovalEntries.Setfilters(Database::Table39003971, DocumentType, "No.");
//                     ApprovalEntries.Run;
//                 end;
//             }
//             action("Send Approval Request")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Send Approval Request';
//                 Image = SendApprovalRequest;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     //TestField(Type);

//                     if Confirm('Send this Application for Approval?', true) = false then exit;
//                     //ApprovalMgt.SendHrAssetransAppApprovalReq(Rec)
//                 end;
//             }
//             action("Cancel Approval Request")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Cancel Approval Request';
//                 Image = Cancel;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin

//                     //IF CONFIRM('Cancel this Application?',TRUE)=FALSE THEN EXIT;
//                     //ApprovalMgt.CancelHrAssetransAppRequest(Rec)
//                     ApprovalMgt.CancelHrAssetransAppRequest(Rec, true, true);
//                 end;
//             }
//             action("Print Review")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Print Review';

//                 trigger OnAction()
//                 begin

//                     RecHeader.Reset;
//                     RecHeader.SetFilter(RecHeader."No.", xRec."No.");
//                     Report.Run(39004371, true, true, RecHeader);
//                 end;
//             }
//             group("Document Management")
//             {
//                 Caption = 'Document Management';
//                 Description = 'Document Management';
//                 action("DMS Link")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Attach Documents';
//                     Image = Web;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         if CompanyInfo.Get then begin
//                             Link := CompanyInfo."Documents Attachment Link";
//                             Hyperlink(Link);
//                         end;
//                     end;
//                 }
//                 action("View Attached Documents")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'View Attached Documents';
//                     Image = Web;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     RunObject = Page "Sharepoint Information";
//                     RunPageLink = "Primary Key" = field("No.");
//                     RunPageMode = View;
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         //Updatecontrol;
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         //Updatecontrol;
//     end;

//     trigger OnInit()
//     begin
//         //Edit:=TRUE;
//         //Line:=TRUE;
//     end;

//     var
//         RecHeader: Record "HR Asset Transfer Header";
//         ApprovalEntries: Page "Approval Entries";
//         ApprovalMgt: Codeunit 439;
//         DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
//         Edit: Boolean;
//         Line: Boolean;
//         CompanyInfo: Record "Company Information";
//         Link: Text[250];


//     procedure Updatecontrol()
//     begin
//         /*
//         IF Status=Status::Open THEN BEGIN
//         Edit:=TRUE;
//         Line:=TRUE;
//         END ELSE IF Status=Status::"Pending Approval" THEN BEGIN
//         Edit:=FALSE;
//         Line:=FALSE;
//         END ELSE IF Status=Status::Approved THEN BEGIN
//         Edit:=FALSE;
//         Line:=FALSE;
//         END
//          */

//     end;
// }

