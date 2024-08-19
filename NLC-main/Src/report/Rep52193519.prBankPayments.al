#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193519 "prBank Payments"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prBank Payments.rdlc';
    ApplicationArea = All;
    Caption = 'prBank Payments';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        PeriodTrans: Record "Cshmgt PV Audit";
        PayeAmount: Decimal;
        TotPayeAmount: Decimal;
        TaxablePay: Decimal;
        TotTaxablePay: Decimal;
        EmployeeName: Text[200];
        PinNumber: Text[30];
        objPeriod: Record Banks;
        objEmp: Record "FA Budget Entry";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        companyinfo: Record "Company Information";
        bankStruct: Record "Cashier Link";
        bankAcc: Text[50];
        BranchBankNM: Text[100];
        mainBankNM: Text[100];
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Bank_Payment_ScheduleCaptionLbl: Label 'Bank Payment Schedule';
        BankCaptionLbl: Label 'Bank';
        BranchCaptionLbl: Label 'Branch';
        No_CaptionLbl: Label 'No:';
        Employee_NameCaptionLbl: Label 'Employee Name';
        Account_No_CaptionLbl: Label 'Account No.';
        Net_AmountCaptionLbl: Label 'Net Amount';
        Employee_BankCaptionLbl: Label 'Employee Bank';
        Bank_BranchCaptionLbl: Label 'Bank Branch';
        Total_CaptionLbl: Label 'Total:';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
}
