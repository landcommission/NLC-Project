#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193487 "HR Applicant Hobbies"
{
    PageType = List;
    SourceTable = "HR Applicant Hobbies";
    ApplicationArea = All;
    Caption = 'HR Applicant Hobbies';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field(Hobby; Rec.Hobby)
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Hobby field.';
                }
            }
        }
    }

    actions { }
}
