#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50162 pageextension50162 extends "Small Business Owner RC"
{
    /*
        //Unsupported feature: Property Modification (Name) on ""Small Business Role Center"(Page 9022)".

        layout
        {
            modify(Control7)
            {
                Caption = 'Employees Cue';

                //Unsupported feature: Property Modification (PagePartID) on "Control7(Control 7)".

            }

            //Unsupported feature: Property Modification (ControlType) on "Control9(Control 9)".


            //Unsupported feature: Property Modification (Name) on "Control9(Control 9)".


            //Unsupported feature: Property Insertion (ContainerType) on "Control9(Control 9)".

            modify(Control13)
            {
                Visible = false;
            }
            modify(Control12)
            {
                Visible = false;
            }
            modify(Control16)
            {
                Visible = false;
            }
            modify(Control10)
            {
                Visible = false;
            }
            modify(Control55)
            {
                Visible = false;
            }

            //Unsupported feature: Property Deletion (Level) on "Control9(Control 9)".


            //Unsupported feature: Property Deletion (AccessByPermission) on "Control9(Control 9)".


            //Unsupported feature: Property Deletion (PagePartID) on "Control9(Control 9)".


            //Unsupported feature: Property Deletion (PartType) on "Control9(Control 9)".

            modify(Control96)
            {
                Visible = false;
            }
            addfirst(Control9)
            {
                group(Control8)
                {
                }
            }
            addafter(Control7)
            {
                group(Control6)
                {
                    systempart(Control5;Links)
                    {
                    }
                    systempart(Control4;MyNotes)
                    {
                    }
                }
            }
            //moveafter(;Control9)
        }
        actions
        {
            modify(ActionContainer1)
            {

                //Unsupported feature: Property Modification (ActionType) on "ActionContainer1(Action 1)".


                //Unsupported feature: Property Modification (Name) on "ActionContainer1(Action 1)".


                //Unsupported feature: Property Insertion (Level) on "ActionContainer1(Action 1)".

                Caption = 'HR Exit Interviews';

                //Unsupported feature: Property Insertion (RunObject) on "ActionContainer1(Action 1)".

                ApplicationArea = Basic;
            }
            modify("Sales Invoice")
            {

                //Unsupported feature: Property Modification (Level) on ""Sales Invoice"(Action 2)".


                //Unsupported feature: Property Modification (ActionType) on ""Sales Invoice"(Action 2)".

                Caption = 'HR Exit Management';

                //Unsupported feature: Property Modification (Image) on ""Sales Invoice"(Action 2)".


                //Unsupported feature: Property Modification (Name) on ""Sales Invoice"(Action 2)".

            }
            modify(ActionGroup27)
            {

                //Unsupported feature: Property Modification (Level) on "ActionGroup27(Action 27)".


                //Unsupported feature: Property Modification (ActionType) on "ActionGroup27(Action 27)".

                Caption = 'HR Job (Occupied)';

                //Unsupported feature: Property Modification (Image) on "ActionGroup27(Action 27)".


                //Unsupported feature: Property Modification (Name) on "ActionGroup27(Action 27)".


                //Unsupported feature: Property Insertion (RunObject) on "ActionGroup27(Action 27)".

                ApplicationArea = Basic;
            }
            modify(PostedPurchaseInvoices)
            {

                //Unsupported feature: Property Modification (Level) on "PostedPurchaseInvoices(Action 69)".


                //Unsupported feature: Property Modification (Name) on "PostedPurchaseInvoices(Action 69)".

                Caption = 'HR Job Applicants Unqualified';

                //Unsupported feature: Property Modification (RunObject) on "PostedPurchaseInvoices(Action 69)".

            }
            modify("Sales Credit Memos")
            {

                //Unsupported feature: Property Modification (Level) on ""Sales Credit Memos"(Action 29)".

                Caption = 'HR Job Occupants';

                //Unsupported feature: Property Modification (RunObject) on ""Sales Credit Memos"(Action 29)".


                //Unsupported feature: Property Modification (Name) on ""Sales Credit Memos"(Action 29)".


                //Unsupported feature: Property Insertion (Promoted) on ""Sales Credit Memos"(Action 29)".


                //Unsupported feature: Property Insertion (Image) on ""Sales Credit Memos"(Action 29)".

            }
            modify("Issued Reminders")
            {

                //Unsupported feature: Property Modification (Level) on ""Issued Reminders"(Action 30)".

                Caption = 'HR Jobs';

                //Unsupported feature: Property Modification (RunObject) on ""Issued Reminders"(Action 30)".


                //Unsupported feature: Property Modification (Image) on ""Issued Reminders"(Action 30)".


                //Unsupported feature: Property Modification (Name) on ""Issued Reminders"(Action 30)".


                //Unsupported feature: Property Insertion (Promoted) on ""Issued Reminders"(Action 30)".

            }
            modify("Issued Finance Charge Memos")
            {

                //Unsupported feature: Property Modification (Level) on ""Issued Finance Charge Memos"(Action 26)".

                Caption = 'HR Job Requirements';

                //Unsupported feature: Property Modification (RunObject) on ""Issued Finance Charge Memos"(Action 26)".


                //Unsupported feature: Property Modification (Image) on ""Issued Finance Charge Memos"(Action 26)".


                //Unsupported feature: Property Modification (Name) on ""Issued Finance Charge Memos"(Action 26)".

            }
            modify(Analysis)
            {

                //Unsupported feature: Property Modification (Level) on "Analysis(Action 70)".


                //Unsupported feature: Property Modification (ActionType) on "Analysis(Action 70)".

                Caption = 'HR Approved Qualified Applicants';

                //Unsupported feature: Property Modification (Name) on "Analysis(Action 70)".


                //Unsupported feature: Property Insertion (RunObject) on "Analysis(Action 70)".

                ApplicationArea = Basic;
            }
            modify("Account Schedules")
            {
                Caption = 'HR Job Applicants Unqualified';

                //Unsupported feature: Property Modification (RunObject) on ""Account Schedules"(Action 71)".


                //Unsupported feature: Property Modification (Name) on ""Account Schedules"(Action 71)".

            }
            modify("Sales Analysis Reports")
            {
                Caption = 'HR Job Applicants Qualified';

                //Unsupported feature: Property Modification (RunObject) on ""Sales Analysis Reports"(Action 72)".


                //Unsupported feature: Property Modification (Name) on ""Sales Analysis Reports"(Action 72)".

            }
            modify("Purchase Analysis Reports")
            {
                Caption = 'HR Shortlisting';

                //Unsupported feature: Property Modification (RunObject) on ""Purchase Analysis Reports"(Action 73)".


                //Unsupported feature: Property Modification (Name) on ""Purchase Analysis Reports"(Action 73)".

            }
            modify("Inventory Analysis Reports")
            {
                Caption = 'HR Job Applications';

                //Unsupported feature: Property Modification (RunObject) on ""Inventory Analysis Reports"(Action 74)".


                //Unsupported feature: Property Modification (Name) on ""Inventory Analysis Reports"(Action 74)".

            }
            modify("Cash Flow Forecasts")
            {
                Caption = 'HR Employee Requisitions';

                //Unsupported feature: Property Modification (RunObject) on ""Cash Flow Forecasts"(Action 75)".


                //Unsupported feature: Property Modification (Name) on ""Cash Flow Forecasts"(Action 75)".

            }
            modify("Chart of Cash Flow Accounts")
            {

                //Unsupported feature: Property Modification (Level) on ""Chart of Cash Flow Accounts"(Action 76)".


                //Unsupported feature: Property Modification (ActionType) on ""Chart of Cash Flow Accounts"(Action 76)".

                Caption = 'HR Employee Recruitment';

                //Unsupported feature: Property Modification (Name) on ""Chart of Cash Flow Accounts"(Action 76)".


                //Unsupported feature: Property Insertion (Image) on ""Chart of Cash Flow Accounts"(Action 76)".

            }
            modify("Bank Acc. Reconciliations")
            {

                //Unsupported feature: Property Modification (Level) on ""Bank Acc. Reconciliations"(Action 28)".

                Caption = 'HR Job (Vacant)';

                //Unsupported feature: Property Modification (RunObject) on ""Bank Acc. Reconciliations"(Action 28)".


                //Unsupported feature: Property Modification (Image) on ""Bank Acc. Reconciliations"(Action 28)".


                //Unsupported feature: Property Modification (Name) on ""Bank Acc. Reconciliations"(Action 28)".

            }

            //Unsupported feature: Property Modification (ActionType) on ""Bank Acc. Statements"(Action 33)".


            //Unsupported feature: Property Modification (Name) on ""Bank Acc. Statements"(Action 33)".


            //Unsupported feature: Property Insertion (ActionContainerType) on ""Bank Acc. Statements"(Action 33)".

            modify(Action3)
            {

                //Unsupported feature: Property Modification (Level) on "Action3(Action 3)".

                Caption = 'HR Exit Questionnaire';

                //Unsupported feature: Property Modification (RunObject) on "Action3(Action 3)".


                //Unsupported feature: Property Modification (Name) on "Action3(Action 3)".

            }

            //Unsupported feature: Property Modification (ActionType) on ""Intrastat Journals"(Action 80)".


            //Unsupported feature: Property Modification (Name) on ""Intrastat Journals"(Action 80)".


            //Unsupported feature: Property Insertion (ActionContainerType) on ""Intrastat Journals"(Action 80)".


            //Unsupported feature: Property Deletion (ActionContainerType) on "ActionContainer1(Action 1)".

            modify(New)
            {
                Visible = false;
            }
            modify("Sales Quote")
            {
                Visible = false;
            }

            //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Invoice"(Action 2)".


            //Unsupported feature: Property Deletion (RunObject) on ""Sales Invoice"(Action 2)".


            //Unsupported feature: Property Deletion (RunPageMode) on ""Sales Invoice"(Action 2)".


            //Unsupported feature: Property Deletion (ApplicationArea) on ""Sales Invoice"(Action 2)".

            modify("Purchase Invoice")
            {
                Visible = false;
            }
            modify(Payments)
            {
                Visible = false;
            }
            modify("Payment Registration")
            {
                Visible = false;
            }
            modify(Setup)
            {
                Visible = false;
            }
            modify("Company Information")
            {
                Visible = false;
            }
            modify("General Ledger Setup")
            {
                Visible = false;
            }
            modify("Sales & Receivables Setup")
            {
                Visible = false;
            }
            modify("Purchases & Payables Setup")
            {
                Visible = false;
            }
            modify("Inventory Setup")
            {
                Visible = false;
            }
            modify("Fixed Assets Setup")
            {
                Visible = false;
            }
            modify("Human Resources Setup")
            {
                Visible = false;
            }
            modify("Jobs Setup")
            {
                Visible = false;
            }
            modify("Getting Started")
            {
                Visible = false;
            }
            modify("Show/Hide Getting Started")
            {
                Visible = false;
            }
            modify(ActionContainer8)
            {
                Visible = false;
            }
            modify(Customers)
            {
                Visible = false;
            }
            modify(Vendors)
            {
                Visible = false;
            }
            modify(Items)
            {
                Visible = false;
            }
            modify("Posted Sales Invoices")
            {
                Visible = false;
            }
            modify("Ongoing Sales Quotes")
            {
                Visible = false;
            }
            modify(ActionContainer38)
            {
                Visible = false;
            }
            modify(Bookkeeping)
            {
                Visible = false;
            }
            modify("General Journals")
            {
                Visible = false;
            }
            modify("Chart of Accounts")
            {
                Visible = false;
            }
            modify("G/L Budgets")
            {
                Visible = false;
            }
            modify("Fixed Assets")
            {
                Visible = false;
            }
            modify(Employees)
            {
                Visible = false;
            }
            modify("Cash Receipt Journals")
            {
                Visible = false;
            }
            modify("Payment Journals")
            {
                Visible = false;
            }
            modify("Sales Invoices")
            {
                Visible = false;
            }
            modify(Action56)
            {
                Visible = false;
            }
            modify("Posted Sales Credit Memos")
            {
                Visible = false;
            }
            modify(Reminders)
            {
                Visible = false;
            }
            modify("Finance Charge Memos")
            {
                Visible = false;
            }
            modify("<Page Mini Purchase Invoices>")
            {
                Visible = false;
            }
            modify("<Page Mini Posted Purchase Invoices>")
            {
                Visible = false;
            }
            modify("<Page Mini Purchase Credit Memos>")
            {
                Visible = false;
            }
            modify("<Page Mini Posted Purchase Credit Memos>")
            {
                Visible = false;
            }

            //Unsupported feature: Property Deletion (Image) on "Analysis(Action 70)".

            modify("VAT Reports")
            {
                Visible = false;
            }

            //Unsupported feature: Property Deletion (RunObject) on ""Chart of Cash Flow Accounts"(Action 76)".


            //Unsupported feature: Property Deletion (ApplicationArea) on ""Chart of Cash Flow Accounts"(Action 76)".

            modify("Cash Flow Manual Revenues")
            {
                Visible = false;
            }
            modify("Cash Flow Manual Expenses")
            {
                Visible = false;
            }
            modify("Bank & Payments")
            {
                Visible = false;
            }
            modify("Bank Accounts")
            {
                Visible = false;
            }

            //Unsupported feature: Property Deletion (Level) on ""Bank Acc. Statements"(Action 33)".


            //Unsupported feature: Property Deletion (CaptionML) on ""Bank Acc. Statements"(Action 33)".


            //Unsupported feature: Property Deletion (RunObject) on ""Bank Acc. Statements"(Action 33)".


            //Unsupported feature: Property Deletion (Image) on ""Bank Acc. Statements"(Action 33)".


            //Unsupported feature: Property Deletion (ApplicationArea) on ""Bank Acc. Statements"(Action 33)".


            //Unsupported feature: Property Deletion (RunPageView) on "Action3(Action 3)".


            //Unsupported feature: Property Deletion (Image) on "Action3(Action 3)".

            modify(Action36)
            {
                Visible = false;
            }
            modify(Action41)
            {
                Visible = false;
            }
            modify(Currencies)
            {
                Visible = false;
            }
            modify("Direct Debit Collections")
            {
                Visible = false;
            }
            modify(Jobs)
            {
                Visible = false;
            }
            modify(Action84)
            {
                Visible = false;
            }
            modify("On Order")
            {
                Visible = false;
            }
            modify("Planned and Quoted")
            {
                Visible = false;
            }
            modify(Completed)
            {
                Visible = false;
            }
            modify(Unassigned)
            {
                Visible = false;
            }
            modify("Job Tasks")
            {
                Visible = false;
            }
            modify(Action86)
            {
                Visible = false;
            }
            modify(Action87)
            {
                Visible = false;
            }
            modify(Resources)
            {
                Visible = false;
            }
            modify("Resource Groups")
            {
                Visible = false;
            }
            modify(MiniPurchasesInvoices)
            {
                Visible = false;
            }
            modify(MiniCreditMemos)
            {
                Visible = false;
            }
            modify(Action90)
            {
                Visible = false;
            }
            modify(Action91)
            {
                Visible = false;
            }
            modify("Time Sheets")
            {
                Visible = false;
            }
            modify("VAT Reporting")
            {
                Visible = false;
            }
            modify("VAT Statements")
            {
                Visible = false;
            }

            //Unsupported feature: Property Deletion (Level) on ""Intrastat Journals"(Action 80)".


            //Unsupported feature: Property Deletion (CaptionML) on ""Intrastat Journals"(Action 80)".


            //Unsupported feature: Property Deletion (RunObject) on ""Intrastat Journals"(Action 80)".


            //Unsupported feature: Property Deletion (ApplicationArea) on ""Intrastat Journals"(Action 80)".

            modify(Action51)
            {
                Visible = false;
            }
            modify(Action48)
            {
                Visible = false;
            }
            modify("Posted Purchase Invoices")
            {
                Visible = false;
            }
            addafter("Sales Invoice")
            {
                action("HR Clearance List")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Clearance List';
                    RunObject = Page "Clearance List";
                }
            }
            //moveafter(;"Intrastat Journals")
            moveafter(ActionContainer80;"Chart of Cash Flow Accounts")
            moveafter("HR Employee Recruitment";"Cash Flow Forecasts")
            moveafter("HR Employee Requisitions";"Inventory Analysis Reports")
            moveafter("HR Job Applications";"Purchase Analysis Reports")
            moveafter("HR Shortlisting";"Sales Analysis Reports")
            moveafter("HR Job Applicants Qualified";"Account Schedules")
            moveafter("HR Job Applicants Unqualified";Analysis)
            moveafter("HR Approved Qualified Applicants";"Sales Invoice")
            moveafter("HR Exit Interviews";PostedPurchaseInvoices)
            moveafter(Action69;"Bank Acc. Statements")
            moveafter(ActionContainer33;"Issued Reminders")
            moveafter("HR Jobs";"Sales Credit Memos")
            moveafter("HR Job Occupants";"Bank Acc. Reconciliations")
        } */
}

