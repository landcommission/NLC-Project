#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193870 "Project Donors"
{
    PageType = Card;
    SourceTable = "Project Donors";
    ApplicationArea = All;
    Caption = 'Project Donors';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor code';
                    ToolTip = 'Specifies the value of the Donor code field.';
                }
                field("Donor Name"; Rec."Donor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donor Name field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field("Allowed Indirect Cost"; Rec."Allowed Indirect Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allowed Indirect Cost field.';
                }
                field("Indirect Cost"; Rec."Indirect Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Allow Indirect Cost';
                    ToolTip = 'Specifies the value of the Allow Indirect Cost field.';
                }
                field("Expected Donation"; Rec."Expected Donation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Donation field.';
                }
                field("Donated Amount"; Rec."Donated Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donated Amount field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Grant No"; Rec."Grant No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant No field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        Rec.Balance := Rec."Expected Donation" - Rec."Donated Amount";
    end;
}
