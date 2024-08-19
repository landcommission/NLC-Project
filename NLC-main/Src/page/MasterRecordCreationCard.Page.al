#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193800 "Master Record Creation Card"
{
    PageType = Card;
    SourceTable = "Master Record Creation Header";
    ApplicationArea = All;
    Caption = 'Master Record Creation Card';
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
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Dimension 1 Description"; Rec."Dimension 1 Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Description';
                    HideValue = false;
                    Visible = Visible;
                    ToolTip = 'Specifies the value of the Department Description field.';
                }
                field("Dimension 2"; Rec."Dimension 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'County';
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Dimension 2 Description"; Rec."Dimension 2 Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'County Description';
                    ToolTip = 'Specifies the value of the County Description field.';
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
                    // if ApprovalMgt.SendMasterApprovalReq(Rec) then;
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
                            //***********G/L Account******************
                            MasterLines.Type::"G/L Account":
                                begin
                                    if "G/L Account".Get(MasterLines."Suggested No.") then
                                        Error('There is an existing G/L Account with that No.');
                                    "G/L Account".Reset();
                                    "G/L Account"."No." := MasterLines."Suggested No.";
                                    "G/L Account".Name := MasterLines.Name;
                                    "G/L Account"."Debit/Credit" := MasterLines."Debit/Credit";
                                    "G/L Account"."Account Type" := MasterLines."Account Type";
                                    "G/L Account".Blocked := MasterLines.Blocked;
                                    "G/L Account"."Gen. Posting Type" := MasterLines."General Posting Type";
                                    "G/L Account"."Gen. Bus. Posting Group" := MasterLines."Gen. Bus. Posting Group";
                                    "G/L Account"."Gen. Prod. Posting Group" := MasterLines."Gen. Prod. Posting Group";
                                    "G/L Account"."VAT Bus. Posting Group" := MasterLines."VAT. Bus. Posting Group";
                                    "G/L Account"."VAT Prod. Posting Group" := MasterLines."VAT. Prod. Posting Group";
                                    "G/L Account"."Income/Balance" := MasterLines."Income/Balance Sheet A/C";
                                    if "G/L Account".Insert() then
                                        Message('G/L Account :[%1] Name:[%2] has been successfully created!', MasterLines."Suggested No.", MasterLines.Name);
                                    MasterLines."Created Document No." := MasterLines."Suggested No.";
                                    MasterLines."Created Document Name" := MasterLines.Name;
                                    MasterLines.Modify();
                                end;
                            //**************//End G/L Account********


                            //***********Bank******************
                            MasterLines.Type::Bank:
                                begin

                                    GenLedgerSetup.Get();
                                    GenLedgerSetup.TestField(GenLedgerSetup."Bank Account Nos.");
                                    NoSeriesMgt.InitSeries(GenLedgerSetup."Bank Account Nos.", Bank."No. Series", 0D, DocNo, Bank."No. Series");

                                    Bank."No." := DocNo;
                                    Bank.Name := MasterLines.Name;
                                    Bank.Address := MasterLines.Address;
                                    Bank."Post Code" := MasterLines."Post Code";
                                    Bank.City := MasterLines.City;
                                    Bank."Country/Region Code" := MasterLines."Country/Region Code";
                                    Bank."Phone No." := MasterLines."Phone No.";
                                    Bank."Bank Branch No." := MasterLines."Bank Branch No.";
                                    Bank."Bank Type" := MasterLines."Bank Type";
                                    Bank."Fax No." := MasterLines."Fax No.";
                                    Bank."E-Mail" := MasterLines.Email;
                                    Bank."Home Page" := MasterLines."Home Page";
                                    Bank."Currency Code" := MasterLines."Currency Code";
                                    Bank."Bank Acc. Posting Group" := MasterLines."Bank Account Posting Groups";
                                    if Bank.Insert() then
                                        Message('Bank Account :[%1] Name:[%2] has been successfully created!', DocNo, MasterLines.Name);
                                    MasterLines."Created Document No." := DocNo;
                                    MasterLines."Created Document Name" := MasterLines.Name;
                                    MasterLines.Modify();

                                end;
                            //**************//End Bank Account********
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


                            MasterLines.Type::Customer:
                                begin
                                    SalesReceivableSetup.Get();
                                    SalesReceivableSetup.TestField(SalesReceivableSetup."Customer Nos.");
                                    NoSeriesMgt.InitSeries(SalesReceivableSetup."Customer Nos.", Customer."No. Series", 0D, DocNo, Customer."No. Series");

                                    Customer."No." := DocNo;
                                    Customer.Name := MasterLines.Name;
                                    Customer.Address := MasterLines.Address;
                                    Customer."Post Code" := MasterLines."Post Code";
                                    Customer.City := MasterLines.City;
                                    Customer."Country/Region Code" := MasterLines."Country/Region Code";
                                    Customer."Phone No." := MasterLines."Phone No.";
                                    Customer."E-Mail" := MasterLines.Email;
                                    Customer."Fax No." := MasterLines."Fax No.";
                                    Customer."Customer Posting Group" := MasterLines."Vendor/Customer Posting Group";
                                    Customer."VAT Bus. Posting Group" := MasterLines."VAT. Bus. Posting Group";
                                    Customer."Gen. Bus. Posting Group" := MasterLines."Gen. Bus. Posting Group";
                                    Customer."Home Page" := MasterLines."Home Page";

                                    if Customer.Insert() then
                                        Message('Customer :[%1] Name:[%2] has been successfully created!', DocNo, MasterLines.Name);
                                    MasterLines."Created Document No." := DocNo;
                                    MasterLines."Created Document Name" := MasterLines.Name;
                                    MasterLines.Modify();


                                end;

                            MasterLines.Type::Vendor:
                                begin
                                    PurchPayablesSetup.Get();
                                    PurchPayablesSetup.TestField(PurchPayablesSetup."Vendor Nos.");
                                    NoSeriesMgt.InitSeries(PurchPayablesSetup."Vendor Nos.", Vendor."No. Series", 0D, DocNo, Vendor."No. Series");

                                    Vendor."No." := DocNo;
                                    Vendor.Name := MasterLines.Name;
                                    Vendor.Address := MasterLines.Address;
                                    Vendor."Post Code" := MasterLines."Post Code";
                                    Vendor.City := MasterLines.City;
                                    Vendor."Country/Region Code" := MasterLines."Country/Region Code";
                                    Vendor."Phone No." := MasterLines."Phone No.";
                                    Vendor."E-Mail" := MasterLines.Email;
                                    Vendor."Fax No." := MasterLines."Fax No.";
                                    Vendor."Vendor Posting Group" := MasterLines."Vendor/Customer Posting Group";
                                    Vendor."VAT Bus. Posting Group" := MasterLines."VAT. Bus. Posting Group";
                                    Vendor."Gen. Bus. Posting Group" := MasterLines."Gen. Bus. Posting Group";
                                    Vendor."Home Page" := MasterLines."Home Page";

                                    if Vendor.Insert() then
                                        Message('Vendor :[%1] Name:[%2] has been successfully created!', DocNo, MasterLines.Name);
                                    MasterLines."Created Document No." := DocNo;
                                    MasterLines."Created Document Name" := MasterLines.Name;
                                    MasterLines.Modify();

                                end;

                            MasterLines.Type::Item:
                                begin
                                    InventorySetup.Get();
                                    InventorySetup.TestField(InventorySetup."Item Nos.");
                                    NoSeriesMgt.InitSeries(InventorySetup."Item Nos.", Item."No. Series", 0D, DocNo, Item."No. Series");

                                    Item."No." := DocNo;
                                    Item.Description := MasterLines.Name;
                                    Item."Base Unit of Measure" := MasterLines."Base Unit of Measure";
                                    Item."Item G/L Budget Account" := MasterLines."Item G/L Budget Account";
                                    Item."Gen. Prod. Posting Group" := MasterLines."Gen. Prod. Posting Group";
                                    Item."Inventory Posting Group" := MasterLines."Inventory Posting Group";
                                    Item."VAT Prod. Posting Group" := MasterLines."VAT. Prod. Posting Group";
                                    if Item.Insert() then
                                        Message('Item :[%1] Name:[%2] has been successfully created!', DocNo, MasterLines.Name);
                                    MasterLines."Created Document No." := DocNo;
                                    MasterLines."Created Document Name" := MasterLines.Name;
                                    MasterLines.Modify();

                                end;

                            MasterLines.Type::"Fixed Asset":
                                begin
                                    FASetup.Get();
                                    FASetup.TestField(FASetup."Fixed Asset Nos.");
                                    NoSeriesMgt.InitSeries(FASetup."Fixed Asset Nos.", FA."No. Series", 0D, DocNo, FA."No. Series");

                                    FA."No." := DocNo;
                                    FA.Description := MasterLines.Name;
                                    FA."FA Class Code" := MasterLines."FA Class Code";
                                    FA."FA Subclass Code" := MasterLines."FA Subclass Code";
                                    FA."Location Code" := MasterLines."FA Location Code";


                                    FA_DepBK."FA No." := DocNo;
                                    FA_DepBK."Depreciation Book Code" := MasterLines."Depreciation Book";
                                    FA_DepBK."FA Posting Group" := MasterLines."FA Posting Group";
                                    FA_DepBK."Depreciation Method" := MasterLines."Depreciation Method";

                                    if FA.Insert() and FA_DepBK.Insert() then
                                        Message('Fixed Asset:[%1] Name:[%2] has been successfully created!', DocNo, MasterLines.Name);
                                    MasterLines."Created Document No." := DocNo;
                                    MasterLines."Created Document Name" := MasterLines.Name;
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
