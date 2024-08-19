#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56100 "Case Hearing Card"
{
    PageType = Card;
    SourceTable = "Case Hearing";
    ApplicationArea = All;
    Caption = 'Case Hearing Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Case Entry"; Rec."Case Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Entry field.';
                }
                field("Last Hearing Date"; Rec."Last Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Hearing Date field.';
                }
                field(Progress; Rec.Progress)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Progress field.';
                }
                field("Next Hearing Date"; Rec."Next Hearing Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next Mention  Date';
                    ToolTip = 'Specifies the value of the Next Mention  Date field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

