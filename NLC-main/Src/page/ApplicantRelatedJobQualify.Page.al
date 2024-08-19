#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193603 "Applicant Related Job Qualify"
{
    PageType = List;
    SourceTable = "HR Applic Related Requirements";
    ApplicationArea = All;
    Caption = 'Applicant Related Job Qualify';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Qualification ID"; Rec."Qualification ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification ID field.';
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
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Score ID"; Rec."Score ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score ID field.';
                }
                field("Need code"; Rec."Need code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Need code field.';
                }
                field("Stage Code"; Rec."Stage Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stage Code field.';
                }
                field(Mandatory; Rec.Mandatory)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandatory field.';
                }
                field("Minimum Score"; Rec."Minimum Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Score field.';
                }
                field("Total (Stage)Desired Score"; Rec."Total (Stage)Desired Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total (Stage)Desired Score field.';
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Score field.';
                }
                field(Relevant; Rec.Relevant)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Relevant field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field(ApplicantNo; Rec.ApplicantNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ApplicantNo field.';
                }
                field("Applicant Related Description"; Rec."Applicant Related Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Related Description field.';
                }
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
            }
        }
    }

    actions { }
}
