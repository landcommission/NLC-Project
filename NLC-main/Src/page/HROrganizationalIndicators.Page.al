page 50020 "HR Organizational Indicators"
{
    ApplicationArea = All;
    Caption = 'HR Organizational Indicators';
    PageType = Card;
    SourceTable = "HR Organizational Indicators";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Active; Rec.Active)
                {
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}
