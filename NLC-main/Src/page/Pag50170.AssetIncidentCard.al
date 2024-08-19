#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50170 "Asset Incident Card"
{
    PageType = Card;
    SourceTable = "Asset Incident";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(IncidentNo; Rec."Incident No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(IncidentType; Rec."Incident Type")
                {
                    ApplicationArea = Basic;
                }
                field(ReportedBy; Rec."Reported By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = AttentionAccent;
                    StyleExpr = true;
                }
                field(DateReported; Rec."Date Reported")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;
                }
                field(Dimension1Code; Rec."Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension2Code; Rec."Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                }
            }
            part(Control12; "Asset Incident Lines")
            {
                SubPageLink = "Incident No." = field("Incident No.");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;

                trigger OnAction()
                begin

                    if Confirm('Send this Maintenance for Approval?', true) = false then exit;

                    //ApprovalMgt.SendAssetTransApprovalReq(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Jobs,"Employee Req",Employees,Promotion,Confirmation,"Employee Transfer","Asset Transfer","Transport Req",Overtime,"Training App","Leave App";
                begin

                    DocumentType := Documenttype::"Asset Transfer";
                    //ApprovalEntries.Setfilters(DATABASE::"HR Asset Transfer Header",DocumentType,"No.");
                    //ApprovalEntries.RUN;
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;

                trigger OnAction()
                begin
                    if Confirm('Cancel Approval Request for this Maintenance?', true) = false then exit;

                    //ApprovalMgt.CancelAssetTransAppRequest(Rec,TRUE,TRUE);
                end;
            }
        }
    }
}
