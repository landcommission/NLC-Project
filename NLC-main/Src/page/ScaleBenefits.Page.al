#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69024 "Scale Benefits"
{
    PageType = List;
    SourceTable = "Scale Benefits";
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Scale Benefits';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Pointer field.';
                }
                field("ED Code"; Rec."ED Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ED Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("ED Description"; Rec."ED Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ED Description field.';
                }
                field("Based On"; Rec."Based On")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Based On field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000009; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000012; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

