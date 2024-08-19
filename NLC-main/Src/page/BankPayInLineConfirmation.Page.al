#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193651 "Bank Pay In Line Confirmation"
{
    PageType = ListPart;
    SourceTable = "Bank Slip Line";
    SourceTableView = where(Vaulted = const(false));
    ApplicationArea = All;
    Caption = 'Bank Pay In Line Confirmation';
    layout
    {
        area(Content)
        {
            repeater(Control1102758000)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    Caption = 'Confirmed';
                    ToolTip = 'Specifies the value of the Confirmed field.';
                }
                field("Bank Slip No."; Rec."Bank Slip No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bank Slip No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Drawers Name"; Rec."Drawers Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Drawers Name field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions { }

    var
        BHeader: Record "Bank Slip";
}
