#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50173 "Asset Repair Card Vehicles"
{
    // //test

    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Asset Repair Header";
    SourceTableView = where("Asset Type" = const(Vehicles));
    ApplicationArea = All;
    PromotedActionCategories = 'New,process,Report,Workflow Process,Repair Comments';

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Lineseditables;
                field(RequestNo; Rec."Request No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(AssetType; Rec."Asset Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(RequestedBy; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    Style = AttentionAccent;
                    StyleExpr = true;
                    //Editable = false;
                }
                field(RequestDate; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = AttentionAccent;
                    StyleExpr = true;
                }
                field(GlobalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCost; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field(TotalAssets; Rec."Total Assets")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityCenter; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                    Editable = false;
                }
            }
            part(Control12; "Asset Repair Lines")
            {
                Editable = Lineseditables;
                SubPageLink = "Request No." = field("Request No."),
                              "Asset Type" = field("Asset Type");
                UpdatePropagation = Both;
            }
            systempart(Control25; Links)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ApprovalRequest)
            {
                Caption = 'Approval Request';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Responsibility Center");
                        Rec.CalcFields(Rec."Total Assets");
                        if Rec."Total Assets" < 1 then
                            Error('Asset Repair lines must have avalue');
                        MastHave;

                        // Message('Send approval request');
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    begin
                        rec.TestField(Status, Status::"Pending Approval");
                        VarVariant := rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action("Re-open Document")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = ReOpen;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        // if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                        //     Error('cancell the approval Request');
                        if Confirm('Do you want to reopen this document?') = true then begin
                            rec.Status := rec.Status::New;
                            Rec.Modify();
                            Message('Document Reopend successfully');
                            CurrPage.Close();
                        end;

                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId)
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action("Repair Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'Comments';
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field("Request No.");
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = AddAction;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.SetFilter(Rec."Request No.", Rec."Request No.");
                        //Report.Run(Report::"Asset Repair Header Report", true, true, Rec);
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // HRLeaveApp.Reset;
        // HRLeaveApp.SetRange(HRLeaveApp.Status, HRLeaveApp.Status::New);
        // HRLeaveApp.SetRange(HRLeaveApp."Requested By", UserId);
        // if HRLeaveApp.Find('-') then begin
        //     if HRLeaveApp.Count >= 1 then begin
        //         Error('There are still some untilized Asset Repair Requisition Nos [ %1 ]. Please utilise them first'
        //              , HRLeaveApp."Request No.");
        //    end;
    end;

    //end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Asset Type" := Rec."asset type"::Vehicles;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        HRLeaveApp: Record "Asset Repair Header";
        AssetRepairLines: Record "Asset Repair Lines";
        CustomApprovals: Codeunit "Approvals Mgt";
        VarVariant: Variant;
        Lineseditables: Boolean;

    local procedure MastHave()
    begin
        AssetRepairLines.Reset;
        AssetRepairLines.SetRange(AssetRepairLines."Asset Type", AssetRepairLines."asset type"::Vehicles);
        AssetRepairLines.SetRange(AssetRepairLines."Request No.", Rec."Request No.");
        if AssetRepairLines.Find('-') then begin
            repeat
                AssetRepairLines.TestField("Registartion No");
                AssetRepairLines.TestField("Service Provider");
                AssetRepairLines.TestField("Type of Maitenance");
                AssetRepairLines.TestField("Current Mileage");
                AssetRepairLines.TestField("Service Mileage");
            until AssetRepairLines.Next = 0;
        end;
    end;

    procedure LinesEditable()
    var
        myInt: Integer;
    begin
        if rec.Status = rec.Status::Approved then
            Lineseditables := false
        else
            Lineseditables := true;

    end;
}
