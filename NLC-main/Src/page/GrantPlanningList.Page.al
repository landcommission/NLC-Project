#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193849 "Grant Planning List"
{
    AutoSplitKey = true;
    Caption = 'Grant Budget List';
    DataCaptionExpression = Rec.Caption();
    DelayedInsert = true;
    Editable = false;
    PageType = Card;
    SourceTable = "Job-Planning Line";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field("Budget Period"; Rec."Budget Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Period field.';
                }
                field("Grant No."; Rec."Grant No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant No.';
                    ToolTip = 'Specifies the value of the Grant No. field.';
                }
                field("Grant Task No."; Rec."Grant Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task No.';
                    ToolTip = 'Specifies the value of the Grant Task No. field.';
                }
                field("Total Year 1"; Rec."Total Year 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Year 1 field.';
                }
                field("Total Year 2"; Rec."Total Year 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Year 2 field.';
                }
                field("Total Year 3"; Rec."Total Year 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Year 3 field.';
                }
                field("Total Year 4"; Rec."Total Year 4")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Year 4 field.';
                }
                field("Total Year 5"; Rec."Total Year 5")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Year 5 field.';
                }
                field("Total Year 6"; Rec."Total Year 6")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Year 6 field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Account field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Transfered To Budget"; Rec."Transfered To Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfered To Budget field.';
                }
                field("Income Account"; Rec."Income Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Income Account field.';
                }
                field("Description 3"; Rec."Description 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 3 field.';
                }
                field("Audit Provision"; Rec."Audit Provision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Provision field.';
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Date field.';
                }
                field("Currency Date"; Rec."Currency Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Date field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Partner; Rec.Partner)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partner field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Type Code field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Quantity (Base) field.';
                }
                field("Direct Unit Cost (LCY)"; Rec."Direct Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Direct Unit Cost (LCY) field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Cost (LCY) field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit Price (LCY) field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Line Amount (LCY)"; Rec."Line Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line Amount (LCY) field.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Discount % field.';
                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Price field.';
                }
                field("Total Price (LCY)"; Rec."Total Price (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Price (LCY) field.';
                }
                field(Transferred; Rec.Transferred)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transferred field.';
                }
                field("Disbursed Amount"; Rec."Disbursed Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disbursed Amount field.';
                }
                field("Accounted Amount"; Rec."Accounted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accounted Amount field.';
                }
                field("Unaccounted Amount"; Rec."Unaccounted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unaccounted Amount field.';
                }
                field(Invoiced; Rec.Invoiced)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoiced field.';
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice Type field.';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                }
                field("Invoiced Cost Amount (LCY)"; Rec."Invoiced Cost Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoiced Cost Amount (LCY) field.';
                }
                field("Invoiced Amount (LCY)"; Rec."Invoiced Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoiced Amount (LCY) field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Lot No. field.';
                }
                field("Grant Contract Entry No."; Rec."Grant Contract Entry No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Contract Entry No.';
                    ToolTip = 'Specifies the value of the Grant Contract Entry No. field.';
                }
                field("Ledger Entry Type"; Rec."Ledger Entry Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Ledger Entry Type field.';
                }
                field("Ledger Entry No."; Rec."Ledger Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Ledger Entry No. field.';
                }
                field("System-Created Entry"; Rec."System-Created Entry")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the System-Created Entry field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
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

                        Rec.TestField(Rec."Grant No.");
                        Rec.TestField(Rec."Grant Task No.");
                        JT.Get(Rec."Grant No.", Rec."Grant Task No.");
                        JT.FilterGroup := 2;
                        JT.SetRange("Grant No.", Rec."Grant No.");
                        JT.SetRange("Grant Task Type", JT."Grant Task Type"::Posting);
                        //IF JT.FIND('-') THEN
                        JT.FilterGroup := 0;

                        Page.RunModal(Page::"Grant Planning Lines", JT);
                    end;
                }
                action("Create &Sales Invoice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create &Sales Invoice';
                    Ellipsis = true;
                    Image = Invoice;
                    ToolTip = 'Executes the Create &Sales Invoice action.';
                    trigger OnAction()
                    begin
                        CreateSalesInvoice(false);
                    end;
                }
                action("Create Sales &Credit Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Sales &Credit Memo';
                    Ellipsis = true;
                    Image = CreditMemo;
                    ToolTip = 'Executes the Create Sales &Credit Memo action.';
                    trigger OnAction()
                    begin
                        CreateSalesInvoice(true);
                    end;
                }
                action("Get Sales/Credit Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get Sales/Credit Memo';
                    Ellipsis = true;
                    Image = GetSourceDoc;
                    ToolTip = 'Executes the Get Sales/Credit Memo action.';

                }
                action("Transfer Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer Lines';
                    ToolTip = 'Executes the Transfer Lines action.';
                    trigger OnAction()
                    begin
                        Job.Reset();
                        Job.SetRange(Job."No.", Rec."Grant No.");
                        if Job.Find('-') then
                            if Job."Approval Status" <> Job."Approval Status"::Approved then
                                Error('The grant has to be approved to set budget');

                        if Confirm('Are you sure you want to Transfer Lines to Budget?', false) = true then begin

                            Job.Reset();
                            Job.Get(Rec."Grant No.");
                            StartDate := Job."Starting Date";

                            BudgetSetup.Find('-');
                            PlanningLines.Reset();
                            PlanningLines.SetRange(PlanningLines."Grant No.", Rec."Grant No.");
                            PlanningLines.SetRange(PlanningLines.Type, PlanningLines.Type::"G/L Account");
                            //PlanningLines.SETRANGE(PlanningLines.Partner,' ');
                            PlanningLines.SetRange(PlanningLines."Budget in use", true);
                            if PlanningLines.Find('-') then begin
                                repeat

                                    if PlanningLines."Transfered To Budget" = false then begin

                                        BudgetEntry.Reset();
                                        if BudgetEntry.Find('+') then
                                            LastEntryNo := BudgetEntry."Entry No.";
                                        //ERROR('%1',LastEntryNo);

                                        BudgetEntry.Init();
                                        BudgetEntry."Entry No." := LastEntryNo + 1;
                                        BudgetEntry."Budget Name" := BudgetSetup."Current Budget Code";
                                        BudgetEntry.Date := StartDate;
                                        BudgetEntry."G/L Account No." := PlanningLines."No.";
                                        BudgetEntry.Description := PlanningLines.Description;
                                        BudgetEntry.Amount := PlanningLines."Total Cost (LCY)";
                                        BudgetEntry.Donor := PlanningLines."Global Dimension 1 Code";
                                        BudgetEntry."Project No" := PlanningLines."Global Dimension 2 Code";
                                        BudgetEntry."Global Dimension 1 Code" := PlanningLines."Global Dimension 1 Code";
                                        BudgetEntry."Contract Entry No" := PlanningLines."Grant Contract Entry No.";
                                        BudgetEntry.Insert();
                                        PlanningLines."Transfered To Budget" := true;
                                        PlanningLines.Modify();

                                        Commit();
                                    end else begin
                                        BudgetEntry.Reset();
                                        BudgetEntry.SetRange(BudgetEntry."Contract Entry No", PlanningLines."Grant Contract Entry No.");
                                        if BudgetEntry.Find('-') then begin
                                            BudgetEntry.Date := StartDate;
                                            BudgetEntry."Budget Name" := BudgetSetup."Current Budget Code";
                                            BudgetEntry."G/L Account No." := PlanningLines."No.";
                                            BudgetEntry.Description := PlanningLines.Description;
                                            BudgetEntry.Donor := PlanningLines."Global Dimension 1 Code";
                                            BudgetEntry."Project No" := PlanningLines."Global Dimension 2 Code";

                                            BudgetEntry."Global Dimension 2 Code" := PlanningLines."Grant No.";
                                            BudgetEntry.Amount := PlanningLines."Total Cost (LCY)";
                                            BudgetEntry."Global Dimension 1 Code" := PlanningLines."Global Dimension 1 Code";
                                            BudgetEntry.Modify();
                                        end
                                    end

                                until PlanningLines.Next() = 0;


                                Message('Transfer Complete.');
                            end
                        end
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec."Unaccounted Amount" := Rec."Disbursed Amount" - Rec."Accounted Amount";
    end;

    trigger OnOpenPage()
    begin
        if ActiveField = 1 then;
        if ActiveField = 2 then;
        if ActiveField = 3 then;
        if ActiveField = 4 then;
    end;

    var
        JobCreateInvoice: Codeunit "HR Leave Jnl Management";
        ActiveField: Option " ",Cost,CostLCY,PriceLCY,Price;
        Job: Record Jobs;
        StartDate: Date;
        BudgetSetup: Record "Budgetary Control Setup";
        PlanningLines: Record "Job-Planning Line";
        BudgetEntry: Record "G/L Budget Entry";
        LastEntryNo: Integer;


    procedure CreateSalesInvoice(CrMemo: Boolean)
    var
        JobPlanningLine: Record "Job-Planning Line";
        JobCreateInvoice: Codeunit "HR Leave Jnl Management";
    begin
        /*TESTFIELD("Line No.");
        JobPlanningLine.COPY(Rec);
        CurrPage.SETSELECTIONFILTER(JobPlanningLine);
        JobCreateInvoice.CreateSalesInvoice(JobPlanningLine,CrMemo)
        */

    end;


    procedure SetActiveField(ActiveField2: Integer)
    begin
        ActiveField := ActiveField2;
    end;
}
