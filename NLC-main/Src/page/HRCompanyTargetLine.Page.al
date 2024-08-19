#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194110 "HR Company Target Line"
{
    PageType = List;
    SourceTable = "HR Company Target Line";
    ApplicationArea = All;
    Caption = 'HR Company Target Line';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                }
                field("Perspective Code"; Rec."Perspective Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Perspective Code field.';
                }
                /* field("Perspective Description";Rec."Perspective Description")
                {
                    ApplicationArea = Basic;
                } */
                field("Targeted Score"; Rec."Targeted Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Targeted Score field.';
                }
                // field("Perspective type";Rec."Perspective type")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Achieved Score"; Rec."Achieved Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Score field.';
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unachieved Targets field.';
                }
            }
        }
    }

    actions { }
}
