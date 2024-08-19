#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193473 "HR Leave Application Comments"
{
    PageType = Card;
    SourceTable = "Approval Comment Line";
    ApplicationArea = All;
    Caption = 'HR Leave Application Comments';
    layout
    {
        area(Content)
        {
            field(DocType; DocType)
            {
                ApplicationArea = Basic;
                Editable = false;
                OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Bank Slip,Grant,Grant Surrender,Employee Requisition,Leave Application,Training Application,Transport Requisition';
                ToolTip = 'Specifies the value of the DocType field.';
            }
            field(DocNo; DocNo)
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the DocNo field.';
            }
            repeater(Control1102755000)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the user who created this approval comment.';
                }
                field("Date and Time"; Rec."Date and Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date and time when the comment was made.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the comment. You can enter a maximum of 250 characters, both numbers and letters.';
                }
                field("Approved Days"; Rec."Approved Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Days field.';
                }
                field("Approved Start Date"; Rec."Approved Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Start Date field.';
                }
                field("Approved Return Date"; Rec."Approved Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Return Date field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field("Leave Allowance Granted"; Rec."Leave Allowance Granted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Allowance Granted field.';
                }
            }
        }
    }

    actions { }

    var
        NewTableId: Integer;
        NewDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application";
        NewDocumentNo: Code[20];
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application";
        DocNo: Code[20];


    procedure SetUpLine(TableId: Integer; DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application"; DocumentNo: Code[20])
    begin
        NewTableId := TableId;
        NewDocumentType := DocumentType;
        NewDocumentNo := DocumentNo;
    end;


    procedure Setfilters(TableId: Integer; DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application"; DocumentNo: Code[20])
    begin
        if TableId <> 0 then begin
            Rec.FilterGroup(2);
            Rec.SetCurrentKey(Rec."Table ID", Rec."Document Type", Rec."Document No.");
            Rec.SetRange(Rec."Table ID", TableId);
            Rec.SetRange(Rec."Document Type", DocumentType);
            if DocumentNo <> '' then
                Rec.SetRange(Rec."Document No.", DocumentNo);
            Rec.FilterGroup(0);
        end;

        DocType := DocumentType;
        DocNo := DocumentNo;
    end;
}
