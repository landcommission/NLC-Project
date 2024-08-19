#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193848 "Grant Task Dimensions"
{
    Caption = 'Grant Activity Dimensions';
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Job-Task Dimension";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Code field.';
                }
                field("Dimension Value Code"; Rec."Dimension Value Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Value Code field.';
                }
            }
        }
    }

    actions { }
}
