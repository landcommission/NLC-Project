#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69631 "Vacancy Work Condition"
{
    Caption = 'Vacancy Work Condition';
    PageType = List;
    SourceTable = "Recruitment Req Work Condition";
    SourceTableView = where("Document Type" = filter("Job Vacancy"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Working Condition Category"; Rec."Working Condition Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

