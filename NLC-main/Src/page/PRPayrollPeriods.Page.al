page 50024 PRPayrollPeriods
{
    ApplicationArea = All;
    Caption = 'PR Payroll Periods';
    PageType = Card;
    SourceTable = "PR Payroll Periods";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Closed; Rec.Closed)
                {
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field("Date Opened"; Rec."Date Opened")
                {
                    ToolTip = 'Specifies the value of the Date Opened field.';
                }
                field("Opened By"; Rec."Opened By")
                {
                    ToolTip = 'Specifies the value of the Opened By field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Name"; Rec."Period Name")
                {
                    ToolTip = 'Specifies the value of the Period Name field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field(Prorated; Rec.Prorated)
                {
                    ToolTip = 'Specifies the value of the Prorated field.';
                }
            }
        }
    }
}
