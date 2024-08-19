page 50047 "Country Dimensions"
{
    ApplicationArea = All;
    Caption = 'Country Dimensions';
    PageType = List;
    SourceTable = "Dimension Value";
    UsageCategory = Lists;
    InsertAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the code for the dimension value.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies a descriptive name for the dimension value.';
                }
                field("Hardship Area"; Rec."Hardship Area")
                {
                    ToolTip = 'Specifies the value of the Hardship Area field.';
                }
            }
        }
    }
}
