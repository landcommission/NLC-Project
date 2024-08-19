#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193900 "Main Sub Components"
{
    AutoSplitKey = false;
    Caption = 'Main Sub Components';
    DataCaptionFields = "Main Sub No.";
    PageType = List;
    SourceTable = "Main Sub Component";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Main Sub No."; Rec."Main Sub No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Main Sub No.';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Main Sub No. field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Caption = ' No.';
                    ToolTip = 'Specifies the value of the  No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions { }
}
