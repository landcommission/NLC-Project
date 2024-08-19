#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193862 "Approved Concepts"
{
    Caption = 'Grant Card';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Jobs;
    SourceTableView = where(Status = const("Concept Formulation"),
                            "Approval Status" = filter(Approved));
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
                    Caption = 'Concept Note ID';
                    ToolTip = 'Specifies the value of the Concept Note ID field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Concept Title';
                    ToolTip = 'Specifies the value of the Concept Title field.';
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Investigator field.';
                }
                field("Principal Investigator name"; Rec."Principal Investigator name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Principal Investigator name field.';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the  Address field.';
                }
                field("Response To fund Opportunity"; Rec."Response To fund Opportunity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response To fund Opportunity field.';
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                    ToolTip = 'Specifies the value of the Objective field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field(Schools; Rec.Schools)
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
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
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cluster';
                    ToolTip = 'Specifies the value of the Cluster field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Consistence with inst. Objs."; Rec."Consistence with inst. Objs.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consistence with inst. Objs. field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control23; Links) { }
            systempart(Control22; Notes) { }
            systempart(Control21; MyNotes) { }
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
            group("&Grant")
            {
                Caption = '&Grant';
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Comment Sheet";
                    RunPageLink = "Table Name" = const(16),
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
                separator(Action1102755037) { }
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
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition",JV,"Grant Task","Concept Note",Proposal;
                    begin
                        DocumentType := DocumentType::"Concept Note";
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
                        Rec.TestField(Rec."Total Cost");
                        //IF ApprovalMgt.SendGrantApprovalRequest(Rec) THEN;
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
                action("Convert To Proposal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Convert To Proposal';
                    ToolTip = 'Executes the Convert To Proposal action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Approval Status", Rec."Approval Status"::Approved);

                        Rec.ChangeProjectStatus();
                    end;
                }
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortcutKey = 'Return';
                    ToolTip = 'Executes the Open action.';
                    trigger OnAction()
                    begin

                        if Rec."Converted To Proposal" = true then
                            Error('You cannot open a converted concept');

                        //   PAGE.RUN(Number [, Record] [, Field])
                        CommentLine.Reset();
                        //CommentLine.SetRange(CommentLine."Table Name",CommentLine."table name"::"16");
                        CommentLine.SetRange(CommentLine."No.", Rec."No.");
                        if CommentLine.Find('-') then begin
                            Rec."Approval Status" := Rec."Approval Status"::Open;
                            Rec.Modify();
                        end else
                            Error('Kindly give a comment to open');
                    end;
                }
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
        // CurrForm.MapPoint.VISIBLE(FALSE);

        CurrencyCheck();
    end;

    var
        Planning: Record "Job-Planning Line";
        AccountedAmount: Decimal;
        GrantSurr: Record "Grant Surrender Header";
        UserMgt: Codeunit "User Setup Management BR";
        Jobs: Record Jobs;
        [InDataSet]
        "Invoice Currency CodeEditable": Boolean;
        [InDataSet]
        "Currency CodeEditable": Boolean;
        objJobsComments: Record "Jobs Comments";
        CommentLine: Record "Comment Line";


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
#pragma warning restore
}
