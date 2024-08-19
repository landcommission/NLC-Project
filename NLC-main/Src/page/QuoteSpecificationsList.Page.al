#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193760 "Quote Specifications List"
{
    PageType = List;
    SourceTable = "Quote Specifications";
    ApplicationArea = All;
    Caption = 'Quote Specifications List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Value/Weight"; Rec."Value/Weight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value/Weight field.';
                }
            }
        }
    }

    actions { }
}
