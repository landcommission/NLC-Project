#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69023 "Salary pointers"
{
    PageType = List;
    SourceTable = "Salary Pointers";
    UsageCategory = Administration;
    SourceTableView = sorting("Salary Scale", Arrangement)
                      order(ascending);
    ApplicationArea = All;
    Caption = 'Salary pointers';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Arrangement; Rec.Arrangement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arrangement field.';
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Pointer field.';
                }
                field("Basic Pay int"; Rec."Basic Pay int")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay int field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field("Employee Category"; Rec."Employee Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Category field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000007; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000008; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

