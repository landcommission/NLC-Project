#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193536 "Transactions - Detailed"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Transactions - Detailed.rdlc';
    ApplicationArea = All;
    Caption = 'Transactions - Detailed';
    dataset
    {
        dataitem("Cshmgt PV Audit"; "Cshmgt PV Audit")
        {
            column(ReportForNavId_7769; 7769) { }

            trigger OnAfterGetRecord()
            begin
                EmpName := '';
                //IF Employee.GET("Employee Code") THEN BEGIN
                //EmpName:=Employee."Last Name"+' '+Employee."First Name"+' '+Employee."Middle Name";
                //END;

                RCount := RCount + 1;
            end;

            trigger OnPreDataItem()
            begin
                //LastFieldNo := FIELDNO("Transaction Code");

                RCount := 1;

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

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        Employee: Record "FA Budget Entry";
        EmpName: Text[200];
        RCount: Integer;
        CompanyInfo: Record "Company Information";
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Transactions___DetailedCaptionLbl: Label 'Transactions - Detailed';
        Membership_No_CaptionLbl: Label 'Membership No.';
        NamesCaptionLbl: Label 'Names';
}
