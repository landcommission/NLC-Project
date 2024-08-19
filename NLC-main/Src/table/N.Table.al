#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193675 N
{
    Caption = 'Funds Mgt Comment Line';
    DrillDownPageId = "Funds Mgt Comment List";
    LookupPageId = "Funds Mgt Comment List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Table Id"; Integer)
        {
            Caption = 'Table Name';
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Load,Discharge';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,Load,Discharge;
            Caption = 'Document Type';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'No.';
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
        }
        field(6; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(7; Comment; Text[80])
        {
            Caption = 'Comment';
        }
        field(8; "User Id"; Code[50])
        {
            Caption = 'User Id';
        }
    }

    keys
    {
        key(Key1; "Table Id", "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }


    procedure SetUpNewLine()
    var
        CommentLine: Record N;
    begin
        CommentLine.SetRange("Table Id", "Table Id");
        CommentLine.SetRange("Document Type", "Document Type");
        CommentLine.SetRange("Document No.", "Document No.");
        CommentLine.SetRange(Date, WorkDate());
        if not CommentLine.FindFirst() then
            Date := WorkDate();
    end;
}
