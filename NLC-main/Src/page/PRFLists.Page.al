#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193699 "PRF Lists"
{
    PageType = List;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = const(Quote));
    ApplicationArea = All;
    Caption = 'PRF Lists';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the document number.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the blanket purchase order.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies information in addition to the description.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the quantity of the purchase order line.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                }
            }
        }
    }

    actions { }


    procedure SetSelection(var Collection: Record "Purchase Line")
    begin
        CurrPage.SetSelectionFilter(Collection);
    end;
}
