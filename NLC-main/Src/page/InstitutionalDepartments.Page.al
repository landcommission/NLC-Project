#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193881 "Institutional Departments"
{
    PageType = List;
    SourceTable = "Institution Departments";
    ApplicationArea = All;
    Caption = 'Institutional Departments';
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control7; Outlook) { }
            systempart(Control8; Notes) { }
            systempart(Control9; MyNotes) { }
            systempart(Control10; Links) { }
        }
    }

    actions { }
}
