#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194146 "HR Appraissal Appeal list"
{
    CardPageId = "HR Appraissal Appeal";
    PageType = List;
    SourceTable = "HR Appraissal Appeal";
    ApplicationArea = All;
    Caption = 'HR Appraissal Appeal list';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Appraissal Period"; Rec."Appraissal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraissal Period field.';
                }
                field("Appraisser No."; Rec."Appraisser No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisser No. field.';
                }
                field("Appraiser Name"; Rec."Appraiser Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraiser Name field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
