#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193802 "Master Record Creation List"
{
    CardPageId = "Master Record Creation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Master Record Creation Header";
    SourceTableView = where(Status = filter(<> Approved));
    ApplicationArea = All;
    Caption = 'Master Record Creation List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Requestor ID"; Rec."Requestor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor ID field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Dimension 1"; Rec."Dimension 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 1 field.';
                }
                field("Dimension 2"; Rec."Dimension 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 2 field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control11; MyNotes) { }
            systempart(Control12; Links) { }
        }
    }

    actions { }
}
