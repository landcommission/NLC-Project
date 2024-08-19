#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193754 "Quotation Request Vendors"
{
    PageType = List;
    SourceTable = "Quotation Request Vendors";
    ApplicationArea = All;
    Caption = 'Quotation Request Vendors';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Requisition Document No."; Rec."Requisition Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Document No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
            }
        }
    }

    actions { }
}
