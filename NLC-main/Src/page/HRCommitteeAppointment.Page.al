#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
page 70022 "HR Committee Appointment"
{
    Caption = 'Committee Appointment Voucher';
    PageType = Card;
    SourceTable = "Commitee Appointment Voucher";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Committee Type ID"; Rec."Committee Type ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committee Type';
                    ToolTip = 'Specifies the value of the Committee Type ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Effective Date field.';
                }
                field("Tenure End Date"; Rec."Tenure End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tenure End Date field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Staff ID"; Rec."Staff ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Branch/Centre"; Rec."Branch/Centre")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Branch/Centre field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
            part(Control6; "Committe Appointment Lines")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
                ApplicationArea = All;
            }
        }
        area(FactBoxes)
        {
            systempart(Control26; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control27; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control28; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control29; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Appoint)
            {
                ApplicationArea = Basic;
                Caption = 'Appoint & Notify';
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Appoint & Notify action.';
                trigger OnAction()
                var
                    TXT001: Label 'Appoint the selected members';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::Released);
                        // Recruitment.FnAppointHRCommiteeeMembers(Rec);
                        //"Approval Status":="Approval Status"::Released;
                        Rec.Modify(true);
                    end
                end;
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';

            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                    Rec."Approval Status" := Rec."Approval Status"::Released;
                    Message('Approved Successfully');
                    // IF ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(Rec) THEN
                    //  ApprovalsMgmt.OnSendLeaveAppForApproval(Rec);
                    // END
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    //
                    Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");
                    Rec."Approval Status" := Rec."Approval Status"::Open;
                    Message('Cancelled Successfully');
                    //ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Appointment;
    end;

    var
    //Recruitment: Codeunit ;
}

