#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193509 "PrPay Change View"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PrPay Change View.rdlc';
    ProcessingOnly = false;
    ApplicationArea = All;
    Caption = 'PrPay Change View';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            RequestFilterFields = "Employee Code";
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "PR Salary Card"."Employee Code") { }
            column(Employee_Name; EmpName) { }
            column(Current_Basic_Pay; CurrentBasicPay) { }
            column(Pay_Raise; PayRaise) { }
            column(New_Basic_Pay; NewBasicPay) { }
            column(Company_Picture; Companyinfo.Picture) { }
            column(Printed_By; PrintedBy) { }
            column(Report_Name; Txt001) { }

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
                        EmpName := HrEmp."Last Name" + ' ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name";

                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin

                Companyinfo.Reset();
                Companyinfo.CalcFields(Picture);

                PrintedBy := UserId;
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

    var
        "Percentage change": Decimal;
        HrEmp: Record "HR Employees";
        CurrentBasicPay: Decimal;
        PayRaise: Decimal;
        NewBasicPay: Decimal;
        DaysWorked: Decimal;
        EmpName: Text[100];
        Companyinfo: Record "Company Information";
        PrintedBy: Code[30];
        Txt001: Label 'Payroll Pay Change';
}
