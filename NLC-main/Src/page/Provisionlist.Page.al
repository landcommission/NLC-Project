#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193867 "Provision list"
{
    PageType = Card;
    SourceTable = "Audit provision";
    ApplicationArea = All;
    Caption = 'Provision list';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
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
