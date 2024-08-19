#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69633 "Requisition Responsibilities"
{
    PageType = ListPart;
    Caption = 'Duties and Responsibilities/Job Dimensions';
    SourceTable = "Recruitment Req Responsibility";
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
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

