#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194108 "HR Individual BSC List"
{
    CardPageId = "HR Leave Carryover Request";
    PageType = List;
    SourceTable = "HR Appraisal Header";
    SourceTableView = where("Target Type" = filter("Individual Targets"),
                            Sent = filter(Appraisee));
    ApplicationArea = All;
    Caption = 'HR Individual BSC List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Type field.';
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control11; Outlook) { }
            systempart(Control12; Notes) { }
            systempart(Control13; MyNotes) { }
            systempart(Control14; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Approve All Individual Targets")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Approve All Individual Targets action.';
            }
            action("Approve Marked Targets")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Approve Marked Targets action.';
            }
            action("Return All Individual Targets")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Return All Individual Targets action.';
            }
            action("Return Marked Targets")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Return Marked Targets action.';
            }
        }
    }
}
