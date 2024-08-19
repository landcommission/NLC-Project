#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193501 "HR Applicants Qualified Card"
{
    PageType = Card;
    SourceTable = "HR Job Applications";
    SourceTableView = where(Qualified = const(true));
    ApplicationArea = All;
    Caption = 'HR Applicants Qualified Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
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
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Applied For field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualified field.';
                }
                field("Date of Interview"; Rec."Date of Interview")
                {
                    ApplicationArea = Basic;
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
            }
        }
    }

    actions { }
}
