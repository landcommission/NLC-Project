page 69839 "Acting Position Card"
{

    PageType = Card;
    SourceTable = "Employee Acting Position";
    ApplicationArea = All;
    Caption = 'Acting Position Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field';
                    ApplicationArea = All;
                }
                field("Promotion Type"; Rec."Promotion Type")
                {
                    Caption = 'Acting Type';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Promotion Type field';
                    ApplicationArea = All;
                }
                field(Position; Rec.Position)
                {
                    Caption = 'Acting Position';
                    ToolTip = 'Specifies the value of the Position field';
                    ApplicationArea = All;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Description field';
                    ApplicationArea = All;
                }
                field("Relieved Employee"; Rec."Relieved Employee")
                {
                    ToolTip = 'Specifies the value of the Relieved Employee field';
                    ApplicationArea = All;
                }
                field("Relieved Name"; Rec."Relieved Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Relieved Name field';
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field';
                    ApplicationArea = All;
                }
                field("Duties Taken Over By"; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                }
                field(Qualified; Rec.Qualified)
                {
                    ToolTip = 'Specifies the value of the Qualified field';
                    ApplicationArea = All;
                }
                field(Promoted; Rec.Promoted)
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Promoted field';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field';
                    ApplicationArea = All;
                }
            }
            group("Reason For Acting")
            {
                Caption = 'Reason For Acting';
                field(Reason; Rec.Reason)
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason field';
                    ApplicationArea = All;
                }
            }
            group("Financial Implication")
            {
                Editable = false;
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ToolTip = 'Specifies the value of the Basic Pay field';
                    ApplicationArea = All;
                }
                field("Acting Amount"; Rec."Acting Amount")
                {
                    ToolTip = 'Specifies the value of the Acting Amount field';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Approvals Mgt";
                    begin

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Promotion Type" := Rec."Promotion Type"::"Acting Position";
    end;
    // ApprovalsMgmt: Codeunit ApprovalMgtCuExtension;
    // Workflow: Codeunit "Workflow Responses";
}

