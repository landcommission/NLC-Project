#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50113 pageextension50113 extends "Purchase Order"
{
    layout
    {

        //Unsupported feature: Property Deletion (Importance) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (Visible) on ""No."(Control 2)".

        addafter(Status)
        {
            field("Order Type"; Rec.Type)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Type field.';
            }
            field(Cancelled; Rec.Cancelled)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Cancelled field.';
            }
        }
    }
    actions
    {
        modify(Action187)
        {
            Caption = 'l8';

            //Unsupported feature: Property Modification (Name) on "Action187(Action 187)".

        }
        // modify(Action190)
        // {
        //     Visible = false;
        // }
        // modify(Action75)
        // {
        //     Visible = false;
        // }


        //Unsupported feature: Code Modification on ""Send A&pproval Request"(Action 221).OnAction".

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
        IF NOT SomeLinesCommitted THEN
          ERROR('All Lines must be Committed before you send for Approval');


        SendPurchaseApprovalRequest(Rec) THEN;
        */
        //end;
        addafter(Approvals)
        {
            action("Check Budget Committment")
            {
                ApplicationArea = Basic;
                Caption = 'Check Budget Committment';
                Image = Balance;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Check Budget Committment action.';
                trigger OnAction()
                begin

                    BCSetup.Get();
                    if not BCSetup.Mandatory then
                        exit;

                    if not CheckforRequiredFields() then
                        Error('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');

                    if Rec.Status = Rec.Status::Released then
                        Error('This document has already been released. This functionality is available for open documents only');
                    if SomeLinesCommitted() then begin
                        if not Confirm('Some or All the Lines Are already Committed do you want to continue', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');
                        DeleteCommitment.Reset();
                        DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll();
                    end;
                    Commitment.CheckPurchase(Rec);

                    Message('Commitments done Successfully for Doc. No %1', Rec."No.");


                    /*BCSetup.GET;
                    IF NOT BCSetup.Mandatory THEN
                       EXIT;

                    IF NOT CheckforRequiredFields THEN
                       ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');

                    IF Status=Status::Released THEN
                      ERROR('This document has already been released. This functionality is available for open documents only');
                    IF SomeLinesCommitted THEN BEGIN
                      ERROR('All Lines Are already Committed');
                       IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                            ERROR('Budget Availability Check and Commitment Aborted');
                      DeleteCommitment.RESET;
                      DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                      DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                      DeleteCommitment.DELETEALL;
                    END;
                       Commitment.CheckPurchase(Rec);

                    MESSAGE('Commitments done Successfully for Doc. No %1',"No.");*/

                end;
            }
            action("Cancel Budget Committment")
            {
                ApplicationArea = Basic;
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Budget Committment action.';
                trigger OnAction()
                begin

                    if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                        Error('Budget Availability Check and Commitment Aborted');

                    DeleteCommitment.Reset();
                    DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::LPO);
                    DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                    DeleteCommitment.DeleteAll();
                    //Tag all the Purchase Line entries as Uncommitted
                    PurchLine.Reset();
                    PurchLine.SetRange(PurchLine."Document Type", Rec."Document Type");
                    PurchLine.SetRange(PurchLine."Document No.", Rec."No.");
                    if PurchLine.Find('-') then
                        repeat
                            PurchLine.Committed := false;
                            PurchLine.Modify();
                        until PurchLine.Next() = 0;

                    Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");
                end;
            }
        }
        addafter("Remove From Job Queue")
        {
            action(ArchiveUnusedDoc)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the ArchiveUnusedDoc action.';
                trigger OnAction()
                begin
                    UserSet.Reset();
                    UserSet.SetRange(UserSet."Archiving User", UserId);
                    if not UserSet.Find('-') then
                        Error('Sorry you have no permission to Arhchive Unused Order,');
                    Rec."Archive Unused Doc" := true;
                    Rec.Modify();
                end;
            }
        }
        addafter(Print)
        {
            group("Document Management")
            {
                Caption = 'Document Management';
                Description = 'Document Management';
            }
            action("DMS Link")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Documents';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Attach Documents action.';
                trigger OnAction()
                begin
                    if CompanyInfo.Get() then begin
                        Link := CompanyInfo."Documents Attachment Link";
                        Hyperlink(Link);
                    end;
                end;
            }
            action("View Attached Documents")
            {
                ApplicationArea = Basic;
                Caption = 'View Attached Documents';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page Attachment;
                RunPageLink = Document_No = field("No.");
                RunPageMode = View;
                ToolTip = 'Executes the View Attached Documents action.';
            }
        }
    }

    var
        BCSetup: Record "Budgetary Control Setup";
        AllFieldsEntered: Boolean;
        DeleteCommitment: Record Committment;
        Commitment: Codeunit "Budgetary Control";
        PurchLine: Record "Purchase Line";
        UserSet: Record "User Setup";
        CompanyInfo: Record "Company Information";
        Link: Text[250];


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetExtDocNoMandatoryCondition;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //SetExtDocNoMandatoryCondition;
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetDocNoVisible;

    IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
      FILTERGROUP(2);
      SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
      FILTERGROUP(0);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //SetDocNoVisible;
    #2..7
    */
    //end;

    procedure CheckforRequiredFields(): Boolean
    var
        PurchLine: Record "Purchase Line";
    begin
        AllFieldsEntered := true;
        PurchLine.Reset();
        PurchLine.SetRange(PurchLine."Document Type", Rec."Document Type");
        PurchLine.SetRange(PurchLine."Document No.", Rec."No.");
        if PurchLine.Find('-') then begin
            repeat
                if (PurchLine.Type = PurchLine.Type::" ") or (PurchLine."No." = '') or (PurchLine."Line Amount" = 0) then
                    AllFieldsEntered := false;
            until PurchLine.Next() = 0;
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
                Exists := true
            else
                Exists := false;
        end;
    end;

    //Unsupported feature: Property Deletion (SourceTableView).

}
