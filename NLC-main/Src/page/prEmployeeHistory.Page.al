#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193533 "prEmployee History"
{
    PageType = List;
    SourceTable = "PR Employee P9 Info";
    ApplicationArea = All;
    Caption = 'prEmployee History';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gross Pay field.';
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Net Pay field.';
                }
                field(Allowances; Rec.Allowances)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Allowances field.';
                }
                field(Deductions; Rec.Deductions)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Deductions field.';
                }
                field(PAYE; Rec.PAYE)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the PAYE field.';
                }
                field(NSSF; Rec.NSSF)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the NSSF field.';
                }
                field(NHIF; Rec.NHIF)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the NHIF field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
            }
        }
    }

    actions { }
}
