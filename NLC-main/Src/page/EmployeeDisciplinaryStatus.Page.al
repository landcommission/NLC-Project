#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69288 "Employee Disciplinary Status."
{
    PageType = List;
    SourceTable = "Employee Disciplinary Status";
    ApplicationArea = All;
    Caption = 'Employee Disciplinary Status.';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Disciplinary Status"; Rec."Disciplinary Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Status field.';
                }
                field("Start Period"; Rec."Start Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Period field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Period"; Rec."End Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Period field.';
                }
                field(Stop; Rec.Stop)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Stop field.';
                }
                field("Effect on Payroll"; Rec."Effect on Payroll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effect on Payroll field.';
                }
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

