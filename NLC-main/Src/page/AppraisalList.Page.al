#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194201 "Appraisal List"
{
    Editable = false;
    PageType = List;
    SourceTable = "HR Appraisal Header";
    ApplicationArea = All;
    Caption = 'Appraisal List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisal No';
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisal Type';
                    ToolTip = 'Specifies the value of the Appraisal Type field.';
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisal Period';
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee No';
                    ToolTip = 'Specifies the value of the Appraisee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appraisee Name';
                    ToolTip = 'Specifies the value of the Appraisee Name field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    Caption = 'Immediate Supervisor No.';
                    ToolTip = 'Specifies the value of the Immediate Supervisor No. field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Immediate Supervisor Name';
                    ToolTip = 'Specifies the value of the Immediate Supervisor Name field.';
                }
                field("Second Supervisor"; Rec."Second Supervisor")
                {
                    ApplicationArea = Basic;
                    Caption = 'Second Supervisor No.';
                    ToolTip = 'Specifies the value of the Second Supervisor No. field.';
                }
                field("Second Supervisor Name"; Rec."Second Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Status';
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
