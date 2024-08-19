#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193784 "FA WIP Card"
{
    SourceTable = Job;
    ApplicationArea = All;
    Caption = 'FA WIP Card';
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
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a short description of the job.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the customer who pays for the job.';
                    trigger OnValidate()
                    begin
                        BilltoCustomerNoOnAfterValidat();
                    end;
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the contact person at the customer''s billing address.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the customer who pays for the job.';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the address of the customer to whom you will send the invoice.';
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an additional line of the address.';
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the postal code of the customer who pays for the job.';
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the address.';
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the country/region code of the customer''s billing address.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the contact person at the customer who pays for the job.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an additional description of the job for searching purposes.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the person at your company who is responsible for the job.';
                }
                field("WIP Vendor"; Rec."WIP Vendor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Vendor field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when the job card was last modified.';
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
                field("Expected FA Quantity"; Rec."Expected FA Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected FA Quantity field.';
                }
                field("WIP GL Balance (LCY)"; Rec."WIP GL Balance (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP GL Balance (LCY) field.';
                }
                field("FA No."; Rec."FA No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA No. field.';
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies a current status of the job. You can change the status for the job as it progresses. Final calculations can be made on completed jobs.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the posting group that links transactions made for the job with the appropriate general ledger accounts according to the general posting setup.';
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the method that is used to calculate the value of work in process for the job.';
                }
                field("WIP Posting Method"; Rec."WIP Posting Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies how WIP posting is performed. Per Job: The total WIP costs and the sales value is used to calculate WIP. Per Job Ledger Entry: The accumulated values of WIP costs and sales are used to calculate WIP.';
                }
                field("Allow Schedule/Contract Lines"; Rec."Allow Schedule/Contract Lines")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if you can add planning lines of both type Budget and type Billable to the job.';
                }
                field("Apply Usage Link"; Rec."Apply Usage Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether usage entries, from the job journal or purchase line, for example, are linked to job planning lines. Select this check box if you want to be able to track the quantities and amounts of the remaining work needed to complete a job and to create a relationship between demand planning, usage, and sales. On a job card, you can select this check box if there are no existing job planning lines that include type Budget that have been posted. The usage link only applies to job planning lines that include type Budget.';
                }
                field("% of Overdue Planning Lines"; Rec.PercentOverdue())
                {
                    ApplicationArea = Basic;
                    Caption = '% of Overdue Planning Lines';
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the % of Overdue Planning Lines field.';
                }
                field("% Completed"; Rec.PercentCompleted())
                {
                    ApplicationArea = Basic;
                    Caption = '% Completed';
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the % Completed field.';
                }
                field("% Invoiced"; Rec.PercentInvoiced())
                {
                    ApplicationArea = Basic;
                    Caption = '% Invoiced';
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the % Invoiced field.';
                }
            }
            group(Duration)
            {
                Caption = 'Duration';
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date on which the job actually starts.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date on which the job is expected to be completed.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date on which you set up the job.';
                }
            }
            group("FA Details")
            {
                Caption = 'FA Details';
                field("FA Description"; Rec."FA Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Description field.';
                }
                field("FA Description 2"; Rec."FA Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Description 2 field.';
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Class Code field.';
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Subclass Code field.';
                }
                field("Depreciation Book Code"; Rec."Depreciation Book Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Depreciation Book Code field.';
                }
                field("Depreciation Method"; Rec."Depreciation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Depreciation Method field.';
                }
                field("Straight-Line %"; Rec."Straight-Line %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Straight-Line % field.';
                }
                field("FA Posting Group"; Rec."FA Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Posting Group field.';
                }
                field("No. of FA Created"; Rec."No. of FA Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of FA Created field.';
                }
                field("FA Quantity to Register"; Rec."FA Quantity to Register")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Quantity to Register field.';
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Location Code field.';
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                Visible = false;
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = CurrencyCodeEditable;
                    Importance = Promoted;
                    ToolTip = 'Specifies the currency code for the job. By default, the currency code is empty. If you enter a foreign currency code, it results in the job being planned and invoiced in that currency.';
                    trigger OnValidate()
                    begin
                        CurrencyCheck();
                    end;
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = InvoiceCurrencyCodeEditable;
                    ToolTip = 'Specifies the currency code you want to apply when creating invoices for a job. By default, the invoice currency code for a job is based on what currency code is defined on the customer card.';
                    trigger OnValidate()
                    begin
                        CurrencyCheck();
                    end;
                }
                field("Exch. Calculation (Cost)"; Rec."Exch. Calculation (Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies how job costs are calculated if you change the Currency Date or the Currency Code fields on a job planning Line or run the Change Job Planning Line Dates batch job. Fixed LCY option: The job costs in the local currency are fixed. Any change in the currency exchange rate will change the value of job costs in a foreign currency. Fixed FCY option: The job costs in a foreign currency are fixed. Any change in the currency exchange rate will change the value of job costs in the local currency.';
                }
                field("Exch. Calculation (Price)"; Rec."Exch. Calculation (Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies how job sales prices are calculated if you change the Currency Date or the Currency Code fields on a job planning Line or run the Change Job Planning Line Dates batch job. Fixed LCY option: The job prices in the local currency are fixed. Any change in the currency exchange rate will change the value of job prices in a foreign currency. Fixed FCY option: The job prices in a foreign currency are fixed. Any change in the currency exchange rate will change the value of job prices in the local currency.';
                }
            }
            group("WIP and Recognition")
            {
                Caption = 'WIP and Recognition';
                group("To Post")
                {
                    Caption = 'To Post';
                    field("WIP Posting Date"; Rec."WIP Posting Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the posting date that was entered when the Job Calculate WIP batch job was last run.';
                    }
                    field("Total WIP Sales Amount"; Rec."Total WIP Sales Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the total WIP sales amount that was last calculated for the job. The WIP sales amount is the value in the WIP Sales Job WIP Entries window minus the value of the Recognized Sales Job WIP Entries window. For jobs with the Cost Value or Cost of Sales WIP methods, the WIP sales amount is normally 0.';
                    }
                    field("Applied Sales G/L Amount"; Rec."Applied Sales G/L Amount")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the sum of all applied sales in the general ledger that are related to the job.';
                    }
                    field("Total WIP Cost Amount"; Rec."Total WIP Cost Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the total WIP cost amount that was last calculated for the job. The WIP cost amount is the value in the WIP Cost Job WIP Entries window minus the value of the Recognized Cost Job WIP Entries window. For jobs with Sales Value or Percentage of Completion WIP methods, the WIP cost amount is normally 0.';
                    }
                    field("Applied Costs G/L Amount"; Rec."Applied Costs G/L Amount")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the sum of all applied costs that is based on to the selected job in the general ledger.';
                    }
                    field("Recog. Sales Amount"; Rec."Recog. Sales Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the recognized sales amount that was last calculated for the job, which is the sum of the Recognized Sales Job WIP Entries.';
                    }
                    field("Recog. Costs Amount"; Rec."Recog. Costs Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the recognized cost amount that was last calculated for the job. The value is the sum of the entries in the Recognized Cost Job WIP Entries window.';
                    }
                    field("Recog. Profit Amount"; Rec.CalcRecognizedProfitAmount())
                    {
                        ApplicationArea = Basic;
                        Caption = 'Recog. Profit Amount';
                        ToolTip = 'Specifies the value of the Recog. Profit Amount field.';
                    }
                    field("Recog. Profit %"; Rec.CalcRecognizedProfitPercentage())
                    {
                        ApplicationArea = Basic;
                        Caption = 'Recog. Profit %';
                        ToolTip = 'Specifies the value of the Recog. Profit % field.';
                    }
                    field("Acc. WIP Costs Amount"; Rec.CalcAccWIPCostsAmount())
                    {
                        ApplicationArea = Basic;
                        Caption = 'Acc. WIP Costs Amount';
                        Visible = false;
                        ToolTip = 'Specifies the value of the Acc. WIP Costs Amount field.';
                    }
                    field("Acc. WIP Sales Amount"; Rec.CalcAccWIPSalesAmount())
                    {
                        ApplicationArea = Basic;
                        Caption = 'Acc. WIP Sales Amount';
                        Visible = false;
                        ToolTip = 'Specifies the value of the Acc. WIP Sales Amount field.';
                    }
                    field("Calc. Recog. Sales Amount"; Rec."Calc. Recog. Sales Amount")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the sum of the recognized sales amount that is associated with job tasks for the job.';
                    }
                    field("Calc. Recog. Costs Amount"; Rec."Calc. Recog. Costs Amount")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the sum of the recognized costs amount that is associated with job tasks for the job.';
                    }
                }
                group(Posted)
                {
                    Caption = 'Posted';
                    field("WIP G/L Posting Date"; Rec."WIP G/L Posting Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the posting date that was entered when the Job Post WIP to General Ledger batch job was last run.';
                    }
                    field("Total WIP Sales G/L Amount"; Rec."Total WIP Sales G/L Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the total WIP sales amount that was last posted to the general ledger for the job. The WIP sales amount is the value in the WIP Sales Job WIP G/L Entries window minus the value in the Recognized Sales Job WIP G/L Entries window. For jobs with the Cost Value or Cost of Sales WIP methods, the WIP sales amount is normally 0.';
                    }
                    field("Total WIP Cost G/L Amount"; Rec."Total WIP Cost G/L Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the total WIP Cost amount that was last posted to the G/L for the job. The WIP Cost Amount for the job is the value WIP Cost Job WIP G/L Entries less the value of the Recognized Cost Job WIP G/L Entries. For jobs with WIP Methods of Sales Value or Percentage of Completion, the WIP Cost Amount is normally 0.';
                    }
                    field("Recog. Sales G/L Amount"; Rec."Recog. Sales G/L Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the total recognized sales amount that was last posted to the general ledger for the job. The recognized sales G/L amount for the job is the sum of the entries in the Recognized Sales Job WIP G/L Entries window.';
                    }
                    field("Recog. Costs G/L Amount"; Rec."Recog. Costs G/L Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the total Recognized Cost amount that was last posted to the general ledger for the job. The Recognized Cost G/L amount for the job is the sum of the Recognized Cost Job WIP G/L Entries.';
                    }
                    field("Recog. Profit G/L Amount"; Rec.CalcRecognizedProfitGLAmount())
                    {
                        ApplicationArea = Basic;
                        Caption = 'Recog. Profit G/L Amount';
                        ToolTip = 'Specifies the value of the Recog. Profit G/L Amount field.';
                    }
                    field("Recog. Profit G/L %"; Rec.CalcRecognProfitGLPercentage())
                    {
                        ApplicationArea = Basic;
                        Caption = 'Recog. Profit G/L %';
                        ToolTip = 'Specifies the value of the Recog. Profit G/L % field.';
                    }
                    field("Calc. Recog. Sales G/L Amount"; Rec."Calc. Recog. Sales G/L Amount")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the sum of the recognized sales general ledger amount that is associated with job tasks for the job.';
                    }
                    field("Calc. Recog. Costs G/L Amount"; Rec."Calc. Recog. Costs G/L Amount")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the sum of the recognized costs general ledger amount that is associated with job tasks for the job.';
                    }
                }
            }
        }
        area(FactBoxes)
        {
            part(Control5; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = false;
            }
            part(Control4; "Job No. of Prices FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Resource Filter" = field("Resource Filter"),
                              "Posting Date Filter" = field("Posting Date Filter"),
                              "Resource Gr. Filter" = field("Resource Gr. Filter"),
                              "Planning Date Filter" = field("Planning Date Filter");
                Visible = true;
            }
            part(Control3; "Job WIP/Recognition FactBox")
            {
                SubPageLink = "No." = field("No."),
                              "Resource Filter" = field("Resource Filter"),
                              "Posting Date Filter" = field("Posting Date Filter"),
                              "Resource Gr. Filter" = field("Resource Gr. Filter"),
                              "Planning Date Filter" = field("Planning Date Filter");
                Visible = false;
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
            group("&FA WIP")
            {
                Caption = '&FA WIP';
                Image = Job;
                action("FA WIP &Task Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA WIP &Task Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "FA WIP Job Task Lines";
                    RunPageLink = "Job No." = field("No.");
                    ShortcutKey = 'Shift+Ctrl+T';
                    ToolTip = 'Executes the FA WIP &Task Lines action.';
                }
                action("FA WIP &Planning Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA WIP &Planning Lines';
                    Image = JobLines;
                    ShortcutKey = 'Shift+Ctrl+P';
                    ToolTip = 'Executes the FA WIP &Planning Lines action.';
                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        Rec.TestField(Rec."No.");
                        JobPlanningLine.SetRange("Job No.", Rec."No.");
                        //JobPlanningLines.SetJobNoVisible(false);
                        JobPlanningLines.SetTableView(JobPlanningLine);
                        JobPlanningLines.Editable := false;
                        JobPlanningLines.Run();
                    end;
                }
                action("&Dimensions")
                {
                    ApplicationArea = Basic;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = page "Default Dimensions";
                    RunPageLink = "Table ID" = const(167),
                                  "No." = field("No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the &Dimensions action.';
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
                separator(Action112) { }
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
                action("&Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = '&Online Map';
                    Image = Map;
                    ToolTip = 'Executes the &Online Map action.';
                    trigger OnAction()
                    begin
                        Rec.DisplayMap();
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
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Posting Group", "WIP Posting Date");
                    Visible = false;
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
                    Visible = false;
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
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "Job Resource Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'Executes the &Resource action.';
                }
                action("&Item")
                {
                    ApplicationArea = Basic;
                    Caption = '&Item';
                    Image = Item;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "Job Item Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'Executes the &Item action.';
                }
                action("&G/L Account")
                {
                    ApplicationArea = Basic;
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
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
                action("Res. &Gr. All&ocated per Job")
                {
                    ApplicationArea = Basic;
                    Caption = 'Res. &Gr. All&ocated per Job';
                    Image = ResourceGroup;
                    RunObject = page "Res. Gr. Allocated per Job";
                    ToolTip = 'Executes the Res. &Gr. All&ocated per Job action.';
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
                    Image = JobLedger;
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
            group("&Copy")
            {
                Caption = '&Copy';
                Image = Copy;
                action("Copy Tasks &from...")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Tasks &from...';
                    Ellipsis = true;
                    Image = CopyToTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Copy Tasks &from... action.';
                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetToJob(Rec);
                        CopyJobTasks.RunModal();
                    end;
                }
                action("Copy Tasks &to...")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Tasks &to...';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Copy Tasks &to... action.';
                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetFromJob(Rec);
                        CopyJobTasks.RunModal();
                    end;
                }
            }
            group(ActionGroup93)
            {
                Caption = 'W&IP';
                Image = WIP;
                action("<Action82>")
                {
                    ApplicationArea = Basic;
                    Caption = '&Calculate WIP';
                    Ellipsis = true;
                    Image = CalculateWIP;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the &Calculate WIP action.';
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
                action("<Action83>")
                {
                    ApplicationArea = Basic;
                    Caption = '&Post WIP to G/L';
                    Ellipsis = true;
                    Image = PostOrder;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ShortcutKey = 'F9';
                    Visible = false;
                    ToolTip = 'Executes the &Post WIP to G/L action.';
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
        area(Reporting)
        {
            action("WIP Actual to Budget")
            {
                ApplicationArea = Basic;
                Caption = 'WIP Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Actual To Budget";
                ToolTip = 'Executes the WIP Actual to Budget action.';
            }
            action("WIP Analysis")
            {
                ApplicationArea = Basic;
                Caption = 'WIP Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Analysis";
                ToolTip = 'Executes the WIP Analysis action.';
            }
            action("WIP - Planning Lines")
            {
                ApplicationArea = Basic;
                Caption = 'WIP - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job - Planning Lines";
                ToolTip = 'Executes the WIP - Planning Lines action.';
            }
            action("WIP - Suggested Billing")
            {
                ApplicationArea = Basic;
                Caption = 'WIP - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Job Suggested Billing";
                ToolTip = 'Executes the WIP - Suggested Billing action.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::WIP;
    end;

    var
        [InDataSet]
        InvoiceCurrencyCodeEditable: Boolean;
        [InDataSet]
        CurrencyCodeEditable: Boolean;


    procedure CurrencyCheck()
    begin
        if Rec."Currency Code" <> '' then
            InvoiceCurrencyCodeEditable := false
        else
            InvoiceCurrencyCodeEditable := true;

        if Rec."Invoice Currency Code" <> '' then
            CurrencyCodeEditable := false
        else
            CurrencyCodeEditable := true;
    end;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.Update();
    end;
}
