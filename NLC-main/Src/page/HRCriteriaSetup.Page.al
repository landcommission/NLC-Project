page 50017 "HR Criteria Setup"
{
    ApplicationArea = All;
    Caption = 'HR Criteria Setup';
    PageType = List;
    SourceTable = "HR Criteria Setup";
    UsageCategory = Lists;

    layout
    {
        area(Content)
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
                field("Job Grade"; Rec."Job Grade")
                {
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Job Group Range"; Rec."Job Group Range")
                {
                    ToolTip = 'Specifies the value of the Job Group Range field.';
                }
            }
        }
    }
}
