page 50016 "Appraisal Training Development"
{
    ApplicationArea = All;
    Caption = 'Appraisal Training Development';
    PageType = List;
    SourceTable = "Appraisal Training Development";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ToolTip = 'Specifies the value of the Appraisal Code field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Recommended Development"; Rec."Recommended Development")
                {
                    ToolTip = 'Specifies the value of the Recommended Development field.';
                }
                field("Skills Example"; Rec."Skills Example")
                {
                    ToolTip = 'Specifies the value of the Skills Example field.';
                }
                field("Skills Gap"; Rec."Skills Gap")
                {
                    ToolTip = 'Specifies the value of the Skills Gap field.';
                }
                field("Staff No"; Rec."Staff No")
                {
                    ToolTip = 'Specifies the value of the Staff No field.';
                }
                field("Training Type"; Rec."Training Type")
                {
                    ToolTip = 'Specifies the value of the Training Type field.';
                }
            }
        }
    }
}
