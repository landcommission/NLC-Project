#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193995 "Bisiness Referee List"
{
    PageType = List;
    SourceTable = "Business Referees";
    ApplicationArea = All;
    Caption = 'Bisiness Referee List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Questionaire No"; Rec."Questionaire No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Questionaire No field.';
                }
                field("Tender No."; Rec."Tender No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender No. field.';
                }
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Name Of Company"; Rec."Name Of Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name Of Company field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Telephone No"; Rec."Telephone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone No field.';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Person field.';
                }
                field("Contract Value"; Rec."Contract Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Value field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
            }
        }
    }

    actions { }
}
