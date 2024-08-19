#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193763 "Bid Analysis SubForm"
{
    PageType = ListPart;
    SourceTable = "Bid Analysis";
    ApplicationArea = All;
    Caption = 'Bid Analysis SubForm';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Quote No."; Rec."Quote No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quote No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
            }
        }
    }

    actions { }
}
