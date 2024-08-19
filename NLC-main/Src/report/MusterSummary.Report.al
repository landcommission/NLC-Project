#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193558 "Muster Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Muster Summary.rdlc';
    Caption = 'PR Payroll Summary - Group Codes';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
            DataItemTableView = sorting("Transaction Code") order(descending);
            RequestFilterFields = "Transaction Code", "Is Special Muster";
            column(ReportForNavId_1; 1) { }
            column(GroupCode_PRTransactionCodes; "PR Transaction Codes"."Group Code") { }
            column(GroupDescription_PRTransactionCodes; "PR Transaction Codes"."Group Description") { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(PeriodName; PeriodName) { }
            column(COMPANYNAME; CompanyName) { }
            column(AppliedFilters; AppliedFilters) { }
            dataitem("PR Period Transactions"; "PR Period Transactions")
            {
                DataItemLink = "Transaction Code" = field("Transaction Code");
                DataItemTableView = sorting("Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No") order(descending);
                column(ReportForNavId_2; 2) { }
                column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name") { }
                column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
                column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
                column(Balance_PRPeriodTransactions; "PR Period Transactions".Balance) { }
                column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
                column(EmpName; EmpName) { }
                column(IDNumber; IDNumber) { }
                column(BLN_No; BLN_No) { }

                trigger OnAfterGetRecord()
                begin

                    EmpName := '';
                    IDNumber := '';

                    HREmp.Reset();
                    if HREmp.Get("PR Period Transactions"."Employee Code") then begin
                        EmpName := UpperCase(HREmp."Full Name");
                        IDNumber := (Format(HREmp."ID Number"));
                    end;

                    BLN_No := '';

                    //Get Reference No
                    PREmpTrans.Reset();
                    PREmpTrans.SetRange(PREmpTrans."Payroll Period", SelectedPeriod);
                    PREmpTrans.SetRange(PREmpTrans."Transaction Code", "PR Period Transactions"."Transaction Code");
                    if PREmpTrans.Find('-') then
                        BLN_No := PREmpTrans."Reference No";
                end;

                trigger OnPreDataItem()
                begin

                    "PR Period Transactions".SetRange("PR Period Transactions"."Payroll Period", SelectedPeriod);

                    if DirectorateCode <> '' then
                        "PR Period Transactions".SetRange("PR Period Transactions"."Global Dimension 1 Code", DirectorateCode);
                end;
            }
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                field(SelectedPeriod; SelectedPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Period';
                    TableRelation = "PR Payroll Periods"."Date Opened";
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field(DirectorateCode; DirectorateCode)
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Code';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field(Summarize; Summarize)
                {
                    ApplicationArea = Basic;
                    Caption = 'Summarize';
                    TableRelation = "PR Transaction Codes"."Is Special Muster";
                    ToolTip = 'Specifies the value of the Summarize field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        if SelectedPeriod = 0D then
            Error('Please enter selected period');

        //Company Info
        fnCompanyInfo();

        //Period Name
        PRPayrollPeriods.Reset();
        PRPayrollPeriods.SetRange(PRPayrollPeriods."Date Opened", SelectedPeriod);
        if PRPayrollPeriods.Find('-') then
            PeriodName := PRPayrollPeriods."Period Name";
    end;

    var
        SelectedPeriod: Date;
        CompInfo: Record "Company Information";
        PeriodName: Text[30];
        AppliedFilters: Text;
        PRPayrollPeriods: Record "PR Payroll Periods";
        PeriodFilter: Date;
        EmpName: Text;
        HREmp: Record "HR Employees";
        DirectorateCode: Code[10];
        IDNumber: Text;
        PREmpTrans: Record "PR Employee Transactions";
        BLN_No: Text;
        Summarize: Boolean;


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
