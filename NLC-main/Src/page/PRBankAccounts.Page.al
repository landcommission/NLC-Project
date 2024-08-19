#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193524 "PR Bank Accounts"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "PR Bank Accounts";
    UsageCategory = Lists;
    Caption = 'PR Bank Accounts';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Branches)
            {
                ApplicationArea = Basic;
                Image = BankAccount;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "PR Bank Branches";
                RunPageLink = "Bank Code" = field("Bank Code");
                ToolTip = 'Executes the Branches action.';
            }
        }
    }
}
