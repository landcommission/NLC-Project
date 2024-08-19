#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193619 "Clear Old Code Variations"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Clear Old Code Variations.rdlc';
    ApplicationArea = All;
    Caption = 'Clear Old Code Variations';
    dataset
    {
        dataitem("JV Header"; "JV Header")
        {
            column(ReportForNavId_5357; 5357) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; UserId) { }
            column(prPayroll_Variations__Employee_Code_; "JV Header"."Document No.") { }
            column(prPayroll_Variations__Transaction_Name_; "JV Header"."Account Type") { }
            column(prPayroll_Variations_Amount; "JV Header"."Account No.") { }
            column(prPayroll_Variations_Balance; "JV Header"."Posting Date") { }
            column(prPayroll_VariationsCaption; prPayroll_VariationsCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(prPayroll_Variations_Transaction_Type; "JV Header"."Shortcut Dimension 2 Code") { }
            column(prPayroll_Variations_Reference_No; "JV Header"."Currency Code") { }

            trigger OnAfterGetRecord()
            begin
                "JV Header".Delete();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        prPayroll_VariationsCaptionLbl: Label 'prPayroll Variations';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
