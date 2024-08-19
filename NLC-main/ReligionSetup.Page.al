page 50033 "Religion Setup"
{
    ApplicationArea = All;
    Caption = 'Religion Setup';
    PageType = List;
    SourceTableView = where(Type = filter(Religion));
    SourceTable = "HR Lookup Values";

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
            }
        }
    }
}
