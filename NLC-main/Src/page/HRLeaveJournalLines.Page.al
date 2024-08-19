#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193464 "HR Leave Journal Lines"
{
    ApplicationArea = Basic;
    DelayedInsert = false;
    PageType = Worksheet;
    PromotedActionCategories = 'New,Process,Report,Functions,Approvals';
    RefreshOnActivate = true;
    SaveValues = false;
    SourceTable = "HR Leave Journal Line";
    UsageCategory = Tasks;
    Caption = 'HR Leave Journal Lines';
    layout
    {
        area(Content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                ApplicationArea = Basic;
                Caption = 'Batch Name';
                Lookup = true;
                ToolTip = 'Specifies the value of the Batch Name field.';
                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord();

                    //Rec.RESET;

                    InsuranceJnlManagement.LookupName(CurrentJnlBatchName, Rec);
                    CurrPage.Update(false);
                end;

                trigger OnValidate()
                begin
                    InsuranceJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali();
                end;
            }
            repeater(Control1102755000)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Period field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Leave Entry Type"; Rec."Leave Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Entry Type field.';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
                field("Leave Period Start Date"; Rec."Leave Period Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Period Start Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Batched; Rec.Batched)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Batched field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Post Adjustment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Adjustment';
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Post Adjustment action.';
                    trigger OnAction()
                    begin

                        Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", Rec);

                        CurrentJnlBatchName := Rec.GetRangeMax(Rec."Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action("Batch Allocation")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = report "HR Leave Adjustment";
                    ToolTip = 'Executes the Batch Allocation action.';
                }
            }
            group(ActionGroup1102755006)
            {
                action("<Action1102756003>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Approvals action.';

                }
                action("<Action1102756005>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Send Approval Request action.';

                }
                action("<Action1102756006>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Request action.';

                }
            }
        }
    }

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
        InsuranceJnlManagement: Codeunit "HR Leave Jnl Management";
    begin
        UserSetup.Reset();
        UserSetup.SetRange(UserSetup."User ID", UserId);
        UserSetup.SetRange(UserSetup."Adjust Leave Days", true);
        if UserSetup.Find('-') then begin



            OpenedFromBatch := (Rec."Journal Batch Name" <> '') and (Rec."Journal Template Name" = '');
            if OpenedFromBatch then begin
                CurrentJnlBatchName := Rec."Journal Batch Name";
                InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
                exit;
            end;
            InsuranceJnlManagement.TemplateSelection(Page::"HR Leave Journal Lines", Rec, JnlSelected);
            if not JnlSelected then
                Error('');
            InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);

        end else
            Error('You have no permission to adjust leave days');
    end;

    var
        HRLeaveTypes: Record "HR Leave Types";
        HREmp: Record "HR Employees";
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        InsuranceJnlManagement: Codeunit "HR Leave Jnl Management";
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[10];
        InsuranceDescription: Text[30];
        FADescription: Text[30];
        ShortcutDimCode: array[8] of Code[20];
        OpenedFromBatch: Boolean;
        HRLeavePeriods: Record "HR Leave Periods";
        AllocationDone: Boolean;
        HRJournalBatch: Record "HR Leave Journal Batch";
        OK: Boolean;
        ApprovalEntries: Record "Approval Entry";
        LLE: Record "HR Leave Ledger Entries";
        UserSetup: Record "User Setup";


    procedure CheckGender(Emp: Record "HR Employees"; LeaveType: Record "HR Leave Types") Allocate: Boolean
    begin

        //CHECK IF LEAVE TYPE ALLOCATION APPLIES TO EMPLOYEE'S GENDER

        if Emp.Gender = Emp.Gender::Male then
            if LeaveType.Gender = LeaveType.Gender::Male then
                Allocate := true;

        if Emp.Gender = Emp.Gender::Female then
            if LeaveType.Gender = LeaveType.Gender::Female then
                Allocate := true;

        if LeaveType.Gender = LeaveType.Gender::Both then
            Allocate := true;
        exit(Allocate);

        if Emp.Gender <> LeaveType.Gender then
            Allocate := false;

        exit(Allocate);
    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord();
        InsuranceJnlManagement.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;


    procedure AllocateLeave1()
    begin
    end;


    procedure AllocateLeave2()
    begin
    end;
}
