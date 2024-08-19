#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193485 "HR Applicant Qualifications"
{
    Caption = 'Applicant Qualifications';
    PageType = List;
    SaveValues = true;
    ShowFilter = true;
    SourceTable = "HR Applicant Qualifications";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Institution/Company field.';
                }
            }
        }
    }

    actions { }
}
