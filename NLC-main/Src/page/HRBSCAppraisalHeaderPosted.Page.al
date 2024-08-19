#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194112 "HR BSC Appraisal Header Posted"
{
    PageType = Card;
    SourceTable = "HR Individual Targets Header";
    ApplicationArea = All;
    Caption = 'HR BSC Appraisal Header Posted';
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

                        IndividualTarget.Reset();
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
                              "Perspective Code" = const(3),
                              "Appraisal Period" = field("Appraisal Period");
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
                end;
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
                    //ApprovalMgt.CancelBSCRequest(Rec,TRUE,TRUE);
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
                    if Confirm('Are you sure you want to post?') = true then begin
                        if Rec.Status <> Rec.Status::Discussed then
                            Error('The status must be approved to contune');

                        Testfields();

                        //post
                        IndividualTarget.Reset();
                        IndividualTarget.SetRange(IndividualTarget."Appraisal No", Rec."Appraisal No");
                        if IndividualTarget.Find('-') then
                            IndividualTarget.CreateLedgerEntries();
                    end;
                end;
            }
            separator(Action1000000031) { }
            action("Load Targets")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Load Targets action.';
                trigger OnAction()
                var
                    "Bsc Head": Record "HR Individual Targets Header";
                    "Bsc Line": Record "HR Individual Target Line";
                    I: Integer;
                    "Bsc Line2": Record "HR Individual Target Line";
                begin
                    I := 0;
                    "Bsc Line".Reset();
                    "Bsc Line".FindLast();
                    I := "Bsc Line"."Line No";

                    "Bsc Head".Reset();
                    "Bsc Head".SetRange("Bsc Head"."Appraisal Year", Rec."Appraisal Year");
                    "Bsc Head".SetRange("Bsc Head"."Employee No", Rec."Employee No");
                    if "Bsc Head".Find('-') then begin
                        Message('TESTING');
                        "Bsc Line".Reset();
                        "Bsc Line".SetRange("Bsc Line"."Appraisal No", "Bsc Head"."Appraisal No");
                        if "Bsc Line".Find('-') then
                            repeat
                                //I:=I+1;
                                Message('LINE NO %1', I);

                                "Bsc Line2".Init();
                                "Bsc Line2"."Line No" := I;
                                "Bsc Line2"."Appraisal No" := Rec."Appraisal No";
                                "Bsc Line2"."Perspective Code" := "Bsc Line"."Perspective Code";
                                "Bsc Line2"."Targeted Score" := "Bsc Line"."Targeted Score";
                                "Bsc Line2"."Achieved Score" := "Bsc Line"."Achieved Score";
                                "Bsc Line2"."Unachieved Targets" := "Bsc Line"."Unachieved Targets";
                                "Bsc Line2"."Appraisee Comments" := "Bsc Line"."Appraisee Comments";
                                "Bsc Line2".Objective := "Bsc Line".Objective;
                                "Bsc Line2"."Start Date" := "Bsc Line"."Start Date";
                                "Bsc Line2"."End Date" := "Bsc Line"."End Date";
                                "Bsc Line2"."Self Rating" := "Bsc Line"."Self Rating";
                                "Bsc Line2"."Supervisor Rating" := "Bsc Line"."Supervisor Rating";
                                "Bsc Line2"."Agreed Rating" := "Bsc Line"."Agreed Rating";
                                "Bsc Line2"."Appraisal Period" := Rec."Appraisal Period";
                                "Bsc Line2"."Perspective Description" := "Bsc Line"."Perspective Description";
                                "Bsc Line2"."Perspective Type" := "Bsc Line"."Perspective Type";
                                "Bsc Line2".Insert();
                                I := I + 1;
                            until "Bsc Line".Next() = 0
                    end
                end;
            }
        }
    }


    trigger OnOpenPage()
    begin
        Rec.CalcFields(Rec."Finance Rating", Rec."Customer Rating", Rec."Training Rating", Rec."Service Rating", Rec.Customer, Rec.Training, Rec.Service, Rec.Finance);
        if (Rec."Finance Rating" <> 0) and (Rec.Finance <> 0) then
            Rec."Finance Perc Score" := (Rec."Finance Rating" * 25) / (Rec.Finance * 5);
        if (Rec."Customer Rating" <> 0) and (Rec.Customer <> 0) then
            Rec."Customer Perc Score" := (Rec."Customer Rating" * 25) / (Rec.Customer * 5);
        if (Rec."Training Rating" <> 0) and (Rec.Training <> 0) then
            Rec."Training Perc Score" := (Rec."Training Rating" * 25) / (Rec.Training * 5);
        if (Rec."Service Rating" <> 0) and (Rec.Service <> 0) then
            Rec."Service Perc Score" := (Rec."Service Rating" * 25) / (Rec.Service * 5);
        Message('%1,%2,%3,%4', Rec."Finance Perc Score", Rec."Customer Perc Score", Rec."Training Perc Score", Rec."Service Perc Score");
        Rec."Overall Perc Score" := Rec."Finance Perc Score" + Rec."Customer Perc Score" + Rec."Training Perc Score" + Rec."Service Perc Score";
        Rec.Modify();
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        IndividualTarget: Record "HR Individual Targets Header";
        OpenPeriod: Integer;
        AppraisalPeriod: Record "HR Appraisal Period";


    procedure Testfields()
    begin
        Rec.TestField(Rec."Appraisal Period");
        Rec.TestField(Rec."Appraisal No");
        Rec.TestField(Rec."Appraisal Period");
        Rec.TestField(Rec."Appraisal Date");
        Rec.TestField(Rec."Employee No");

        //TESTFIELD("Financial Targeted Score");
        //TESTFIELD("Achieved Financial  Score");
        //TESTFIELD("Unachieved Targets");
        //TESTFIELD("Training Targeted Score");
        //TESTFIELD("Training Achieved  Score");
        //TESTFIELD("Service Delivery Target Score");
        //TESTFIELD("Service Delivery Achieved");
        //TESTFIELD("Customer Target Score");
        //TESTFIELD("Customer Achieved  Score");
        Rec.TestField(Rec."Responsibility Center");
        Rec.TestField(Rec.Status);
    end;
}
