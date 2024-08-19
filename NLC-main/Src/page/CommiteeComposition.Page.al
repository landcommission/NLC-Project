#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69655 "Commitee Composition"
{
    PageType = ListPart;
    SourceTable = "Committee Composition";
    ApplicationArea = All;
    Caption = 'Commitee Composition';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum No. of Members"; Rec."Minimum No. of Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum No. of Members field.';
                }
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

