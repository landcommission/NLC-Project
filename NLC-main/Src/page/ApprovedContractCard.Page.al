#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193828 "Approved Contract Card"
{
    Caption = 'Approved Contract Card';
    Editable = false;
    InsertAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Jobs;
    SourceTableView = where(Status = const(Contract),
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Re:"; Rec."Re:")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re: field.';
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
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Prime PI"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI At Collaborative Institution field.';
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
            }
            group("Summary on Ammendment")
            {
                part("<Contract Lines>>"; "Contract Lines")
                {
                    Caption = '<Contract Lines>';
                    SubPageLink = "Document No." = field("No.");
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000015; Links)
            {
                Editable = false;
                Visible = true;
            }
            systempart(Control1000000014; Notes)
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
            group("&Proposal")
            {
                Caption = '&Proposal';
                action("Page Proposal Check List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Check List';
                    ToolTip = 'Executes the Proposal Check List action.';
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
                action("<Page Grant Task Lines>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task Lines';
                    RunObject = page "Grant Task Lines";
                    RunPageLink = "Grant No." = field("No.");
                    ToolTip = 'Executes the Grant Task Lines action.';
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
                separator(Action1102755008) { }
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
                separator(Action1102755019) { }
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
                        DocumentType := DocumentType::Proposal;
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
                        // Status:=Status::"Concept Formulation";
                        // MODIFY;


                        //IF "Approval Status"= "Approval Status"::Open THEN ERROR('Concept must be approved first');
                        if Confirm('Revert contract to proposal?') then begin
                            Rec.Status := Rec.Status::Proposal;
                            Rec."Approval Status" := Rec."Approval Status"::Open;
                            Rec.Modify()
                        end
                    end;
                }
                action("Convert to Project")
                {
                    ApplicationArea = Basic;
                    Caption = 'Convert to Project';
                    ToolTip = 'Executes the Convert to Project action.';
                    trigger OnAction()
                    begin
                        Rec.ChangeProjectStatus();
                    end;
                }
                action(recordlinks)
                {
                    ApplicationArea = Basic;
                    Caption = 'recordlinks';
                    ToolTip = 'Executes the recordlinks action.';
                    trigger OnAction()
                    begin
                        objNewJob.Reset();
                        objNewJob.SetRange(objNewJob."No.", Rec."Project No");
                        if objNewJob.Find('-') then
                            Rec.RecordLinkMove(Rec, objNewJob);
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
                        if Confirm('Do you want to Re-open the Contract?') then begin
                            Rec."Approval Status" := Rec."Approval Status"::Open;
                            Rec.Modify();
                        end
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
                    objjobs.Reset();
                    objjobs.SetRange(objjobs."No.", Rec."No.");
                    if objjobs.Find('-') then
                        Report.Run(39005815, true, true, objjobs);
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
        objNewJob: Record Jobs;
        objjobs: Record Jobs;


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
}
