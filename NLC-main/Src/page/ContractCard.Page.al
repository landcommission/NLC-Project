#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193827 "Contract Card"
{
    Caption = 'Contract Card';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Jobs;
    SourceTableView = where(Status = const(Contract),
                            "Approval Status" = filter(Open | "Pending Approval"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Funding Agency"; Rec."Main Donor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Donor field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prime Institution';
                    ToolTip = 'Specifies the value of the Prime Institution field.';
                }
                field("Prime PI"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prime PI';
                    ToolTip = 'Specifies the value of the Prime PI field.';
                }
                field("Performance Period Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Performance Period Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field("Payment Method"; Rec."Payment Methods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Methods field.';
                }
                field("Amount Awarded"; Rec."Amount Awarded")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Awarded field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
            }
            group("Summary on Ammendment")
            {
                Caption = 'Summary';
            }
            part("<Contract Lines>>"; "Contract Lines")
            {
                Caption = 'Contract Lines';
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000002; Links)
            {
                Editable = false;
                Visible = true;
            }
            systempart(Control1000000001; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("W&IP")
            {
                Caption = 'W&IP';
                Visible = false;
                action("Calculate WIP")
                {
                    ApplicationArea = Basic;
                    Caption = 'Calculate WIP';
                    Ellipsis = true;
                    Image = CalculateWIP;
                    ToolTip = 'Executes the Calculate WIP action.';
                    trigger OnAction()
                    var
                        Job: Record Jobs;
                    begin
                        Rec.TestField("No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        Report.RunModal(Report::"Job Calculate WIP", true, false, Job);
                    end;
                }
                action("Post WIP to G/L")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post WIP to G/L';
                    Ellipsis = true;
                    Image = Post;
                    ToolTip = 'Executes the Post WIP to G/L action.';
                    trigger OnAction()
                    var
                        Job: Record Jobs;
                    begin
                        Rec.TestField("No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        Report.RunModal(Report::"Job Post WIP to G/L", true, false, Job);
                    end;
                }
                action("<Page Grant WIP Entries>")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP Entries';
                    RunObject = page "Grant WIP Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Posting Group", "WIP Posting Date");
                    ToolTip = 'Executes the WIP Entries action.';
                }
                action("<Page Grant WIP G/L Entries>")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP G/L Entries';
                    RunObject = page "Grant WIP G/L Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.");
                    ToolTip = 'Executes the WIP G/L Entries action.';
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Visible = false;
                action("<Page Grant Resource Prices>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource';
                    RunObject = page "Grant Resource Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'Executes the Resource action.';
                }
                action("<Page Grant Item Prices>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item';
                    RunObject = page "Grant Item Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'Executes the Item action.';
                }
                action("<Page Grant G/L Account Prices>")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Account';
                    RunObject = page "Grant G/L Account Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'Executes the G/L Account action.';
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Visible = false;
                action("Resource Allocated per Job")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Allocated per Job';
                    RunObject = page "Resource Allocated per Job";
                    ToolTip = 'Executes the Resource Allocated per Job action.';
                }
                separator(Action67)
                {
                    Caption = 'a';
                }
                action("Res. &Gr. Allocated per Job")
                {
                    ApplicationArea = Basic;
                    Caption = 'Res. &Gr. Allocated per Job';
                    RunObject = page "Res. Gr. Allocated per Job";
                    ToolTip = 'Executes the Res. &Gr. Allocated per Job action.';
                }
            }
            group("&Contract")
            {
                Caption = '&Contract';
                action("Area")
                {
                    ApplicationArea = Basic;
                    Caption = 'Area';
                    ToolTip = 'Executes the Area action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Job),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = page "Default Dimensions";
                    RunPageLink = "Table ID" = const(39004330),
                                  "No." = field("No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("<Page Grant Ledger Entries>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    RunObject = page "Grant Ledger Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Task No.", "Entry Type", "Posting Date");
                    ShortcutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Ledger E&ntries action.';
                }
                action("Grant Task Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task Lines';
                    ToolTip = 'Executes the Grant Task Lines action.';
                    trigger OnAction()
                    var
                        JTLines: Page "Grant Task Lines";
                    begin
                        JTLines.SetJobNo(Rec."No.");
                        JTLines.Run();
                    end;
                }
                action("<Page Grant Planning List>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant &Planning Lines';
                    RunObject = page "Grant Planning List";
                    RunPageLink = "Grant No." = field("No.");
                    ToolTip = 'Executes the Grant &Planning Lines action.';
                }
                action("<Page Grant Statistics>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Grant Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                }
                separator(Action64) { }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    ToolTip = 'Executes the Online Map action.';
                    trigger OnAction()
                    begin
                        Rec.DisplayMap();
                    end;
                }
                separator(Action1102755026) { }
                action("<Page Project Partners>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Partners';
                    RunObject = page "Project Partners";
                    RunPageLink = "Grant No" = field("No.");
                    ToolTip = 'Executes the Partners action.';
                }
                action("<Page Project Donors>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donors';
                    RunObject = page "Project Donors";
                    RunPageLink = "Grant No" = field("No.");
                    ToolTip = 'Executes the Donors action.';
                }
                separator(Action1102755017) { }
                action("<Page Project Personnel Cost All")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personnel Cost Alloc.';
                    RunObject = page "Project Personnel Cost Alloc";
                    RunPageLink = Project = field("No.");
                    ToolTip = 'Executes the Personnel Cost Alloc. action.';
                }
            }
        }
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender",JV,"Employee Requisition","Leave Application","Training Requisition","Transport Requisition","Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project;
                    begin
                        DocumentType := DocumentType::Contract;
                        ApprovalEntries.Setfilters(Database::Jobs, DocumentType, Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                separator(Action1102755018) { }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        //Release the grant for Approval
                        //TESTFIELD("Total Cost");
                        //IF ApprovalMgt.SendProposalApprovalReq(Rec) THEN;
                        //TESTFIELD("Total Cost");

                        if Rec."Cost Share" = true then begin
                            Rec.CalcFields(Donors);
                            Rec.TestField(Donors);
                        end;

                        //IF NOT RecordLinkCheck(Rec) THEN ERROR('You have no documents attached hence cant proceed');


                        // if ApprovalMgt.SendContractNoteApprovalReq(Rec) then
                        // ;
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    ToolTip = 'Executes the Cancel Approval Request action.';

                }
                separator(Action1102755020) { }
                action("Copy Grant")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Grant';
                    Ellipsis = true;
                    ToolTip = 'Executes the Copy Grant action.';
                    //RunObject = Report 1084;
                }
                action("Revert to Proposal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Revert to Proposal';
                    ToolTip = 'Executes the Revert to Proposal action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Contract;
                        Rec.Modify();
                    end;
                }
            }
        }
        area(Reporting)
        {
            action("Contract Route Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Contract Route Sheet';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunPageOnRec = true;
                ToolTip = 'Executes the Contract Route Sheet action.';
                trigger OnAction()
                begin
                    //      Report project Summary Sheet
                    objJobs.Reset();
                    objJobs.SetRange(objJobs."No.", Rec."No.");
                    if objJobs.Find('-') then
                        Report.Run(39003911, true, true, objJobs);
                end;
            }
        }
    }

    trigger OnInit()
    begin
        "Currency CodeEditable" := true;
        "Invoice Currency CodeEditable" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;

        //IF NOT MapMgt.TestSetup THEN
        //  CurrForm.MapPoint.VISIBLE(FALSE);

        CurrencyCheck();
    end;

    var
        Planning: Record "Job-Planning Line";
        AccountedAmount: Decimal;
        GrantSurr: Record "Grant Surrender Header";
        UserMgt: Codeunit "User Setup Management BR";
        [InDataSet]
        "Invoice Currency CodeEditable": Boolean;
        [InDataSet]
        "Currency CodeEditable": Boolean;
        objProjectDonors: Record "Project Donors";
        objJobs: Record Jobs;


    procedure CurrencyCheck()
    begin
        if Rec."Currency Code" <> '' then
            "Invoice Currency CodeEditable" := false
        else
            "Invoice Currency CodeEditable" := true;

        if Rec."Invoice Currency Code" <> '' then
            "Currency CodeEditable" := false
        else
            "Currency CodeEditable" := true;
    end;


    procedure RecordLinkCheck(job: Record Jobs) RecordLnkExist: Boolean
    var
        objRecordLnk: Record "Record Link";
        TableCaption: RecordId;
        objRecord_Link: RecordRef;
    begin
        objRecord_Link.GetTable(job);
        TableCaption := objRecord_Link.RecordId;
        objRecordLnk.Reset();
        objRecordLnk.SetRange(objRecordLnk."Record ID", TableCaption);
        if objRecordLnk.Find('-') then
            exit(true)
        else
            exit(false);
    end;
}

