#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 52194154 "HR Employee Cue"
{
    PageType = CardPart;
    SourceTable = "HR Employee Role Center Cue";
    ApplicationArea = All;
    Caption = 'HR Employee Cue';
    layout
    {
        area(Content)
        {
            cuegroup(Control4)
            {
                Caption = 'Employee Stats';
                field(Active; Rec.Active)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field(Female; Rec.Female)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Female field.';
                }
                field(Male; Rec.Male)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Male field.';
                }
            }
        }
    }

}

#pragma implicitwith restore
