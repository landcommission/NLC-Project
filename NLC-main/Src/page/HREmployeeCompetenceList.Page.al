#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194181 "HR Employee Competence List"
{
    PageType = List;
    SourceTable = "HR Employee Competence";
    ApplicationArea = All;
    Caption = 'HR Employee Competence List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Competence Code"; Rec."Competence Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competence Code field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Score"; Rec."Competency Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Score field.';
                }
            }
        }
    }

    actions { }
}
