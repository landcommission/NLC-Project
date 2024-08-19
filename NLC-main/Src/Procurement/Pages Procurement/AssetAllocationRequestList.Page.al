#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50146 "Asset Allocation Request List"
{
    CardPageID = "Asset Allocation Request Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = where("Document Type" = const("Asset Allocation"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control4; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control3; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
            systempart(Control2; Notes)
            {
            }
            systempart(Control1; MyNotes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"Asset Allocation"
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Asset Allocation"
    end;
}

