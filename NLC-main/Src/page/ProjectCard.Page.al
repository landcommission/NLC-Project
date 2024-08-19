#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193821 "Project Card"
{
    Caption = 'Project Summary ';
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Jobs;
    SourceTableView = where(Status = const(Project));
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
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Title';
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'File Name';
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("Funding Agency No."; Rec."Funding Agency No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agreement No.';
                    ToolTip = 'Specifies the value of the Agreement No. field.';
                }
                field("SubAward No."; Rec."SubAward No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SubAward No. field.';
                }
                field("Period of Performance"; Rec."Period of Performance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period of Performance field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field(Contractor; Rec.Contractor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor field.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type of Grant';
                    ToolTip = 'Specifies the value of the Type of Grant field.';
                }
                field(Partners; Rec.Partners)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collaborative Grants field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field(Schools; Rec.Schools)
                {
                    ApplicationArea = Basic;
                    Caption = 'Schools';
                    ToolTip = 'Specifies the value of the Schools field.';
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                    ToolTip = 'Specifies the value of the Objective field.';
                }
                field("Project Location"; Rec."Project Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Location field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Investigator field.';
                }
                field("Project Coordinator"; Rec."Project Coordinator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Coordinator field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Reporting dates generated"; Rec."Reporting dates generated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting dates generated field.';
                }
                field("Type Of Funding"; Rec."Type Of Funding")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type Of Agreement';
                    ToolTip = 'Specifies the value of the Type Of Agreement field.';
                }
                field("Project Status"; Rec."Project Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Status field.';
                }
                field("IREC Approval"; Rec."IREC Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IREC Approval field.';
                }
                field("IREC Approval Date"; Rec."IREC Approval Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IREC Approval Date field.';
                }
                field("Audit Indicator"; Rec."Audit Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Indicator field.';
                }
                field("Bill-to Partner No."; Rec."Bill-to Partner No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Main Sub"; Rec."Main Sub")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Sub field.';
                }
                field("Special Contract Provision"; Rec."Special Contract Provision")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Special Contract Provision field.';
                }
                field("Payment Methods"; Rec."Payment Methods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Methods field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budgeted Cost';
                    ToolTip = 'Specifies the value of the Budgeted Cost field.';
                }
                field("Total Cost(LCY)"; Rec."Total Cost(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budgeted Cost LCY';
                    ToolTip = 'Specifies the value of the Budgeted Cost LCY field.';
                }
                field("Prime Institution"; Rec."Prime Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prime Institution field.';
                }
                field("Amount Awarded"; Rec."Amount Awarded")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Awarded field.';
                }
                field("Allow OverExpenditure"; Rec."Allow OverExpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow OverExpenditure field.';
                }
                field("Accounted Amount"; Rec."Accounted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accounted Amount field.';
                }
                field("Disbursed Amount"; Rec."Disbursed Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Disbursed Amount field.';
                }
                field("Expected Receipt Amount"; Rec."Expected Receipt Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Receipt Amount field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Status';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Status field.';
                }
                label(Control1102755025)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Invoiced"; Rec."Amount Invoiced")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount Invoiced field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Approved Funding Start Date"; Rec."Approved Funding Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Project Start Date';
                    ToolTip = 'Specifies the value of the Approved Project Start Date field.';
                }
                field("Approved Funding End Date"; Rec."Approved Funding End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Project End Date';
                    ToolTip = 'Specifies the value of the Approved Project End Date field.';
                }
                field("Approved Budget Start Date"; Rec."Approved Budget Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Budget Start Date field.';
                }
                field("Approved Budget End Date"; Rec."Approved Budget End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Budget End Date field.';
                }
                field("Grant Phases"; Rec."Grant Phases")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Life';
                    ToolTip = 'Specifies the value of the Grant Life field.';
                }
                field("Justification Narration"; Rec."Justification Narration")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Justification Narration field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Alert sent"; Rec."Alert sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alert sent field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Currency Code';
                    Editable = "Currency CodeEditable";
                    ToolTip = 'Specifies the value of the Grant Currency Code field.';
                    trigger OnValidate()
                    begin
                        CurrencyCheck();
                    end;
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Invoice Currency CodeEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoice Currency Code field.';
                }
                field("Financial Reporting Due Date"; Rec."Financial Reporting Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Reporting Due Date field.';
                }
                field("Technical  Reporting Due Date"; Rec."Technical  Reporting Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technical  Reporting Due Date field.';
                }
                field("Obligated Amount"; Rec."Obligated Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Obligated Amount field.';
                }
                field("Indirect Cost"; Rec."Indirect Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Indirect Cost field.';
                }
                field("Allowed Indirect Cost"; Rec."Allowed Indirect Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Allowed Indirect Cost %';
                    ToolTip = 'Specifies the value of the Allowed Indirect Cost % field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control11; Links)
            {
                Editable = false;
                Visible = true;
            }
            systempart(Control9; Notes)
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
                        Rec.TestField(Rec."No.");
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
                        Rec.TestField(Rec."No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        Report.RunModal(Report::"Job Post WIP to G/L", true, false, Job);
                    end;
                }
                action("WIP Entries")
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
            group("&Project")
            {
                Caption = '&Project';
                action("<Page Compliance main List>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Compliance';
                    Image = Task;
                    RunObject = page "Compliance main List";
                    RunPageLink = "Grant No" = field("No.");
                    ToolTip = 'Executes the Compliance action.';
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
                action("<Page Project Donors>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donors';
                    RunObject = page "Project Donors";
                    RunPageLink = "Grant No" = field("No.");
                    ToolTip = 'Executes the Donors action.';
                }
                action("<Page Project Partners>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Partners (Contracted Institution)';
                    RunObject = page "Project Partners";
                    RunPageLink = "Grant No" = field("No.");
                    ToolTip = 'Executes the Partners (Contracted Institution) action.';
                }
                separator(Action1102755035) { }
                action("<Page Phase Reporting SchedulesA")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reporting phase schedule';
                    Image = AgreementQuote;
                    RunObject = page "Phase Reporting SchedulesAudit";
                    RunPageLink = Project = field("No.");
                    ToolTip = 'Executes the Reporting phase schedule action.';
                }
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
                        DocumentType := DocumentType::Project;
                        ApprovalEntries.Setfilters(Database::Jobs, DocumentType, Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                separator(Action1102755018) { }
                action("Send for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send for Approval';
                    ToolTip = 'Executes the Send for Approval action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        //Release the grant for Approval

                        //TESTFIELD(Donors);
                        Rec.TestField(Rec."Total Cost");
                        Rec.TestField(Rec."Bill-to Partner No.");

                        //IF NOT RecordLinkCheck(Rec) THEN ERROR('You have no documents attached hence cant proceed');

                        //IF ApprovalMgt.SendProjectNoteApprovalReq(Rec) then;   //
                        ////IF ApprovalMgt.SendLabRequestApprovalReq(Rec) THEN;   //
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    ToolTip = 'Executes the Cancel Approval Request action.';

                }
                separator(Action1102755020) { }
            }
        }
        area(Reporting)
        {
            action("Project Summary Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Project Summary Sheet';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunPageOnRec = true;
                ToolTip = 'Executes the Project Summary Sheet action.';
                trigger OnAction()
                begin
                    //      Report project Summary Sheet
                    objJobs.Reset();
                    objJobs.SetRange(objJobs."No.", Rec."No.");
                    if objJobs.Find('-') then
                        Report.Run(39005811, true, true, objJobs);
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
            Rec.SetRange(Rec."Responsibility Center", UserMgt.GetPurchasesFilter());
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
