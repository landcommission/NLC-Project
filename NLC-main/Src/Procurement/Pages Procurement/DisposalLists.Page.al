#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50147 "Disposal Lists"
{
    CardPageID = "Disposal Plans";
    Editable = false;
    PageType = List;
    SourceTable = "Disposal Plan Table Headers";
    SourceTableView = where("Disposal Type" = const(Procurement));

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
                field(Year; Year)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Disposal Year"; "Disposal Year")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Description"; "Disposal Description")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Method"; "Disposal Method")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date"; "Planned Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut dimension 1 code"; "Shortcut dimension 1 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Code';
                }
                field("Shortcut dimension 2 code"; "Shortcut dimension 2 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'County Code';
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
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
        "Disposal Type" := "disposal type"::Procurement
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Disposal Type" := "disposal type"::Procurement
    end;
}

