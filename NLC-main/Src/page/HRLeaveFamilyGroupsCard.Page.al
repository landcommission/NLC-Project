#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193476 "HR Leave Family Groups Card"
{
    PageType = Card;
    SourceTable = "HR Leave Family Groups";
    ApplicationArea = All;
    Caption = 'HR Leave Family Groups Card';
    layout
    {
        area(Content)
        {
            group(Group)
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
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Max Employees On Leave"; Rec."Max Employees On Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Employees On Leave field.';
                }
            }
        }
    }

    actions { }
}
