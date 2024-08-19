#pragma implicitwith disable
page 52194089 "HR Promotion Recommendation"
{
    //DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Workflow Process,Promotion,Employee History,Comments';
    SourceTable = "HR Promo. Recommend Header";
    ApplicationArea = All;
    Caption = 'HR Promotion';
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = Testing;
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = all;
                    Caption = 'Promotion Reason';
                    Visible = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }
                field("Date of Recommendation"; Rec."Date of Recommendation")
                {
                    ToolTip = 'Specifies the value of the Date of Recommendation field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                    Visible = false;
                }

                field("Effective Date Of Transfer"; Rec."Effective Date Of Transfer")
                {
                    ToolTip = 'Specifies the value of the Effective Date Of Transfer field.';
                    Caption = 'Effective Promotion Date';
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                    Editable = false;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = all;
                    Caption = 'Approved By';
                    Editable = false;
                }
            }
            part(q; "HR Recommendation Lines")
            {
                Editable = true;
                SubPageLink = "Document No" = field(No);
                Visible = false;
            }
            part(w; "HR New Recommendation Lines")
            {
                SubPageLink = "Document No" = field(No);
                Editable = Testing;
            }
            part(we; "Promotion Allowances")
            {
                Caption = 'Employee Promotion Allowances';
                SubPageLink = "Document No" = field(No);
                Editable = Testing;
            }
            // part("Employee Qualifications"; "HR Employee Qualification Line")
            // {
            //     Caption = 'Employee Qualifications';
            //     Enabled = false;
            //     SubPageLink = "Employee No." = field("Employee No.");
            //     Visible = false;
            // }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';

                action(SendApprovalRequest)
                {
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    var
                        HrPromoRecomLines: Record "HR Promo. Recommend Lines";
                        PromoLines: Record "HR Promo. Recommend Lines";
                        Reasonav: Boolean;
                    begin
                        Rec.TestField(Status, rec.Status::New);
                        Reasonav := false;
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');
                        HrPromoRecomLines.Reset();
                        HrPromoRecomLines.SetRange(HrPromoRecomLines."Document No", Rec.No);
                        if HrPromoRecomLines.Find('-') then begin
                            repeat
                                Reasonav := false;
                                PromoLines.Reset();
                                PromoLines.SetRange(PromoLines."Document No", HrPromoRecomLines."Document No");
                                PromoLines.SetRange(PromoLines."Employee No.", HrPromoRecomLines."Employee No.");
                                if PromoLines.FindFirst() then
                                    if (PromoLines.Reason <> '') and (PromoLines."From payroll Period" <> 0D) then
                                        Reasonav := true;
                                if Reasonav = false then
                                    Error('every line should have a reason and payperiod must have a value');
                            until HrPromoRecomLines.Next() = 0;
                        end;
                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();

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
                            rec.Status := rec.Status::new;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                        rec.Status := rec.Status::Rejected;
                        rec.Modify();
                        CurrPage.Close();
                    end;
                }
                action(Approvals)
                {
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // DocumentType := DocumentType::Prom;
                        // ApprovalEntries.Setfilters(Database::"HR Promo. Recommend Header", DocumentType, Rec.No);
                        // ApprovalEntries.Run();
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            group(Promotion)
            {
                Caption = 'Promotion';
                action(Promote)
                {
                    Image = Position;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;
                    //Visible = false;
                    ToolTip = 'Executes the Promote action.';
                    trigger OnAction()
                    begin

                        Rec.TestField(Status, Rec.Status::Approved);

                        if Confirm(Txt001, false) = true then begin

                            Employees.Reset();
                            Employees.SetRange(Employees."No.", Rec."Employee No.");
                            if Employees.Find('-') then begin
                                Employees."Job ID" := Rec."New Job ID";
                                Employees."Job Title" := Rec."New Job Title";
                                Employees."Salary Grade" := Rec."New Salary Grade";
                                Employees.Validate("Salary Grade");
                                Employees."Salary Notch/Step" := Rec."New Salary Notch";
                                Employees.Validate("Salary Notch/Step");
                                //Employees.MODIFY;
                            end;

                            Rec.Promoted := true;
                            Rec.Modify();

                            Message(Txt002, Rec."Employee No.");

                        end;
                    end;
                }
                action("Employee performance history")
                {
                    Caption = 'Employee performance history';
                    Image = Aging;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    RunObject = Page 50023;
                    Visible = false;
                    RunPageLink = "Employee Code" = FIELD("Employee No.");
                    ToolTip = 'Executes the Employee performance history action.';
                }
                action("Appraisal Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'Comments';
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field(No);
                }

            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Setappearance();
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Setappearance();
    end;



    trigger OnAfterGetRecord()
    begin
        Setappearance();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        PromoLinesrec.Reset();
        PromoLinesrec.SetRange(PromoLinesrec."Document No", Rec.No);
        if PromoLinesrec.Find('-') then
            PromoLinesrec."Document No" := Rec.No;
    end;

    var
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Prom;
        ApprovalEntries: Page "Approval Entries";
        PromoLinesrec: Record "HR Promo. Recommend Lines";

        VarVariant: Variant;

        CustomApprovals: Codeunit "Approvals Mgt";
        Txt001: Label 'Do you want to promote this employee?';
        Txt002: Label 'Employee No. %1 has been successfully promoted';

        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Testing: Boolean;
        Employees: Record "HR Employees";

    procedure LinesExists(): Boolean
    var
        PayLines: Record "HR Promo. Recommend Lines";
        HasLines: Boolean;
    begin

        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Document No", Rec.No);
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    local procedure Setappearance()
    var
        myInt: Integer;
    begin
        if rec.Status <> rec.Status::New then
            Testing := false
        else
            Testing := true;

    end;
}

#pragma implicitwith restore

