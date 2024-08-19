#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193916 "Proposal Check List"
{
    PageType = List;
    SourceTable = "Proposal Check List";
    ApplicationArea = All;
    Caption = 'Proposal Check List';
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
                field(Task; Rec.Task)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task field.';
                }
                field("Responsible Office"; Rec."Responsible Office")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Office field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control11; Notes) { }
            systempart(Control12; MyNotes) { }
            systempart(Control13; Links) { }
            systempart(Control14; Outlook) { }
        }
    }

    actions { }
}
