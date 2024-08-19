#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193612 "Transfer to new Codes"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Transfer to new Codes.rdlc';
    ApplicationArea = All;
    Caption = 'Transfer to new Codes';
    dataset
    {
        dataitem("Bank Bal. Alert Buffer"; "Bank Bal. Alert Buffer")
        {
            column(ReportForNavId_6955; 6955) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; UserId) { }
            column(prTransaction_Codes__Transaction_Code_; "Bank Bal. Alert Buffer"."Line No.") { }
            column(prTransaction_Codes__Transaction_Name_; "Bank Bal. Alert Buffer"."Teller Name") { }
            column(prTransaction_CodesCaption; prTransaction_CodesCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(prTransaction_Codes__Transaction_Code_Caption; "Bank Bal. Alert Buffer".FieldCaption("Bank Bal. Alert Buffer"."Line No.")) { }
            column(prTransaction_Codes__Transaction_Name_Caption; "Bank Bal. Alert Buffer".FieldCaption("Bank Bal. Alert Buffer"."Teller Name")) { }

        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        EmpTrans: Record "CshMgt Approvals";
        StepTrans: Record "Purchase Quote Params";
        prTransaction_CodesCaptionLbl: Label 'prTransaction Codes';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
