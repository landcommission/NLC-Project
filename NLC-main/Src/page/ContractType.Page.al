#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193969 "Contract Type"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Types";
    UsageCategory = Lists;
    Caption = 'Contract Type';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Contract Code"; Rec."Contract Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Code field.';
                }
                field("Contract Name"; Rec."Contract Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Name field.';
                }
                field("Contract Cycle"; Rec."Contract Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Cycle field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Contract Lines")
            {
                ApplicationArea = Basic;
                RunObject = page "Contract Line";
                RunPageLink = "Contract Type" = field("Contract Code");
                ToolTip = 'Executes the Contract Lines action.';
            }
        }
    }
}
