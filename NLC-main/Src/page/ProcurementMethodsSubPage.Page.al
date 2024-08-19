#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193924 "Procurement Methods Sub Page"
{
    PageType = CardPart;
    SourceTable = "Proc. Method Stage Duration";
    ApplicationArea = All;
    Caption = 'Procurement Methods Sub Page';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Proc. Method No."; Rec."Proc. Method No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Proc. Method No. field.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stage field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Duration(Days)"; Rec."Duration(Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration(Days) field.';
                }
            }
        }
    }

    actions { }
}
