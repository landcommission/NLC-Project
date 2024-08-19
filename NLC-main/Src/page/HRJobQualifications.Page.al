#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193432 "HR Job Qualifications"
{
    ApplicationArea = Basic;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Qualifications';
    SourceTable = "HR Job Qualifications";
    UsageCategory = Lists;
    Caption = 'HR Job Qualifications';
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Qualification)
            {
                Caption = 'Qualification';
                action("Q&ualification Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualification Overview';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "Qualification Overview";
                    ToolTip = 'Executes the Q&ualification Overview action.';
                }
            }
        }
    }
}
