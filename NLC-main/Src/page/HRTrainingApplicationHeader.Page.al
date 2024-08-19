#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194063 "HR Training Application Header"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Show,Workflow Process,Training Comments';
    SourceTable = "HR Training App Header";
    ApplicationArea = All;
    Caption = 'HR Training Application';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Training Need"; "Training Need")
                {
                    ApplicationArea = all;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    //DrillDownPageId = "Training Needs Appraisal";
                    Editable = false;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Type field.';
                }

                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution field.';
                }

                field("Training_Category"; Rec.Training_Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training_Category field.';
                }
                field("Training Venue"; Rec."Training Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Venue field.';
                }
                field("Bonded Training?"; Rec."Bonded Training?")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bonded Training? field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }

                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Start Date field.';

                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }

                field("Employee Grade"; Rec."Employee Grade")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Grade field.';
                }
                field(Workstation; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Caption = 'Workstation';
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Workstation Name"; "Workstation Name")
                {
                    ApplicationArea = all;
                    Editable = false;

                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Employee No_"; Rec."Employee No_")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No_ field.';
                }
                field(UserId; Rec.UserId)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the UserId field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Training Cost Cstimated"; Rec."Training Cost Cstimated")
                {
                    ApplicationArea = Basic;
                    Caption = 'Estimated Cost';
                    editable = false;
                    ToolTip = 'Specifies the value of the Training Cost Cstimated field.';
                }
                field("Include VAT?"; "Include VAT?")
                {
                    ApplicationArea = ALL;
                }
                field("Total Cost"; "Total Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the total Cost';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control3; "HR Training Application Lines")
            {
                SubPageLink = "Application No." = field("Application No");
            }
        }
        area(FactBoxes)
        {
            systempart(Control14; Outlook) { }
            systempart(Control15; Notes) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Executes the Comments action.';
                    PromotedIsBig = true;
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field("Application No");
                    // trigger OnAction()
                    // var
                    //     DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    // begin
                    //     DocumentType := DocumentType::"Training Application";

                    //     ApprovalComments.Setfilters(Database::"HR Training App Header", DocumentType, Rec."Application No");
                    //     ApprovalComments.SetUpLine(Database::"HR Training App Header", DocumentType, Rec."Application No");
                    //     ApprovalComments.Run();
                    // end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';

                action("&Send Approval &Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Executes the &Send Approval &Request action.';
                    trigger OnAction()
                    var
                        TrainiPa: Record "HR Training App Lines";
                    begin
                        Rec.TestField(Duration);
                        TrainiPa.Reset();
                        TrainiPa.SetRange("Application No.", Rec."Application No");
                        if not TrainiPa.FindFirst() then
                            Error('Participant (s) must be have a value');
                        rec.TestField(Status, rec.Status::New);

                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendTrainingAppApprovalReq(Rec);




                        if (Rec."Bonded Training?") and (Rec.Status = Rec.Status::Approved) then begin
                            HRTrainingAppLines.Reset();
                            HRTrainingAppLines.SetRange(HRTrainingAppLines."Application No.", Rec."Application No");
                            if HRTrainingAppLines.Find('-') then
                                repeat
                                    HRExitTrainingBond.Reset();

                                    HRExitTrainingBond.Init();
                                    HRExitTrainingBond."Line No." := get_LastLineNo() + 1;
                                    HRExitTrainingBond."Employee No." := HRTrainingAppLines."Employee No.";
                                    HRExitTrainingBond."Training Application Code" := Rec."Course Title";
                                    HRExitTrainingBond."Training Description" := Rec."Course Description";


                                    HRTrainingNeeds.Reset();
                                    if HRTrainingNeeds.Get(Rec."Course Title") then begin
                                        HRExitTrainingBond."Bonding Duration" := HRTrainingNeeds."Bondage Duration";
                                        HRExitTrainingBond."Bondage Start Date" := HRTrainingNeeds."Bondage Start Date";
                                        HRExitTrainingBond."Bondage Release Date" := HRTrainingNeeds."Bondage Release Date";
                                    end;

                                    HRExitTrainingBond.Insert();

                                until HRTrainingAppLines.Next() = 0;
                        end;
                        CurrPage.Close();
                    end;
                }
                action("&Cancel Approval request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Cancel Approval request action.';
                    trigger OnAction()
                    begin
                        rec.TestField(Status, rec.Status::"Pending Approval");
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelTrainingAppRequest(Rec,true,true);
                        CurrPage.Close();
                    end;
                }
                action("Reject Approval")
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category6;
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
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        Approvalmg: Codeunit "Approvals Mgmt.";
                    begin
                        Approvalmg.OpenApprovalEntriesPage(rec.RecordId);

                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Approved);

                        HRTrainingApplications.SetRange(HRTrainingApplications."Application No", Rec."Application No");
                        if HRTrainingApplications.Find('-') then
                            Report.Run(39005484, true, true, HRTrainingApplications);
                    end;
                }
                action("<A ction1102755042>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::New;
                        Rec.Modify();
                    end;
                }
                action(Attachment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Attachment action.';
                    trigger OnAction()
                    var
                        DMSInt: Record DMS;
                    begin
                        DMSInt.Reset();
                        DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."DMS Link Type"::Training);
                        if DMSInt.Find('-') then
                            Hyperlink(DMSInt."DMS Link Path" + Rec."Application No");
                    end;
                }
                action("Training Costs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Costs';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "HR Training Cost List";
                    RunPageLink = "Training ID" = field("Training Need");
                    ToolTip = 'Executes the Training Costs action.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Controlpage();
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Controlpage();

    end;

    trigger OnAfterGetRecord()
    begin
        Controlpage();

        if Rec.Status = Rec.Status::New then begin
            "Responsibility CenterEditable" := true;
            "Application NoEditable" := true;
            "Employee No.Editable" := true;
            "Employee NameEditable" := true;
            "Employee DepartmentEditable" := true;
            "Purpose of TrainingEditable" := true;
            "Course TitleEditable" := true;
        end else begin
            "Responsibility CenterEditable" := false;
            "Application NoEditable" := false;
            "Employee No.Editable" := false;
            "Employee NameEditable" := false;
            "Employee DepartmentEditable" := false;
            "Purpose of TrainingEditable" := false;
            "Course TitleEditable" := false;
        end;
    end;

    trigger OnInit()
    begin
        "Course TitleEditable" := true;
        "Purpose of TrainingEditable" := true;
        "Employee DepartmentEditable" := true;
        "Employee NameEditable" := true;
        "Employee No.Editable" := true;
        "Application NoEditable" := true;
        "Responsibility CenterEditable" := true;
    end;

    var
        HREmp: Record "FA Budget Entry";
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "HR Training App Header";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Application NoEditable": Boolean;
        [InDataSet]
        "Employee No.Editable": Boolean;
        [InDataSet]
        "Employee NameEditable": Boolean;
        [InDataSet]
        "Employee DepartmentEditable": Boolean;
        [InDataSet]
        "Purpose of TrainingEditable": Boolean;
        [InDataSet]
        "Course TitleEditable": Boolean;
        HRExitTrainingBond: Record "HR Exit Training Bonding";
        HRTrainingAppLines: Record "HR Training App Lines";
        HRTrainingNeeds: Record "HR Training Needs";


    procedure TESTFIELDS()
    begin
    end;

    local procedure get_LastLineNo() LastLineNo: Integer
    var
        HRExitTrainingBonding2: Record "HR Exit Training Bonding";
    begin
        HRExitTrainingBonding2.Reset();
        if HRExitTrainingBonding2.Find('+') then begin
            Rec.Status := Rec.Status::Approved;
            LastLineNo := HRExitTrainingBonding2."Line No.";
        end else begin
            Rec.Status := Rec.Status::Approved;
            LastLineNo := 1;
        end;
    end;

    local procedure Controlpage()
    var
        myInt: Integer;
    begin
        if rec.Status <> rec.Status::New then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
    end;
}
