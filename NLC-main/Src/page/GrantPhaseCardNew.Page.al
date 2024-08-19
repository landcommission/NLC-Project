#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193831 "Grant Phase Card New"
{
    PageType = Card;
    SourceTable = "Grant Phases";
    ApplicationArea = All;
    Caption = 'Grant Phase Card New';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Phase)
            {
                Caption = 'Phase';
                Image = Intrastat;
                action("<Page Phase Reporting Schedules>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reporting Schedules';
                    Promoted = true;
                    RunObject = page "Phase Reporting Schedules";
                    RunPageLink = Phase = field(Code);
                    ToolTip = 'Executes the Reporting Schedules action.';
                }
            }
        }
    }

    var
        Job: Record Jobs;
}
