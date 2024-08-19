#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50052 "Departmental Disposal Lists"
{
    CardPageID = "Departmental Disposal Plans";
    Editable = true;
    PageType = List;
    SourceTable = "Disposal Plan Table Headers";
    SourceTableView = where("Disposal Type"=const(Departmental));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Disposal Year";"Disposal Year")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Description";"Disposal Description")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date";"Planned Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut dimension 1 code";"Shortcut dimension 1 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Code';
                }
                field("Shortcut dimension 2 code";"Shortcut dimension 2 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'County Code';
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Type";"Disposal Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control4;"Approval Comments")
            {
                SubPageLink = "Document No."=field("No.");
            }
            part(Control3;"Approval Comment Lines")
            {
                SubPageLink = "Application Code"=field("No.");
            }
            systempart(Control2;Notes)
            {
            }
            systempart(Control1;MyNotes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
         "Disposal Type":="disposal type"::Departmental
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
         "Disposal Type":="disposal type"::Departmental
    end;
}

