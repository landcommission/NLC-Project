#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194233 HRObjectivesTargets
{
    PageType = Card;
    SourceTable = "HR Objectives Targets";
    ApplicationArea = All;
    Caption = 'HRObjectivesTargets';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No Series field.';
                }
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Code field.';
                }
                field("Supervisor Comments"; Rec."Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Comments field.';
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisee Comments field.';
                }
                field(Ratings; Rec.Ratings)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ratings field.';
                }
                field(Objectives; Rec.Objectives)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objectives field.';
                }
                field(Performance; Rec.Performance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance field.';
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("For Next Period"; Rec."For Next Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the For Next Period field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Criteria; Rec.Criteria)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria field.';
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Indicator field.';
                }
                field("Second Supervisor Comments"; Rec."Second Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Comments field.';
                }
                field("Supervisor Ratings"; Rec."Supervisor Ratings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Ratings field.';
                }
                field("Agreed Ratings"; Rec."Agreed Ratings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agreed Ratings field.';
                }
                field("Achievements Reviewed"; Rec."Achievements Reviewed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achievements Reviewed field.';
                }
                field("Target Changed Or Added"; Rec."Target Changed Or Added")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Changed Or Added field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
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
