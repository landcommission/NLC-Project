#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193475 "HR Leave Family Employees List"
{
    PageType = List;
    SourceTable = "HR Leave Family Employees";
    ApplicationArea = All;
    Caption = 'HR Leave Family Employees List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Family; Rec.Family)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Family field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions { }
}
