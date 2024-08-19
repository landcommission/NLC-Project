#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194007 "HR Employee Bank TransferLine"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "HR Employee Transfer Lines";
    ApplicationArea = All;
    Caption = 'HR Employee Bank TransferLine';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Request No"; Rec."Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request No field.';
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
                field("Bank  Code"; Rec."Bank  Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank  Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
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
                field("A/C  Number"; Rec."A/C  Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the A/C  Number field.';
                }
                field("New Bank  Code"; Rec."New Bank  Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bank  Code field.';
                }
                field("New Bank Name"; Rec."New Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bank Name field.';
                }
                field("New Branch Code"; Rec."New Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Branch Code field.';
                }
                field("New Branch Name"; Rec."New Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Branch Name field.';
                }
                field("New A/C  Number"; Rec."New A/C  Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New A/C  Number field.';
                }
                field("From payroll Period"; Rec."From payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From payroll Period field.';
                }
                field("To Payroll Period"; Rec."To Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Payroll Period field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
            }
        }
    }

    actions { }
}
