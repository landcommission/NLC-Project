#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193856 "Grant Planning Lines"
{
    Caption = 'Grant Budget Lines';
    DataCaptionExpression = Rec.Caption2();
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Job-Task";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Grant Task No."; Rec."Grant Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task No.';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grant Task No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part(PlanningLines; "Grant Planning Line Subform")
            {
                SubPageLink = "Grant No." = field("Grant No."),
                              "Grant Task No." = field("Grant Task No.");
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
                action("Transfer Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer Lines';
                    ToolTip = 'Executes the Transfer Lines action.';
                    trigger OnAction()
                    begin

                        if Confirm('Are you sure you want to Transfer Lines to Budget?', false) = true then begin

                            Job.Reset();
                            Job.Get(Rec."Grant No.");
                            StartDate := Job."Starting Date";

                            if Job."Approval Status" <> Job."Approval Status"::Approved then
                                Error('The grant has to be approved to set budget');

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
                                        BudgetEntry.Donor := Job."Bill-to Partner No.";
                                        BudgetEntry."Project No" := Job."No.";
                                        BudgetEntry."Global Dimension 1 Code" := Job."No.";
                                        BudgetEntry."Global Dimension 2 Code" := Job."Bill-to Partner No.";
                                        ;
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
                                            BudgetEntry.Donor := Job."Bill-to Partner No.";
                                            BudgetEntry."Project No" := Job."No.";
                                            BudgetEntry."Global Dimension 1 Code" := Job."No.";
                                            BudgetEntry."Global Dimension 2 Code" := Job."Bill-to Partner No.";
                                            ;
                                            BudgetEntry.Amount := PlanningLines."Total Cost (LCY)";
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

    trigger OnOpenPage()
    begin
        if Job.Get(Rec."Grant No.") then
            CurrPage.Editable(not (Job.Blocked = Job.Blocked::All));
    end;

    var
        Job: Record Jobs;
        AppMgt: Codeunit "Export F/O Consolidation";
        PlanningLines: Record "Job-Planning Line";
        JobCreateInvoice: Codeunit "HR Leave Jnl Management";
        ActiveField: Option " ",Cost,CostLCY,PriceLCY,Price;
        StartDate: Date;
        BudgetSetup: Record "Budgetary Control Setup";
        BudgetEntry: Record "G/L Budget Entry";
        LastEntryNo: Integer;
}
