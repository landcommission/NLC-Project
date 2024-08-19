#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194130 "HR Hiring Criteria"
{
    PageType = List;
    SourceTable = "HR Hiring Criteria";
    ApplicationArea = All;
    Caption = 'HR Hiring Criteria';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Hiring Criteria"; Rec."Hiring Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hiring Criteria field.';
                }
            }
        }
    }

    actions { }
}
