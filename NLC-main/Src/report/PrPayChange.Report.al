#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193511 "PrPay Change"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'PrPay Change';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            RequestFilterFields = "Employee Code";
            column(ReportForNavId_1; 1) { }

            trigger OnAfterGetRecord()
            begin
                HrEmp.Reset();
                HrEmp.SetRange(HrEmp."No.", "PR Salary Card"."Employee Code");
                if HrEmp.Find('-') then begin
                    HrEmp.TestField("Date Of Join");
                    DaysWorked := Today - HrEmp."Date Of Join";
                    if DaysWorked >= 365 then begin

                        CurrentBasicPay := "PR Salary Card"."Basic Pay";
                        PayRaise := "Percentage change" / 100 * "PR Salary Card"."Basic Pay";
                        NewBasicPay := "PR Salary Card"."Basic Pay" + PayRaise;
                        "PR Salary Card"."Basic Pay" := NewBasicPay;
                        "PR Salary Card".Modify();

                        PayChangeStore.Reset();
                        PayChangeStore.Init();
                        PayChangeStore."Line No." := 0;
                        PayChangeStore."Employee No" := "PR Salary Card"."Employee Code";
                        PayChangeStore."Previous Basic Pay" := CurrentBasicPay;
                        PayChangeStore."New Basic Pay" := NewBasicPay;
                        PayChangeStore."Date Changed" := Today;
                        PayChangeStore."Time Changed" := Time;
                        PayChangeStore."Changed By" := UserId;
                        PayChangeStore.Insert(true);

                    end;
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group(Control2)
                {
                    field("Percentage change"; "Percentage change")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Percentage change';
                        ToolTip = 'Specifies the value of the Percentage change field.';
                    }
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPostReport()
    begin
        Message(Txt001);
    end;

    var
        "Percentage change": Decimal;
        HrEmp: Record "HR Employees";
        PayChangeStore: Record prPayChange;
        CurrentBasicPay: Decimal;
        PayRaise: Decimal;
        NewBasicPay: Decimal;
        Txt001: Label 'Process Complete';
        DaysWorked: Decimal;
}
