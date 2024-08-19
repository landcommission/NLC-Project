#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193580 "Payroll Change Cards New"
{
    PageType = Card;
    SourceTable = "Payroll Changes";
    ApplicationArea = All;
    PromotedActionCategories = 'New,Report,process,Workflow Process';
    Caption = 'Payroll Change Cards New';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Payroll Change No"; Rec."Payroll Change No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll Change No field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Payroll Updated"; Rec."Payroll Updated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll Updated field.';
                }
                field(Narration; Rec.Narrations)
                {
                    ApplicationArea = Basic;
                    Caption = 'Narration';
                    Editable = false;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Narration field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
            part(Control11; "Payroll Change Lines New")
            {
                SubPageLink = "Payroll Change No" = field("Payroll Change No");
            }
        }
    }

    actions
    {
        area(Creation)
        {

            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the &Send Approval Request action.';
                trigger OnAction()
                var
                    Prperiod: Record "PR Payroll Periods";
                begin
                    Prperiod.Reset();
                    Prperiod.SetRange("Date Opened", rec."Payroll Period");
                    Prperiod.SetRange(Closed, false);
                    if not Prperiod.FindFirst() then
                        Error('Payroll period must be open');
                    if not LinesExists() then
                        Error('There are no Lines created for this Document');

                    if not AllFieldsEntered() then
                        Error('Some of the Key Fields on the Lines:[Employee Code,Transaction Code,Reason] Have not been Entered please RECHECK your entries');


                    if Rec.Status <> Rec.Status::New then
                        exit;

                    if Confirm('Send this Employee for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    CurrPage.Close();
                    //ApprovalMgt.SendPayChangeAppApprovalReq(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the &Cancel Approval Request action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    CurrPage.Close();
                    //ApprovalMgt.CancelPayChangeAppRequest(Rec,true,true);
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
                        rec.Status := rec.Status::New;
                        rec."Payroll Updated" := false;
                        Rec.Modify();
                        Message('Document Reopend successfully');
                        CurrPage.Close();
                    end;

                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                var
                    Approv: Codeunit "Approvals Mgmt.";
                begin
                    Approv.OpenApprovalEntriesPage(rec.RecordId);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.FilterGroup(2);
        Rec.SetRange(Rec."User ID", UserId);
        Rec.FilterGroup(0);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Type := Rec.Type::"New Staff"
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status <> Rec.Status::New then
            Error('You are not allowed to modify at this level');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec.Type := Rec.Type::"New Staff"
    end;

    trigger OnOpenPage()
    begin
        Rec.Narration := 'This is for modifying the already Existing Employee Earnings and Deductions in the System';
        Rec.Narrations := 'This is for Inserting New Employee Earnings and Deductions in the System';

        Rec.FilterGroup(2);
        Rec.SetRange(Rec."User ID", UserId);
        Rec.FilterGroup(0);
    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,PV,"Petty Cash",Imp,Rn,ImpS,InterB,Receipt,Staff,"Staff Adv",AdvSurr,Bank,Grant,"Grant Surr",EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Salary Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC;
        ApprovalEntries: Page "Approval Entries";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Payroll Change Request Line";
    begin

        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Payroll Change No", Rec."Payroll Change No");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "Payroll Change Request Line";
    begin

        AllKeyFieldsEntered := true;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Payroll Change No", Rec."Payroll Change No");
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."Employee Code" = '') or (PayLines."Transaction Code" = '') then
                    AllKeyFieldsEntered := false;
            until PayLines.Next() = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;
}
