page 50038 "Vehicle Type List"
{
    ApplicationArea = All;
    Caption = 'Vehicle Type List';
    PageType = List;
    SourceTable = "Vehicle Type";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ToolTip = 'Specifies the value of the Capacity field.';
                }
            }
        }
    }
}
