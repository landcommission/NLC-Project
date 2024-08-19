#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193570 "Inactive staff"
{
    ApplicationArea = Basic;
    CardPageId = "HR Employee Card";
    Editable = false;
    PageType = List;
    SourceTable = "HR Employees";
    SourceTableView = where(Status = const(Inactive));
    UsageCategory = Lists;
    Caption = 'Inactive staff';
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
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Department Code"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Location/Division Code"; Rec."Location/Division Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location/Division Code field.';
                }
            }
        }
    }

    actions { }
}
