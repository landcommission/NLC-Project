#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194107 "HR Master Record Creation Card"
{
    PageType = Card;
    SourceTable = "Master Record Creation Header";
    ApplicationArea = All;
    Caption = 'HR Master Record Creation Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Visible = true;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Requestor ID"; Rec."Requestor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor ID field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Dimension 1"; Rec."Dimension 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 1 field.';
                }
                field("Dimension 1 Description"; Rec."Dimension 1 Description")
                {
                    ApplicationArea = Basic;
                    HideValue = false;
                    Visible = Visible;
                    ToolTip = 'Specifies the value of the Dimension 1 Description field.';
                }
                field("Dimension 2"; Rec."Dimension 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 2 field.';
                }
                field("Dimension 2 Description"; Rec."Dimension 2 Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 2 Description field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
            part(Control16; "HR Master Record Creation Line")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(FactBoxes)
        {
            systempart(Control14; MyNotes) { }
            systempart(Control15; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    if Confirm('Do you want to send this document for approval?', false) then;
                    //if ApprovalMgt.SendMasterApprovalReq(Rec) then;
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to cancel approval request?', false) then;
                    //if ApprovalMgt.CancelMasterAppRequest(Rec,true,true) then;
                end;
            }
            action(Action20)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,"Master Record";
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocumentType := DocumentType::"Master Record";
                    ApprovalEntries.Setfilters(Database::"Master Record Creation Header", DocumentType, Rec."No.");
                    ApprovalEntries.Run();
                end;
            }
            action("Create Record")
            {
                ApplicationArea = Basic;
                Caption = 'Create Record';
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Create Record action.';
                trigger OnAction()
                begin
                    //Routine to create documents
                    MasterLines.Reset();
                    MasterLines.SetRange(MasterLines."Document No.", Rec."No.");
                    if MasterLines.Find('-') then
                        case MasterLines.Type of
                            MasterLines.Type::Dimension:
                                begin
                                    Dimension.Code := MasterLines."Dimension Code Insert"; //The reason for duplicate fields for dimension is to allow us to look up when creating dimval in UI
                                    Dimension.Name := MasterLines."Dimension Name Insert";
                                    if Dimension.Insert() then
                                        Message('Dimension :[%1] Name:[%2] has been successfully created!', MasterLines."Dimension Code Insert", MasterLines."Dimension Name Insert");
                                    MasterLines."Created Document No." := MasterLines."Dimension Code Insert";
                                    MasterLines."Created Document Name" := MasterLines."Dimension Name Insert";
                                    MasterLines.Modify();

                                end;
                            MasterLines.Type::"Dimension Value":
                                begin
                                    DimVal."Dimension Code" := MasterLines."Dimension Code";
                                    DimVal.Code := MasterLines."Dimension Value Code";
                                    DimVal.Name := MasterLines."Dimension Value Name";
                                    if DimVal.Insert() then
                                        Message('Dimension Value :[%1] Name:[%2] has been successfully created!', MasterLines."Dimension Value Code", MasterLines."Dimension Value Name");
                                    MasterLines."Created Document No." := MasterLines."Dimension Value Code";
                                    MasterLines."Created Document Name" := MasterLines."Dimension Value Name";
                                    MasterLines.Modify();

                                end;

                        end;  //End cases
                end;
            }
        }
    }

    var
        "G/L Account": Record "G/L Account";
        MasterLines: Record "Master Record Creation Lines";
        DocNo: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        Bank: Record "Bank Account";
        Customer: Record Customer;
        SalesReceivableSetup: Record "Sales & Receivables Setup";
        PurchPayablesSetup: Record "Purchases & Payables Setup";
        Vendor: Record Vendor;
        InventorySetup: Record "Inventory Setup";
        Item: Record Item;
        FASetup: Record "FA Setup";
        FA: Record "Fixed Asset";
        [InDataSet]
        Visible: Boolean;
        FA_DepBK: Record "FA Depreciation Book";
        Dimension: Record Dimension;
        DimVal: Record "Dimension Value";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //ApprovalMgt: Codeunit "Export F/O Consolidation";
}
