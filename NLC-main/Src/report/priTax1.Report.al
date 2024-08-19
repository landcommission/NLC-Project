#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193588 priTax1
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/priTax1.rdlc';
    ApplicationArea = All;
    Caption = 'priTax1';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = filter('GPAY'));
            RequestFilterFields = "Employee Code";
            column(ReportForNavId_1000000000; 1000000000) { }

            trigger OnAfterGetRecord()
            begin
                mBPAY := 0;
                "Housing Allowance" := 0;
                "Transport Allowance" := 0;
                "Leave Allowance" := 0;
                OT := 0;
                "Directors Fees" := 0;
                "Lum[ Sum" := 0;
                "other allowance" := 0;
                "total cash pay" := 0;
                "value of car" := 0;
                "other non cash" := 0;
                "total non cash" := 0;
                "global income" := 0;
                "type of housing" := 0;
                "rent of house" := 0;
                "Computed Rent" := 0;
                "Rent Recovered" := 0;
                "net Housing" := 0;
                "total gross pay" := 0;
                "30% cash" := 0;
                "Actual contribution" := 0;
                "permisable limit" := 0;
                "mortgage interest" := 0;
                HOSp := 0;
                "Amount of benefit" := 0;
                "taxable pay" := 0;
                "total pable slab" := 0;
                "monthly Relief" := 0;
                "insurance relief" := 0;
                PAYE := 0;

                PeriodTran1.Reset();
                PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'BPAY');
                PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                if PeriodTran1.Find('-') then
                    mBPAY := PeriodTran1.Amount;

                transCode.Reset();
                transCode.SetRange(transCode."itax Grouping", transCode."itax Grouping"::"Housing Allowance");
                if transCode.Find('-') then
                    repeat
                        PeriodTran1.Reset();
                        PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                        PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                        if PeriodTran1.Find('-') then
                            "Housing Allowance" := "Housing Allowance" + PeriodTran1.Amount;
                    until transCode.Next() = 0;

                transCode.Reset();
                transCode.SetRange(transCode."itax Grouping", transCode."itax Grouping"::"Transport Allowance");
                if transCode.Find('-') then
                    repeat
                        PeriodTran1.Reset();
                        PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                        PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                        if PeriodTran1.Find('-') then
                            "Transport Allowance" := "Transport Allowance" + PeriodTran1.Amount;
                    until transCode.Next() = 0;

                transCode.Reset();
                transCode.SetRange(transCode."itax Grouping", transCode."itax Grouping"::Leave);
                if transCode.Find('-') then
                    repeat
                        PeriodTran1.Reset();
                        PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                        PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                        if PeriodTran1.Find('-') then
                            "Leave Allowance" := "Leave Allowance" + PeriodTran1.Amount;
                    until transCode.Next() = 0;


                transCode.Reset();
                transCode.SetRange(transCode."itax Grouping", transCode."itax Grouping"::OT);
                if transCode.Find('-') then
                    repeat
                        PeriodTran1.Reset();
                        PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                        PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                        if PeriodTran1.Find('-') then
                            OT := OT + PeriodTran1.Amount;
                    until transCode.Next() = 0;

                transCode.Reset();
                transCode.SetRange(transCode."itax Grouping", transCode."itax Grouping"::"Directors Fees");
                if transCode.Find('-') then
                    repeat
                        PeriodTran1.Reset();
                        PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                        PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                        if PeriodTran1.Find('-') then
                            "Directors Fees" := "Directors Fees" + PeriodTran1.Amount;
                    until transCode.Next() = 0;

                //----------------------------------
                transCode.Reset();
                transCode.SetRange(transCode."itax Grouping", transCode."itax Grouping"::Other);
                transCode.SetRange(transCode."Transaction Type", transCode."Transaction Type"::Income);
                if transCode.Find('-') then
                    repeat
                        PeriodTran1.Reset();
                        PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                        PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                        if PeriodTran1.Find('-') then
                            "other allowance" := "other allowance" + PeriodTran1.Amount;
                    until transCode.Next() = 0;


                //Actual contribution------------
                transCode.Reset();
                transCode.SetRange(transCode."Special Transactions", transCode."Special Transactions"::"Defined Contribution");
                if transCode.Find('-') then
                    repeat
                        PeriodTran1.Reset();
                        PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                        PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                        if PeriodTran1.Find('-') then
                            "Actual contribution" := "Actual contribution" + PeriodTran1.Amount;
                    until transCode.Next() = 0;

                PeriodTran1.Reset();
                PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'NSSF');
                PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                if PeriodTran1.Find('-') then
                    "Actual contribution" := "Actual contribution" + PeriodTran1.Amount;

                //"monthly Relief":=0;
                PeriodTran1.Reset();
                PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'PSNR');
                PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                if PeriodTran1.Find('-') then
                    "monthly Relief" := "monthly Relief" + PeriodTran1.Amount;

                //"insurance relief":=0;  INSR
                PeriodTran1.Reset();
                PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'INSR');
                PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                if PeriodTran1.Find('-') then
                    "insurance relief" := "insurance relief" + PeriodTran1.Amount;

                //PAYE
                PeriodTran1.Reset();
                PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
                PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'PAYE');
                PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SetRange(PeriodTran1."Payroll Code", "PR Period Transactions"."Payroll Code");
                if PeriodTran1.Find('-') then
                    PAYE := PAYE + PeriodTran1.Amount;


                MakeExcelDataBody();
            end;

            trigger OnPostDataItem()
            begin
                CreateExcelbook();
            end;

            trigger OnPreDataItem()
            begin
                UserSetup.Get(UserId);
                //IF UserSetup."Payroll Accountant"=FALSE THEN ERROR('Under Construction');


                "PR Period Transactions".SetFilter("PR Period Transactions"."Payroll Code", '=%1', UserSetup."Payroll Code");
                "PR Period Transactions".SetFilter("PR Period Transactions"."Payroll Period", '=%1', SelectedPeriod);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field("Selected Period"; SelectedPeriod)
                {
                    ApplicationArea = Basic;
                    TableRelation = "PR Payroll Periods";
                    ToolTip = 'Specifies the value of the SelectedPeriod field.';
                }
                field("Payroll Code"; payrollcode)
                {
                    ApplicationArea = Basic;
                    TableRelation = "prPayroll Type";
                    ToolTip = 'Specifies the value of the payrollcode field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin

        if SelectedPeriod = 0D then
            Error('You must specify the period filter');

        //IF PrintToExcel THEN
        MakeExcelInfo();
    end;

    var
        PeriodTrans: Record "PR Period Transactions";
        EmployeeName: Text[100];
        objPeriod: Record "PR Payroll Periods";
        UserSetup: Record "User Setup";
        SelectedPeriod: Date;
        PeriodFilter: Text[30];
        objEmp: Record "HR Employees";
        controlinfo: Record "Purchase Quote Header";
        NoofEntries: Integer;
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        "Period Names": Text[30];
        dimVal: Record "Dimension Value";
        mCount: Integer;
        mPercDist: Decimal;
        mPercLeave: Decimal;
        "HR Timesheets": Record Customer;
        FromDate: Date;
        ToDate: Date;
        mHours: Decimal;
        mPerc: Decimal;
        HRday: Integer;
        totMhours: Decimal;
        mDate: Record Date;
        mPercTotal: Decimal;
        mHorPercTotal: array[100] of Decimal;
        PeriodTran1: Record "PR Period Transactions";
        i: Integer;
        approved: Record Customer;
        dt1: Date;
        dt2: Date;
        objholidays: Record "HR Employee Qualifications";
        "no of holidays": Integer;
        objbasecalenderchange: Record "prEmployee Salary Ledger";
        DATE1: Date;
        DATE2: Date;
        tempDate: Date;
        mtotalGrosspay: Decimal;
        mRealTotals: Decimal;
        mDay: Integer;
        Text000: Label 'Period: %1';
        Text001: Label 'Before';
        Text002: Label 'Salary Distribution';
        Text003: Label 'More than';
        Text004: Label 'Aged by %1';
        Text005: Label 'Total for %1';
        Text006: Label 'Aged as of %1';
        Text007: Label 'Aged by %1';
        Text008: Label 'All Amounts in LCY';
        Text009: Label 'Due Date,Posting Date,Document Date';
        Text010: Label 'The Date Formula %1 cannot be used. Try to restate it. E.g. 1M+CM instead of CM+1M.';
        Text011: Label 'Data';
        Text012: Label 'Aged Accounts Receivable';
        Text013: Label 'Company Name';
        Text014: Label 'Report No.';
        Text015: Label 'Report Name';
        Text016: Label 'User ID';
        Text017: Label 'Date';
        Text018: Label 'Customer Filters';
        Text019: Label 'Cust. Ledger Entry Filters';
        myFilter: Text[1000];
        Trans: Record "PR Transaction Codes";
        mNetPay: Decimal;
        mPAYE: Decimal;
        mBPAY: Decimal;
        payrollcode: Code[50];
        "Housing Allowance": Decimal;
        "Transport Allowance": Decimal;
        "Leave Allowance": Decimal;
        OT: Decimal;
        "Directors Fees": Decimal;
        "Lum[ Sum": Decimal;
        "other allowance": Decimal;
        "total cash pay": Decimal;
        "value of car": Decimal;
        o: Decimal;
        "other non cash": Decimal;
        "total non cash": Decimal;
        "global non income": Decimal;
        "global income": Decimal;
        "type of housing": Decimal;
        "rent income": Decimal;
        "rent of house": Decimal;
        "Computed Rent": Decimal;
        "Rent Recovered": Decimal;
        "net Housing": Decimal;
        "total Gross": Decimal;
        "total gross pay": Decimal;
        "30% cash": Decimal;
        "Actual contribution": Decimal;
        "permisible interest": Decimal;
        "mortgage interest": Decimal;
        HOSp: Decimal;
        "Amount of benefit": Decimal;
        "taxable pay": Decimal;
        "total pable slab": Decimal;
        "monthly Relief": Decimal;
        "insurance relief": Decimal;
        "permisable limit": Decimal;
        slab: Decimal;
        transCode: Record "PR Transaction Codes";
        PAYE: Decimal;


    procedure MakeExcelInfo()
    begin
        //ExcelBuf.SetUseInfoSheed;
        ExcelBuf.ClearNewRow();
        MakeExcelDataHeader();
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow();
        ExcelBuf.AddColumn('Pin of Employee', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Name of Employee', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Residential status', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Type of Employee', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Basic Salary', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Housing Allowance', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Transport Allowance', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Leave Allowance', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('OT', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Directors Fees', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Lum[ sum', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('oter allowance', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('total cash pay', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Value of Car', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('other non cash', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('total non cash', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Global income', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('type of Housing', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Rent of house', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('computed  Rent', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Rent Recovered', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('net housing', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('total gross  pay', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('30% cash', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Actual contribution', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('permisable limit', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('mortgage interest', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('HOSp', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('Amount of Benefit', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('taxable pay', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('total pable, slab', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('monthly relief', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('insurance relief', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('', false, '', false, false, false, '', 0);
        ExcelBuf.AddColumn('PAYE', false, '', false, false, false, '', 0);
        ExcelBuf.NewRow();
    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
        objEmp.Reset();
        objEmp.SetRange(objEmp."No.", "PR Period Transactions"."Employee Code");
        objEmp.SetRange(objEmp.Disabled, objEmp.Disabled::No);
        if objEmp.Find('-') then begin
            ExcelBuf.AddColumn(objEmp."PIN No.", false, '', false, false, true, '', 0);
            ExcelBuf.AddColumn(objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name", false, '', false, false, true, '', 1);

            ExcelBuf.AddColumn(objEmp."Residential status", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn(objEmp."Employee Type Primary", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn(mBPAY, false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn("Housing Allowance", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn("Transport Allowance", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn("Leave Allowance", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn(OT, false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn("Directors Fees", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn("Lum[ Sum", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn("other allowance", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0); //"total cash pay"
            ExcelBuf.AddColumn("value of car", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn("other non cash", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0);//"total non cash"
            ExcelBuf.AddColumn("global income", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn('Benefit not given', false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0);//"rent of house"
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0);//"Computed Rent"
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0); //"Rent Recovered"
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0); // "net Housing"
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0); //"total gross pay"
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0);  //"30% cash"
            ExcelBuf.AddColumn("Actual contribution", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0); //"permisable limit"
            ExcelBuf.AddColumn("mortgage interest", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn(HOSp, false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0);//"Amount of benefit"
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0);//"taxable pay"
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0); //"total pable slab"
            ExcelBuf.AddColumn("monthly Relief", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn("insurance relief", false, '', false, false, false, '', 0);
            ExcelBuf.AddColumn('', false, '', false, false, false, '', 0); //0
            ExcelBuf.AddColumn(PAYE, false, '', false, false, false, '', 0);
            ExcelBuf.NewRow();
        end;
    end;


    procedure CreateExcelbook()
    begin

        // ExcelBuf.CreateBook('iTax');
        //   ExcelBuf.CreateBookAndOpenExcel('Sheet1','Sheet1','iTax',UserId);
        // ExcelBuf.CreateBookAndOpenExcel(SheetName,ReportHeader,CompanyName,UserID2)
        // ExcelBuf.CreateBookAndOpenExcel(FileName,SheetName,ReportHeader,CompanyName2,UserID2)
        //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        // ExcelBuf.GiveUserControl;
        Message('DONE');
        /*
      ExcelBuf.CreateBook('iTax');
         ExcelBuf.CreateBookAndOpenExcel('Sheet1','Sheet1','iTax',USERID);
        // ExcelBuf.CreateBookAndOpenExcel(SheetName,ReportHeader,CompanyName,UserID2)
        // ExcelBuf.CreateBookAndOpenExcel(FileName,SheetName,ReportHeader,CompanyName2,UserID2)
      //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
      ExcelBuf.GiveUserControl;
      MESSAGE('DONE');
          */

    end;
}
