#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193566 "prSalary Scale"
{
    PageType = List;
    SourceTable = "prSalary Scale";
    ApplicationArea = All;
    Caption = 'prSalary Scale';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum Pay"; Rec."Minimum Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Pay field.';
                }
                field("Maximum Pay"; Rec."Maximum Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Pay field.';
                }
            }
        }
    }

    actions { }
}
