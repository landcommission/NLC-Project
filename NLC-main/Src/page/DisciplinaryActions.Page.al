#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69179 "Disciplinary Actions"
{
    PageType = List;
    SourceTable = "Disciplinary Actions";
    ApplicationArea = All;
    Caption = 'Disciplinary Actions';
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
                field(Terminate; Rec.Terminate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terminate field.';
                }
                field(Document; Rec.Document)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000008; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

