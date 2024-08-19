#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193437 "HR Job Requirement Lines(RO)"
{
    Caption = 'HR Job Requirements';
    //CardPageId = "HR Job Requirements";
    DeleteAllowed = false;
    // Editable = true;
    // InsertAllowed = true;
    // ModifyAllowed = true;
    PageType = List;
    SourceTable = "HR Job Requirements";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Applicant No"; "Applicant No")
                {
                    ApplicationArea = all;
                    Caption = 'Application No.';
                    Editable = false;
                    Visible = false;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field(Mandatory; Mandatory)
                {
                    ApplicationArea = all;
                }
                field("Score ID"; "Score ID")
                {
                    ApplicationArea = all;
                    Caption = 'Score';
                }
            }
        }
    }

    actions { }
}
