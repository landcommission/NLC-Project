#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193833 "Project/Proposal Area"
{
    PageType = ListPart;
    SourceTable = "Proposal/Projects Areas";
    ApplicationArea = All;
    Caption = 'Project/Proposal Area';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Proposal Area Code"; Rec."Proposal Area Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Area Code field.';
                }
                field("Proposal Area Description"; Rec."Proposal Area Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Area Description field.';
                }
            }
        }
    }

    actions { }
}
