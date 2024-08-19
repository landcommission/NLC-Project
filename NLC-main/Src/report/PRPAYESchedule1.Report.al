#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193586 "PR P.A.Y.E Schedule1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR P.A.Y.E Schedule1.rdlc';
    ApplicationArea = All;
    Caption = 'PR P.A.Y.E Schedule1';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1) { }
            column(NSSFNo_HREmployees; "HR Employees"."NSSF No.") { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(i; i) { }
            column(PayrollPeriod; PayrollPeriod) { }
            column(PINNo_HREmployees; "HR Employees"."PIN No.") { }
            column(MPRAmount; MPRAmount) { }
            column(INSReleifAmount; INSReleifAmount) { }
            column(PAYEAmount; PAYEAmount) { }
            column(Picture; CompanyInformation.Picture) { }
            column(Tel; CompanyInformation."Phone No.") { }
            column(Company_Email; CompanyInformation."E-Mail") { }
            column(Website; CompanyInformation."Home Page") { }
            column(floor; CompanyInformation."Ship-to Address 2") { }
            column(Locations; CompanyInformation.City) { }
            column(addess2; CompanyInformation."Address 2") { }
            column(Adress; CompanyInformation.Address) { }
            column(cnty; CompanyInformation."Country/Region Code") { }
            column(County; CompanyInformation.County) { }
            column(Name; CompanyInformation.Name) { }

            trigger OnAfterGetRecord()
            begin
                MPRAmount := 0;
                INSReleifAmount := 0;
                PAYEAmount := 0;


                //1,162
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PayrollPeriod);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PSNR');
                if PRPeriodTrans.Find('-') then
                    MPRAmount := PRPeriodTrans.Amount;

                //Insurance Relief
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PayrollPeriod);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'INSR');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    INSReleifAmount := PRPeriodTrans.Amount;
                end;

                //PAYE
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PayrollPeriod);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PAYE');
                if PRPeriodTrans.Find('-') then
                    PAYEAmount := PRPeriodTrans.Amount;

                if MPRAmount + INSReleifAmount + PAYEAmount = 0 then
                    CurrReport.Skip();

                i += 1;
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
                field(PayrollPeriod; PayrollPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Period';
                    TableRelation = "PR Payroll Periods"."Date Opened";
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CompanyInformation.Reset();
        CompanyInformation.Get();
        CompanyInformation.CalcFields(CompanyInformation.Picture);
        if PayrollPeriod = 0D then
            Error('Please enter payroll period');
    end;

    var
        PayrollPeriod: Date;
        PRPeriodTrans: Record "PR Period Transactions";
        PRTransCode: Record "PR Transaction Codes";
        i: Integer;
        MPRAmount: Decimal;
        INSReleifAmount: Decimal;
        PAYEAmount: Decimal;
        CompanyInformation: Record "Company Information";
}
