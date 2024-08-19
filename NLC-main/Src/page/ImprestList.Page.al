#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193619 "Imprest List"
{
    Caption = 'Staff Travel  List';
    CardPageId = "Imprest Request";
    Editable = false;
    PageType = List;
    SourceTable = "Imprest Header";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print/Preview")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print/Preview action.';
                trigger OnAction()
                begin
                    ImprestHeader.Reset();
                    ImprestHeader.SetRange(ImprestHeader."No.", Rec."No.");
                    Report.Run(39005885, true, false, ImprestHeader);
                end;
            }
        }
    }

    var
        ImprestHeader: Record "Imprest Header";
}
