#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193863 "Audit Provision"
{
    PageType = Card;
    SourceTable = "Audit provision";
    ApplicationArea = All;
    Caption = 'Audit Provision';
    layout
    {
        area(Content)
        {
            group(Control1)
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
                field(date; Rec.date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the date field.';
                }
            }
        }
    }

    actions { }
}
