#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194135 "HR Job Applicants Uploaded"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Description = 'HR Job Applicants Qualified Card';
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "HR Job Applications";
    SourceTableView = where(Uploaded = const(true));
    UsageCategory = History;
    Caption = 'HR Job Applicants Uploaded';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = AttentionAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Qualified field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Applied for Description field.';
                }
                label("Interview Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Interview Details';
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Date of Interview"; Rec."Date of Interview")
                {
                    ApplicationArea = Basic;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date of Interview field.';
                }
                field("From Time"; Rec."From Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Time field.';
                }
                field("To Time"; Rec."To Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Time field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Interview Type"; Rec."Interview Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Type field.';
                }
                field("Total Score After Interview"; Rec."Total Score After Interview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Score After Interview field.';
                }
                field("Total Score After Shortlisting"; Rec."Total Score After Shortlisting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Score After Shortlisting field.';
                }
            }
        }
    }

    actions { }
}
