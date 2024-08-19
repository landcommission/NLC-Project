#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193785 "FA WIP List"
{
    ApplicationArea = Basic;
    CardPageId = "FA WIP Card";
    SourceTable = Job;
    SourceTableView = where(Type = const(WIP));
    UsageCategory = Lists;
    Caption = 'FA WIP List';
    layout
    {
        area(Content)
        {
            repeater(Control20)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a short description of the job.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the customer who pays for the job.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a current status of the job. You can change the status for the job as it progresses. Final calculations can be made on completed jobs.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the person at your company who is responsible for the job.';
                }
                field("Next Invoice Date"; Rec."Next Invoice Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the next invoice date for the job.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the posting group that links transactions made for the job with the appropriate general ledger accounts according to the general posting setup.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an additional description of the job for searching purposes.';
                }
                field("% of Overdue Planning Lines"; Rec.PercentOverdue())
                {
                    ApplicationArea = Basic;
                    Caption = '% of Overdue Planning Lines';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the % of Overdue Planning Lines field.';
                }
                field("% Completed"; Rec.PercentCompleted())
                {
                    ApplicationArea = Basic;
                    Caption = '% Completed';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the % Completed field.';
                }
                field("% Invoiced"; Rec.PercentInvoiced())
                {
                    ApplicationArea = Basic;
                    Caption = '% Invoiced';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the % Invoiced field.';
                }
                field("Usage (Cost)"; Rec."Usage (Cost)")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP Cost';
                    ToolTip = 'Specifies the value of the WIP Cost field.';
                }
                field("Amount Posted to FA"; Rec."Amount Posted to FA")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Posted to FA field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control5; "Sales Hist. Bill-to FactBox")
            {
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = false;
            }
            part(Control4; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = false;
            }
            part(Control3; "Job WIP/Recognition FactBox")
            {
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            systempart(Control2; Links)
            {
                Visible = false;
            }
            systempart(Control1; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action("FA WIP Task &Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA WIP Task &Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "FA WIP Job Task Lines";
                    RunPageLink = "Job No." = field("No.");
                    ShortcutKey = 'Shift+Ctrl+T';
                    ToolTip = 'Executes the FA WIP Task &Lines action.';
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
                        RunObject = page "Default Dimensions";
                        RunPageLink = "Table ID" = const(167),
                                      "No." = field("No.");
                        ShortcutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-&Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';
                        trigger OnAction()
                        var
                            Job: Record Job;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Job);
                            DefaultDimMultiple.SetMultiJob2(Job);
                            DefaultDimMultiple.RunModal();
                        end;
                    }
                }
                action("&Statistics")
                {
                    ApplicationArea = Basic;
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Job Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the &Statistics action.';
                }
                action("Sales &Invoices / Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales &Invoices / Credit Memos';
                    Image = GetSourceDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Sales &Invoices / Credit Memos action.';
                    trigger OnAction()
                    var
                        JobInvoices: Page "Job Invoices";
                    begin
                        JobInvoices.SetPrJob(Rec);
                        JobInvoices.RunModal();
                    end;
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
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                Visible = false;
                action("&WIP Entries")
                {
                    ApplicationArea = Basic;
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = page "Job WIP Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Posting Group", "WIP Posting Date");
                    ToolTip = 'Executes the &WIP Entries action.';
                }
                action("WIP &G/L Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = page "Job WIP G/L Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.");
                    ToolTip = 'Executes the WIP &G/L Entries action.';
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                action("&Resource")
                {
                    ApplicationArea = Basic;
                    Caption = '&Resource';
                    Image = Resource;
                    RunObject = page "Job Resource Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'Executes the &Resource action.';
                }
                action("&Item")
                {
                    ApplicationArea = Basic;
                    Caption = '&Item';
                    Image = Item;
                    RunObject = page "Job Item Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'Executes the &Item action.';
                }
                action("&G/L Account")
                {
                    ApplicationArea = Basic;
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    RunObject = page "Job G/L Account Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'Executes the &G/L Account action.';
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action("Resource &Allocated per Job")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = page "Resource Allocated per Job";
                    ToolTip = 'Executes the Resource &Allocated per Job action.';
                }
                action("Res. Group All&ocated per Job")
                {
                    ApplicationArea = Basic;
                    Caption = 'Res. Group All&ocated per Job';
                    Image = ViewJob;
                    RunObject = page "Res. Gr. Allocated per Job";
                    ToolTip = 'Executes the Res. Group All&ocated per Job action.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Job Ledger Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Task No.", "Entry Type", "Posting Date");
                    ShortcutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Ledger E&ntries action.';
                }
            }
        }
        area(Processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyJob)
                {
                    ApplicationArea = Basic;
                    Caption = '&Copy FA WIP';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the &Copy FA WIP action.';
                    trigger OnAction()
                    var
                        CopyJob: Page "Copy Job";
                    begin
                        CopyJob.SetFromJob(Rec);
                        CopyJob.RunModal();
                    end;
                }
                action("Create Job &Sales Invoice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Job &Sales Invoice';
                    Image = CreateJobSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = report "Job Create Sales Invoice";
                    Visible = false;
                    ToolTip = 'Executes the Create Job &Sales Invoice action.';
                }
                group(ActionGroup37)
                {
                    Caption = 'W&IP';
                    Image = WIP;
                    Visible = false;
                    action("<Action151>")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Calculate WIP';
                        Ellipsis = true;
                        Image = CalculateWIP;
                        ToolTip = 'Executes the &Calculate WIP action.';
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;

                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TestField(Rec."No.");
                            Job.Copy(Rec);
                            Job.SetRange("No.", Rec."No.");
                            Report.RunModal(Report::"Job Calculate WIP", true, false, Job);
                        end;
                    }
                    action("<Action152>")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Post WIP to G/L';
                        Ellipsis = true;
                        Image = PostOrder;
                        ToolTip = 'Executes the &Post WIP to G/L action.';
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;

                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TestField(Rec."No.");
                            Job.Copy(Rec);
                            Job.SetRange("No.", Rec."No.");
                            Report.RunModal(Report::"Job Post WIP to G/L", true, false, Job);
                        end;
                    }
                }
            }
        }
        area(Reporting)
        {
            action("Actual to Budget")
            {
                ApplicationArea = Basic;
                Caption = 'Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Actual To Budget";
                ToolTip = 'Executes the Actual to Budget action.';
            }
            action("FA WIP Analysis")
            {
                ApplicationArea = Basic;
                Caption = 'FA WIP Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Analysis";
                ToolTip = 'Executes the FA WIP Analysis action.';
            }
            action("FA WIP - Planning Lines")
            {
                ApplicationArea = Basic;
                Caption = 'FA WIP - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job - Planning Lines";
                ToolTip = 'Executes the FA WIP - Planning Lines action.';
            }
            action("FA WIP - Suggested Billing")
            {
                ApplicationArea = Basic;
                Caption = 'FA WIP - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Suggested Billing";
                ToolTip = 'Executes the FA WIP - Suggested Billing action.';
            }
            action("FA WIP per Customer")
            {
                ApplicationArea = Basic;
                Caption = 'FA WIP per Customer';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = report "Jobs per Customer";
                ToolTip = 'Executes the FA WIP per Customer action.';
            }
            action("Items per FA WIP")
            {
                ApplicationArea = Basic;
                Caption = 'Items per FA WIP';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = report "Items per Job";
                ToolTip = 'Executes the Items per FA WIP action.';
            }
            action("FA WIP per Item")
            {
                ApplicationArea = Basic;
                Caption = 'FA WIP per Item';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = report "Jobs per Item";
                ToolTip = 'Executes the FA WIP per Item action.';
            }
            group("Financial Management")
            {
                Caption = 'Financial Management';
                Image = "Report";
                action("WIP to G/L")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP to G/L';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Job WIP To G/L";
                    ToolTip = 'Executes the WIP to G/L action.';
                }
            }
            group(ActionGroup24)
            {
                Caption = 'History';
                Image = "Report";
                action("Transaction Detail")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Detail';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Job - Transaction Detail";
                    ToolTip = 'Executes the Transaction Detail action.';
                }
                action("FA WIP Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA WIP Register';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Job Register";
                    ToolTip = 'Executes the FA WIP Register action.';
                }
            }
        }
    }
}
