#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193521 prBasicPayListing
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prBasicPayListing.rdlc';
    ApplicationArea = All;
    Caption = 'prBasicPayListing';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        //PeriodFilter:="prSalary Card".GETFILTER("Period Filter");
        if PeriodFilter = '' then
            Error('You must specify the period filter');

        //SelectedPeriod:="prSalary Card".GETRANGEMIN("Period Filter");
        objPeriod.Reset();
        //IF objPeriod.GET(SelectedPeriod) THEN PeriodName:=objPeriod."Period Name";


        if companyinfo.Get() then
;
    end;

    var
        PeriodTrans: Record "Cshmgt PV Audit";
        BasicPay: Decimal;
        GrossPay: Decimal;
        NetPay: Decimal;
        TotBasicPay: Decimal;
        TotGrossPay: Decimal;
        TotNetPay: Decimal;
        EmployeeName: Text[30];
        objEmp: Record "FA Budget Entry";
        objPeriod: Record Banks;
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        companyinfo: Record "Purchase Quote Header";
        Basic_Pay_ListingCaptionLbl: Label 'Basic Pay Listing';
        Basic_Pay_CaptionLbl: Label 'Basic Pay:';
        Gross_Pay_CaptionLbl: Label 'Gross Pay:';
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Totals_CaptionLbl: Label 'Totals:';
}

