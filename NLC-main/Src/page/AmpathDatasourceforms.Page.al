#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193895 "Ampath Data source forms"
{
    Caption = 'List Ampath Data source forms and corresponding items required for data';
    PageType = ListPart;
    SourceTable = "Ampath Data Source Forms";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Inv. code"; Rec."Inv. code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inv. code field.';
                }
                field("Ampath Source Form"; Rec."Ampath Source Form")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ampath Source Form field.';
                }
            }
        }
    }

    actions { }
}
