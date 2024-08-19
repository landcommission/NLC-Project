#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193755 "Purchase Quote Parameters"
{
    PageType = List;
    SourceTable = "Purchase Quote Params";
    ApplicationArea = All;
    Caption = 'Purchase Quote Parameters';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Specification; Rec.Specification)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specification field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Value field.';
                }
            }
        }
    }

    actions { }
}
