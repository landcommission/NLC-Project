#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193818 "Payment Header grants"
{
    DeleteAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Cust. Ledger Entry";
    ApplicationArea = All;
    Caption = 'Payment Header grants';
    layout
    {
        area(Content)
        {
            group(Control1) { }
        }
    }

    actions { }

    var
        Text001: Label 'This Document no %1 has printed Cheque No %2 which will have to be voided first before reposting.';
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';
}
