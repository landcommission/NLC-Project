#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193533 "Payroll Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Summary.rdlc';
    ApplicationArea = All;
    Caption = 'Payroll Summary';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Current Month Filter", "Location/Division Code", County, "Cost Center Code", "Salary Grade", "Salary Notch/Step", "Posting Group";
            column(ReportForNavId_8631; 8631) { }
            column(GETFILTERS; "HR Employees".GetFilters) { }
            column(USERID; "HR Employees"."Employee UserID") { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(cHeader_1_; cHeader[1]) { }
            column(cHeader_2_; cHeader[2]) { }
            column(cHeader_3_; cHeader[3]) { }
            column(cHeader_7_; cHeader[7]) { }
            column(cHeader_6_; cHeader[6]) { }
            column(cHeader_5_; cHeader[5]) { }
            column(cHeader_4_; cHeader[4]) { }
            column(cHeader_11_; cHeader[11]) { }
            column(cHeader_10_; cHeader[10]) { }
            column(cHeader_9_; cHeader[9]) { }
            column(cHeader_8_; cHeader[8]) { }
            column(cHeader_12_; cHeader[12]) { }
            column(cHeader_13_; cHeader[13]) { }
            column(cHeader_14_; cHeader[14]) { }
            column(cHeader_15_; cHeader[15]) { }
            column(cHeader_17_; cHeader[17]) { }
            column(cHeader_16_; cHeader[16]) { }
            column(cHeader_18_; cHeader[18]) { }
            column(cHeader_19_; cHeader[19]) { }
            column(cHeader_20_; cHeader[20]) { }
            column(strEmpName; strEmpName) { }
            column(HR_Employee__HR_Employee___No__; "HR Employees"."No.") { }
            column(cValue_1_; cValue[1]) { }
            column(cValue_2_; cValue[2]) { }
            column(cValue_3_; cValue[3]) { }
            column(cValue_6_; cValue[6]) { }
            column(cValue_5_; cValue[5]) { }
            column(cValue_4_; cValue[4]) { }
            column(cValue_9_; cValue[9]) { }
            column(cValue_8_; cValue[8]) { }
            column(cValue_7_; cValue[7]) { }
            column(cValue_11_; cValue[11]) { }
            column(cValue_12_; cValue[12]) { }
            column(cValue_13_; cValue[13]) { }
            column(cValue_14_; cValue[14]) { }
            column(cValue_15_; cValue[15]) { }
            column(cValue_10_; cValue[10]) { }
            column(cValue_19_; cValue[19]) { }
            column(cValue_18_; cValue[18]) { }
            column(cValue_17_; cValue[17]) { }
            column(cValue_16_; cValue[16]) { }
            column(cValue_20_; cValue[20]) { }
            column(HR_Employee__Department_Code_; "HR Employees".County) { }
            column(cValue_19__Control1102755024; cValue[19]) { }
            column(cValue_18__Control1102755029; cValue[18]) { }
            column(cValue_17__Control1102755030; cValue[17]) { }
            column(cValue_16__Control1102755031; cValue[16]) { }
            column(cValue_15__Control1102755052; cValue[15]) { }
            column(cValue_14__Control1102755053; cValue[14]) { }
            column(cValue_13__Control1102755054; cValue[13]) { }
            column(cValue_12__Control1102755055; cValue[12]) { }
            column(cValue_11__Control1102755056; cValue[11]) { }
            column(cValue_10__Control1102755057; cValue[10]) { }
            column(cValue_9__Control1102755058; cValue[9]) { }
            column(cValue_8__Control1102755059; cValue[8]) { }
            column(cValue_7__Control1102755060; cValue[7]) { }
            column(cValue_6__Control1102755061; cValue[6]) { }
            column(cValue_5__Control1102755062; cValue[5]) { }
            column(cValue_4__Control1102755063; cValue[4]) { }
            column(cValue_3__Control1102755064; cValue[3]) { }
            column(cValue_2__Control1102755065; cValue[2]) { }
            column(cValue_1__Control1102755066; cValue[1]) { }
            column(RCount; RCount) { }
            column(cValue_20__Control1102755071; cValue[20]) { }
            column(Employee_NameCaption; Employee_NameCaptionLbl) { }
            column(Employee_CodeCaption; Employee_CodeCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Payroll_SummaryCaption; Payroll_SummaryCaptionLbl) { }
            column(HR_Employee__Department_Code_Caption; "HR Employees".FieldCaption("HR Employees".County)) { }
            column(Prepared_by_Caption; Prepared_by_CaptionLbl) { }
            column(EmptyStringCaption; EmptyStringCaptionLbl) { }
            column(EmptyStringCaption_Control1102755072; EmptyStringCaption_Control1102755072Lbl) { }
            column(NameCaption; NameCaptionLbl) { }
            column(Signature_and_DateCaption; Signature_and_DateCaptionLbl) { }
            column(Signature_and_DateCaption_Control1102755076; Signature_and_DateCaption_Control1102755076Lbl) { }
            column(NameCaption_Control1102755077; NameCaption_Control1102755077Lbl) { }
            column(Authorised_by_Caption; Authorised_by_CaptionLbl) { }
            column(EmptyStringCaption_Control1102755079; EmptyStringCaption_Control1102755079Lbl) { }
            column(EmptyStringCaption_Control1102755080; EmptyStringCaption_Control1102755080Lbl) { }
            column(Signature_and_DateCaption_Control1102755081; Signature_and_DateCaption_Control1102755081Lbl) { }
            column(NameCaption_Control1102755082; NameCaption_Control1102755082Lbl) { }
            column(Approved_by_Caption; Approved_by_CaptionLbl) { }
            column(EmptyStringCaption_Control1102755084; EmptyStringCaption_Control1102755084Lbl) { }
            column(EmptyStringCaption_Control1102755085; EmptyStringCaption_Control1102755085Lbl) { }

            trigger OnAfterGetRecord()
            begin
                strEmpName := "HR Employees"."Last Name" + ' ' + "HR Employees"."First Name" + ' ' + "HR Employees"."Middle Name";
                EmployeeCode := "HR Employees"."No.";

                i := 1;
                repeat
                    i := i + 1;
                    cValue[i] := 0;
                until i = 20;

                Trans.Reset();
                Trans.SetFilter(Trans."Current Month Filter", "HR Employees".GetFilter("Current Month Filter"));
                Trans.SetFilter(Trans."Employee Code Filter", "HR Employees"."No.");
                if Trans.Find('-') then
                    repeat
                        Trans.CalcFields("Curr. Amount");
                        //Basic Pay
                        cHeader[1] := 'Basic Pay';
                        if Trans."Transaction Code" = 'BPAY' then
                            cValue[1] := Trans."Curr. Amount";

                        //Housing
                        cHeader[2] := 'Housing';
                        if Trans."Transaction Category" = Trans."Transaction Category"::Housing then
                            cValue[2] := cValue[2] + Trans."Curr. Amount";

                        //Transport
                        cHeader[3] := 'Transport';
                        if Trans."Transaction Category" = Trans."Transaction Category"::Transport then
                            cValue[3] := cValue[3] + Trans."Curr. Amount";

                        //Entertainment
                        cHeader[4] := 'Entertainment';
                        if Trans."Transaction Category" = Trans."Transaction Category"::Entertainment then
                            cValue[4] := cValue[4] + Trans."Curr. Amount";

                        //Leave
                        cHeader[5] := 'Leave';
                        if Trans."Transaction Category" = Trans."Transaction Category"::Leave then
                            cValue[5] := cValue[5] + Trans."Curr. Amount";

                        //Utility
                        cHeader[6] := 'Utility';
                        if Trans."Transaction Category" = Trans."Transaction Category"::Utility then
                            cValue[6] := cValue[6] + Trans."Curr. Amount";


                        //Bonus Special
                        cHeader[7] := 'Lunch';
                        if Trans."Transaction Category" = Trans."Transaction Category"::Lunch then
                            cValue[7] := cValue[7] + Trans."Curr. Amount";

                        //Inconvinience
                        cHeader[8] := 'Inconvinience';
                        if Trans."Transaction Category" = Trans."Transaction Category"::Inconvinience then
                            cValue[8] := cValue[8] + Trans."Curr. Amount";


                        //Bonus Special
                        cHeader[9] := 'Bonus Special';
                        if Trans."Transaction Category" = Trans."Transaction Category"::"Bonus Special" then
                            cValue[9] := cValue[9] + Trans."Curr. Amount";

                        //Gross Pay
                        cHeader[10] := 'Gross Pay';
                        if Trans."Transaction Code" = 'GPAY' then
                            cValue[10] := Trans."Curr. Amount";

                        //Taxable Pay
                        cHeader[11] := 'Taxable Pay';
                        if Trans."Transaction Code" = 'TXBP' then
                            cValue[11] := Trans."Curr. Amount";

                        //Gross Pay
                        cHeader[12] := 'P.A.Y.E';
                        if Trans."Transaction Code" = 'PAYE' then
                            cValue[12] := Trans."Curr. Amount";


                        //NHF
                        cHeader[13] := 'N.H.F';
                        if Trans."Transaction Code" = 'NHF' then
                            cValue[13] := Trans."Curr. Amount";


                        //Pension
                        cHeader[14] := 'Pension';
                        if Trans."Transaction Category" = Trans."Transaction Category"::Pension then
                            cValue[14] := cValue[14] + Trans."Curr. Amount";

                        //Surcharge
                        cHeader[15] := 'Compassionate Loan';//PKK'Surcharge';
                        if Trans."Transaction Category" = Trans."Transaction Category"::"Compassionate Loan" then
                            cValue[15] := cValue[15] + Trans."Curr. Amount";

                        //Housing Deduction
                        cHeader[16] := 'Housing Loan';
                        if Trans."Transaction Category" = Trans."Transaction Category"::"Housing Deduction" then
                            cValue[16] := cValue[16] + Trans."Curr. Amount";

                        //Personal Loan
                        cHeader[17] := 'Personal Loan';
                        if Trans."Transaction Category" = Trans."Transaction Category"::"Personal Loan" then
                            cValue[17] := cValue[17] + Trans."Curr. Amount";

                        //Other Co-Deductions
                        cHeader[18] := 'Other Co-Deductions';
                        if Trans."Transaction Category" = Trans."Transaction Category"::"Other Co-deductions" then
                            cValue[18] := cValue[18] + Trans."Curr. Amount";


                        //Other Deductions
                        cHeader[19] := 'Other Deductions';
                        if Trans."Transaction Category" = Trans."Transaction Category"::"Other Deductions" then
                            cValue[19] := cValue[19] + Trans."Curr. Amount";


                        //Net Pay
                        cHeader[20] := 'Net Pay';
                        if Trans."Transaction Code" = 'NPAY' then
                            cValue[20] := Trans."Curr. Amount";

                    until Trans.Next() = 0;

                if (cValue[1] = 0) then
                    CurrReport.Skip();

                if PrintToExcel then
                    if HeaderCreated = false then begin
                        MakeExcelDataHeader();
                        HeaderCreated := true;
                    end;

                if PrintToExcel then
                    MakeExcelDataBody();


                RCount := RCount + 1;
            end;

            trigger OnPreDataItem()
            begin
                if "HR Employees".GetFilter("HR Employees"."Current Month Filter") = '' then
                    Error('You must specify current Period filter.');

                CurrReport.CreateTotals(cValue[1], cValue[2], cValue[3], cValue[4], cValue[5], cValue[6], cValue[7], cValue[8], cValue[9], cValue[10]);
                CurrReport.CreateTotals(cValue[11], cValue[12], cValue[13], cValue[14], cValue[15], cValue[16], cValue[17]);
                CurrReport.CreateTotals(cValue[18], cValue[19], cValue[20]);

                RCount := 0;

                if CompanyInfo.Get() then
                    CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;
        }
    }

    requestpage
    {

        layout { }

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
        strEmpName: Text[100];
        cHeader: array[200] of Text[200];
        cValue: array[200] of Decimal;
        Trans: Record "PR Transaction Codes";
        ColNo: Integer;
        i: Integer;
        RCount: Integer;
        PrintToExcel: Boolean;
        ExcelBuf: Record "Excel Buffer" temporary;
        Text000: Label 'Not Due';
        Text001: Label 'Before';
        Text002: Label 'days';
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
        Text018: Label 'Filters';
        Emp: Record "HR Employees";
        HeaderCreated: Boolean;
        EmployeeCode: Code[20];
        CompanyInfo: Record "Company Information";
        Employee_NameCaptionLbl: Label 'Employee Name';
        Employee_CodeCaptionLbl: Label 'Employee Code';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Payroll_SummaryCaptionLbl: Label 'Payroll Summary';
        Prepared_by_CaptionLbl: Label 'Prepared by:';
        EmptyStringCaptionLbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755072Lbl: Label '......................................................................................................................................................';
        NameCaptionLbl: Label 'Name';
        Signature_and_DateCaptionLbl: Label 'Signature and Date';
        Signature_and_DateCaption_Control1102755076Lbl: Label 'Signature and Date';
        NameCaption_Control1102755077Lbl: Label 'Name';
        Authorised_by_CaptionLbl: Label 'Authorised by:';
        EmptyStringCaption_Control1102755079Lbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755080Lbl: Label '......................................................................................................................................................';
        Signature_and_DateCaption_Control1102755081Lbl: Label 'Signature and Date';
        NameCaption_Control1102755082Lbl: Label 'Name';
        Approved_by_CaptionLbl: Label 'Approved by:';
        EmptyStringCaption_Control1102755084Lbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755085Lbl: Label '......................................................................................................................................................';


    procedure MakeExcelInfo()
    begin
        /*
        ExcelBuf.SetUseInfoSheed;
        ExcelBuf.AddInfoColumn(FORMAT(Text013),FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(COMPANYNAME,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text015),FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn('Payroll Summary',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text016),FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(USERID,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text017),FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn(TODAY,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text018),FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddInfoColumn("HR-Employee".GETFILTERS,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.NewRow;
        ExcelBuf.ClearNewRow;
        //MakeExcelDataHeader;
        */

    end;

    local procedure MakeExcelDataHeader()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Employee Code',FALSE,'',TRUE,FALSE,TRUE,'@');
        ExcelBuf.AddColumn('Names',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn('Department',FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[1],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[2],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[3],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[4],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[5],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[6],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[7],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[8],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[9],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[10],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[11],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[12],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[13],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[14],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[15],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[16],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[17],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[18],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[19],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[20],FALSE,'',TRUE,FALSE,TRUE,'');
        {
        ExcelBuf.AddColumn(cHeader[21],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[22],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[23],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[24],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[25],FALSE,'',TRUE,FALSE,TRUE,'');
        ExcelBuf.AddColumn(cHeader[26],FALSE,'',TRUE,FALSE,TRUE,'');
        }
        */

    end;


    procedure MakeExcelDataBody()
    begin
        /*
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(("HR-Employee"."No."),FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(strEmpName,FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn("HR-Employee"."Department Code",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[1],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[2],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[3],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[4],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[5],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[6],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[7],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[8],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[9],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[10],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[11],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[12],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[13],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[14],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[15],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[16],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[17],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[18],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[19],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[20],FALSE,'',FALSE,FALSE,FALSE,'');
        {
        ExcelBuf.AddColumn(cValue[21],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[22],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[23],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[24],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[25],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[26],FALSE,'',FALSE,FALSE,FALSE,'');
        }
        */

    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text011,Text012,COMPANYNAME,USERID);
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
        ExcelBuf.AddColumn(cValue[1],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[2],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[3],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[4],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[5],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[6],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[7],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[8],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[9],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[10],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[11],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[12],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[13],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[14],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[15],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[16],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[17],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[18],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[19],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[20],FALSE,'',FALSE,FALSE,FALSE,'');
        {
        ExcelBuf.AddColumn(cValue[21],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[22],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[23],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[24],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[25],FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(cValue[26],FALSE,'',FALSE,FALSE,FALSE,'');
        }
        */

    end;
}
