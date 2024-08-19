#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50159 pageextension50159 extends "Accounting Manager Role Center"
{

    //Unsupported feature: Property Modification (Name) on ""Accounting Manager Role Center"(Page 9001)".

    layout
    {
        /* modify(Control1900000008)
        {
            Visible = false;
        } */
        modify(Control1900724808)
        {
            Visible = false;
        }
        modify(Control99)
        {
            Visible = false;
        }
        modify(Control1902304208)
        {
            Visible = false;
        }
        modify(Control1907692008)
        {
            Visible = false;
        }
        modify(Control1900724708)
        {
            Visible = false;
        }
        modify(Control103)
        {
            Visible = false;
        }
        modify(Control106)
        {
            Visible = false;
        }
        modify(Control100)
        {
            Visible = false;
        }
        modify(Control1902476008)
        {
            Visible = false;
        }
        modify(Control108)
        {
            Visible = false;
        }
        /* modify(Control1903012608)
        {
            Visible = false;
        } */
        modify(Control1901377608)
        {
            Visible = false;
        }
        addfirst(rolecenter)
        {
            group(Control29)
            {
                part(Control27; "HR Employee Cue")
                {
                    Caption = 'Employees Cue';
                    ApplicationArea = All;
                }
            }
            group(Control25)
            {
                systempart(Control18; Links)
                {
                    ApplicationArea = All;
                }
                systempart(Control5; MyNotes)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        modify("&G/L Trial Balance")
        {

            //Unsupported feature: Property Modification (Level) on ""&G/L Trial Balance"(Action 32)".

            Caption = 'HR Approval Entries';

            //Unsupported feature: Property Modification (RunObject) on ""&G/L Trial Balance"(Action 32)".


            //Unsupported feature: Property Modification (Name) on ""&G/L Trial Balance"(Action 32)".

        }
        modify("&Bank Detail Trial Balance")
        {

            //Unsupported feature: Property Modification (ActionType) on ""&Bank Detail Trial Balance"(Action 33)".

            Caption = 'HR Approvals Management';

            //Unsupported feature: Property Modification (Image) on ""&Bank Detail Trial Balance"(Action 33)".


            //Unsupported feature: Property Modification (Name) on ""&Bank Detail Trial Balance"(Action 33)".

        }
        modify("&Account Schedule")
        {

            //Unsupported feature: Property Modification (ActionType) on ""&Account Schedule"(Action 34)".

            Caption = 'Payroll';

            //Unsupported feature: Property Modification (Image) on ""&Account Schedule"(Action 34)".


            //Unsupported feature: Property Modification (Name) on ""&Account Schedule"(Action 34)".

        }
        modify("Bu&dget")
        {

            //Unsupported feature: Property Modification (Level) on ""Bu&dget"(Action 35)".

            Caption = 'HR Employee Disciplinary Cases';

            //Unsupported feature: Property Modification (RunObject) on ""Bu&dget"(Action 35)".


            //Unsupported feature: Property Modification (Name) on ""Bu&dget"(Action 35)".

        }
        modify("Trial Bala&nce/Budget")
        {

            //Unsupported feature: Property Modification (Level) on ""Trial Bala&nce/Budget"(Action 36)".

            Caption = 'HR E-Mail Parameters List';

            //Unsupported feature: Property Modification (RunObject) on ""Trial Bala&nce/Budget"(Action 36)".


            //Unsupported feature: Property Modification (Name) on ""Trial Bala&nce/Budget"(Action 36)".

        }
        modify("Trial Balance by &Period")
        {

            //Unsupported feature: Property Modification (Level) on ""Trial Balance by &Period"(Action 37)".

            Caption = 'HR Disciplinary Cases List';

            //Unsupported feature: Property Modification (RunObject) on ""Trial Balance by &Period"(Action 37)".


            //Unsupported feature: Property Modification (Name) on ""Trial Balance by &Period"(Action 37)".

        }
        modify("&Fiscal Year Balance")
        {

            //Unsupported feature: Property Modification (ActionType) on ""&Fiscal Year Balance"(Action 46)".

            Caption = 'HR Welfare Management';

            //Unsupported feature: Property Modification (Image) on ""&Fiscal Year Balance"(Action 46)".


            //Unsupported feature: Property Modification (Name) on ""&Fiscal Year Balance"(Action 46)".

        }
        modify("Balance Comp. - Prev. Y&ear")
        {

            //Unsupported feature: Property Modification (Level) on ""Balance Comp. - Prev. Y&ear"(Action 47)".

            Caption = 'Approvals';

            //Unsupported feature: Property Modification (RunObject) on ""Balance Comp. - Prev. Y&ear"(Action 47)".


            //Unsupported feature: Property Modification (Name) on ""Balance Comp. - Prev. Y&ear"(Action 47)".

        }

        //Unsupported feature: Property Modification (ActionType) on ""&Closing Trial Balance"(Action 48)".


        //Unsupported feature: Property Modification (Name) on ""&Closing Trial Balance"(Action 48)".


        //Unsupported feature: Property Insertion (ActionContainerType) on ""&Closing Trial Balance"(Action 48)".

        modify("Aged Accounts &Receivable")
        {

            //Unsupported feature: Property Modification (Level) on ""Aged Accounts &Receivable"(Action 50)".

            Caption = 'HR Appraisals List - Target Evaluation';

            //Unsupported feature: Property Modification (RunObject) on ""Aged Accounts &Receivable"(Action 50)".


            //Unsupported feature: Property Modification (Name) on ""Aged Accounts &Receivable"(Action 50)".

        }
        modify("Aged Accounts Pa&yable")
        {

            //Unsupported feature: Property Modification (Level) on ""Aged Accounts Pa&yable"(Action 51)".

            Caption = 'HR Appraisals List - Target Approval';

            //Unsupported feature: Property Modification (RunObject) on ""Aged Accounts Pa&yable"(Action 51)".


            //Unsupported feature: Property Modification (Name) on ""Aged Accounts Pa&yable"(Action 51)".

        }
        modify("Reconcile Cus&t. and Vend. Accs")
        {

            //Unsupported feature: Property Modification (Level) on ""Reconcile Cus&t. and Vend. Accs"(Action 52)".

            Caption = 'HR Appraisals List - Target Setting';

            //Unsupported feature: Property Modification (RunObject) on ""Reconcile Cus&t. and Vend. Accs"(Action 52)".


            //Unsupported feature: Property Modification (Name) on ""Reconcile Cus&t. and Vend. Accs"(Action 52)".

        }
        modify(Action53)
        {

            //Unsupported feature: Property Modification (ActionType) on "Action53(Action 53)".


            //Unsupported feature: Property Modification (Name) on "Action53(Action 53)".

            Caption = 'HR Performance Management';

            //Unsupported feature: Property Insertion (Image) on "Action53(Action 53)".

        }

        //Unsupported feature: Property Modification (ActionType) on "Action4(Action 4)".


        //Unsupported feature: Property Modification (Name) on "Action4(Action 4)".


        //Unsupported feature: Property Insertion (ActionContainerType) on "Action4(Action 4)".

        modify("Cost Accounting P/L Statement")
        {
            Caption = 'Other PR Listing';

            //Unsupported feature: Property Modification (RunObject) on ""Cost Accounting P/L Statement"(Action 7)".


            //Unsupported feature: Property Modification (Image) on ""Cost Accounting P/L Statement"(Action 7)".


            //Unsupported feature: Property Modification (Name) on ""Cost Accounting P/L Statement"(Action 7)".

        }
        modify("CA P/L Statement per Period")
        {
            Caption = 'PR NSSF';

            //Unsupported feature: Property Modification (RunObject) on ""CA P/L Statement per Period"(Action 15)".


            //Unsupported feature: Property Modification (Name) on ""CA P/L Statement per Period"(Action 15)".

        }
        modify("CA P/L Statement with Budget")
        {
            Caption = 'HR Job Requirements';

            //Unsupported feature: Property Modification (RunObject) on ""CA P/L Statement with Budget"(Action 21)".


            //Unsupported feature: Property Modification (Image) on ""CA P/L Statement with Budget"(Action 21)".


            //Unsupported feature: Property Modification (Name) on ""CA P/L Statement with Budget"(Action 21)".

        }
        modify("Cost Accounting Analysis")
        {

            //Unsupported feature: Property Modification (Level) on ""Cost Accounting Analysis"(Action 42)".

            Caption = 'HR Training Application List';

            //Unsupported feature: Property Modification (RunObject) on ""Cost Accounting Analysis"(Action 42)".


            //Unsupported feature: Property Modification (Name) on ""Cost Accounting Analysis"(Action 42)".

        }
        modify("Chart of Accounts")
        {

            //Unsupported feature: Property Modification (Level) on ""Chart of Accounts"(Action 2)".

            Caption = 'HR Job Requirement';

            //Unsupported feature: Property Modification (RunObject) on ""Chart of Accounts"(Action 2)".


            //Unsupported feature: Property Modification (Name) on ""Chart of Accounts"(Action 2)".


            //Unsupported feature: Property Insertion (Promoted) on ""Chart of Accounts"(Action 2)".

        }
        modify(Vendors)
        {
            Caption = 'Company Payslip';

            //Unsupported feature: Property Modification (RunObject) on "Vendors(Action 8)".


            //Unsupported feature: Property Modification (Image) on "Vendors(Action 8)".


            //Unsupported feature: Property Modification (Name) on "Vendors(Action 8)".


            //Unsupported feature: Property Insertion (Promoted) on "Vendors(Action 8)".

        }
        modify("Purchase Orders")
        {
            Caption = 'Muster Payroll';

            //Unsupported feature: Property Modification (RunObject) on ""Purchase Orders"(Action 6)".


            //Unsupported feature: Property Modification (Name) on ""Purchase Orders"(Action 6)".


            //Unsupported feature: Property Insertion (Promoted) on ""Purchase Orders"(Action 6)".


            //Unsupported feature: Property Insertion (Image) on ""Purchase Orders"(Action 6)".

        }

        //Unsupported feature: Property Modification (ActionType) on "Budgets(Action 76)".


        //Unsupported feature: Property Modification (Name) on "Budgets(Action 76)".


        //Unsupported feature: Property Insertion (ActionContainerType) on "Budgets(Action 76)".

        modify("Bank Accounts")
        {
            Caption = 'PR P10D';

            //Unsupported feature: Property Modification (RunObject) on ""Bank Accounts"(Action 9)".


            //Unsupported feature: Property Modification (Name) on ""Bank Accounts"(Action 9)".

        }
        modify("VAT Statements")
        {
            Caption = 'PR P10C';

            //Unsupported feature: Property Modification (RunObject) on ""VAT Statements"(Action 10)".


            //Unsupported feature: Property Modification (Name) on ""VAT Statements"(Action 10)".

        }
        modify(Items)
        {
            Caption = 'PR P10B';

            //Unsupported feature: Property Modification (RunObject) on "Items(Action 11)".


            //Unsupported feature: Property Modification (Name) on "Items(Action 11)".

        }
        modify(Customers)
        {
            Caption = 'PR P10A';

            //Unsupported feature: Property Modification (RunObject) on "Customers(Action 12)".


            //Unsupported feature: Property Modification (Name) on "Customers(Action 12)".

        }
        /* modify(Action13)
        {
            Caption = 'PR P9A';

            //Unsupported feature: Property Modification (RunObject) on "Action13(Action 13)".


            //Unsupported feature: Property Modification (Name) on "Action13(Action 13)".


            //Unsupported feature: Property Insertion (Promoted) on "Action13(Action 13)".

        } */
        modify("Sales Orders")
        {
            Caption = 'PR NHIF';

            //Unsupported feature: Property Modification (RunObject) on ""Sales Orders"(Action 14)".


            //Unsupported feature: Property Modification (Name) on ""Sales Orders"(Action 14)".


            //Unsupported feature: Property Insertion (Promoted) on ""Sales Orders"(Action 14)".

        }
        modify("Fixed Assets")
        {

            //Unsupported feature: Property Modification (ActionType) on ""Fixed Assets"(Action 16)".

            Caption = 'HR Training Needs';

            //Unsupported feature: Property Modification (Image) on ""Fixed Assets"(Action 16)".


            //Unsupported feature: Property Modification (Name) on ""Fixed Assets"(Action 16)".


            //Unsupported feature: Property Insertion (RunObject) on ""Fixed Assets"(Action 16)".


            //Unsupported feature: Property Insertion (Promoted) on ""Fixed Assets"(Action 16)".

            //ApplicationArea = Basic;
        }
        modify(Action17)
        {

            //Unsupported feature: Property Modification (Level) on "Action17(Action 17)".

            Caption = 'HR Applicants CV';

            //Unsupported feature: Property Modification (RunObject) on "Action17(Action 17)".


            //Unsupported feature: Property Modification (Name) on "Action17(Action 17)".

        }
        modify("Fixed Assets G/L Journals")
        {

            //Unsupported feature: Property Modification (Level) on ""Fixed Assets G/L Journals"(Action 19)".

            Caption = 'HR Appraisal Report';

            //Unsupported feature: Property Modification (RunObject) on ""Fixed Assets G/L Journals"(Action 19)".


            //Unsupported feature: Property Modification (Name) on ""Fixed Assets G/L Journals"(Action 19)".


            //Unsupported feature: Property Insertion (PromotedIsBig) on ""Fixed Assets G/L Journals"(Action 19)".


            //Unsupported feature: Property Insertion (Image) on ""Fixed Assets G/L Journals"(Action 19)".

        }
        modify("Fixed Assets Journals")
        {

            //Unsupported feature: Property Modification (Level) on ""Fixed Assets Journals"(Action 24)".

            Caption = 'HR Job Occupants';

            //Unsupported feature: Property Modification (RunObject) on ""Fixed Assets Journals"(Action 24)".


            //Unsupported feature: Property Modification (Name) on ""Fixed Assets Journals"(Action 24)".


            //Unsupported feature: Property Insertion (Promoted) on ""Fixed Assets Journals"(Action 24)".


            //Unsupported feature: Property Insertion (Image) on ""Fixed Assets Journals"(Action 24)".

        }
        modify("Fixed Assets Reclass. Journals")
        {

            //Unsupported feature: Property Modification (Level) on ""Fixed Assets Reclass. Journals"(Action 20)".

            Caption = 'HR Applicant to Employee';

            //Unsupported feature: Property Modification (RunObject) on ""Fixed Assets Reclass. Journals"(Action 20)".


            //Unsupported feature: Property Modification (Name) on ""Fixed Assets Reclass. Journals"(Action 20)".


            //Unsupported feature: Property Insertion (Image) on ""Fixed Assets Reclass. Journals"(Action 20)".

        }
        modify("Insurance Journals")
        {

            //Unsupported feature: Property Modification (Level) on ""Insurance Journals"(Action 22)".

            Caption = 'HR Job (Occupied)';

            //Unsupported feature: Property Modification (RunObject) on ""Insurance Journals"(Action 22)".


            //Unsupported feature: Property Modification (Name) on ""Insurance Journals"(Action 22)".


            //Unsupported feature: Property Insertion (Image) on ""Insurance Journals"(Action 22)".

        }
        modify("<Action3>")
        {

            //Unsupported feature: Property Modification (Level) on ""<Action3>"(Action 3)".


            //Unsupported feature: Property Modification (ActionType) on ""<Action3>"(Action 3)".


            //Unsupported feature: Property Modification (Name) on ""<Action3>"(Action 3)".

            Caption = 'HR Jobs Management';
        }
        modify("Recurring Fixed Asset Journals")
        {

            //Unsupported feature: Property Modification (Level) on ""Recurring Fixed Asset Journals"(Action 23)".

            Caption = 'HR Job (Vacant)';

            //Unsupported feature: Property Modification (RunObject) on ""Recurring Fixed Asset Journals"(Action 23)".


            //Unsupported feature: Property Modification (Name) on ""Recurring Fixed Asset Journals"(Action 23)".


            //Unsupported feature: Property Insertion (Image) on ""Recurring Fixed Asset Journals"(Action 23)".

        }
        modify("Cost Centers")
        {

            //Unsupported feature: Property Modification (Level) on ""Cost Centers"(Action 75)".


            //Unsupported feature: Property Modification (ActionType) on ""Cost Centers"(Action 75)".

            Caption = 'HR Jobs Management';

            //Unsupported feature: Property Modification (Name) on ""Cost Centers"(Action 75)".


            //Unsupported feature: Property Insertion (Image) on ""Cost Centers"(Action 75)".

        }
        modify("Cost Objects")
        {
            Caption = 'HR Jobs';

            //Unsupported feature: Property Modification (RunObject) on ""Cost Objects"(Action 74)".


            //Unsupported feature: Property Modification (Name) on ""Cost Objects"(Action 74)".

        }
        modify("Cost Budgets")
        {
            Caption = 'HR HR Job Responsibilities';

            //Unsupported feature: Property Modification (RunObject) on ""Cost Budgets"(Action 1)".


            //Unsupported feature: Property Modification (Name) on ""Cost Budgets"(Action 1)".


            //Unsupported feature: Property Insertion (PromotedIsBig) on ""Cost Budgets"(Action 1)".

        }
        modify("Posted Documents")
        {

            //Unsupported feature: Property Modification (Level) on ""Posted Documents"(Action 39)".


            //Unsupported feature: Property Modification (ActionType) on ""Posted Documents"(Action 39)".

            Caption = 'HR Training Bonding Conditions';

            //Unsupported feature: Property Modification (Name) on ""Posted Documents"(Action 39)".


            //Unsupported feature: Property Insertion (RunObject) on ""Posted Documents"(Action 39)".

            //ApplicationArea = Basic;
        }
        modify("Posted Sales Credit Memos")
        {

            //Unsupported feature: Property Modification (Level) on ""Posted Sales Credit Memos"(Action 26)".

            Caption = 'HR Jobs';

            //Unsupported feature: Property Modification (RunObject) on ""Posted Sales Credit Memos"(Action 26)".


            //Unsupported feature: Property Modification (Image) on ""Posted Sales Credit Memos"(Action 26)".


            //Unsupported feature: Property Modification (Name) on ""Posted Sales Credit Memos"(Action 26)".


            //Unsupported feature: Property Insertion (Promoted) on ""Posted Sales Credit Memos"(Action 26)".

        }

        //Unsupported feature: Property Modification (ActionType) on ""Posted Purchase Credit Memos"(Action 28)".


        //Unsupported feature: Property Modification (Name) on ""Posted Purchase Credit Memos"(Action 28)".


        //Unsupported feature: Property Insertion (ActionContainerType) on ""Posted Purchase Credit Memos"(Action 28)".

        modify(Administration)
        {

            //Unsupported feature: Property Modification (Level) on "Administration(Action 31)".


            //Unsupported feature: Property Modification (ActionType) on "Administration(Action 31)".

            Caption = 'HR Approval Request Entries';

            //Unsupported feature: Property Modification (Name) on "Administration(Action 31)".


            //Unsupported feature: Property Insertion (RunObject) on "Administration(Action 31)".

            //ApplicationArea = Basic;
        }
        modify(Currencies)
        {

            //Unsupported feature: Property Modification (Level) on "Currencies(Action 38)".


            //Unsupported feature: Property Modification (ActionType) on "Currencies(Action 38)".

            Caption = 'Disciplinary Management';

            //Unsupported feature: Property Modification (Image) on "Currencies(Action 38)".


            //Unsupported feature: Property Modification (Name) on "Currencies(Action 38)".

        }
        modify("Accounting Periods")
        {
            Caption = 'HR Training Needs List';

            //Unsupported feature: Property Modification (RunObject) on ""Accounting Periods"(Action 40)".


            //Unsupported feature: Property Modification (Name) on ""Accounting Periods"(Action 40)".

        }
        modify("Number Series")
        {
            Caption = 'HR Training Applications (Approved)';

            //Unsupported feature: Property Modification (RunObject) on ""Number Series"(Action 41)".


            //Unsupported feature: Property Modification (Name) on ""Number Series"(Action 41)".

        }
        modify("Analysis Views")
        {
            Caption = 'HR Employee Training Requisition List';

            //Unsupported feature: Property Modification (RunObject) on ""Analysis Views"(Action 43)".


            //Unsupported feature: Property Modification (Name) on ""Analysis Views"(Action 43)".

        }
        modify(Dimensions)
        {

            //Unsupported feature: Property Modification (Level) on "Dimensions(Action 44)".


            //Unsupported feature: Property Modification (ActionType) on "Dimensions(Action 44)".

            Caption = 'HR Training Management';

            //Unsupported feature: Property Modification (Image) on "Dimensions(Action 44)".


            //Unsupported feature: Property Modification (Name) on "Dimensions(Action 44)".

        }
        modify("Bank Account Posting Groups")
        {
            Caption = 'HR Welfare List';

            //Unsupported feature: Property Modification (RunObject) on ""Bank Account Posting Groups"(Action 45)".


            //Unsupported feature: Property Modification (Name) on ""Bank Account Posting Groups"(Action 45)".

        }
        modify("Sales &Credit Memo")
        {

            //Unsupported feature: Property Modification (Level) on ""Sales &Credit Memo"(Action 66)".

            Caption = 'HR Approved Qualified Applicants';

            //Unsupported feature: Property Modification (RunObject) on ""Sales &Credit Memo"(Action 66)".


            //Unsupported feature: Property Modification (Name) on ""Sales &Credit Memo"(Action 66)".

        }
        modify("P&urchase Credit Memo")
        {

            //Unsupported feature: Property Modification (Level) on ""P&urchase Credit Memo"(Action 65)".

            Caption = 'HR Job Applicants Unqualified';

            //Unsupported feature: Property Modification (RunObject) on ""P&urchase Credit Memo"(Action 65)".


            //Unsupported feature: Property Modification (Name) on ""P&urchase Credit Memo"(Action 65)".

        }
        modify(Action67)
        {

            //Unsupported feature: Property Modification (Level) on "Action67(Action 67)".


            //Unsupported feature: Property Modification (ActionType) on "Action67(Action 67)".


            //Unsupported feature: Property Modification (Name) on "Action67(Action 67)".

            Caption = 'HR Job Applicants Unqualified';

            //Unsupported feature: Property Insertion (RunObject) on "Action67(Action 67)".

            //ApplicationArea = Basic;
        }
        modify("Calculate Deprec&iation")
        {

            //Unsupported feature: Property Modification (Level) on ""Calculate Deprec&iation"(Action 68)".

            Caption = 'HR Job Applicants Qualified';

            //Unsupported feature: Property Modification (RunObject) on ""Calculate Deprec&iation"(Action 68)".


            //Unsupported feature: Property Modification (Name) on ""Calculate Deprec&iation"(Action 68)".

        }
        modify("Import Co&nsolidation from Database")
        {

            //Unsupported feature: Property Modification (Level) on ""Import Co&nsolidation from Database"(Action 69)".

            Caption = 'HR Shortlisting';

            //Unsupported feature: Property Modification (RunObject) on ""Import Co&nsolidation from Database"(Action 69)".


            //Unsupported feature: Property Modification (Name) on ""Import Co&nsolidation from Database"(Action 69)".

        }
        modify("Bank Account R&econciliation")
        {

            //Unsupported feature: Property Modification (Level) on ""Bank Account R&econciliation"(Action 70)".

            Caption = 'HR Job Applications';

            //Unsupported feature: Property Modification (RunObject) on ""Bank Account R&econciliation"(Action 70)".


            //Unsupported feature: Property Modification (Name) on ""Bank Account R&econciliation"(Action 70)".

        }
        modify("Adjust E&xchange Rates")
        {

            //Unsupported feature: Property Modification (Level) on ""Adjust E&xchange Rates"(Action 71)".

            Caption = 'HR Employee Requisitions';

            //Unsupported feature: Property Modification (RunObject) on ""Adjust E&xchange Rates"(Action 71)".


            //Unsupported feature: Property Modification (Name) on ""Adjust E&xchange Rates"(Action 71)".

        }
        modify("P&ost Inventory Cost to G/L")
        {

            //Unsupported feature: Property Modification (ActionType) on ""P&ost Inventory Cost to G/L"(Action 72)".

            Caption = 'HR Employee Recruitment';

            //Unsupported feature: Property Modification (Image) on ""P&ost Inventory Cost to G/L"(Action 72)".


            //Unsupported feature: Property Modification (Name) on ""P&ost Inventory Cost to G/L"(Action 72)".

        }
        modify(Action73)
        {

            //Unsupported feature: Property Modification (Level) on "Action73(Action 73)".


            //Unsupported feature: Property Modification (ActionType) on "Action73(Action 73)".


            //Unsupported feature: Property Modification (Name) on "Action73(Action 73)".

            Caption = 'HR Job Qualifications';

            //Unsupported feature: Property Insertion (RunObject) on "Action73(Action 73)".

            // ApplicationArea = Basic;
        }
        /* modify(ActionContainer1900000006)
        {
            Visible = false;
        } */

        //Unsupported feature: Property Deletion (Image) on ""&G/L Trial Balance"(Action 32)".


        //Unsupported feature: Property Deletion (RunObject) on ""&Bank Detail Trial Balance"(Action 33)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""&Bank Detail Trial Balance"(Action 33)".


        //Unsupported feature: Property Deletion (RunObject) on ""&Account Schedule"(Action 34)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""&Account Schedule"(Action 34)".


        //Unsupported feature: Property Deletion (Image) on ""Bu&dget"(Action 35)".


        //Unsupported feature: Property Deletion (Image) on ""Trial Bala&nce/Budget"(Action 36)".


        //Unsupported feature: Property Deletion (Image) on ""Trial Balance by &Period"(Action 37)".


        //Unsupported feature: Property Deletion (RunObject) on ""&Fiscal Year Balance"(Action 46)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""&Fiscal Year Balance"(Action 46)".


        //Unsupported feature: Property Deletion (Image) on ""Balance Comp. - Prev. Y&ear"(Action 47)".


        //Unsupported feature: Property Deletion (CaptionML) on ""&Closing Trial Balance"(Action 48)".


        //Unsupported feature: Property Deletion (RunObject) on ""&Closing Trial Balance"(Action 48)".


        //Unsupported feature: Property Deletion (Image) on ""&Closing Trial Balance"(Action 48)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""&Closing Trial Balance"(Action 48)".


        modify("Cash Flow Date List")
        {
            Visible = false;
        }


        //Unsupported feature: Property Deletion (Image) on ""Aged Accounts &Receivable"(Action 50)".


        //Unsupported feature: Property Deletion (Image) on ""Aged Accounts Pa&yable"(Action 51)".


        //Unsupported feature: Property Deletion (Image) on ""Reconcile Cus&t. and Vend. Accs"(Action 52)".

        modify("&VAT Registration No. Check")
        {
            Visible = false;
        }
        modify("VAT E&xceptions")
        {
            Visible = false;
        }
        modify("VAT &Statement")
        {
            Visible = false;
        }
        modify("VAT - VIES Declaration Tax Aut&h")
        {
            Visible = false;
        }
        modify("VAT - VIES Declaration Dis&k")
        {
            Visible = false;
        }
        modify("EC Sales &List")
        {
            Visible = false;
        }

        modify("&Intrastat - Checklist")
        {
            Visible = false;
        }
        modify("Intrastat - For&m")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Level) on "Action4(Action 4)".


        //Unsupported feature: Property Deletion (Image) on ""CA P/L Statement per Period"(Action 15)".


        //Unsupported feature: Property Deletion (Image) on ""Cost Accounting Analysis"(Action 42)".


        //Unsupported feature: Property Deletion (Level) on "Budgets(Action 76)".


        //Unsupported feature: Property Deletion (CaptionML) on "Budgets(Action 76)".


        //Unsupported feature: Property Deletion (RunObject) on "Budgets(Action 76)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Budgets(Action 76)".


        //Unsupported feature: Property Deletion (Image) on ""Bank Accounts"(Action 9)".


        //Unsupported feature: Property Deletion (Image) on "Items(Action 11)".


        //Unsupported feature: Property Deletion (Image) on "Customers(Action 12)".


        //Unsupported feature: Property Deletion (RunPageView) on "Action13(Action 13)".


        //Unsupported feature: Property Deletion (Image) on "Action13(Action 13)".


        //Unsupported feature: Property Deletion (Image) on ""Sales Orders"(Action 14)".

        modify(Reminders)
        {
            Visible = false;
        }
        modify("Finance Charge Memos")
        {
            Visible = false;
        }
        modify("Incoming Documents")
        {
            Visible = false;
        }

        modify(Journals)
        {
            Visible = false;
        }

        modify("Intrastat Journals")
        {
            Visible = false;
        }
        modify(Insurance)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (RunPageView) on ""Fixed Assets G/L Journals"(Action 19)".


        //Unsupported feature: Property Deletion (RunPageView) on ""Fixed Assets Journals"(Action 24)".


        //Unsupported feature: Property Deletion (RunObject) on ""<Action3>"(Action 3)".


        //Unsupported feature: Property Deletion (RunPageView) on ""<Action3>"(Action 3)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""<Action3>"(Action 3)".


        //Unsupported feature: Property Deletion (RunPageView) on ""Recurring Fixed Asset Journals"(Action 23)".

        modify("Cash Flow")
        {
            Visible = false;
        }
        modify("Cash Flow Forecasts")
        {
            Visible = false;
        }
        modify("Chart of Cash Flow Accounts")
        {
            Visible = false;
        }
        modify("Cash Flow Manual Revenues")
        {
            Visible = false;
        }
        modify("Cash Flow Manual Expenses")
        {
            Visible = false;
        }
        modify("Cost Accounting")
        {
            Visible = false;
        }
        modify("Cost Types")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (RunObject) on ""Cost Centers"(Action 75)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Cost Centers"(Action 75)".

        modify("Cost Allocations")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Image) on ""Posted Documents"(Action 39)".

        modify("Posted Sales Invoices")
        {
            Visible = false;
        }
        modify("Posted Purchase Invoices")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Level) on ""Posted Purchase Credit Memos"(Action 28)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Posted Purchase Credit Memos"(Action 28)".


        //Unsupported feature: Property Deletion (RunObject) on ""Posted Purchase Credit Memos"(Action 28)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Posted Purchase Credit Memos"(Action 28)".

        modify("Issued Reminders")
        {
            Visible = false;
        }
        modify("Issued Fin. Charge Memos")
        {
            Visible = false;
        }
        modify("G/L Registers")
        {
            Visible = false;
        }
        modify("Cost Accounting Registers")
        {
            Visible = false;
        }
        modify("Cost Accounting Budget Registers")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Image) on "Administration(Action 31)".


        //Unsupported feature: Property Deletion (RunObject) on "Currencies(Action 38)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Currencies(Action 38)".


        //Unsupported feature: Property Deletion (Image) on ""Accounting Periods"(Action 40)".

        modify("Account Schedules")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (RunObject) on "Dimensions(Action 44)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Dimensions(Action 44)".


        //Unsupported feature: Property Deletion (Promoted) on ""Sales &Credit Memo"(Action 66)".


        //Unsupported feature: Property Deletion (Image) on ""Sales &Credit Memo"(Action 66)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Sales &Credit Memo"(Action 66)".


        //Unsupported feature: Property Deletion (RunPageMode) on ""Sales &Credit Memo"(Action 66)".


        //Unsupported feature: Property Deletion (Promoted) on ""P&urchase Credit Memo"(Action 65)".


        //Unsupported feature: Property Deletion (Image) on ""P&urchase Credit Memo"(Action 65)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""P&urchase Credit Memo"(Action 65)".


        //Unsupported feature: Property Deletion (RunPageMode) on ""P&urchase Credit Memo"(Action 65)".


        modify("Cas&h Receipt Journal")
        {
            Visible = false;
        }
        modify("Pa&yment Journal")
        {
            Visible = false;
        }
        modify("Analysis &Views")
        {
            Visible = false;
        }
        modify("Analysis by &Dimensions")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Ellipsis) on ""Calculate Deprec&iation"(Action 68)".


        //Unsupported feature: Property Deletion (Image) on ""Calculate Deprec&iation"(Action 68)".


        //Unsupported feature: Property Deletion (Ellipsis) on ""Import Co&nsolidation from Database"(Action 69)".


        //Unsupported feature: Property Deletion (Image) on ""Import Co&nsolidation from Database"(Action 69)".


        //Unsupported feature: Property Deletion (Image) on ""Bank Account R&econciliation"(Action 70)".


        //Unsupported feature: Property Deletion (Ellipsis) on ""Adjust E&xchange Rates"(Action 71)".


        //Unsupported feature: Property Deletion (Image) on ""Adjust E&xchange Rates"(Action 71)".


        //Unsupported feature: Property Deletion (RunObject) on ""P&ost Inventory Cost to G/L"(Action 72)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""P&ost Inventory Cost to G/L"(Action 72)".


        modify("C&reate Reminders")
        {
            Visible = false;
        }
        modify("Create Finance Charge &Memos")
        {
            Visible = false;
        }
        modify("Intrastat &Journal")
        {
            Visible = false;
        }
        modify("Calc. and Pos&t VAT Settlement")
        {
            Visible = false;
        }

        modify("General &Ledger Setup")
        {
            Visible = false;
        }
        modify("&Sales && Receivables Setup")
        {
            Visible = false;
        }
        modify("&Purchases && Payables Setup")
        {
            Visible = false;
        }
        modify("&Fixed Asset Setup")
        {
            Visible = false;
        }
        modify("Cash Flow Setup")
        {
            Visible = false;
        }
        modify("Cost Accounting Setup")
        {
            Visible = false;
        }

        modify("Navi&gate")
        {
            Visible = false;
        }


        /*   moveafter("HR Jobs";Action73)
          moveafter("HR Job Qualifications";"P&ost Inventory Cost to G/L")
          moveafter("HR Employee Recruitment";"Adjust E&xchange Rates")
          moveafter("HR Employee Requisitions";"Bank Account R&econciliation")
          moveafter("HR Job Applications";"Import Co&nsolidation from Database")
          moveafter("HR Shortlisting";"Calculate Deprec&iation")
          moveafter("HR Job Applicants Qualified";Action67)
          moveafter("HR Job Applicants Unqualified";"Sales &Credit Memo")
          moveafter(Action65;Action53)
          moveafter("HR Performance Management";"Reconcile Cus&t. and Vend. Accs")
          moveafter("HR Appraisals List - Target Setting";"Aged Accounts Pa&yable")
          moveafter("HR Appraisals List - Target Approval";"Aged Accounts &Receivable")
          moveafter("HR Appraisals List - Target Evaluation";"&Fiscal Year Balance")
          moveafter("HR Welfare Management";"Bank Account Posting Groups")
          moveafter("HR Welfare List";Dimensions)
          moveafter("HR Training Management";"Analysis Views")
          moveafter("HR Employee Training Requisition List";"Cost Accounting Analysis")
          moveafter("HR Training Application List";"Number Series")
          moveafter("HR Training Applications (Approved)";"Accounting Periods")
          moveafter("HR Training Needs List";"Posted Documents")
          moveafter("HR Training Bonding Conditions";Currencies)
          moveafter("Disciplinary Management";"Trial Balance by &Period")
          moveafter("HR Disciplinary Cases List";"Trial Bala&nce/Budget")
          moveafter("HR E-Mail Parameters List";"Bu&dget")
          moveafter("HR Employee Disciplinary Cases";"&Account Schedule")
          moveafter(Payroll;"&Bank Detail Trial Balance")
          moveafter("HR Approval Entries";Administration)
          moveafter("HR Approval Request Entries";"&Closing Trial Balance")
          moveafter(Action47;"Posted Purchase Credit Memos")
          moveafter(ActionContainer28;"Posted Sales Credit Memos")
          moveafter(Action26;"Fixed Assets Journals")
          moveafter("HR Job Occupants";"Recurring Fixed Asset Journals")
          moveafter("HR Job (Vacant)";"Insurance Journals")
          moveafter("HR Job (Occupied)";"CA P/L Statement with Budget")
          moveafter("HR Job Requirements";"Fixed Assets Reclass. Journals")
          moveafter("HR Applicant to Employee";"Fixed Assets G/L Journals")
          moveafter("HR Appraisal Report";"Fixed Assets")
          moveafter("HR Applicants CV";"CA P/L Statement per Period")
          moveafter("PR NSSF";"Sales Orders")
          moveafter("PR NHIF";Action13)
          moveafter("PR P9A";Customers)
          moveafter("PR P10A";Items)
          moveafter("PR P10B";"VAT Statements")
          moveafter("PR P10C";"Bank Accounts")
          moveafter("PR P10D";Vendors)
          moveafter("prCompany Payslip2";"Cost Accounting P/L Statement")
          moveafter("Other PR Listing";"Purchase Orders")
          moveafter(ActionContainer4;"<Action3>") */
    }
}

