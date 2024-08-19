#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193486 "HR Applicant Referees"
{
    PageType = List;
    SourceTable = "Application Referees";
    ApplicationArea = All;
    Caption = 'HR Applicant Referees';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Application No."; "Application No.")
                {
                    ApplicationArea = all;
                }
                field(Names; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Designation; "Designation/Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Telephone No"; "Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Telephone No field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
            }
        }
    }

    actions { }
}
