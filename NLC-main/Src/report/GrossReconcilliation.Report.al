#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193624 "Gross Reconcilliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Gross Reconcilliation.rdlc';
    ApplicationArea = All;
    Caption = 'Gross Reconcilliation';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        PeriodTrans: Record "Cshmgt PV Audit";
        BasicPay: Decimal;
        GrossPay: Decimal;
        NetPay: Decimal;
        TotBasicPay: Decimal;
        TotGrossPay: Decimal;
        TotNetPay: Decimal;
        EmployeeName: Text[200];
        objEmp: Record "FA Budget Entry";
        objPeriod: Record Banks;
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        companyinfo: Record "Company Information";
        PeriodTransPREV: Record "Cshmgt PV Audit";
        BasicPayPREV: Decimal;
        GrossPayPREV: Decimal;
        NetPayPREV: Decimal;
        ReconcilliationTable: Record "Quotation Specification Lines";
        No: Integer;
        "Entry/Exit": Boolean;
        TCurrAmount: Decimal;
        TPrevAmount: Decimal;
        Payment_ReconcilliationCaptionLbl: Label 'Payment Reconcilliation';
        Prev__AmountCaptionLbl: Label 'Prev. Amount';
        VarienceCaptionLbl: Label 'Varience';
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        Current_AmountCaptionLbl: Label 'Current Amount';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
}
