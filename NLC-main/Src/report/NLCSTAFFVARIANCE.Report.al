#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50014 "NLC STAFF VARIANCE"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NLC STAFF VARIANCE.rdlc';
    ApplicationArea = All;
    Caption = 'NLC STAFF VARIANCE';
    dataset
    {
        dataitem("Salary Step/Notch Transactions"; "Salary Step/Notch Transactions")
        {
            RequestFilterFields = "Entry No", "Salary Step/Notch";
            column(ReportForNavId_1; 1) { }
            column(ReferenceNo_PREmployeechangeTransaction; "Salary Step/Notch Transactions"."Salary Grade") { }
            column(TransactionCode_PREmployeechangeTransaction; "Salary Step/Notch Transactions"."Salary Step/Notch") { }
            column(TransactionName_PREmployeechangeTransaction; "Salary Step/Notch Transactions"."Transaction Code") { }
            column(NewAmount_PREmployeechangeTransaction; "Salary Step/Notch Transactions"."Transaction Name") { }
            column(OriginalAmount_PREmployeechangeTransaction; "Salary Step/Notch Transactions".Amount) { }
            column(PeriodMonth_PREmployeechangeTransaction; "Salary Step/Notch Transactions"."% of Basic Pay") { }
            column(PeriodYear_PREmployeechangeTransaction; "Salary Step/Notch Transactions".Formula) { }
            column(PayrollPeriod_PREmployeechangeTransaction; "Salary Step/Notch Transactions"."Entry No") { }
            column(TransactionType_PREmployeechangeTransaction; "Salary Step/Notch Transactions"."Transaction Type") { }
            column(SalaryGrade_PREmployeechangeTransaction; "Salary Step/Notch Transactions"."Salary Grade") { }
            column(CI_Name; Ci.Name) { }
            column(Picture; Ci.Picture) { }
            column(Difference; Difference) { }
            column(Name; Name) { }

            trigger OnAfterGetRecord()
            begin
                //IF "PREmployee change  Transaction"."New Amount">"PREmployee change  Transaction"."Original Amount" THEN
                ////Difference:="Salary Step/Notch Transactions".Amount-"Salary Step/Notch Transactions"."Transaction Name";
                //END ELSE BEGIN
                //Difference:="PREmployee change  Transaction"."Original Amount"-"PREmployee change  Transaction"."New Amount";

                HrEmp.Reset();
                ////HrEmp.SETRANGE(HrEmp."Employee Code","Salary Step/Notch Transactions"."Employee Code") ;
                if HrEmp.Find('-') then
;
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        Ci.Reset();
        Ci.Get();
        Ci.CalcFields(Ci.Picture);
    end;

    var
        Ci: Record "Company Information";
        Difference: Decimal;
        Name: Text;
        HrEmp: Record "prSalary Card Casual";
}

