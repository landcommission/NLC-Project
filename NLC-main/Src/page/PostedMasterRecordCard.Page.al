#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193803 "Posted Master Record Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Master Record Creation Header";
    ApplicationArea = All;
    Caption = 'Posted Master Record Card';
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
            part(Control16; "Master Record Creation Lines")
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
