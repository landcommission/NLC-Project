#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193550 "Base Calendar Changes new"
{
    Caption = 'Base Calendar Changes';
    DataCaptionFields = "Employee Code";
    PageType = List;
    SourceTable = "prEmployee Salary Ledger";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Recurring System';
                    ToolTip = 'Specifies the value of the Recurring System field.';
                }
                field("Transaction Name 2"; Rec."Transaction Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name 2 field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Original Amount"; Rec."Original Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Nonworking';
                    ToolTip = 'Specifies the value of the Nonworking field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions { }
}
