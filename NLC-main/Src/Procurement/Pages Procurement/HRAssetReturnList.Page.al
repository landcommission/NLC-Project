#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50087 "HR Asset Return List"
{
    Caption = 'Asset Return List';
    CardPageID = "HR Asset Return Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = where("Document Type" = const("Asset Transfer"),
                            Type = const(Return));

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
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Transfered; Transfered)
                {
                    ApplicationArea = Basic;
                }
                field("Date Transfered"; "Date Transfered")
                {
                    ApplicationArea = Basic;
                }
                field("Transfered By"; "Transfered By")
                {
                    ApplicationArea = Basic;
                }
                field("Time Posted"; "Time Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control17; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control16; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
            systempart(Control15; Notes)
            {
            }
            systempart(Control8; MyNotes)
            {
            }
        }
    }

    actions
    {
    }
}

