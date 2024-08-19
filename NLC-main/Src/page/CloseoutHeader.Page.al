#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193676 "Close out Header"
{
    PageType = Card;
    SourceTable = "Close Out Check List";
    ApplicationArea = All;
    Caption = 'Close out Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Closeout No."; Rec."Closeout No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Closeout No. field.';
                }
                field("Grant No"; Rec."Grant No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(PI; Rec.PI)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI field.';
                }
                field("PI Name"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the PI Name field.';
                }
                field(Subcontractor; Rec.Subcontractor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subcontractor field.';
                }
                field("Donor/Sponsor Code"; Rec."Donor/Sponsor Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Donor/Sponsor Code field.';
                }
                field("Subcontractor no"; Rec."Subcontractor no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subcontractor no field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control1000000017; "Close out Lines") { }
        }
        area(FactBoxes)
        {
            systempart(Control1000000013; Outlook) { }
            systempart(Control1000000014; Notes) { }
            systempart(Control1000000015; MyNotes) { }
            systempart(Control1000000016; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Load Checklist")
            {
                ApplicationArea = Basic;
                Image = BinJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Load Checklist action.';
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Open then
                        Error('Sorry, Close out number %1 is not open for appending the lines', Rec."Closeout No.");

                    //Delete the lines for the period--
                    objCloseoutLines.Reset();
                    objCloseoutLines.SetRange(objCloseoutLines."Closeout Nos", Rec."Closeout No.");
                    if objCloseoutLines.Find('-') then
                        if Confirm('Lines exist for this close out do you want to overwrite?') then
                            objCloseoutLines.DeleteAll(true)
                        else
                            exit;

                    //gET lAST NUMBER
                    objCloseoutLines.Reset();
                    objCloseoutLines.SetRange(objCloseoutLines."Line No");
                    if objCloseoutLines.Find('+') then
                        iNo := objCloseoutLines."Line No";

                    //Get and load the cheklist
                    objLookup.Reset();
                    objLookup.SetRange(objLookup.Type, objLookup.Type::"Sub Contractor Close Out Checklist");
                    if objLookup.Find('-') then
                        repeat
                            objCloseoutLines.Init();
                            objCloseoutLines."Line No" := objCloseoutLines."Line No" + 1;
                            objCloseoutLines."Closeout Nos" := Rec."Closeout No.";
                            objCloseoutLines.Sections := objLookup.Remarks;
                            objCloseoutLines.Insert();
                        until objLookup.Next() = 0;



                    /*IF Status<>Status::Open THEN ERROR('Sorry, Close out number %1 is not open for appending the lines',"Closeout No.");

                    //Delete the lines for the period--
                    objCloseoutLines.RESET;
                    objCloseoutLines.SETRANGE(objCloseoutLines."Closeout Nos","Closeout No.");
                    IF objCloseoutLines.FIND('-') THEN BEGIN
                     IF CONFIRM('Lines exist for this close out do you want to overwrite?') THEN BEGIN
                        objCloseoutLines.DELETEALL(TRUE);
                     END ELSE EXIT;
                    END;

                        //gET lAST NUMBER
                        objCloseoutLines.RESET;
                        objCloseoutLines.SETRANGE(objCloseoutLines."Line No");
                        IF objCloseoutLines.FIND('+') THEN  iNo:=objCloseoutLines."Line No";

                        //Get and load the cheklist
                        objLookup.RESET;
                        objLookup.SETRANGE(objLookup.Type,objLookup.Type::"0");
                        IF objLookup.FIND('-') THEN REPEAT
                          objCloseoutLines.INIT;
                          objCloseoutLines."Line No":=objCloseoutLines."Line No"+1;
                          objCloseoutLines."Closeout Nos":="Closeout No.";
                          objCloseoutLines.Sections:=objLookup.Remarks;
                          objCloseoutLines.INSERT;
                        UNTIL objLookup.NEXT=0;*/

                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition",Job;
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocumentType := DocumentType::Job;
                    ApprovalEntries.Setfilters(Database::"Master Record Creation Header", DocumentType, Rec."Closeout No.");
                    ApprovalEntries.Run();
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin


                    if Confirm('Send this Closeout for Approval?', true) = false then
                        exit;
                    // AppMgmt.SendCloseoutApprovalReq(Rec);
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    if Confirm('Cancel Approval Request?', true) = false then
                        exit;
                    // AppMgmt.CancelCloseoutRequest(Rec,true,true);
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action("Print Checklist")
            {
                ApplicationArea = Basic;
                Image = BinJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunPageOnRec = false;
                ToolTip = 'Executes the Print Checklist action.';
                trigger OnAction()
                begin
                    objCloseOut.Reset();
                    objCloseOut.SetRange(objCloseOut."Closeout No.", Rec."Closeout No.");
                    if objCloseOut.Find('-') then
                        Report.Run(39003925, true, true, objCloseOut);
                end;
            }
        }
    }

    var
        iNo: Integer;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //AppMgmt: Codeunit
        objCloseoutLines: Record "Closeout Checklist Lines";
        objLookup: Record "Grants Lookup Values";
        objCloseOut: Record "Close Out Check List";
}
