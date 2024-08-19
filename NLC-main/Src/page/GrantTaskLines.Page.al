#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193845 "Grant Task Lines"
{
    Caption = 'Grant Activities';
    DataCaptionFields = "Grant No.";
    DelayedInsert = true;
    PageType = Card;
    SaveValues = true;
    SourceTable = "Job-Task";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field(CurrentJobNo; CurrentJobNo)
            {
                ApplicationArea = Basic;
                Caption = 'Grant No.';
                Editable = false;
                TableRelation = Jobs;
                ToolTip = 'Specifies the value of the Grant No. field.';
                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord();
                    Commit();
                    Job."No." := CurrentJobNo;
                    if Page.RunModal(0, Job) = Action::LookupOK then begin
                        Job.Get(Job."No.");
                        CurrentJobNo := Job."No.";
                        JobDescription := Job.Description;
                        Rec.FilterGroup := 2;
                        Rec.SetRange(Rec."Grant No.", CurrentJobNo);
                        Rec.FilterGroup := 0;
                        if Rec.Find('-') then;
                        CurrPage.Update(false);
                    end;
                end;

                trigger OnValidate()
                begin
                    Job.Get(CurrentJobNo);
                    JobDescription := Job.Description;
                    CurrentJobNoOnAfterValidate();
                end;
            }
            field(JobDescription; JobDescription)
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the JobDescription field.';
            }
            repeater(Control1)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                field("Grant No."; Rec."Grant No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant No.';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Grant No. field.';
                }
                field("Grant Task No."; Rec."Grant Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task No.';
                    ToolTip = 'Specifies the value of the Grant Task No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Grant Task Type"; Rec."Grant Task Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task Type';
                    ToolTip = 'Specifies the value of the Grant Task Type field.';
                }
                field("WIP-Total"; Rec."WIP-Total")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP-Total field.';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Totaling field.';
                }
                field("Grant Posting Group"; Rec."Grant Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Job Posting Group';
                    ToolTip = 'Specifies the value of the Grant Job Posting Group field.';
                }
                field("Schedule (Total Cost)"; Rec."Schedule (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Schedule (Total Cost) field.';
                }
                field("Schedule (Total Price)"; Rec."Schedule (Total Price)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Schedule (Total Price) field.';
                }
                field("Usage (Total Cost)"; Rec."Usage (Total Cost)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Usage (Total Cost) field.';
                }
                field("Usage (Total Price)"; Rec."Usage (Total Price)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Usage (Total Price) field.';
                }
                field("Contract (Total Cost)"; Rec."Contract (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract (Total Cost) field.';
                }
                field("Contract (Total Price)"; Rec."Contract (Total Price)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contract (Total Price) field.';
                }
                field("Contract (Invoiced Cost)"; Rec."Contract (Invoiced Cost)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contract (Invoiced Cost) field.';
                }
                field("Contract (Invoiced Price)"; Rec."Contract (Invoiced Price)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contract (Invoiced Price) field.';
                }
                field("WIP Amount"; Rec."WIP Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Amount field.';
                }
                field("Invoiced Sales Amount"; Rec."Invoiced Sales Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoiced Sales Amount field.';
                }
                field("Cost Completion %"; Rec."Cost Completion %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cost Completion % field.';
                }
                field("Invoiced %"; Rec."Invoiced %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoiced % field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Outstanding Orders"; Rec."Outstanding Orders")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Outstanding Orders field.';
                    trigger OnDrillDown()
                    var
                        PurchLine: Record "Purchase Line";
                    begin
                        PurchLine.SetCurrentKey("Document Type", "Job No.", "Job Task No.");
                        PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
                        PurchLine.SetRange("Job No.", Rec."Grant No.");
                        PurchLine.SetRange("Job Task No.", Rec."Grant Task No.");
                        PurchLine.SetFilter("Outstanding Amount (LCY)", '<> 0');
                        Page.RunModal(Page::"Purchase Order Subform", PurchLine);
                    end;
                }
                field("Amt. Rcd. Not Invoiced"; Rec."Amt. Rcd. Not Invoiced")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amt. Rcd. Not Invoiced field.';
                    trigger OnDrillDown()
                    var
                        PurchLine: Record "Purchase Line";
                    begin
                        PurchLine.SetCurrentKey("Document Type", "Job No.", "Job Task No.");
                        PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
                        PurchLine.SetRange("Job No.", Rec."Grant No.");
                        PurchLine.SetRange("Job Task No.", Rec."Grant Task No.");
                        PurchLine.SetFilter("Amt. Rcd. Not Invoiced (LCY)", '<> 0');
                        Page.RunModal(Page::"Purchase Order Subform", PurchLine);
                    end;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
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

                        Job.SetRange("No.", Job."No.");
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
                        Rec.TestField(Rec."Grant No.");
                        Job.Get(Rec."Grant No.");
                        Job.SetRange("No.", Job."No.");
                        Report.RunModal(Report::"Job Post WIP to G/L", true, false, Job);
                    end;
                }
                action("<Page Grant WIP Entries>")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP Entries';
                    RunObject = page "Grant WIP Entries";
                    RunPageLink = "Job No." = field("Grant No.");
                    RunPageView = sorting("Job No.", "Job Posting Group", "WIP Posting Date");
                    ToolTip = 'Executes the WIP Entries action.';
                }
                action("<Page Grant WIP G/L Entries>")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP G/L Entries';
                    RunObject = page "Grant WIP G/L Entries";
                    RunPageLink = "Job No." = field("Grant No.");
                    RunPageView = sorting("Job No.");
                    ToolTip = 'Executes the WIP G/L Entries action.';
                }
            }
            group("&Grant Task")
            {
                Caption = '&Grant Task';
                action("<Page Grant Task Card>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant &Task Card';
                    RunObject = page "Grant Task Card";
                    RunPageLink = "Grant No." = field("Grant No."),
                                  "Grant Task No." = field("Grant Task No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Grant &Task Card action.';
                }
                action("<Page Grant Ledger Entries>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task Ledger E&ntries';
                    RunObject = page "Grant Ledger Entries";
                    RunPageLink = "Job No." = field("Grant No."),
                                  "Job Task No." = field("Grant Task No.");
                    RunPageView = sorting("Job No.", "Job Task No.");
                    ShortcutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Grant Task Ledger E&ntries action.';
                }
                action("<Page Grant Planning List>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task &Planning Lines';
                    RunObject = page "Grant Planning List";
                    RunPageLink = "Grant No." = field("Grant No."),
                                  "Grant Task No." = field("Grant Task No.");
                    ToolTip = 'Executes the Grant Task &Planning Lines action.';
                }
                action("<Page Grant Task Statistics>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task &Statistics';
                    RunObject = page "Grant Task Statistics";
                    RunPageLink = "Grant No." = field("Grant No."),
                                  "Grant Task No." = field("Grant Task No.");
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Grant Task &Statistics action.';
                }
                separator(Action65)
                {
                    Caption = '-';
                }
                action("<Page Grant Task Dimensions>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = page "Grant Task Dimensions";
                    RunPageLink = "Job No." = field("Grant No."),
                                  "Job Task No." = field("Grant Task No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
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
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition",JV,"Grant Task";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        CurrPage.SetSelectionFilter(JobTask);
                        if JobTask.Find('-') then begin


                            DocumentType := DocumentType::"Grant Task";
                            ApprovalEntries.Setfilters(Database::"Job-Task", DocumentType, JobTask."Grant Task No.");
                            ApprovalEntries.Run();


                        end;
                    end;
                }
                separator(Action1102755014) { }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    begin
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendGPLApprovalReq(Rec);

                        CurrPage.SetSelectionFilter(JobTask);
                        if JobTask.Find('-') then
                            repeat
                            //    ApprovalMgt.SendGTApprovalReq(JobTask);
                            until JobTask.Next() = 0;
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(JobTask);
                        if JobTask.Find('-') then
                            repeat
                            //   ApprovalMgt.CancelGTAppRequest(JobTask,TRUE,TRUE);
                            until JobTask.Next() = 0;
                    end;
                }
                separator(Action1102755009) { }
                action("Edit Planning Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Edit Planning Lines';
                    Ellipsis = true;
                    Image = EditLines;
                    ToolTip = 'Executes the Edit Planning Lines action.';
                    trigger OnAction()
                    var
                        JT: Record "Job-Task";
                    begin
                        Rec.TestField(Rec."Grant Task Type", Rec."Grant Task Type"::Posting);
                        Rec.TestField(Rec."Grant No.");
                        Job.Get(Rec."Grant No.");
                        Rec.TestField(Rec."Grant Task No.");
                        JT.Get(Rec."Grant No.", Rec."Grant Task No.");
                        JT.FilterGroup := 2;
                        JT.SetRange("Grant No.", Rec."Grant No.");
                        JT.SetRange("Grant Task Type", JT."Grant Task Type"::Posting);
                        JT.FilterGroup := 0;
                        Page.RunModal(Page::"Grant Planning Lines", JT);
                    end;
                }
                action("Create Sales Invoice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Sales Invoice';
                    Ellipsis = true;
                    Image = Invoice;
                    ToolTip = 'Executes the Create Sales Invoice action.';
                    trigger OnAction()
                    var
                        Job: Record Jobs;
                        JT: Record "Job-Task";
                    begin
                        Rec.TestField(Rec."Grant No.");
                        Job.Get(Rec."Grant No.");
                        if Job.Blocked = Job.Blocked::All then
                            Job.TestBlocked();

                        JT := Rec;
                        JT.SetRange("Grant No.", Job."No.");
                        Report.RunModal(Report::"Job Create Sales Invoice", true, false, JT);
                    end;
                }
                action("Split Planning Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Split Planning Lines';
                    Ellipsis = true;
                    Image = Splitlines;
                    ToolTip = 'Executes the Split Planning Lines action.';
                    trigger OnAction()
                    var
                        Job: Record Jobs;
                        JT: Record "Job-Task";
                    begin
                        Rec.TestField(Rec."Grant No.");
                        Rec.TestField(Rec."Grant Task No.");
                        JT := Rec;
                        Job.Get(Rec."Grant No.");
                        if Job.Blocked = Job.Blocked::All then
                            Job.TestBlocked();
                        JT.SetRange("Grant No.", Job."No.");
                        JT.SetRange("Grant Task No.", Rec."Grant Task No.");

                        Report.RunModal(Report::"Job Split Planning Line", true, false, JT);
                    end;
                }
                action("Change &Dates")
                {
                    ApplicationArea = Basic;
                    Caption = 'Change &Dates';
                    Ellipsis = true;
                    ToolTip = 'Executes the Change &Dates action.';
                    trigger OnAction()
                    var
                        Job: Record Jobs;
                        JT: Record "Job-Task";
                    begin
                        Rec.TestField(Rec."Grant No.");
                        Job.Get(Rec."Grant No.");
                        if Job.Blocked = Job.Blocked::All then
                            Job.TestBlocked();
                        JT.SetRange("Grant No.", Job."No.");
                        JT.SetRange("Grant Task No.", Rec."Grant Task No.");
                        //REPORT.RUNMODAL(REPORT::Report1087,TRUE,FALSE,JT);
                    end;
                }
                action("Copy Grant Task &From")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Grant Task &From';
                    Ellipsis = true;
                    ToolTip = 'Executes the Copy Grant Task &From action.';
                    trigger OnAction()
                    var
                        CopyJobTask: Report "Receivables-Payables";
                    begin
                        Rec.TestField(Rec."Grant Task Type", Rec."Grant Task Type"::Posting);
                        //CopyJobTask.SetCopyFrom(Rec);
                        //CopyJobTask.RUNMODAL;
                    end;
                }
                action("Copy Grant Task &To")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Grant Task &To';
                    Ellipsis = true;
                    ToolTip = 'Executes the Copy Grant Task &To action.';
                    trigger OnAction()
                    var
                        CopyJobTask: Report "Detail Trial Balance";
                    begin
                        Rec.TestField(Rec."Grant Task Type", Rec."Grant Task Type"::Posting);
                        //CopyJobTask.SetCopyTo(Rec);
                        //CopyJobTask.RUNMODAL;
                    end;
                }
                action("Indent Grant Tasks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Indent Grant Tasks';
                    RunObject = codeunit "HR Leave Year - Close";
                    ToolTip = 'Executes the Indent Grant Tasks action.';
                }
                action("Create Purchase Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Purchase Order';
                    ToolTip = 'Executes the Create Purchase Order action.';
                    trigger OnAction()
                    var
                        JT: Record "Job-Task";
                        Job: Record Jobs;
                    begin
                        //TESTFIELD(Job."No.");
                        Job.Get(Job."No.");
                        if Job.Blocked = Job.Blocked::All then
                            Job.TestBlocked();

                        if Job."Approval Status" <> Job."Approval Status"::Approved then
                            Error('The Project has not been approved');
                        JT := Rec;
                        JT.SetRange(JT."Grant No.", Job."No.");
                        //REPORT.RUNMODAL(REPORT::"Grant Create Purch. Order",TRUE,FALSE,JT);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DescriptionIndent := 0;
        GrantNoOnFormat();
        GrantTaskNoOnFormat();
        DescriptionOnFormat();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Job.Reset();
        Job.SetRange(Job."No.", Rec."Grant No.");
        if Job.Find('-') then
            if Job."Approval Status" <> Job."Approval Status"::Open then
                Error('You CANNOT modify any Pending Document or Fully Approved');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.ClearTempDim();
    end;

    trigger OnOpenPage()
    begin
        if CurrentJobNo3 <> '' then
            CurrentJobNo := CurrentJobNo3;
        if not Job.Get(CurrentJobNo) then
            Job.Find('-');
        CurrentJobNo := Job."No.";
        JobDescription := Job.Description;
        //NoOfPhases:=Job."Grant Phases";
        Rec.FilterGroup := 2;
        Rec.SetRange(Rec."Grant No.", CurrentJobNo);
        Rec.FilterGroup := 0;
    end;

    var
        Job: Record Jobs;
        CurrentJobNo: Code[20];
        CurrentJobNo3: Code[20];
        JobDescription: Text[250];
        NoOfPhases: Code[10];
        GrantPhases: Record "Grant Phases";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        JobTask: Record "Job-Task";
        JobTasks: Record "Job-Task";
        [InDataSet]
        "Grant No.Emphasize": Boolean;
        [InDataSet]
        "Grant Task No.Emphasize": Boolean;
        [InDataSet]
        DescriptionEmphasize: Boolean;
        [InDataSet]
        DescriptionIndent: Integer;


    procedure SetJobNo(CurrentJobNo2: Code[20])
    begin
        CurrentJobNo3 := CurrentJobNo2;
    end;

    local procedure CurrentJobNoOnAfterValidate()
    begin
        CurrPage.SaveRecord();
        Rec.FilterGroup := 2;
        Rec.SetRange(Rec."Grant No.", CurrentJobNo);
        Rec.FilterGroup := 0;
        if Rec.Find('-') then;
        CurrPage.Update(false);
    end;

    local procedure GrantNoOnFormat()
    begin
        "Grant No.Emphasize" := Rec."Grant Task Type" <> Rec."Grant Task Type"::Posting;
    end;

    local procedure GrantTaskNoOnFormat()
    begin
        "Grant Task No.Emphasize" := Rec."Grant Task Type" <> Rec."Grant Task Type"::Posting;
    end;

    local procedure DescriptionOnFormat()
    begin
        DescriptionIndent := Rec.Indentation;
        DescriptionEmphasize := Rec."Grant Task Type" <> Rec."Grant Task Type"::Posting;
    end;
}
