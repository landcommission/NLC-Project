#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193572 "Salary Advance Request Lists"
{
    ApplicationArea = Basic;
    CardPageId = "Salary Advance Request Crd";
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = List;
    SourceTable = "Staff Advance Headers";
    SourceTableView = where(Status = filter(<> Approved));
    UsageCategory = Lists;
    Caption = 'Salary Advance Request Lists';
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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';

                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requestor ID';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Payroll Deduction Month"; Rec."Payroll Deduction Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Deduction Month field.';
                }
                field("Loan Type"; Rec."Loan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Type field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Reasons for Advance Amount"; Rec."Reasons for Advance Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons for Advance Amount field.';
                }
            }
        }
    }

    actions { }

}
