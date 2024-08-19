page 50050 "NLC Multiplier"
{
    ApplicationArea = All;
    Caption = 'NLC Multiplier Pa';
    PageType = List;
    SourceTable = "NLC Grade Multiplier";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                    Visible = true;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field(Multiplier; Rec.Multiplier)
                {
                    ToolTip = 'Specifies the value of the Multiplier field.', Comment = '%';
                }
            }
        }
    }
}
