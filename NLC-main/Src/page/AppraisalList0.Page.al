#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194084 "Appraisal List0"
{
    ApplicationArea = Basic;
    CardPageId = "HR 360 Appraisal Card";
    PageType = List;
    SourceTable = "HR Appraisal Header";
    UsageCategory = Lists;
    Caption = 'Appraisal List0';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    HideValue = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Second Supervisor"; Rec."Second Supervisor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor field.';
                }
                field("Explored By Second Supervisor"; Rec."Explored By Second Supervisor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Explored By Second Supervisor field.';
                }
                field("Explored By Appraisee"; Rec."Explored By Appraisee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Explored By Appraisee field.';
                }
                field("Explored By Supervisor"; Rec."Explored By Supervisor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Explored By Supervisor field.';
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Type field.';
                }
                field("Appraisal Stage"; Rec."Appraisal Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Stage field.';
                }
                field("SecSupervisor Recomendations"; Rec."SecSupervisor Recomendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SecSupervisor Recomendations field.';
                }
                field("SecSupervisor Comments"; Rec."SecSupervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SecSupervisor Comments field.';
                }
                field("Mid Year Review"; Rec."Mid Year Review")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mid Year Review field.';
                }
                field("Second Supervisor Comments"; Rec."Second Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Comments field.';
                }

            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Appraisal Report")
            {
                ApplicationArea = Basic;
                Image = Employee;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = report "Appraisal Report OLD";
                ToolTip = 'Executes the Appraisal Report action.';
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter(Rec."Appraisal No", Rec."Appraisal No");
                    Report.Run(39003917, true, true, Rec);
                    Rec.Reset();
                end;
            }
        }
    }
}
