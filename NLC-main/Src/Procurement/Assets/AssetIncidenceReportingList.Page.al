#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50123 "Asset Incidence Reporting List"
{
    CardPageID = "Asset Incidence Reporting Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = 52193494;
    SourceTableView = where("Document Type" = const("Asset Incidence"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibilityCenter; "Responsibility Center")
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
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"Asset Incidence"
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Asset Incidence"
    end;
}

