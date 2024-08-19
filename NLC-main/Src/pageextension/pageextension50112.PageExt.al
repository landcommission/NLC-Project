#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50112 pageextension50112 extends "General Journal"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Posting No. Series field.';
            }
        }
        addafter("Incoming Document Entry No.")
        {
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
        }
        moveafter("Document No."; "External Document No.")
    }
    actions
    {


        //Unsupported feature: Code Modification on "Post(Action 50).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",Rec);
        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //check journal if approved befre posting

        GenJnlBatch.RESET;
        GenJnlBatch.SETRANGE(GenJnlBatch.Name,"Journal Batch Name");
        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
        IF GenJnlBatch.FIND('-') THEN BEGIN

        IF GenJnlBatch.Status<>GenJnlBatch.Status::Approved THEN
        ERROR('Journal Batch %1 must be approved prior to posting',CurrentJnlBatchName);

        #1..3
        END;
            //Reset Batch to open for future use
            GenJnlBatch.RESET;
            GenJnlBatch.SETRANGE(GenJnlBatch.Name,"Journal Batch Name");
            GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
            IF GenJnlBatch.FIND('-') THEN BEGIN
            GenJnlBatch.Status:=GenJnlBatch.Status::Open;
            GenJnlBatch.MODIFY;
            END;
        */
        //end;


        //Unsupported feature: Code Modification on ""Post and &Print"(Action 51).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post+Print",Rec);
        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //check journal if approved befre posting

        GenJnlBatch.RESET;
        GenJnlBatch.SETRANGE(GenJnlBatch.Name,"Journal Batch Name");
        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
        IF GenJnlBatch.FIND('-') THEN BEGIN

        IF GenJnlBatch.Status<>GenJnlBatch.Status::Approved THEN
        ERROR('Journal Batch %1 must be approved prior to posting',CurrentJnlBatchName);


        #1..3
         END;

        //Reset Batch to open for future use
        GenJnlBatch.RESET;
        GenJnlBatch.SETRANGE(GenJnlBatch.Name,"Journal Batch Name");
        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
        IF GenJnlBatch.FIND('-') THEN BEGIN
        GenJnlBatch.Status:=GenJnlBatch.Status::Open;
        GenJnlBatch.MODIFY;
        END;
        */
        //end;
        addafter("Payro&ll")
        {
            group(ActionGroup47)
            {
                action(Approvals1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Promoted = true;
                    Visible = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,"Outward Donation","Asset Donation","Asset Clearance","Asset Transfer","Travel Request","Salary Advance","Store Requisition",JV;
                    begin

                        DocType := DocType::JV;

                        GenJnlBatch.Reset();
                        //GenJnlBatch.SetRange(GenJnlBatch.Name,CurrentJnlBatchName);
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                        if GenJnlBatch.Find('-') then begin
                            ApprovalEntries.Setfilters(Database::"Gen. Journal Batch", DocType, GenJnlBatch.BatchApprovalNo);
                            ApprovalEntries.Run();
                        end;
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Promoted = true;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                        //ApprovalMgt: Codeunit "Export F/O Consolidation";
                        GenLedgSetup: Record "General Ledger Setup";
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                        DimMgt: Codeunit DimensionManagement;
                        ShortcutDimCode: array[8] of Code[25];
                    begin

                        GenJnlBatch.Reset();
                        //GenJnlBatch.SetRange(GenJnlBatch.Name,CurrentJnlBatchName);
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                        if GenJnlBatch.Find('-') then
                            // IF GenJnlBatch.Status<>GenJnlBatch.Status::Open THEN
                            //  ERROR('Status must be open');


                            if GenLedgSetup.Get() then begin
                                GenJnlBatch."Batch Workflow No. Series" := '';
                                GenLedgSetup.TestField(GenLedgSetup."Journal Approval Nos");

                                NoSeriesMgt.InitSeries(GenLedgSetup."Journal Approval Nos", GenJnlBatch."Batch Workflow No. Series"
                                , 0D, GenJnlBatch.BatchApprovalNo, GenJnlBatch."Batch Workflow No. Series");
                                GenJnlBatch.Modify();
                            end;
                        // if ApprovalMgt.SendJVApprovalRequest(GenJnlBatch) then;
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Promoted = true;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin

                        //First Update the Batch with a number
                        GenJnlBatch.Reset();
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                        GenJnlBatch.SetRange(GenJnlBatch.Name, Rec."Journal Batch Name");
                        //if GenJnlBatch.Find('-') then begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelJVApprovalRequest(GenJnlBatch,true,true);
                        //end;
                        //End allocate batch number
                    end;
                }
            }
        }
    }

    var
        GenJnlBatch: Record "Gen. Journal Batch";
        TemplateName: Code[10];
        NoSeries: Code[20];
        NoSeriesLine: Record "No. Series Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
