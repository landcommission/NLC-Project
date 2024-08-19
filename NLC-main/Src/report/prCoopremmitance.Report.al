#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193515 "prCoop remmitance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prCoop remmitance.rdlc';
    ApplicationArea = All;
    Caption = 'prCoop remmitance';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        strEmpName: Text[200];
        strOrganisation: Text[30];
        objEmp: Record "FA Budget Entry";
        objOrg: Record "Petty Cash Assignment";
        objPeriod: Record Banks;
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodTrans: Record "Cshmgt PV Audit";
        empTotal: Decimal;
        totempTotal: Decimal;
        GrandTotal: Decimal;
        PeriodFilter: Text[30];
        LineTotal: Decimal;
        totLineTotal: Decimal;
        CoopNo: Text[50];
        transcode: Record "Bank Bal. Alert Buffer";
        Index: Integer;
        DenomArray: array[3, 12] of Text[50];
        AmountArray: array[3, 12] of Decimal;
        Totals1: Decimal;
        Totals2: Decimal;
        Totals3: Decimal;
        Totals4: Decimal;
        Totals5: Decimal;
        Totals6: Decimal;
        Totals7: Decimal;
        Totals8: Decimal;
        Totals9: Decimal;
        Totals10: Decimal;
        Totals11: Decimal;
        Totals12: Decimal;
        DptTotals1: Decimal;
        DptTotals2: Decimal;
        DptTotals3: Decimal;
        DptTotals4: Decimal;
        DptTotals5: Decimal;
        DptTotals6: Decimal;
        DptTotals7: Decimal;
        DptTotals8: Decimal;
        DptTotals9: Decimal;
        DptTotals10: Decimal;
        DptTotals11: Decimal;
        DptTotals12: Decimal;
        CoopLoan: Decimal;
        COUNTER: Integer;
        CompanyInfo: Record "Company Information";
        TotalPayable: Decimal;
        IntCode: Code[20];
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        TotalsCaptionLbl: Label 'Totals';
        NameCaptionLbl: Label 'Name';
        Payroll_NoCaptionLbl: Label 'Payroll No';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
}
