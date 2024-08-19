#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193897 "Compliance main List"
{
    InsertAllowed = true;
    PageType = List;
    SourceTable = "Grants Compliance";
    ApplicationArea = All;
    Caption = 'Compliance main List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Grant No"; Rec."Grant No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grant No field.';
                }
                field("Compliance Code"; Rec."Compliance Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Serial No.';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Post Compliance Report")
            {
                ApplicationArea = Basic;
                Caption = 'Post Compliance Report';
                ToolTip = 'Executes the Post Compliance Report action.';
            }
        }
    }

    var
        objCompliance: Record "Grants Compliance";
        objCompLedgerEntries: Record "Compliance ledger Entries";
}
