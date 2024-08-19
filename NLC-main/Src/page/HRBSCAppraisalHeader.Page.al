#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194111 "HR BSC Appraisal Header"
{
    PageType = Card;
    SourceTable = "HR Individual Targets Header";
    ApplicationArea = All;
    Caption = 'HR BSC Appraisal Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                    trigger OnValidate()
                    begin
                        AppraisalPeriod.Reset();
                        AppraisalPeriod.SetRange(AppraisalPeriod.Closed, false);
                        if AppraisalPeriod.Find('-') then
                            OpenPeriod := AppraisalPeriod."Appraisal Month";

                        HRIndividualTargetsHeader.Reset();
                    end;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field("Appraisal Date"; Rec."Appraisal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Date field.';
                }
                field("Appraisal Year"; Rec."Appraisal Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Year field.';
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Type field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Financial Targeted Score"; Rec."Financial Targeted Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Targeted Score field.';
                }
                field("Achieved Financial  Score"; Rec."Achieved Financial  Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Financial  Score field.';
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unachieved Targets field.';
                }
                field("Training Targeted Score"; Rec."Training Targeted Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Targeted Score field.';
                }
                field("Training Achieved  Score"; Rec."Training Achieved  Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Achieved  Score field.';
                }
                field("Service Delivery Target Score"; Rec."Service Delivery Target Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Delivery Target Score field.';
                }
                field("Service Delivery Achieved"; Rec."Service Delivery Achieved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Delivery Achieved field.';
                }
                field("Customer Target Score"; Rec."Customer Target Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Target Score field.';
                }
                field("Customer Achieved  Score"; Rec."Customer Achieved  Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Achieved  Score field.';
                }
                field("Finance Rating"; Rec."Finance Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finance Rating field.';

                }
                field("Customer Rating"; Rec."Customer Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Rating field.';

                }
                field("Training Rating"; Rec."Training Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Rating field.';

                }
                field("Service Rating"; Rec."Service Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Rating field.';

                }
                field("Overall Perc Score"; Rec."Overall Perc Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Perc Score field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control1000000006; "HR Financial BSC Lines")
            {
                Caption = 'Financial Targets';
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Perspective Code" = const(1);
            }
            part(Control1000000007; "HR Service BSC Lines")
            {
                Caption = 'Service Delivery Targets';
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Perspective Code" = const(4);
            }
            part(Control1000000008; "HR Customer BSC Lines")
            {
                Caption = 'Customer Targets';
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Perspective Code" = const(2);
            }
            part(Control1000000009; "HR Training Target Lines")
            {
                Caption = 'Training Targets';
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Perspective Code" = const(3);
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","Employee Transfer","Salary Advance","Staff Clearance",Payroll,Contract,BSC;
                begin
                    DocumentType := DocumentType::BSC;
                    ApprovalEntries.Setfilters(Database::"HR Individual Targets Header", DocumentType, Rec."Appraisal No");
                    ApprovalEntries.Run();
                end;
            }
            action("&Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Send Approval Request action.';
                trigger OnAction()
                begin


                    if Confirm('Send this Application for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendBSCApprovalReq(Rec);
                end;//
            }
            action("&Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Cancel Approval Request action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelBSCApprovalReqnAppRequest(Rec,true,true);
                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Caption = 'Re-Open';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Re-Open action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Print action.';
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    if Rec."Appraisal Type" = Rec."Appraisal Type"::"Target Setting" then
                        Rec.TestField(Rec.Status, Rec.Status::Discussed);

                    if Rec."Appraisal Type" = Rec."Appraisal Type"::"Appraisal Review" then
                        Rec.TestField(Rec.Status, Rec.Status::Approved);

                    if Confirm('Are you sure you want to post?', false) = true then begin
                        Testfields();
                        //post
                        HRIndividualTargetsHeader.Reset();
                        HRIndividualTargetsHeader.SetRange(HRIndividualTargetsHeader."Appraisal No", Rec."Appraisal No");
                        if HRIndividualTargetsHeader.Find('-') then
                            HRIndividualTargetsHeader.CreateLedgerEntries();
                    end;
                end;
            }
            action("Mark As Discussed?")
            {
                ApplicationArea = Basic;
                Caption = 'Mark As Discussed?';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Mark As Discussed? action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Discussed;
                    Rec.Modify();
                end;
            }
            action("Training needs")
            {
                ApplicationArea = Basic;
                Image = List;
                Promoted = true;
                RunObject = page "Emp. Appraisal Training Needs";
                RunPageLink = "Employee No" = field("Employee No");
                ToolTip = 'Executes the Training needs action.';
            }
        }
    }


    var
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        HRIndividualTargetsHeader: Record "HR Individual Targets Header";
        OpenPeriod: Integer;
        AppraisalPeriod: Record "HR Appraisal Period";
        Editpage: Boolean;


    procedure Testfields()
    begin
        Rec.TestField(Rec."Appraisal Period");
        Rec.TestField(Rec."Appraisal No");
        Rec.TestField(Rec."Appraisal Period");
        Rec.TestField(Rec."Appraisal Date");
        Rec.TestField(Rec."Employee No");
    end;


    procedure EditFields()
    begin
        if Rec.Status <> Rec.Status::Open then
            Editpage := false
        else
            Editpage := true;
    end;
}
