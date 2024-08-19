#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193532 "Negative Pay List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Negative Pay List.rdlc';
    ApplicationArea = All;
    Caption = 'Negative Pay List';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        RCount: Integer;
        CompanyInfo: Record "Company Information";
        Negative_Pay_ListCaptionLbl: Label 'Negative Pay List';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NamesCaptionLbl: Label 'Names';
}
