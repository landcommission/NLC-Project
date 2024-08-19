page 50010 "HR Individual Objectives"
{
    ApplicationArea = All;
    Caption = 'HR Individual Objectives';
    PageType = List;
    SourceTable = "HR Individual Objectives1";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(Objectives; Rec.Objectives)
                {
                    ToolTip = 'Specifies the value of the Objectives field.';
                }
                field(Period; Rec.Period)
                {
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("Staff No"; Rec."Staff No")
                {
                    ToolTip = 'Specifies the value of the Staff No field.';
                }
            }
        }
    }
}
