#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193534 "Bank Payment Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank Payment Schedule.rdlc';
    ApplicationArea = All;
    Caption = 'Bank Payment Schedule';
    dataset
    {
        dataitem("PR Bank Accounts"; "PR Bank Accounts")
        {
            DataItemTableView = sorting("Bank Code", "Bank Name");
            RequestFilterFields = "Bank Code", "Bank Name";
            column(ReportForNavId_4233; 4233) { }
            column(GETFILTERS__________HR_Employee__GETFILTERS; "PR Bank Accounts".GetFilters + ' ' + "HR Employees".GetFilters) { }
            column(USERID; UserId) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(prBank_Structure__Bank_Name_; "PR Bank Accounts"."Bank Name") { }
            column(prBank_Structure__Bank_Code_; "PR Bank Accounts"."Bank Code") { }
            column(prBank_Structure__Branch_Code_; "PR Bank Accounts"."Bank Name") { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Bank_Payment_ScheduleCaption; Bank_Payment_ScheduleCaptionLbl) { }
            column(Net_AmountCaption; Net_AmountCaptionLbl) { }
            column(Account_No_Caption; Account_No_CaptionLbl) { }
            column(Bank_BranchCaption; Bank_BranchCaptionLbl) { }
            column(Employee_BankCaption; Employee_BankCaptionLbl) { }
            column(Employee_NameCaption; Employee_NameCaptionLbl) { }
            column(BankCaption; BankCaptionLbl) { }
            column(BranchCaption; BranchCaptionLbl) { }
            column(No_Caption; No_CaptionLbl) { }
            column(HR_Employee__Account_Type_Caption; "HR Employees".FieldCaption("Account Type")) { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "Main Bank" = field("Bank Code");
                RequestFilterFields = "Current Month Filter", "Location/Division Code", "Responsibility Center", "Cost Center Code", "Salary Grade", "Salary Notch/Step", "Employee Classification";
                column(ReportForNavId_8631; 8631) { }
                column(BranchBankNM; BranchBankNM) { }
                column(EmployeeName; EmployeeName) { }
                column(HR_Employee__HR_Employee___Net_Pay_; "HR Employees"."Net Pay") { }
                column(bankAcc; bankAcc) { }
                column(mainBankNM; mainBankNM) { }
                column(HR_Employee__HR_Employee___No__; "HR Employees"."No.") { }
                column(HR_Employee__Account_Type_; "HR Employees"."Account Type") { }
                column(HR_Employee__HR_Employee___Net_Pay__Control1102755001; "HR Employees"."Net Pay") { }
                column(RCount; RCount) { }
                column(Prepared_by_Caption; Prepared_by_CaptionLbl) { }
                column(NameCaption; NameCaptionLbl) { }
                column(EmptyStringCaption; EmptyStringCaptionLbl) { }
                column(EmptyStringCaption_Control1102755035; EmptyStringCaption_Control1102755035Lbl) { }
                column(Authorised_by_Caption; Authorised_by_CaptionLbl) { }
                column(NameCaption_Control1102755037; NameCaption_Control1102755037Lbl) { }
                column(EmptyStringCaption_Control1102755038; EmptyStringCaption_Control1102755038Lbl) { }
                column(Approved_by_Caption; Approved_by_CaptionLbl) { }
                column(NameCaption_Control1102755040; NameCaption_Control1102755040Lbl) { }
                column(Signature___DateCaption; Signature___DateCaptionLbl) { }
                column(EmptyStringCaption_Control1102755042; EmptyStringCaption_Control1102755042Lbl) { }
                column(Signature___DateCaption_Control1102755043; Signature___DateCaption_Control1102755043Lbl) { }
                column(EmptyStringCaption_Control1102755044; EmptyStringCaption_Control1102755044Lbl) { }
                column(Signature___DateCaption_Control1102755045; Signature___DateCaption_Control1102755045Lbl) { }
                column(EmptyStringCaption_Control1102755046; EmptyStringCaption_Control1102755046Lbl) { }
                column(HR_Employee_Main_Bank; "HR Employees"."Main Bank") { }
                column(HR_Employee_Branch_Bank; "HR Employees"."Branch Bank") { }
                column(DepartmentCode_HREmployee; "HR Employees"."Location/Division Code") { }

                trigger OnAfterGetRecord()
                begin
                    EmployeeName := "HR Employees"."First Name" + ' ' + "HR Employees"."Middle Name" + ' ' + "HR Employees"."Last Name";
                    bankAcc := "HR Employees"."Bank Account Number";
                    bankStruct.Reset();
                    bankStruct.SetRange(bankStruct."Bank Code", "HR Employees"."Main Bank");
                    // bankStruct.SETRANGE(bankStruct."Branch Code","Branch Bank");
                    if bankStruct.Find('-') then
                        mainBankNM := bankStruct."Bank Name";
                    //BranchBankNM:=bankStruct."Branch Name";

                    /*
                    IF "HR Employees"."Net Pay" = 0 THEN
                    CurrReport.SKIP;
                     */
                    if PrintToExcel then
                        if HeaderCreated = false then begin
                            MakeExcelDataHeader();
                            HeaderCreated := true;
                        end;

                    if PrintToExcel then
                        MakeExcelDataBody();

                    GrandTotal := GrandTotal + "HR Employees"."Net Pay";

                    RCount := RCount + 1;

                end;

                trigger OnPreDataItem()
                begin
                    //"HR-Employee"."Current Month Filter" := DateFilter;
                    //IF "HR-Employee"."Current Month Filter"=0D THEN
                    if "HR Employees".GetFilter("HR Employees"."Current Month Filter") = '' then
                        Error('You must specify current Period filter.');
                end;
            }

            trigger OnAfterGetRecord()
            begin
                RCount := 0;
            end;

            trigger OnPreDataItem()
            begin
                if CompanyInfo.Get() then
                    CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content) { }
        }

        actions { }
    }

    labels { }

    trigger OnPostReport()
    begin
        if PrintToExcel then
            MakeExcelTotalBody();

        if PrintToExcel then
            CreateExcelbook();
    end;

    var
        EmployeeName: Text[200];
        bankStruct: Record "PR Bank Accounts";
        bankAcc: Text[50];
        BranchBankNM: Text[100];
        mainBankNM: Text[100];
        RCount: Integer;
        PrintToExcel: Boolean;
        ExcelBuf: Record "Excel Buffer" temporary;
        HeaderCreated: Boolean;
        GrandTotal: Decimal;
        CompanyInfo: Record "Company Information";
        AccountType: Text[30];
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Bank_Payment_ScheduleCaptionLbl: Label 'Bank Payment Schedule';
        Net_AmountCaptionLbl: Label 'Net Amount';
        Account_No_CaptionLbl: Label 'Account No.';
        Bank_BranchCaptionLbl: Label 'Bank Branch';
        Employee_BankCaptionLbl: Label 'Employee Bank';
        Employee_NameCaptionLbl: Label 'Employee Name';
        BankCaptionLbl: Label 'Bank';
        BranchCaptionLbl: Label 'Branch';
        No_CaptionLbl: Label 'No:';
        Prepared_by_CaptionLbl: Label 'Prepared by:';
        NameCaptionLbl: Label 'Name';
        EmptyStringCaptionLbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755035Lbl: Label '......................................................................................................................................................';
        Authorised_by_CaptionLbl: Label 'Authorised by:';
        NameCaption_Control1102755037Lbl: Label 'Name';
        EmptyStringCaption_Control1102755038Lbl: Label '......................................................................................................................................................';
        Approved_by_CaptionLbl: Label 'Approved by:';
        NameCaption_Control1102755040Lbl: Label 'Name';
        Signature___DateCaptionLbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755042Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755043Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755044Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755045Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755046Lbl: Label '......................................................................................................................................................';
        DateFilter: Date;

    local procedure MakeExcelDataHeader()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Employee Code',FALSE,'',TRUE,FALSE,TRUE,'@');
        ExcelBuf.AddColumn('Names',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Employee Bank',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Employee Branch',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Account Type',FALSE,'',TRUE,FALSE,TRUE,'@');
        ExcelBuf.AddColumn('Account No.',FALSE,'',TRUE,FALSE,TRUE,'@');
        ExcelBuf.AddColumn('Net Amount',FALSE,'',TRUE,FALSE,TRUE,'');
        */

    end;


    procedure MakeExcelDataBody()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(("HR-Employee"."No."),FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(EmployeeName,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(mainBankNM,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(BranchBankNM,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(FORMAT("HR-Employee"."Account Type"),FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(bankAcc,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn("HR-Employee"."Net Pay",FALSE,'',FALSE,FALSE,FALSE,'');
        */

    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet('Bank Payment Schedule','Bank Payment Schedule',COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */

    end;


    procedure MakeExcelTotalBody()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(GrandTotal,FALSE,'',FALSE,FALSE,FALSE,'');
        */

    end;
}
