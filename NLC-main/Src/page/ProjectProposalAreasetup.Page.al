#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193832 "Project/Proposal Area setup"
{
    PageType = List;
    SourceTable = "Proposal/Projects Areas setup";
    ApplicationArea = All;
    Caption = 'Project/Proposal Area setup';
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
                field("Area Description"; Rec."Area Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Area Description field.';
                }
            }
        }
    }

    actions { }
}
