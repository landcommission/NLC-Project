#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/*
Page 52194151 "HR Disciplinary Case Card NCA"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Case Status,Show';
    SourceTable = "HR Disciplinary Cases";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = PageEditable;
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("HR Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                }
                //field("User ID"; Rec."User ID")
                //{
                //ApplicationArea = Basic;
                //Caption = 'HR User ID';
                // Editable = false;
            }
            field("Date of Complaint"; Rec."Date of Complaint")
            {
                ApplicationArea = Basic;
                Caption = 'Date Offence Reported';
                Editable = true;
            }
                //ield(Year; Rec.Year)
                //{
                  //  ApplicationArea = Basic;
                    //Caption = 'Case Year';
                }
                field("Accused Employee"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accused Employee Staff No';
                }
                field("Accused Employee Name"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Type Complaint"; Rec."Type Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Offence Type';
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description of Offence';
                    MultiLine = true;
                }
                field("Severity Of the Complain"; Rec."Severity Of the Complain")
                {
                    ApplicationArea = Basic;
                    Caption = 'Severity Of the Offence';
                }
                field("Date of Complaint was Reported"; Rec."Date of Complaint was Reported")
                {
                    ApplicationArea = Basic;
                    Caption = 'Offence Date';
                }
                field("Accussed By"; Rec."Accussed By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Accuser; Rec.Accuser)
                {
                    ApplicationArea = Basic;
                    Caption = 'Accuser Staff No1';
                    Visible = false;
                }
                field("Witness #2"; Rec."Witness #2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accuser Staff No';
                    Visible = true;
                }
                field("Witness #2  Name"; Rec."Witness #2  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accuser Staff Name';
                    Editable = false;
                    Visible = true;
                }
                field("Accuser Name"; Rec."Accuser Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accuser Staff Name1';
                    Editable = false;
                    HideValue = true;
                    Visible = false;
                }
                field("Non Employee Name"; Rec."Non Employee Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Witness #1"; Rec."Witness #1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supervisor Staff No';
                }
                field("Witness #1 Name"; Rec."Witness #1 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supervisor Staff Name';
                    Editable = false;
                }
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Case Discussed';
                }
                field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committee Handling The Offence';
                }
                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = '<Mode of Lodging The Offence';
                    Visible = false;
                }
                field("Policy Guidlines In Effect"; Rec."Policy Guidlines In Effect")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary Action"; Rec."Preliminary Action")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary Action Date"; Rec."Preliminary Action Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Preliminary Action Effective Date';
                }
                field("HR Committee"; Rec."HR Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Committee No';
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                }
                field("Disciplinary Stage Status"; Rec."Disciplinary Stage Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disciplinary Case  Status';
                    Editable = false;
                    HideValue = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
            group("Committee Members")
            {
                Caption = 'Committee Members';
                Editable = PageEditable;
            }
            group("Action Information")
            {
                Caption = 'Action Information';
                Editable = PageEditable;
                field("Employee Defence"; Rec."Employee Defence")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accused Defence Remarks';
                }
                field("Departmental Report"; Rec."Departmental Report")
                {
                    ApplicationArea = Basic;
                }
                field("Investigation Findings"; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remarks On Action Taken';
                    Editable = true;
                    MultiLine = true;
                }
                field("Review Findings"; Rec."Review Findings")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appeal Findings';
                    MultiLine = true;
                }
                field("Action Duration Start Date"; Rec."Action Duration Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Action Taken Start Date';
                }
                field("Action Duration End  Date"; Rec."Action Duration End  Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Action Taken End  Date';
                }
                field(Appealed; Rec.Appealed)
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Appeal"; Rec."Date Of Appeal")
                {
                    ApplicationArea = Basic;
                }
                field("Action Taken After Appeal"; Rec."Action Taken After Appeal")
                {
                    ApplicationArea = Basic;
                }
                label(Control15)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control17; "Committee Members Disciplinary")
            {
                SubPageLink = "Disc No." = field("Case Number");
            }
        }
        area(factboxes)
        {
            part(Control1102755038; "HR Disciplinary Cases Factbox")
            {
                Caption = 'HR Disciplinary Cases Factbox';
                SubPageLink = "Case Number" = field("Case Number");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Case Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Case Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        if Confirm('Send this Case for Approval ?', true) = false then exit;
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //AppMgmt.SendDiscApprovalReq(Rec);
                    end;
                }
                action("Cancel Case Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Case Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Case Approval Request?', true) = false then exit;
                        // AppMgmt.CancelDiscAppRequest(Rec,true,true);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        DocumentType := Documenttype::Disc;
                        ApprovalEntries.Setfilters(Database::"HR Disciplinary Cases NCA", DocumentType, Rec."Case Number");
                        ApprovalEntries.Run;
                    end;
                }
            }
            group("Case Status")
            {
                action("Under Investigation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Under Investigation';
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        Rec.TestField(Rec."Accused Employee");
                        Rec.TestField(Rec."Date of Complaint");
                        Rec.TestField(Rec."Date of Complaint was Reported");

                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::"Under Investigation " then exit;
                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::Inprogress then exit;
                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::Closed then exit;
                        // IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under review" THEN EXIT;


                        if Confirm('Are you sure you want to mark this case as "Under Investigation"?') then begin
                            Rec."Disciplinary Stage Status" := Rec."disciplinary stage status"::"Under Investigation ";
                            Rec.Modify;
                            Message('Case Number %1 has been marked as under "Investigation"', Rec."Case Number");
                        end;
                    end;
                }
                action("In Progress")
                {
                    ApplicationArea = Basic;
                    Caption = 'In Progress';
                    Image = CarryOutActionMessage;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        Rec.TestField(Rec.Status, Rec.Status::Approved);


                        //IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Investigation " THEN EXIT;
                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::Inprogress then exit;
                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::Closed then exit;
                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::"Under review" then exit;


                        if Confirm('Are you sure you want to open Investigations for these Case?') then begin
                            Rec."Disciplinary Stage Status" := Rec."disciplinary stage status"::Inprogress;
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "In Progress"', Rec."Case Number");
                        end;
                    end;
                }
                action(Close)
                {
                    ApplicationArea = Basic;
                    Caption = ' Close';
                    Image = Closed;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        Rec.TestField(Rec.Status, Rec.Status::Approved);


                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::"Under Investigation " then exit;
                        // IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"InProgress" THEN EXIT;
                        //  IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::Closed THEN EXIT;
                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::"Under review" then exit;


                        if Confirm('Are you sure you want to mark this case as "Closed"?') then begin
                            Rec."Disciplinary Stage Status" := Rec."disciplinary stage status"::Closed;
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "Closed"', Rec."Case Number");
                        end;
                    end;
                }
                action(Appeal)
                {
                    ApplicationArea = Basic;
                    Caption = ' Appeal';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        Rec.TestField(Rec.Status, Rec.Status::Approved);

                        if Rec.Appealed = true then begin
                            Error('A case can only be Appealed once');
                        end;

                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::"Under Investigation " then exit;
                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::Inprogress then exit;
                        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::"Under review" then exit;


                        if Confirm('Are you sure you want to mark this case as "Under Review?"') then begin
                            Rec."Disciplinary Stage Status" := Rec."disciplinary stage status"::"Under review";
                            Rec.Appealed := true;
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "Under Review"', Rec."Case Number");
                        end;
                    end;
                }
                action(Attachment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment';
                    Image = Attach;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        DMSInt.Reset;
                        DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."dms link type"::Disciplinary);
                        if DMSInt.Find('-') then begin
                            Hyperlink(DMSInt."DMS Link Path" + Rec."Case Number");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin

        PageEditable := true;

        if Rec."Disciplinary Stage Status" = Rec."disciplinary stage status"::Closed then PageEditable := false;
        if Rec.Status = Rec.Status::Approved then PageEditable := false;
        if Rec.Status = Rec.Status::"Pending Approval" then PageEditable := false;

        if Rec.Status = Rec.Status::New then PageEditable := true;
    end;

    var
        VarVariant: Variant;
        //CustomApprovals: Codeunit "Approvals Mgt"
        //AppMgmt: Codeunit "Export F/O Consolidation";
        //DiscCase: Record "HR Disciplinary Cases NCA";
        PageEditable: Boolean;
        DMSInt: Record DMS;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imp,Requisition,ImpSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDetails,Qualified,Disc;
        //ApprovalEntries: Page "Approval Entries";
}
*/