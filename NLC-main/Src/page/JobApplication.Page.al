#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193598 "Job Application"
{
    Caption = 'Job Application';
    PageType = Card;
    SourceTable = "Job Applications";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ID; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(JobNo; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the JobNo field.';
                }

                field(ApplicantNames; Rec."Full Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ApplicantNames field.';
                }



            }
        }
    }

    actions { }
}
