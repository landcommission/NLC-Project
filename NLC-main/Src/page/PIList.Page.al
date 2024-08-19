#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193902 "PI List"
{
    PageType = List;
    SourceTable = "PI Master";
    ApplicationArea = All;
    Caption = 'PI List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("PI Code"; Rec."PI Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Code field.';
                }
                field("PI Name"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Name field.';
                }
                field("Colabotative Institution"; Rec."Colabotative Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Colabotative Institution field.';
                }
                field("PI Address"; Rec."PI Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Address field.';
                }
                field("PI Telephone"; Rec."PI Telephone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Telephone field.';
                }
                field("PI EMail"; Rec."PI EMail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI EMail field.';
                }
            }
        }
    }

    actions { }
}
