#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193621 "Mark as PAYS PAYE"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Mark as PAYS PAYE.rdlc';
    ApplicationArea = All;
    Caption = 'Mark as PAYS PAYE';
    dataset
    {
        dataitem("Staff Claims Header"; "Staff Claims Header")
        {
            DataItemTableView = sorting("No.");
            column(ReportForNavId_6207; 6207) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; UserId) { }
            column(prSalary_Card__Employee_Code_; "Staff Claims Header"."No.") { }
            column(prSalary_CardCaption; prSalary_CardCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(prSalary_Card__Employee_Code_Caption; "Staff Claims Header".FieldCaption("Staff Claims Header"."No.")) { }

        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        SalaryGrades: Record "Purchase Quote Line";
        prSalary_CardCaptionLbl: Label 'prSalary Card';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
