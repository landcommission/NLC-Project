#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193439 "HR Jobs Training Needs SF"
{
    PageType = ListPart;
    SourceTable = "HR Job Training Needs";
    ApplicationArea = All;
    Caption = 'HR Jobs Training Needs SF';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
            }
        }
    }

    actions { }
}
