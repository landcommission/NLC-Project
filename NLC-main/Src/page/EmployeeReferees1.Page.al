#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193435 "Employee Referees1"
{
    PageType = List;
    SourceTable = "Employee Referees";
    ApplicationArea = All;
    Caption = 'Employee Referees1';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee code"; Rec."Employee code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee code field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone field.';
                }
                field("Business/Occupation"; Rec."Business/Occupation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business/Occupation field.';
                }
            }
        }
    }

    actions { }
}
