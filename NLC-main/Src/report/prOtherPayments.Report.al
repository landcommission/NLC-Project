#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193520 "prOther Payments"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prOther Payments.rdlc';
    ApplicationArea = All;
    Caption = 'prOther Payments';
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
        EmployeeName: Text[30];
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
        icount: Integer;
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        FOSA_PAYMENT_REPORTCaptionLbl: Label 'FOSA PAYMENT REPORT';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        Net_Amount_CaptionLbl: Label 'Net Amount:';
        Employee_NameCaptionLbl: Label 'Employee Name';
        No_CaptionLbl: Label 'No:';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Total_CaptionLbl: Label 'Total:';
}
