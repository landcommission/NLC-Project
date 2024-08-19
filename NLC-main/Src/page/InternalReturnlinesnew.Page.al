#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193947 "Internal Return lines new"
{
    PageType = List;
    SourceTable = "Internal Return Lines";
    ApplicationArea = All;
    Caption = 'Internal Return lines new';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
                field("Serial Number"; Rec."Serial Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial Number field.';
                }
                field("Batch Number"; Rec."Batch Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Batch Number field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field("Reason for Return"; Rec."Reason for Return")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Return field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Destination Store"; Rec."Destination Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Store field.';
                }
            }
        }
    }

    actions { }
}
