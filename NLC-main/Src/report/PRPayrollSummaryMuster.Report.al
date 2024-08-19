#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50054 "PR Payroll Summary -  Muster"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Payroll Summary -  Muster.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR Payroll Summary -  Muster';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            RequestFilterFields = "Employee Code", "Payroll Period", "Global Dimension 1 Code";
            column(ReportForNavId_1; 1) { }
            column(Payroll_Period; "Payroll Period")
            { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name") { }
            column(PeriodMonth_PRPeriodTransactions; "PR Period Transactions"."Period Month") { }
            column(PeriodYear_PRPeriodTransactions; "PR Period Transactions"."Period Year") { }
            column(GlobalDimension1Code_PRPeriodTransactions; "PR Period Transactions"."Global Dimension 1 Code") { }
            column(GroupOrder_PRPeriodTransactions; "PR Period Transactions"."Group Order") { }
            column(SubGroupOrder_PRPeriodTransactions; "PR Period Transactions"."Sub Group Order") { }
            column(FullName; FullName) { }
            column(RowNum; RowNum) { }
            column(Picture; CompInfo.Picture) { }
            column(CountyName; CountyName) { }
            column(HideDeductions; HideDeductions) { }
            column(Grade; Grade) { }
            column(Designation; Designation) { }
            column(Directorate; Directorate) { }
            column(CompanyAddress; CompanyAddress)
            { }
            column(CompanyName; CompanyName)
            {

            }
            column(NLCWebsite; NLCWebsite)
            {

            }
            column(Piture; CompInfo.Picture)
            {

            }

            trigger OnAfterGetRecord()
            begin
                FullName := '';
                Grade := '';
                Designation := '';
                Directorate := '';
                // if "PR Period Transactions"."Employee Code" = '' then
                //     CurrReport.Skip();


                RowNum := 0;

                if "PR Period Transactions"."Employee Code" <> "PR Period Transactions"."Employee Code" then
                    RowNum += 1;

                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "PR Period Transactions"."Employee Code");
                if HREmp.Find('-') then begin
                    FullName := UpperCase(HREmp."Full Name");
                    Grade := HREmp.Grade;
                    Designation := HREmp."Job Title";
                    Directorate := HREmp."Global Dimension 2 Code";
                end;

                DimensionValue.Reset();
                //DimensionValue.SetRange(DimensionValue."Global Dimension No.", 1);
                DimensionValue.SetRange(DimensionValue.Code, "PR Period Transactions"."Global Dimension 1 Code");
                if DimensionValue.Find('-') then
                    CountyName := DimensionValue.Name;
            end;

            trigger OnPreDataItem()
            begin
                "PR Period Transactions".SetCurrentKey("PR Period Transactions"."Employee Code", "PR Period Transactions"."Period Month", "PR Period Transactions"."Period Year",
                "PR Period Transactions"."Group Order", "PR Period Transactions"."Sub Group Order");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                field(HideDeductions; HideDeductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Hide Deductions';
                    ToolTip = 'Specifies the value of the Hide Deductions field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        if "PR Period Transactions".GetFilter("PR Period Transactions"."Payroll Period") = '' then
            Error('Please select a payroll period');
        CompInfo.get();
        CompInfo.CalcFields(Picture);
        CompanyName := CompInfo.Name;
        CompanyAddress := CompInfo.Address;
        NLCWebsite := CompInfo."NLC Website";
    end;

    trigger OnPostReport()
    var
        myInt: Integer;
    begin

    end;

    var
        HREmp: Record "HR Employees";
        FullName: Text;
        RowNum: Integer;
        HideDeductions: Boolean;
        CompInfo: Record "Company Information";
        CountyName: Text;
        DimensionValue: Record "Dimension Value";
        Grade: Text;
        Designation: Text;
        CompanyName: Text;
        CompanyAddress: Text;
        NLCWebsite: Text;
        Directorate: Text;
}
