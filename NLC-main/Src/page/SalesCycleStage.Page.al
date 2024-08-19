#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193976 "Sales Cycle Stage"
{
    PageType = List;
    SourceTable = "Contract Cycle Stage";
    ApplicationArea = All;
    Caption = 'Sales Cycle Stage';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Sales Cycle Code"; Rec."Sales Cycle Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Cycle Code field.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stage field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Completed %"; Rec."Completed %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completed % field.';
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Quote Required"; Rec."Quote Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quote Required field.';
                }
                field("Allow Skip"; Rec."Allow Skip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Skip field.';
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
                field("Average No. of Days"; Rec."Average No. of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Average No. of Days field.';
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filter field.';
                }
                field("Date Formula"; Rec."Date Formula")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Formula field.';
                }
                field("Contract Line Type"; Rec."Contract Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line Type field.';
                }
                field("Payment Expected"; Rec."Payment Expected")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Expected field.';
                }
                field("%age of Payment"; Rec."%age of Payment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the %age of Payment field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Statistics)
            {
                ApplicationArea = Basic;
                RunObject = page "Sales Cycle Stage Statistics";
                ToolTip = 'Executes the Statistics action.';
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                RunObject = page "Rlshp. Mgt. Comment Sheet";
                ToolTip = 'Executes the Comments action.';
            }
        }
    }
}
