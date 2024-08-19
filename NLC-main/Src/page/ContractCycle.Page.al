#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193975 "Contract Cycle"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Cycle";
    UsageCategory = Lists;
    Caption = 'Contract Cycle';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
                field("Completion Level"; Rec."Probability Calculation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Probability Calculation field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("No. of Opportunities"; Rec."No. of Opportunities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Opportunities field.';
                }
                field("Estimated Value (LCY)"; Rec."Estimated Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Value (LCY) field.';
                }
                field("Calcd. Current Value (LCY)"; Rec."Calcd. Current Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calcd. Current Value (LCY) field.';
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filter field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Contract Cycle Stages")
            {
                ApplicationArea = Basic;
                RunObject = page "Sales Cycle Stage";
                ToolTip = 'Executes the Contract Cycle Stages action.';
            }
        }
    }
}
