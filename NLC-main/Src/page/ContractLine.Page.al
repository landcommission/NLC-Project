#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193970 "Contract Line"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Lines";
    UsageCategory = Lists;
    Caption = 'Contract Line';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Contract Line Code"; Rec."Contract Line Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Line Type")
            {
                ApplicationArea = Basic;
                RunObject = page "Contract Lines Type";
                RunPageLink = "Contract Line Code" = field("Contract Line Code");
                ToolTip = 'Executes the Line Type action.';
            }
        }
    }
}
