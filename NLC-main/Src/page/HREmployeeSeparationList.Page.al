#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194180 "HR Employee Separation List"
{
    CardPageId = "HR Employee Separation";
    PageType = List;
    SourceTable = "HR Employee Separation";
    ApplicationArea = All;
    Caption = 'HR Employee Separation List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Separation No."; Rec."Separation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation No. field.';
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
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Nature of Separation"; Rec."Nature of Separation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Separation field.';
                }

            }
        }
    }

    actions { }
}
