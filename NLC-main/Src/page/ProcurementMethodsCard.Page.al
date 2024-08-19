#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193925 "Procurement Methods Card"
{
    PageType = Card;
    SourceTable = "Procurement Methods";
    ApplicationArea = All;
    Caption = 'Procurement Methods Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
            }
            part(Control1000000001; "Procurement Methods Sub Page")
            {
                SubPageLink = "Proc. Method No." = field(Code);
            }
        }
    }

    actions { }
}
