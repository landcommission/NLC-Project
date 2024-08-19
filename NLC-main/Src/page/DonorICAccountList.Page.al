#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193877 "Donor I/C Account List"
{
    PageType = List;
    SourceTable = "Donor IC G/L Account";
    ApplicationArea = All;
    Caption = 'Donor I/C Account List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Income/Balance"; Rec."Income/Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Income/Balance field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Map-to G/L Acc. No."; Rec."Map-to G/L Acc. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Map-to G/L Acc. No. field.';
                }
                field(Indentation; Rec.Indentation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Indentation field.';
                }
                field(Donor; Rec.Donor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donor field.';
                }
            }
        }
    }

    actions { }
}
