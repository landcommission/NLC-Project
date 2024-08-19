#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193786 "FA WIP Job Task Lines"
{
    Caption = 'FA WIP Job Task Lines';
    DataCaptionFields = "Job No.";
    PageType = List;
    SaveValues = true;
    SourceTable = "Job Task";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    Visible = false;
                    ToolTip = 'Specifies the number of the related job.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies a description of the job task. You can enter anything that is meaningful in describing the task. The description is copied and used in descriptions on the job planning line.';
                }
                field("Job Task Type"; Rec."Job Task Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the purpose of the account. Newly created accounts are automatically assigned the Posting account type, but you can change this. Choose the field to select one of the following five options:';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an interval or a list of job task numbers.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job posting group of the task.';
                }
                field("WIP-Total"; Rec."WIP-Total")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job tasks you want to group together when calculating Work In Process (WIP) and Recognition.';
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the Work in Process calculation method that is associated with a job. The value in this field comes from the WIP method specified on the job card.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the start date for the job task. The date is based on the date on the related job planning line.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the end date for the job task. The date is based on the date on the related job planning line.';
                }
                field("Schedule (Total Cost)"; Rec."Schedule (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies, in the local currency, the total budgeted cost for the job task during the time period in the Planning Date Filter field.';
                }
                field("Schedule (Total Price)"; Rec."Schedule (Total Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies, in local currency, the total budgeted price for the job task during the time period in the Planning Date Filter field.';
                }
                field("Usage (Total Cost)"; Rec."Usage (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies, in local currency, the total cost of the usage of items, resources and general ledger expenses posted on the job task during the time period in the Posting Date Filter field.';
                }
                field("Usage (Total Price)"; Rec."Usage (Total Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies, in the local currency, the total price of the usage of items, resources and general ledger expenses posted on the job task during the time period in the Posting Date Filter field.';
                }
                field("Contract (Total Cost)"; Rec."Contract (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies, in local currency, the total billable cost for the job task during the time period in the Planning Date Filter field.';
                }
                field("Contract (Total Price)"; Rec."Contract (Total Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies, in the local currency, the total billable price for the job task during the time period in the Planning Date Filter field.';
                }
                field("Contract (Invoiced Cost)"; Rec."Contract (Invoiced Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies, in the local currency, the total billable cost for the job task that has been invoiced during the time period in the Posting Date Filter field.';
                }
                field("Contract (Invoiced Price)"; Rec."Contract (Invoiced Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies, in the local currency, the total billable price for the job task that has been invoiced during the time period in the Posting Date Filter field.';
                }
                field("Remaining (Total Cost)"; Rec."Remaining (Total Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the remaining total cost (LCY) as the sum of costs from job planning lines associated with the job task. The calculation occurs when you have specified that there is a usage link between the job ledger and the job planning lines.';
                }
                field("Remaining (Total Price)"; Rec."Remaining (Total Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the remaining total price (LCY) as the sum of prices from job planning lines associated with the job task. The calculation occurs when you have specified that there is a usage link between the job ledger and the job planning lines.';
                }
                field("EAC (Total Cost)"; Rec.CalcEACTotalCost())
                {
                    ApplicationArea = Basic;
                    Caption = 'EAC (Total Cost)';
                    ToolTip = 'Specifies the value of the EAC (Total Cost) field.';
                }
                field("EAC (Total Price)"; Rec.CalcEACTotalPrice())
                {
                    ApplicationArea = Basic;
                    Caption = 'EAC (Total Price)';
                    ToolTip = 'Specifies the value of the EAC (Total Price) field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Outstanding Orders"; Rec."Outstanding Orders")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the sum of outstanding orders, in local currency, for this job task. The value of the Outstanding Amount (LCY) field is used for entries in the Purchase Line table of document type Order to calculate and update the contents of this field.';
                    trigger OnDrillDown()
                    var
                        PurchLine: Record "Purchase Line";
                    begin
                        PurchLine.SetCurrentKey("Document Type", "Job No.", "Job Task No.");
                        PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
                        PurchLine.SetRange("Job No.", Rec."Job No.");
                        PurchLine.SetRange("Job Task No.", Rec."Job Task No.");
                        PurchLine.SetFilter("Outstanding Amount (LCY)", '<> 0');
                        Page.RunModal(Page::"Purchase Lines", PurchLine);
                    end;
                }
                field("Amt. Rcd. Not Invoiced"; Rec."Amt. Rcd. Not Invoiced")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the sum for items that have been received but have not yet been invoiced. The value in the Amt. Rcd. Not Invoiced (LCY) field is used for entries in the Purchase Line table of document type Order to calculate and update the contents of this field.';
                    trigger OnDrillDown()
                    var
                        PurchLine: Record "Purchase Line";
                    begin
                        PurchLine.SetCurrentKey("Document Type", "Job No.", "Job Task No.");
                        PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
                        PurchLine.SetRange("Job No.", Rec."Job No.");
                        PurchLine.SetRange("Job Task No.", Rec."Job Task No.");
                        PurchLine.SetFilter("Amt. Rcd. Not Invoiced (LCY)", '<> 0');
                        Page.RunModal(Page::"Purchase Lines", PurchLine);
                    end;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Job Task")
            {
                Caption = '&Job Task';
                Image = Task;
                action("Job &Planning Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job &Planning Lines';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'Shift+Ctrl+P';
                    ToolTip = 'Executes the Job &Planning Lines action.';
                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        Rec.TestField(Rec."Job Task Type", Rec."Job Task Type"::Posting);
                        Rec.TestField(Rec."Job No.");
                        Rec.TestField(Rec."Job Task No.");
                        JobPlanningLine.SetRange("Job No.", Rec."Job No.");
                        JobPlanningLine.SetRange("Job Task No.", Rec."Job Task No.");
                        //JobPlanningLines.SetJobNoVisible(false);
                        JobPlanningLines.SetJobTaskNoVisible(false);
                        //JobPlanningLines.SetJobNo(Rec."Job No.");
                        JobPlanningLines.SetTableView(JobPlanningLine);
                        JobPlanningLines.Run();
                    end;
                }
                action(JobTaskStatistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Task &Statistics';
                    Image = StatisticsDocument;
                    RunObject = page "Job Task Statistics";
                    RunPageLink = "Job No." = field("Job No."),
                                  "Job Task No." = field("Job Task No.");
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Job Task &Statistics action.';
                }
                action("Job &Task Card")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job &Task Card';
                    Image = Task;
                    RunObject = page "Job Task Card";
                    RunPageLink = "Job No." = field("Job No."),
                                  "Job Task No." = field("Job Task No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Job &Task Card action.';
                }
                separator(Action65)
                {
                    Caption = '-';
                }
                group("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    action("Dimensions-&Single")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Single';
                        Image = Dimensions;
                        RunObject = page "Job Task Dimensions";
                        RunPageLink = "Job No." = field("Job No."),
                                      "Job Task No." = field("Job Task No.");
                        ShortcutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-&Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = tabledata Dimension = R;
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';
                        trigger OnAction()
                        var
                            JobTask: Record "Job Task";
                            JobTaskDimensionsMultiple: Page "Job Task Dimensions Multiple";
                        begin
                            CurrPage.SetSelectionFilter(JobTask);
                            JobTaskDimensionsMultiple.SetMultiJobTask(JobTask);
                            JobTaskDimensionsMultiple.RunModal();
                        end;
                    }
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action("Sales &Invoices/Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales &Invoices/Credit Memos';
                    Image = GetSourceDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Sales &Invoices/Credit Memos action.';
                    trigger OnAction()
                    var
                        JobInvoices: Page "Job Invoices";
                    begin
                        JobInvoices.SetPrJobTask(Rec);
                        JobInvoices.RunModal();
                    end;
                }
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                action("&WIP Entries")
                {
                    ApplicationArea = Basic;
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = page "Job WIP Entries";
                    RunPageLink = "Job No." = field("Job No.");
                    RunPageView = sorting("Job No.", "Job Posting Group", "WIP Posting Date");
                    ToolTip = 'Executes the &WIP Entries action.';
                }
                action("WIP &G/L Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = page "Job WIP G/L Entries";
                    RunPageLink = "Job No." = field("Job No.");
                    RunPageView = sorting("Job No.");
                    ToolTip = 'Executes the WIP &G/L Entries action.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Job Ledger E&ntries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Ledger E&ntries';
                    Image = JobLedger;
                    RunObject = page "Job Ledger Entries";
                    RunPageLink = "Job No." = field("Job No."),
                                  "Job Task No." = field("Job Task No.");
                    RunPageView = sorting("Job No.", "Job Task No.");
                    ShortcutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Job Ledger E&ntries action.';
                }
            }
        }
        area(Processing)
        {
            group("New Documents")
            {
                Caption = 'New Documents';
                Image = Invoice;
                action("Create &Sales Invoice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create &Sales Invoice';
                    Ellipsis = true;
                    Image = Invoice;
                    ToolTip = 'Executes the Create &Sales Invoice action.';
                    trigger OnAction()
                    var
                        Job: Record Job;
                        JobTask: Record "Job Task";
                    begin
                        Rec.TestField(Rec."Job No.");
                        Job.Get(Rec."Job No.");
                        if Job.Blocked = Job.Blocked::All then
                            Job.TestBlocked();

                        JobTask.SetRange("Job No.", Job."No.");
                        if Rec."Job Task No." <> '' then
                            JobTask.SetRange("Job Task No.", Rec."Job Task No.");

                        Report.RunModal(Report::"Job Create Sales Invoice", true, false, JobTask);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Split &Planning Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Split &Planning Lines';
                    Ellipsis = true;
                    Image = Splitlines;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Split &Planning Lines action.';
                    trigger OnAction()
                    var
                        Job: Record Job;
                        JobTask: Record "Job Task";
                    begin
                        Rec.TestField(Rec."Job No.");
                        Job.Get(Rec."Job No.");
                        if Job.Blocked = Job.Blocked::All then
                            Job.TestBlocked();

                        Rec.TestField(Rec."Job Task No.");
                        JobTask.SetRange("Job No.", Job."No.");
                        JobTask.SetRange("Job Task No.", Rec."Job Task No.");

                        Report.RunModal(Report::"Job Split Planning Line", true, false, JobTask);
                    end;
                }
                action("Change &Dates")
                {
                    ApplicationArea = Basic;
                    Caption = 'Change &Dates';
                    Ellipsis = true;
                    Image = ChangeDate;
                    ToolTip = 'Executes the Change &Dates action.';
                    trigger OnAction()
                    var
                        Job: Record Job;
                        JobTask: Record "Job Task";
                    begin
                        Rec.TestField(Rec."Job No.");
                        Job.Get(Rec."Job No.");
                        if Job.Blocked = Job.Blocked::All then
                            Job.TestBlocked();

                        JobTask.SetRange("Job No.", Job."No.");
                        if Rec."Job Task No." <> '' then
                            JobTask.SetRange("Job Task No.", Rec."Job Task No.");

                        Report.RunModal(Report::"Change Job Dates", true, false, JobTask);
                    end;
                }
                action("<Action7>")
                {
                    ApplicationArea = Basic;
                    Caption = 'I&ndent Job Tasks';
                    Image = Indent;
                    RunObject = codeunit "Job Task-Indent";
                    ToolTip = 'Executes the I&ndent Job Tasks action.';
                }
                group("&Copy")
                {
                    Caption = '&Copy';
                    Image = Copy;
                    action("Copy Job Planning Lines &from...")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Copy Job Planning Lines &from...';
                        Ellipsis = true;
                        Image = CopyToTask;
                        Promoted = true;
                        PromotedCategory = Process;
                        ToolTip = 'Executes the Copy Job Planning Lines &from... action.';
                        trigger OnAction()
                        var
                            CopyJobPlanningLines: Page "Copy Job Planning Lines";
                        begin
                            Rec.TestField(Rec."Job Task Type", Rec."Job Task Type"::Posting);
                            CopyJobPlanningLines.SetToJobTask(Rec);
                            CopyJobPlanningLines.RunModal();
                        end;
                    }
                    action("Copy Job Planning Lines &to...")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Copy Job Planning Lines &to...';
                        Ellipsis = true;
                        Image = CopyFromTask;
                        Promoted = true;
                        PromotedCategory = Process;
                        ToolTip = 'Executes the Copy Job Planning Lines &to... action.';
                        trigger OnAction()
                        var
                            CopyJobPlanningLines: Page "Copy Job Planning Lines";
                        begin
                            Rec.TestField(Rec."Job Task Type", Rec."Job Task Type"::Posting);
                            CopyJobPlanningLines.SetFromJobTask(Rec);
                            CopyJobPlanningLines.RunModal();
                        end;
                    }
                }
                group("<Action13>")
                {
                    Caption = 'W&IP';
                    Image = WIP;
                    action("<Action48>")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Calculate WIP';
                        Ellipsis = true;
                        Image = CalculateWIP;
                        ToolTip = 'Executes the &Calculate WIP action.';
                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TestField(Rec."Job No.");
                            Job.Get(Rec."Job No.");
                            Job.SetRange("No.", Job."No.");
                            Report.RunModal(Report::"Job Calculate WIP", true, false, Job);
                        end;
                    }
                    action("<Action49>")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Post WIP to G/L';
                        Ellipsis = true;
                        Image = PostOrder;
                        ShortcutKey = 'F9';
                        ToolTip = 'Executes the &Post WIP to G/L action.';
                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TestField(Rec."Job No.");
                            Job.Get(Rec."Job No.");
                            Job.SetRange("No.", Job."No.");
                            Report.RunModal(Report::"Job Post WIP to G/L", true, false, Job);
                        end;
                    }
                    action("FA WIP Cost Transfer")
                    {
                        ApplicationArea = Basic;
                        Caption = 'FA WIP Cost Transfer';
                        Image = TransferToLines;
                        Promoted = true;
                        ToolTip = 'Executes the FA WIP Cost Transfer action.';
                        trigger OnAction()
                        begin
                            Rec.TestField(Rec."Job No.");


                            Job.Get(Rec."Job No.");
                            if Job.Blocked = Job.Blocked::All then
                                Job.TestBlocked();

                            Clear(Job);
                            Job.SetRange("No.", Rec."Job No.");
                            Job.FindFirst();

                            Report.RunModal(Report::"Convert WIP to FA", true, false, Job);
                        end;
                    }
                }
            }
        }
        area(Reporting)
        {
            action("Job Actual to Budget")
            {
                ApplicationArea = Basic;
                Caption = 'Job Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Actual To Budget";
                ToolTip = 'Executes the Job Actual to Budget action.';
            }
            action("Job Analysis")
            {
                ApplicationArea = Basic;
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Analysis";
                ToolTip = 'Executes the Job Analysis action.';
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job - Planning Lines";
                ToolTip = 'Executes the Job - Planning Lines action.';
            }
            action("Job - Suggested Billing")
            {
                ApplicationArea = Basic;
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Suggested Billing";
                ToolTip = 'Executes the Job - Suggested Billing action.';
            }
            action("Jobs - Transaction Detail")
            {
                ApplicationArea = Basic;
                Caption = 'Jobs - Transaction Detail';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = report "Job - Transaction Detail";
                ToolTip = 'Executes the Jobs - Transaction Detail action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DescriptionIndent := Rec.Indentation;
        StyleIsStrong := Rec."Job Task Type" <> Rec."Job Task Type"::Posting;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.ClearTempDim();
    end;

    var
        [InDataSet]
        DescriptionIndent: Integer;
        [InDataSet]
        StyleIsStrong: Boolean;
        Job: Record Job;
}
