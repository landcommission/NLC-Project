#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193511 "HR Committees"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "HR Committees";
    UsageCategory = Administration;
    Caption = 'HR Committees';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
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
                field(Roles; Rec.Roles)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Roles field.';
                }
                field("Monetary Benefit?"; Rec."Monetary Benefit?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monetary Benefit? field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field(Amount; Rec."Transaction Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Amount field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Committee)
            {
                Caption = 'Committee';
                action(Members)
                {
                    ApplicationArea = Basic;
                    Caption = 'Members';
                    RunObject = page "HR Commitee Members";
                    RunPageLink = Committee = field(Code);
                    ToolTip = 'Executes the Members action.';
                }
            }
        }
    }
}
