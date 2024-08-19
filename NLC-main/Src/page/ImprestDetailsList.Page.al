#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193658 "Imprest Details List"
{
    Caption = ' Travel  Imprest Details List';
    Editable = false;
    PageType = ListPart;
    SourceTable = "Imprest Lines";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Account No:"; Rec."Account No:")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No: field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';

                }
                field("Imprest Holder"; Rec."Imprest Holder")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Holder field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Date Issued"; Rec."Date Issued")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Issued field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
            }
        }
    }

    actions { }

    var
        PayHeader: Record "Pending Vch. Surr. Line";
        PayLine: Record "Receipt Line";
        Bal: Decimal;
}
