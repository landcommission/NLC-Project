#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193796 Rates
{
    PageType = List;
    SourceTable = Rates;
    ApplicationArea = All;
    Caption = 'Rates';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control7; MyNotes) { }
            systempart(Control8; Links) { }
        }
    }

    actions { }
}
