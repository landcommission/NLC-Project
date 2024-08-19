#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193542 prPayrollType
{
    PageType = List;
    SourceTable = "prPayroll Type";
    ApplicationArea = All;
    Caption = 'prPayrollType';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Code field.';
                }
                field("Payroll Name"; Rec."Payroll Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Name field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Period Length"; Rec."Period Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Length field.';
                }
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EntryNo field.';
                }
            }
        }
    }

    actions { }
}
