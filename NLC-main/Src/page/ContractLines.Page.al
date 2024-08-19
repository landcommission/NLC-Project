#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193891 "Contract Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Line";
    ApplicationArea = All;
    Caption = 'Contract Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Detail; Rec.Detail)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Detail field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions { }
}
