#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193734 "Depreciation Tb Header Output"
{
    PageType = List;
    SourceTable = "Depreciation Tb Header Output";
    ApplicationArea = All;
    Caption = 'Depreciation Tb Header Output';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Depreciation Table"; Rec."Depreciation Table")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Depreciation Table field.';
                }
                field("Line Output"; Rec."Line Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Output field.';
                }
            }
        }
    }

    actions { }
}
