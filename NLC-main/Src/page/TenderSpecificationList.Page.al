#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193985 "Tender Specification List"
{
    PageType = ListPart;
    SourceTable = "Tender Specifications";
    ApplicationArea = All;
    Caption = 'Tender Specification List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Specification; Rec.Specification)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specification field.';
                }
                field("Notification Header"; Rec."Notification Header")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification Header field.';
                }
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender No field.';
                }
            }
        }
    }

    actions { }
}
