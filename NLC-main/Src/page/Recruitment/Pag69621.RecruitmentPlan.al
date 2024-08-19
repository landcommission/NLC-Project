#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69621 "Recruitment Plan"
{
    PageType = Card;
    SourceTable = "Recruitment Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Staff Establishment"; Rec."Approved Staff Establishment")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Planned New Hires"; Rec."No. of Planned New Hires")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Recruitment Requisition"; Rec."No. of Recruitment Requisition")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Recruitment Budget (LCY)"; Rec."Total Recruitment Budget (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created BY"; Rec."Created BY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control26; "Recruitment Plan Position")
            {
                SubPageLink = "Recruitment Plan ID" = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {

            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69603, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                //CustomApprovals: Codeunit "Custom Approvals Codeunit";

                // ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin

                    VarVariant := Rec;
                    // if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                    //     ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                end;
            }

            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                //  CustomApprovals: Codeunit "Custom Approvals Codeunit";
                //  ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    VarVariant := Rec;
                    //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin

                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Guiding Principles")
            {
                ApplicationArea = Basic;
                Image = AgreementQuote;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                // RunObject = Page "Hr Guiding Principle";
                // RunPageLink = "HR Process" = filter("Recruitment & Selection");
            }
        }
    }
}

#pragma implicitwith restore

