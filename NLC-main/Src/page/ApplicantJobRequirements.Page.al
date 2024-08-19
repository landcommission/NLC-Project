#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193602 "Applicant Job Requirements"
{
    PageType = List;
    SourceTable = "Application Qualification";
    //SourceTable = "HR Appplicants Requirements";
    ApplicationArea = All;
    Caption = 'Applicant Job Requirements';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Application No."; "Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the JOb Application No field.';
                }
                field("Qualification Type"; "Qualification Type")
                {
                    ApplicationArea = all;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Qualification Description"; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("Institution/Company"; "Institution/Company")
                {
                    ApplicationArea = all;
                }
                field("Attained Score"; "Attained Score")
                {
                    ApplicationArea = all;
                }
                field(Specialization; Specialization)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions { }
}
