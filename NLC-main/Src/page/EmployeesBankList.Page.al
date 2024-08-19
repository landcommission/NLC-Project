#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193567 "Employees Bank List"
{
    PageType = List;
    SourceTable = "Employee Bankss";
    ApplicationArea = All;
    Caption = 'Employees Bank List';
    //CardPageId="HR Employee Bank Changes";
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
            }
        }
    }

    actions { }
}
