#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194100 "HR 360 Appraisal Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Appraisal,Workflow Process,Document Attachment';
    SourceTable = "HR Appraisal Header";
    ApplicationArea = All;
    Caption = 'HR 360 Appraisal Card';
    layout
    {
        area(Content)
        {
            group("HR Appraisal Header")
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field("Second Supervisor"; Rec."Second Supervisor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor field.';
                }
                field("Second Supervisor Name"; Rec."Second Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Name field.';
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field("Appraisal Date"; Rec."Appraisal Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Appraisal Date field.';
                }
                field("Evaluation Period Start"; Rec."Evaluation Period Start")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Period Start field.';
                }
                field("Evaluation Period End"; Rec."Evaluation Period End")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Evaluation Period End field.';
                }
                field("Appraisal Stage"; Rec."Appraisal Stage")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Appraisal Stage field.';
                }
                field("Appraisal Method"; Rec."Appraisal Method")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Appraisal Method field.';
                    trigger OnValidate()
                    begin

                        //Testfields
                        Rec.TestField(Rec.Status, Rec.Status::Appraisee);
                        Rec.TestField(Rec."Appraisal Method");

                        if Confirm(Text0003, false, Rec."Appraisal Method") = false then
                            Error('Process aborted, Press F5 to discard changes')
                        else begin
                            //Delete Lines
                            HRAppLines.Reset();
                            HRAppLines.SetRange(HRAppLines."Appraisal No", Rec."Appraisal No");
                            HRAppLines.SetRange(HRAppLines."Appraisal Period", Rec."Appraisal Period");
                            HRAppLines.SetRange(HRAppLines."Employee No", Rec."Employee No");
                            if HRAppLines.Find('-') then begin
                                HRAppLines.DeleteAll();
                                //Subpage Visibility
                                fn_ShowSubPages();
                            end;

                        end;
                    end;
                }
                field("Appraisal Approval Status"; Rec."Appraisal Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Appraisal Approval Status field.';
                }
                field("Appraisal Score"; Rec."Appraisal Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Appraisal Score field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(PersonalObjectives; "HR 360 Appraisal Lines - PG")
            {
                ShowFilter = false;
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Employee No" = field("Employee No"), "Categorize As" = const("Personal Goals/Objectives");
            }
            part(JobSpecificObjectives; "HR 360 Appraisal Lines - JS")
            {
                ShowFilter = false;
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Employee No" = field("Employee No"), "Categorize As" = const("Job Specific");
            }
            part(EmployeeSubordinatesObjectives; "HR 360 Appraisal Lines - ES")
            {
                ShowFilter = false;
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Employee No" = field("Employee No");
                Visible = SubPageVisible;
            }
            part(PeerObjectives; "HR 360 Appraisal Lines - ES")
            {
                ShowFilter = false;
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Employee No" = field("Employee No");
                Visible = SubPageVisible;
            }
            part(ExternalSourcesObjectives; "HR 360 Appraisal Lines - ES")
            {
                ShowFilter = false;
                SubPageLink = "Appraisal No" = field("Appraisal No"),
                              "Appraisal Period" = field("Appraisal Period"),
                              "Employee No" = field("Employee No");
                Visible = SubPageVisible;
            }
        }
        area(FactBoxes)
        {
            systempart(Control43; Outlook) { }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Approvals)
            {
                Caption = 'Approvals';

                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    begin
                        if Confirm('Send this appraisal for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //AppMgmt.SendAppraisalApprovalReq(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //AppMgmt.CancelAppraisalRequest(Rec,TRUE,TRUE);
                    end;
                }
                action(Action1000000005)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        Appromgt: Codeunit "Approvals Mgmt.";
                    begin
                        Appromgt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
            }
            group(ActionGroup1000000008)
            {
                Caption = 'Functions';
                action("Load Appraisal Sections")
                {
                    ApplicationArea = Basic;
                    Image = CreateInteraction;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Load Appraisal Sections action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Job Title");
                        Rec.TestField(Rec.Status, Rec.Status::Appraisee);
                        Rec.TestField(Rec."Appraisal Stage", Rec."Appraisal Stage"::"Target Setting");


                        if Confirm(Text0001, false) = false then
                            exit;

                        //Job Specific
                        HRAppEvalAreas.Reset();
                        HRAppEvalAreas.SetRange(HRAppEvalAreas."Categorize As", HRAppEvalAreas."Categorize As"::"Job Specific");
                        HRAppEvalAreas.SetRange(HRAppEvalAreas."Assign To", Rec."Job Title");
                        HRAppEvalAreas.SetRange(HRAppEvalAreas."Appraisal Period", Rec."Appraisal Period");
                        HRAppEvalAreas.SetRange(HRAppEvalAreas.Blocked, false);
                        if HRAppEvalAreas.Find('-') then begin
                            HRAppLines.Reset();
                            HRAppLines.SetRange(HRAppLines."Appraisal No", Rec."Appraisal No");
                            HRAppLines.SetRange(HRAppLines."Appraisal Period", Rec."Appraisal Period");
                            HRAppLines.SetRange(HRAppLines."Employee No", Rec."Employee No");
                            HRAppLines.SetRange(HRAppLines."Categorize As", HRAppLines."Categorize As"::"Job Specific");
                            if HRAppLines.Find('-') then begin
                                HRAppLines.DeleteAll();
                                fn_LoadSections();
                            end else
                                fn_LoadSections();
                        end else
                            //if no sections are found
                            Error(Text0002, Rec."Job Title");

                        //360 Sections
                        case Rec."Appraisal Method" of
                            Rec."Appraisal Method"::"360 Appraisal":

                                fn_Load360Sections();
                        end;
                    end;
                }
                action(SendSupervisor)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send to Supervisor';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Enabled = Rec.Status = Rec.Status::"Immediate Supervisor";
                    ToolTip = 'Executes the Send to Supervisor action.';
                    trigger OnAction()
                    begin
                        ////TESTFIELD("Appraisal Stage","Appraisal Stage"::"Target Setting");

                        Rec.TestField(Rec."Employee No");
                        if Confirm('Are you sure you want to Send this Appraisal to the supervisor?', false, Rec."Appraisal No") = false then
                            exit;
                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"Target Approval";
                        Rec.Status := Rec.Status::"Immediate Supervisor";
                        Message('Appraisal sent to supervisor');
                    end;
                }
                action(ReturnAppraisee)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return to Appraisee';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Return to Appraisee action.';
                    trigger OnAction()
                    begin
                        ////TESTFIELD("Appraisal Stage","Appraisal Stage"::"Target Approval");

                        if Confirm('Are you sure you want to Return this Appraisal to the appraisee?', false, Rec."Appraisal No") = false then
                            exit;
                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"Target Setting";
                        Rec.Status := Rec.Status::Appraisee;
                        Message('Appraisal returned to appraisee');
                    end;
                }
                action(ReturnSupervisor)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return to Supervisor';
                    Image = Return;
                    Visible = false;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Return to Supervisor action.';
                    trigger OnAction()
                    begin
                        ////TESTFIELD("Appraisal Stage","Appraisal Stage"::"End Year Evalauation");

                        if Confirm('Are you sure you want to Return this Appraisal to the supervisor?', false, Rec."Appraisal No") = false then
                            exit;
                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"Target Approval";
                        Rec.Status := Rec.Status::"Immediate Supervisor";
                        ;
                        Message('Appraisal returned to supervisor');
                    end;
                }
                action(ApproveTargets)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve Targets';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Approve Targets action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Appraisal Stage", Rec."Appraisal Stage"::"Target Approval");
                        Rec.TestField(Rec."Employee No");

                        if Confirm('Approve targets?') = false then
                            exit;

                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"End Year Evalauation";
                        Message('Appraisal targets approved');
                    end;
                }
                action(Attachment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Attachment action.';
                    trigger OnAction()
                    begin
                        DMSInt.Reset();
                        DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."DMS Link Type"::Appraisal);
                        if DMSInt.Find('-') then
                            Hyperlink(DMSInt."DMS Link Path" + Rec."Appraisal No");
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        //GET APPLICANT DETAILS FROM HR EMPLOYEES TABLE AND COPY THEM TO THE GOAL SETTING TABLE
        HREmp.Reset();
        if HREmp.Get(Rec."Employee No") then begin
            Rec."Employee Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            Rec."Date of Employment" := HREmp."Date Of Joining the Company";
            Rec."Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            Rec."Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
            Rec."Job Title" := HREmp."Job ID";
            Rec."Contract Type" := HREmp."Contract Type";
            Rec."User ID" := HREmp."User ID";

            //Supervisor
            ////Supervisor:=HREmpCard.GetSupervisor("User ID");
            //Superisor ID
            ////"Supervisor ID":=HREmpCard.GetSupervisorID("User ID");
            HREmp.CalcFields(HREmp.Picture);
            Rec.Picture := HREmp.Picture;
        end else
            Error('Employee No' + ' ' + Rec."Employee No" + ' ' + 'is not assigned to any employee. Consult the HR Officer so as to be setup as an employee');



        //Show Hide Subpages
        fn_ShowSubPages();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //Insert current appraisal period
        HRLookupVal.Reset();
        HRLookupVal.SetRange(HRLookupVal.Type, HRLookupVal.Type::"Appraisal Period");
        if HRLookupVal.Find('-') then
            Rec."Appraisal Period" := HRLookupVal.Code
        else
            Error('No appraisal period have been defined');
    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //AppMgmt: Codeunit "Export F/O Consolidation";
        HRAppEvalAreas: Record "HR Appraisal Eval Areas";
        HRAppLines: Record "HR Appraisal Lines";
        Text0001: Label 'Load Appraisal Sections?. \\NB: Existing Lines will be deleted';
        HRAppLines2: Record "HR Appraisal Lines";
        HREmp: Record "HR Employees";
        HREmpCard: Page "HR Employee Card";
        HRAppHeader: Record "HR Appraisal Header";
        Text0002: Label 'No job specific sections for [Job ID: %1] are defined';
        LastLineNo: Integer;
        HRJobResp: Record "HR Job Responsiblities";
        HRSetup: Record "HR Setup";
        HREmp2: Record "HR Employees";
        SubPageVisible: Boolean;
        Text0003: Label 'Change Appraisal Method to [%1]? \\NB: Existing Lines will be deleted';
        HRLookupVal: Record "HR Lookup Values";
        DMSInt: Record DMS;


    procedure enableDisable() enableDisable: Boolean
    begin
        enableDisable := false;
    end;


    procedure fn_LoadSections()
    begin
        //Load Job Specific Evaluation Sections

        repeat
            //Get last no.
            HRAppLines2.Reset();
            if HRAppLines2.Find('+') then
                LastLineNo := HRAppLines2."Line No"
            else
                LastLineNo := 1;
            HRAppLines.Reset();
            HRAppLines.Init();
            HRAppLines."Line No" := LastLineNo + 1;
            HRAppLines."Appraisal No" := Rec."Appraisal No";
            HRAppLines."Appraisal Period" := Rec."Appraisal Period";
            HRAppLines."Employee No" := Rec."Employee No";
            HRAppLines."Categorize As" := HRAppEvalAreas."Categorize As";
            HRAppLines."Sub Category" := HRAppEvalAreas."Sub Category";
            HRAppLines."Perfomance Goals and Targets" := HRAppEvalAreas.Description;
            HRAppLines.Insert();
        until HRAppEvalAreas.Next() = 0;
    end;

    procedure fn_Load360Sections()
    begin

        //Employee's Subordinates
        HRAppEvalAreas.Reset();
        HRAppEvalAreas.SetRange(HRAppEvalAreas."Categorize As", HRAppEvalAreas."Categorize As"::"Employee's Subordinates");
        HRAppEvalAreas.SetRange(HRAppEvalAreas."Appraisal Period", Rec."Appraisal Period");
        if HRAppEvalAreas.Find('-') then begin
            HRAppLines.Reset();
            HRAppLines.SetRange(HRAppLines."Appraisal No", Rec."Appraisal No");
            HRAppLines.SetRange(HRAppLines."Appraisal Period", Rec."Appraisal Period");
            HRAppLines.SetRange(HRAppLines."Employee No", Rec."Employee No");
            HRAppLines.SetRange(HRAppLines."Categorize As", HRAppLines."Categorize As"::"Employee's Subordinates");
            if HRAppLines.Find('-') then begin
                HRAppLines.DeleteAll();
                fn_LoadSections();
            end else
                fn_LoadSections();
        end;

        //Employee's Peers
        HRAppEvalAreas.Reset();
        HRAppEvalAreas.SetRange(HRAppEvalAreas."Categorize As", HRAppEvalAreas."Categorize As"::"Employee's Peers");
        HRAppEvalAreas.SetRange(HRAppEvalAreas."Appraisal Period", Rec."Appraisal Period");
        if HRAppEvalAreas.Find('-') then begin
            HRAppLines.Reset();
            HRAppLines.SetRange(HRAppLines."Appraisal No", Rec."Appraisal No");
            HRAppLines.SetRange(HRAppLines."Appraisal Period", Rec."Appraisal Period");
            HRAppLines.SetRange(HRAppLines."Employee No", Rec."Employee No");
            HRAppLines.SetRange(HRAppLines."Categorize As", HRAppLines."Categorize As"::"Employee's Peers");
            if HRAppLines.Find('-') then begin
                HRAppLines.DeleteAll();
                fn_LoadSections();
            end else
                fn_LoadSections();
        end;

        //External Sources (Vendors and Customers)
        HRAppEvalAreas.Reset();
        HRAppEvalAreas.SetRange(HRAppEvalAreas."Categorize As", HRAppEvalAreas."Categorize As"::"External Sources");
        HRAppEvalAreas.SetRange(HRAppEvalAreas."Appraisal Period", Rec."Appraisal Period");
        if HRAppEvalAreas.Find('-') then begin
            HRAppLines.Reset();
            HRAppLines.SetRange(HRAppLines."Appraisal No", Rec."Appraisal No");
            HRAppLines.SetRange(HRAppLines."Appraisal Period", Rec."Appraisal Period");
            HRAppLines.SetRange(HRAppLines."Employee No", Rec."Employee No");
            HRAppLines.SetRange(HRAppLines."Categorize As", HRAppLines."Categorize As"::"External Sources");
            if HRAppLines.Find('-') then begin
                HRAppLines.DeleteAll();
                fn_LoadSections();
            end else
                fn_LoadSections();
        end;
    end;

    procedure fn_ShowSubPages()
    begin
        //Visbility of Subpages
        if Rec."Appraisal Method" <> Rec."Appraisal Method"::"360 Appraisal" then
            SubPageVisible := false
        else
            SubPageVisible := true;
    end;
}
