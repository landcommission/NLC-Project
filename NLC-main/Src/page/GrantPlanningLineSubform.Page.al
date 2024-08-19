#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193857 "Grant Planning Line Subform"
{
    AutoSplitKey = true;
    Caption = 'Grant Budget Line Subform';
    DataCaptionExpression = Rec.Caption();
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Job-Planning Line";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = TypeEditable;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Donor Expense Code"; Rec."Donor Expense Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donor Expense Code field.';
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Date field.';
                }
                field("Budget Period"; Rec."Budget Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Period field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = "No.Editable";
                    ToolTip = 'Specifies the value of the Expense Account field.';
                }
                field(Restriction; Rec.Restriction)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restriction field.';
                }
                field("Grant Contract Entry No."; Rec."Grant Contract Entry No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Contract Entry No.';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Grant Contract Entry No. field.';
                }
                field("Pending donor Issues"; Rec."Pending donor Issues")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pending donor Issues field.';
                }
                field("Budget in use"; Rec."Budget in use")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget in use field.';
                }
                field("Special Condition for Travel"; Rec."Special Condition for Travel")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Special Condition for Travel field.';
                }
                field("Audit Provision"; Rec."Audit Provision")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit Provision field.';
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
                field("Currency Date"; Rec."Currency Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Currency DateEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = DescriptionEditable;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Partner; Rec.Partner)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partner field.';
                }
                field("Budget Grouping Code"; Rec."Budget Grouping Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Grouping Code field.';
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
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Variant CodeEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Location CodeEditable";
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Work Type CodeEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Work Type Code field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Unit of Measure CodeEditable";
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = QuantityEditable;
                    ToolTip = 'Specifies the value of the Quantity field.';
                    trigger OnValidate()
                    begin
                        //Check if quantity is less than zero
                        if (Rec.Quantity <= 0) then
                            Error('Quantity should not be less than 0');
                        // END
                    end;
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
                    Editable = "Unit CostEditable";
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
                field("ICIPE Contribution"; Rec."ICIPE Contribution")
                {
                    ApplicationArea = Basic;
                    Caption = '<Own Contribution>';
                    ToolTip = 'Specifies the value of the <Own Contribution> field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    Editable = "Unit PriceEditable";
                    Visible = false;
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
                    Editable = "Line AmountEditable";
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
                    Editable = "Line Discount AmountEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = Basic;
                    Editable = "Line Discount %Editable";
                    Visible = false;
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
                field("Invoiced Amount (LCY)"; Rec."Invoiced Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoiced Amount (LCY) field.';
                }
                field("Invoiced Cost Amount (LCY)"; Rec."Invoiced Cost Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoiced Cost Amount (LCY) field.';
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoice Type field.';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                }
                field(Invoiced; Rec.Invoiced)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoiced field.';
                }
                field(Transferred; Rec.Transferred)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transferred field.';
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
                action("Create &Sales Invoice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create &Sales Invoice';
                    Ellipsis = true;
                    Image = Invoice;
                    ToolTip = 'Executes the Create &Sales Invoice action.';
                    trigger OnAction()
                    begin
                        //This functionality was copied from page #39004417. Unsupported part was commented. Please check it.
                        /*CurrPage.PlanningLines.FORM.*/
                        _CreateSalesInvoice(false);

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
                        //This functionality was copied from page #39004417. Unsupported part was commented. Please check it.
                        /*CurrPage.PlanningLines.FORM.*/
                        _CreateSalesInvoice(true);

                    end;
                }
                action("Get Sales Invoice/Credit Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get Sales Invoice/Credit Memo';
                    Ellipsis = true;
                    ToolTip = 'Executes the Get Sales Invoice/Credit Memo action.';
                    trigger OnAction()
                    begin
                        //This functionality was copied from page #39004417. Unsupported part was commented. Please check it.
                        /*CurrPage.PlanningLines.FORM.*/
                        GetInvoice();

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord();
    end;

    trigger OnInit()
    begin
        "Unit CostEditable" := true;
        "Line AmountEditable" := true;
        "Line Discount %Editable" := true;
        "Line Discount AmountEditable" := true;
        "Unit PriceEditable" := true;
        "Work Type CodeEditable" := true;
        "Location CodeEditable" := true;
        "Variant CodeEditable" := true;
        "Unit of Measure CodeEditable" := true;
        QuantityEditable := true;
        DescriptionEditable := true;
        "No.Editable" := true;
        TypeEditable := true;
        "Currency DateEditable" := true;
    end;

    trigger OnModifyRecord(): Boolean
    var
        Job: Record Jobs;
    begin
        Rec.TestField(Rec.Transferred, false);

        if Rec."System-Created Entry" = true then
            if not Confirm(Text001, false) then
                Error('')
            else
                Rec."System-Created Entry" := false;

        Job.Reset();
        Job.SetRange(Job."No.", Rec."Grant No.");
        if Job.Find('-') then
            if Job."Approval Status" <> Job."Approval Status"::Open then
                Error('You CANNOT modify any Pending Document or Fully Approved');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.SetUpNewLine(xRec);
        OnAfterGetCurrRecord();
    end;

    var
        Text001: Label 'This Job Planning Line is generated automatically. Do you want to continue?';
        [InDataSet]
        "Currency DateEditable": Boolean;
        [InDataSet]
        TypeEditable: Boolean;
        [InDataSet]
        "No.Editable": Boolean;
        [InDataSet]
        DescriptionEditable: Boolean;
        [InDataSet]
        QuantityEditable: Boolean;
        [InDataSet]
        "Unit of Measure CodeEditable": Boolean;
        [InDataSet]
        "Variant CodeEditable": Boolean;
        [InDataSet]
        "Location CodeEditable": Boolean;
        [InDataSet]
        "Work Type CodeEditable": Boolean;
        [InDataSet]
        "Unit PriceEditable": Boolean;
        [InDataSet]
        "Line Discount AmountEditable": Boolean;
        [InDataSet]
        "Line Discount %Editable": Boolean;
        [InDataSet]
        "Line AmountEditable": Boolean;
        [InDataSet]
        "Unit CostEditable": Boolean;


    procedure _CreateSalesInvoice(CrMemo: Boolean)
    var
        JobPlanningLine: Record "Job-Planning Line";
        JobCreateInvoice: Codeunit "HR Leave Jnl Management";
    begin
        Rec.TestField(Rec."Line No.");
        JobPlanningLine.Copy(Rec);
        CurrPage.SetSelectionFilter(JobPlanningLine);
        /*JobCreateInvoice.CreateSalesInvoice(JobPlanningLine,CrMemo) */

    end;


    procedure CreateSalesInvoice(CrMemo: Boolean)
    var
        JobPlanningLine: Record "Job-Planning Line";
        JobCreateInvoice: Codeunit "HR Leave Jnl Management";
    begin
        Rec.TestField(Rec."Line No.");
        JobPlanningLine.Copy(Rec);
        CurrPage.SetSelectionFilter(JobPlanningLine);
        /*JobCreateInvoice.CreateSalesInvoice(JobPlanningLine,CrMemo)*/

    end;

    local procedure SetEditable(Edit: Boolean)
    begin
        //CurrForm."Line Type".EDITABLE := Edit;
        //CurrForm."Planning Date".EDITABLE := Edit;
        "Currency DateEditable" := Edit;
        //CurrForm."Document No.".EDITABLE := Edit;
        TypeEditable := Edit;
        "No.Editable" := Edit;
        DescriptionEditable := Edit;
        QuantityEditable := Edit;
        "Unit of Measure CodeEditable" := Edit;
        "Variant CodeEditable" := Edit;
        "Location CodeEditable" := Edit;
        "Work Type CodeEditable" := Edit;
        "Unit PriceEditable" := Edit;
        "Line Discount AmountEditable" := Edit;
        "Line Discount %Editable" := Edit;
        "Line AmountEditable" := Edit;
        "Unit CostEditable" := Edit;
    end;


    procedure GetInvoice()
    var
        JobCreateInvoice: Codeunit "HR Leave Jnl Management";
    begin
        /*JobCreateInvoice.GetSalesInvoice(Rec);*/

    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        SetEditable(not Rec.Transferred);
    end;
}
