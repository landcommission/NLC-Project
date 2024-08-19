#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193842 "compliance Manager Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part("<compliance Manager Activities>"; "HR Leave Jnl. Template List") { }
            }
            group(Control1900724708)
            {
                part(Control1907692008; "My Customers") { }
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1903012608; "Copy Profile") { }
                systempart(Control1901377608; MyNotes) { }
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action("Job &Analysis")
            {
                ApplicationArea = Basic;
                Caption = 'Job &Analysis';
                Image = "Report";
                RunObject = report "Job Analysis";
                ToolTip = 'Executes the Job &Analysis action.';
            }
            action("Job Actual To &Budget")
            {
                ApplicationArea = Basic;
                Caption = 'Job Actual To &Budget';
                Image = "Report";
                RunObject = report "Job Actual To Budget";
                ToolTip = 'Executes the Job Actual To &Budget action.';
            }
            action("Job - Pla&nning Line")
            {
                ApplicationArea = Basic;
                Caption = 'Job - Pla&nning Line';
                Image = "Report";
                RunObject = report "Job - Planning Lines";
                ToolTip = 'Executes the Job - Pla&nning Line action.';
            }
            separator(Action29) { }
            action("Job Su&ggested Billing")
            {
                ApplicationArea = Basic;
                Caption = 'Job Su&ggested Billing';
                Image = "Report";
                RunObject = report "Job Suggested Billing";
                ToolTip = 'Executes the Job Su&ggested Billing action.';
            }
            action("Jobs per &Customer")
            {
                ApplicationArea = Basic;
                Caption = 'Jobs per &Customer';
                Image = "Report";
                RunObject = report "Jobs per Customer";
                ToolTip = 'Executes the Jobs per &Customer action.';
            }
            action("Items per &Job")
            {
                ApplicationArea = Basic;
                Caption = 'Items per &Job';
                Image = "Report";
                RunObject = report "Items per Job";
                ToolTip = 'Executes the Items per &Job action.';
            }
            action("Jobs per &Item")
            {
                ApplicationArea = Basic;
                Caption = 'Jobs per &Item';
                Image = "Report";
                RunObject = report "Jobs per Item";
                ToolTip = 'Executes the Jobs per &Item action.';
            }
        }
        area(embedding) { }
        area(sections)
        {
            group(Concepts)
            {
                Caption = 'Concepts';
                action("Concept Notes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Concept Notes';
                    ToolTip = 'Executes the Concept Notes action.';
                }
                action("Approved Concept Notes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Concept Notes';
                    RunObject = page "HR Applicants UnQualified L";
                    RunPageMode = View;
                    ToolTip = 'Executes the Approved Concept Notes action.';
                }
            }
            group(Proposals)
            {
                Caption = 'Proposals';
                action("Approved Proposals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Proposals';
                    RunObject = page "HR Lookup Values List";
                    ToolTip = 'Executes the Approved Proposals action.';
                }
            }
            group(Projects)
            {
                Caption = 'Projects';
            }
            group("Grants Management")
            {
                Caption = 'Grants Management';
                action(Receipt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipt';
                    RunObject = page "Inspection List";
                    ToolTip = 'Executes the Receipt action.';
                }
                action("Payments Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payments Vouchers';
                    ToolTip = 'Executes the Payments Vouchers action.';
                }
                action("Petty Cash Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Petty Cash Vouchers';
                    ToolTip = 'Executes the Petty Cash Vouchers action.';
                }
                action("Grants Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grants Surrender';
                    ToolTip = 'Executes the Grants Surrender action.';
                }
            }
            group(Journals)
            {
                Caption = 'Journals';
                Image = Journals;
                action("Job Journals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Journals';
                    RunObject = page "Job Journal Batches";
                    RunPageView = where(Recurring = const(false));
                    ToolTip = 'Executes the Job Journals action.';
                }
                action("Job G/L Journals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job G/L Journals';
                    RunObject = page "General Journal Batches";
                    RunPageView = where("Template Type" = const(Jobs),
                                        Recurring = const(false));
                    ToolTip = 'Executes the Job G/L Journals action.';
                }
                action("Resource Journals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Journals';
                    RunObject = page "Resource Jnl. Batches";
                    RunPageView = where(Recurring = const(false));
                    ToolTip = 'Executes the Resource Journals action.';
                }
                action("Item Journals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Journals';
                    RunObject = page "Item Journal Batches";
                    RunPageView = where("Template Type" = const(Item),
                                        Recurring = const(false));
                    ToolTip = 'Executes the Item Journals action.';
                }
                action("Recurring Job Journals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Recurring Job Journals';
                    RunObject = page "Job Journal Batches";
                    RunPageView = where(Recurring = const(true));
                    ToolTip = 'Executes the Recurring Job Journals action.';
                }
                action("Recurring Resource Journals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Recurring Resource Journals';
                    RunObject = page "Resource Jnl. Batches";
                    RunPageView = where(Recurring = const(true));
                    ToolTip = 'Executes the Recurring Resource Journals action.';
                }
                action("Recurring Item Journals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Recurring Item Journals';
                    RunObject = page "Item Journal Batches";
                    RunPageView = where("Template Type" = const(Item),
                                        Recurring = const(true));
                    ToolTip = 'Executes the Recurring Item Journals action.';
                }
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Shipments';
                    RunObject = page "Posted Sales Shipments";
                    ToolTip = 'Executes the Posted Shipments action.';
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Invoices";
                    ToolTip = 'Executes the Posted Sales Invoices action.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Credit Memos";
                    ToolTip = 'Executes the Posted Sales Credit Memos action.';
                }
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = page "Posted Purchase Receipts";
                    ToolTip = 'Executes the Posted Purchase Receipts action.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = page "Posted Purchase Invoices";
                    ToolTip = 'Executes the Posted Purchase Invoices action.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = page "Posted Purchase Credit Memos";
                    ToolTip = 'Executes the Posted Purchase Credit Memos action.';
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = page "G/L Registers";
                    ToolTip = 'Executes the G/L Registers action.';
                }
                action("Job Registers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Registers';
                    Image = JobRegisters;
                    RunObject = page "Job Registers";
                    ToolTip = 'Executes the Job Registers action.';
                }
                action("Item Registers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Registers';
                    Image = ItemRegisters;
                    RunObject = page "Item Registers";
                    ToolTip = 'Executes the Item Registers action.';
                }
                action("Resource Registers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Registers';
                    Image = ResourceRegisters;
                    RunObject = page "Resource Registers";
                    ToolTip = 'Executes the Resource Registers action.';
                }
            }
        }
        area(Processing)
        {
            separator(Action17)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Job J&ournal")
            {
                ApplicationArea = Basic;
                Caption = 'Job J&ournal';
                Image = JobJournal;
                RunObject = page "Job Journal";
                ToolTip = 'Executes the Job J&ournal action.';
            }
            action("Job G/L &Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Job G/L &Journal';
                Image = GLJournal;
                RunObject = page "Job G/L Journal";
                ToolTip = 'Executes the Job G/L &Journal action.';
            }
            action("R&esource Journal")
            {
                ApplicationArea = Basic;
                Caption = 'R&esource Journal';
                Image = ResourceJournal;
                RunObject = page "Resource Journal";
                ToolTip = 'Executes the R&esource Journal action.';
            }
            action("C&hange Job Planning Line Date")
            {
                ApplicationArea = Basic;
                Caption = 'C&hange Job Planning Line Date';
                Image = "Report";
                RunObject = report "Change Job Dates";
                ToolTip = 'Executes the C&hange Job Planning Line Date action.';
            }
            action("Split Pla&nning Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Split Pla&nning Lines';
                Image = Splitlines;
                RunObject = report "Job Split Planning Line";
                ToolTip = 'Executes the Split Pla&nning Lines action.';
            }
            action("Manager Time Sheet by Job")
            {
                ApplicationArea = Basic;
                Caption = 'Manager Time Sheet by Job';
                Image = JobTimeSheet;
                RunObject = page "Manager Time Sheet by Job";
                ToolTip = 'Executes the Manager Time Sheet by Job action.';
            }
            separator(Action5) { }
            action("Job &Create Sales Invoice")
            {
                ApplicationArea = Basic;
                Caption = 'Job &Create Sales Invoice';
                Image = CreateJobSalesInvoice;
                RunObject = report "Job Create Sales Invoice";
                ToolTip = 'Executes the Job &Create Sales Invoice action.';
            }
            separator(Action7) { }
            action("Update Job I&tem Cost")
            {
                ApplicationArea = Basic;
                Caption = 'Update Job I&tem Cost';
                Image = "Report";
                RunObject = report "Update Job Item Cost";
                ToolTip = 'Executes the Update Job I&tem Cost action.';
            }
            action("Job Calculate &WIP")
            {
                ApplicationArea = Basic;
                Caption = 'Job Calculate &WIP';
                Image = "Report";
                RunObject = report "Job Calculate WIP";
                ToolTip = 'Executes the Job Calculate &WIP action.';
            }
            action("Jo&b Post WIP to G/L")
            {
                ApplicationArea = Basic;
                Caption = 'Jo&b Post WIP to G/L';
                Image = "Report";
                RunObject = report "Job Post WIP to G/L";
                ToolTip = 'Executes the Jo&b Post WIP to G/L action.';
            }
            separator(Action11)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic;
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = page Navigate;
                ToolTip = 'Executes the Navi&gate action.';
            }
        }
    }
}
