page 69837 "Employee Promotion Card"
{
    PageType = Card;
    SourceTable = "Employee Acting Position";
    ApplicationArea = All;
    Caption = 'Employee Promotion Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = not IsApproved;
                field(No; Rec.No)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field';
                    ApplicationArea = All;
                }
                field("Promotion Type"; Rec."Promotion Type")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Promotion Type field';
                    ApplicationArea = All;
                }
                label("Request:")
                {
                    Style = Strong;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("Request Date"; Rec."Request Date")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Date field';
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field';
                    ApplicationArea = All;
                }
                field(PLWD; Rec.PLWD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PLWD field.';
                }
                field("Current Duty Station"; Rec."Current Duty Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Duty Station field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requested By field';
                    ApplicationArea = All;
                }
                field("Request Name"; Rec."Request Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Name field';
                    ApplicationArea = All;
                }
                label("Employee:")
                {
                    Style = Strong;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
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
                label("Desired Position:")
                {
                    Style = Strong;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("Desired Position"; Rec."Desired Position")
                {
                    ToolTip = 'Specifies the value of the Desired Position field';
                    ApplicationArea = All;
                }
                field("Position Name"; Rec."Position Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Position Name field';
                    ApplicationArea = All;
                }
                field("New Job Group"; Rec."New Scale")
                {
                    ToolTip = 'Specifies the value of the New Scale field';
                    ApplicationArea = All;
                }
                field("New Pointer"; Rec."New Pointer")
                {
                    ToolTip = 'Specifies the value of the New Pointer field';
                    ApplicationArea = All;
                }
                field(Promoted; Rec.Promoted)
                {
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
            group("Reason For Promotion")
            {
                Editable = not IsApproved;
                Caption = 'Reason For Promotion';
                field(Reason; Rec.Reason)
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason field';
                    ApplicationArea = All;
                }
            }
            group("Promotion Benefits")
            {
                Editable = false;
                field("Current Job Group"; Rec."Current Scale")
                {
                    Caption = 'Current Salary Scale';
                    ToolTip = 'Specifies the value of the Current Job Group field';
                    ApplicationArea = All;
                }
                field("Current Pointer"; Rec."Current Pointer")
                {
                    ToolTip = 'Specifies the value of the Current Pointer field';
                    ApplicationArea = All;
                }
                field("Current Benefits"; Rec."Current Benefits")
                {
                    ToolTip = 'Specifies the value of the Current Benefits field';
                    ApplicationArea = All;
                }
                label("Grade Benefits")
                {
                    Style = Strong;
                    StyleExpr = true;
                    ApplicationArea = All;
                }
                field("New Benefits"; Rec."New Benefits")
                {
                    ToolTip = 'Specifies the value of the New Benefits field';
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

        Rec."Promotion Type" := Rec."Promotion Type"::Promotion;
    end;


    var
        CanSendApproval: Boolean;
        CancancelApproval: Boolean;
        IsApproved: Boolean;

    procedure SetControlAppearance()
    begin
        CanSendApproval := false;
        CancancelApproval := false;
        IsApproved := false;
        if Rec.Status = Rec.Status::New then
            CanSendApproval := true;
        if Rec.Status = Rec.Status::"Pending Approval" then
            CancancelApproval := true;
        if Rec.Status = Rec.Status::Approved then
            IsApproved := true;
        //IsApproved
    end;
}

