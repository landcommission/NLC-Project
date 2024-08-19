#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193460 "HR Employee Course of Study"
{
    PageType = List;
    SourceTable = "HR Employee Course of Study";
    ApplicationArea = All;
    Caption = 'HR Employee Course of Study';
    UsageCategory = Lists;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Years of Study"; Rec."Years of Study")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Years of Study field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755006; Outlook) { }
            systempart(Control1102755007; Notes) { }
        }
    }

    actions
    {
        area(Creation)
        {
            group(ActionGroup1102755009) { }
        }
    }
}
