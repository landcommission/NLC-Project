#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69629 "Vacancies"
{
    CardPageID = Vacancy;
    PageType = List;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type" = filter("Job Vacancy"),
                            Published = filter(true),
                            "Position Category" = filter(Employee));
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }

                field("Recruitment Plan Type"; Rec."Recruitment Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Staff No"; Rec."Requester Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Finacial Year Code"; Rec."Finacial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

