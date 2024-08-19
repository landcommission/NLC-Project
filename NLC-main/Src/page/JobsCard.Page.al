#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193888 "Jobs Card"
{
    Caption = 'Contract Card';
    Editable = false;
    InsertAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Jobs;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group("Route Sheet")
            {
                Caption = 'Route Sheet';
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
                field(Submission; Rec.Submission)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field(Schools; Rec.Schools)
                {
                    ApplicationArea = Basic;
                    Caption = 'School';
                    ToolTip = 'Specifies the value of the School field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    Caption = ' Brief Description Of the Program';
                    ToolTip = 'Specifies the value of the  Brief Description Of the Program field.';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the  Address field.';
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Address field.';
                }
                field("PI Name"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI At Collaborative Institution field.';
                }
                field("PI Address"; Rec."PI Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Address field.';
                }
                field("PI Telephone"; Rec."PI Telephone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Telephone field.';
                }
                field("PI EMail"; Rec."PI EMail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI EMail field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Description field.';
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
                field("Concept Approval Date"; Rec."Concept Approval Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Concept Approval Date field.';
                }
                field("Main Donor"; Rec."Main Donor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Donor field.';
                }
                field("Main Sub"; Rec."Main Sub")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Sub field.';
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
                field("Cost Share"; Rec."Cost Share")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Share field.';
                }
                field("Cost Share Details"; Rec."Cost Share Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Share Details field.';
                }
                field(Matching; Rec.Matching)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Matching field.';
                }
                field("Matching Details"; Rec."Matching Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Matching Details field.';
                }
                field("Funding Request"; Rec."Funding Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Request field.';
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
                field("Budget Justification"; Rec."Budget Justification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Justification field.';
                }
                field("Project Summary Abstract"; Rec."Project Summary Abstract")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Summary Abstract field.';
                }
                field("RSPO Completion List"; Rec."RSPO Completion List")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RSPO Completion List field.';
                }
                field(Partners; Rec.Partners)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collaborative Grants field.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Kind of Program field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
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
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
                field("Total Cost(LCY)"; Rec."Total Cost(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Cost(LCY) field.';
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Invoice Currency CodeEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoice Currency Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Status';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Status field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Responsible Officer"; Rec."Responsible Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Agency';
                    ToolTip = 'Specifies the value of the Funding Agency field.';
                }
                field("Proposal Application due Date"; Rec."Proposal Application due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Application due Date field.';
                }
                field("RFA/A Receipt Date"; Rec."RFA/A Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFA/A Receipt Date field.';
                }
                field("Project Team"; Rec."Project Team")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team field.';
                }
            }
            group("New Study Description  Page")
            {
                Caption = 'New Study Description  Page';
                part(Control45; "Project/Proposal Area")
                {
                    Caption = 'Areas involved in this project';
                    SubPageLink = "Proposal No." = field("No.");
                }
                field("Moi/MTRH Collaborator"; Rec."Moi/MTRH Collaborator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Do you have a previous Collaboration with Moi/MTRH ? field.';
                }
                field("AMPATH Affiliation Consortium"; Rec."AMPATH Affiliation Consortium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AMPATH Affiliation Consortium field.';
                }
                field("Previous MU Consortium School?"; Rec."Previous MU Consortium School?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous MU Consortium School? field.';
                }
                field("Which MU Consortium School"; Rec."Which MU Consortium School")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Which MU Consortium School field.';
                }
                field("ASANTE Collaborator?"; Rec."ASANTE Collaborator?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ASANTE Collaborator? field.';
                }
                field("ASANTE Collaborator Details"; Rec."ASANTE Collaborator Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ASANTE Collaborator Details field.';
                }
                field("Assist identifying Collabotor?"; Rec."Assist identifying Collabotor?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assist identifying Collabotor? field.';
                }
                field("Study Type"; Rec."Study Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Type field.';
                }
                field("Study Type Details"; Rec."Study Type Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Type Details field.';
                }
                field("Brief Description of Study"; Rec."Brief Description of Study")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Brief Description of Study field.';
                }
                field("Study Funded"; Rec."Study Funded")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Funded field.';
                }
                field("Funding Source/Funding Sought"; Rec."Funding Source/Funding Sought")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source/Funding Sought field.';
                }
                field("Application Deadline"; Rec."Application Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Deadline field.';
                }
                field("Lab Services"; Rec."Lab Services")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lab Services field.';
                }
                field("AMPATH Data Mgt Core Required"; Rec."AMPATH Data Mgt Core Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AMPATH Data Mgt Core Required field.';
                }
                field("Contracted To"; Rec."Contracted To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contracted To field.';
                }
                field("Biostats Core Required"; Rec."Biostats Core Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Biostats Core Required field.';
                }
                field("Prime Institution"; Rec."Prime Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prime Institution field.';
                }
                field("Workgroup Recomendation"; Rec."Workgroup Recomendation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workgroup Recomendation field.';
                }
                field("Recomendation Description"; Rec."Recomendation Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recomendation Description field.';
                }
            }
            group("Lab Request Page")
            {
                Caption = 'Lab Request Page';
                part(Control78; "Lab Request Form")
                {
                    SubPageLink = "Proposal No." = field("No.");
                }
            }
            systempart(Control23; Links)
            {
                Editable = false;
                Visible = true;
            }
            systempart(Control21; Notes)
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

                        if not RecordLinkCheck(Rec) then
                            Error('You have no documents attached hence cant proceed');


                        //if ApprovalMgt.SendConceptNoteApprovalReq(Rec) then
                        ;
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
            action("Contractl Route Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Contractl Route Sheet';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunPageOnRec = true;
                ToolTip = 'Executes the Contractl Route Sheet action.';
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

