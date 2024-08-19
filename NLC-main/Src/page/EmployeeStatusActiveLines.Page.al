#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194163 "Employee Status Active Lines"
{
    PageType = ListPart;
    SourceTable = "Payroll Change Request Line";
    ApplicationArea = All;
    Caption = 'Employee Status Active Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Payroll Change No"; Rec."Payroll Change No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Change No field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Employee Status"; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Status';
                    ToolTip = 'Specifies the value of the Employee Status field.';
                }
                field("New Employee Status"; Rec."New Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Employee Status';
                    Editable = false;
                    ToolTip = 'Specifies the value of the New Employee Status field.';
                }
                field("Payroll Period"; Rec."Effective Payroll Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Period';
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Reason for Change"; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for Change';
                    ToolTip = 'Specifies the value of the Reason for Change field.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Leaving';
                    ToolTip = 'Specifies the value of the Date of Leaving field.';
                }
            }
        }
    }

    actions { }

    var
        PRTransCode: Record "PR Transaction Codes";
        PREmpTrans: Record "PR Employee Transactions";
}
