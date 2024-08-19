#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50114 pageextension50114 extends "Purchase Invoice"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("Contract No."; Rec."Contract No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract No. field.';
            }
            field("Contract Value"; Rec."Contract Value")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract Value field.';
            }
        }
        addafter("Currency Code")
        {
            field("Invoice Basis"; Rec."Invoice Basis")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Invoice Basis field.';
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on ""Send A&pproval Request"(Action 142).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SendPurchaseApprovalRequest(Rec) THEN;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {
        IF LinesCommitted THEN
           ERROR('All Lines should be committed');

        IF NOT CheckforSourceofDocument THEN
            ERROR('All Invoices based on LPO must have an order no. on the lines');

         }

        IF NOT CheckforRequiredFields THEN
           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT,("JOB NO.","JOB TASK NO.")FOR WIP] Please recheck your document lines');

        SendPurchaseApprovalRequest(Rec) THEN;
        */
        //end;
    }

    var
        Commitment: Codeunit "Budgetary Control";
        BudgetaryControl: Integer;
        BCSetup: Record "Budgetary Control Setup";
        DeleteCommitment: Record Committment;
        PurchLine: Record "Purchase Line";
        AllFieldsEntered: Boolean;
        ConfirmOrderNo: Boolean;
        mJobs: Record "HR Employee Qualifications";

    local procedure LinesCommitted()
    var
        PurchLines: Record "Purchase Line";
    begin
    end;

    procedure CheckforRequiredFields(): Boolean
    var
        PurchLines: Record "Purchase Line";
        JobsSetup: Record "Jobs Setup";
        JobPostingGroup: Record "Job Posting Group";
    begin
        AllFieldsEntered := true;
        PurchLines.Reset();
        PurchLines.SetRange(PurchLines."Document Type", Rec."Document Type");
        PurchLines.SetRange(PurchLines."Document No.", Rec."No.");
        if PurchLines.Find('-') then begin
            repeat
                if (PurchLines.Type = PurchLines.Type::" ") or (PurchLines."No." = '') or (PurchLines."Outstanding Amount (LCY)" = 0) then
                    AllFieldsEntered := false;
                if JobsSetup.Get() then
                    if JobPostingGroup.Get(JobsSetup."Default Job Posting Group") then
                        if PurchLine."No." = JobPostingGroup."WIP Costs Account" then
                            if (PurchLine."Job No." = '') or (PurchLine."Job Task No." = '') then
                                AllFieldsEntered := false;

            until PurchLines.Next() = 0;
            exit(AllFieldsEntered)
        end;
    end;

    procedure SomeLinesCommitted() Exists: Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        if BCSetup.Get() then begin
            Exists := false;
            PurchLines.Reset();
            PurchLines.SetRange(PurchLines."Document Type", Rec."Document Type");
            PurchLines.SetRange(PurchLines."Document No.", Rec."No.");
            PurchLines.SetRange(PurchLines.Committed, true);
            if PurchLines.Find('-') then
                Exists := true;
        end else
            Exists := false;
    end;

    procedure UpdateControls()
    begin

        /*IF Status<>Status::Open THEN BEGIN
          CurrPage.PurchLines.EDITABLE:=FALSE;
         END ELSE
           CurrPage.PurchLines.EDITABLE:=TRUE;*/

    end;
}
