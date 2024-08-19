page 50032 "HR Training Cost List"
{
    ApplicationArea = All;
    Caption = 'HR Training Cost List';
    PageType = ListPart;
    SourceTable = "HR Training Cost";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Training ID"; Rec."Training ID")
                {
                    ToolTip = 'Specifies the value of the Training ID field.';
                }
                field("Cost Item"; Rec."Cost Item")
                {
                    ToolTip = 'Specifies the value of the Cost Item field.';
                }
                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field("Cost Item Description"; Rec."Cost Item Description")
                {
                    ToolTip = 'Specifies the value of the Cost Item Description field.';
                }
            }
        }
    }
}
