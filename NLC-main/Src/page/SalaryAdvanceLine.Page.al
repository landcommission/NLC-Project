#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 52193573 "Salary Advance Line"
{
    Caption = 'Salary Advance Line';
    Editable = true;
    PageType = ListPart;
    SourceTable = "Staff Advance Line";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
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
                field("Date Taken"; Rec."Date Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Taken field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Payroll Deduct Month"; Rec."Payroll Deduct Month")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Payroll Deduct Month field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';

                }

                field("Emeployee Gross Pay"; Rec."Emeployee Gross Pay")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross Pay';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gross Pay field.';
                }

                field("3* Gross Pay"; Rec."A Third Basic Pay")
                {
                    ApplicationArea = Basic;
                    Caption = '3* Gross Pay';
                    Editable = false;
                    ToolTip = 'Specifies the value of the 3* Gross Pay field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("No.of Months to Repay"; Rec."No.of Months to Repay")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the No.of Months to Repay field.';
                }
                field("Monthly Repayment Amount"; Rec."Monthly Repayment Amount")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Monthly Repayment Amount field.';
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = Basic;
                    Caption = 'Net Pay';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Net Pay field.';
                }
                field("A Third Rule"; Rec."A Third Rule")
                {
                    ApplicationArea = Basic;
                    Caption = 'A Third Rule';
                    Editable = false;
                    ToolTip = 'Specifies the value of the A Third Rule field.';
                }
                field("Max.Amount Per 1/3 Rule"; Rec."Max.Amount Per 1/3 Rule")
                {
                    ApplicationArea = Basic;
                    Caption = 'Max.Amount Per 1/3 Rule';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Max.Amount Per 1/3 Rule field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        PayHeader: Record "Pending Vch. Surr. Line";
        PayLine: Record "Receipt Line";
        Bal: Decimal;
        DimVal: Record "Dimension Value";
        ShortcutDimCode: array[8] of Code[20];
}

#pragma implicitwith restore
