#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193627 "Generate 13th Month"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Generate 13th Month.rdlc';
    ApplicationArea = All;
    Caption = 'Generate 13th Month';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        Trans: Record "Bank Bal. Alert Buffer";
        PayrollVariations: Record "JV Header";
        PayrollPeriodR: Record Banks;
        AllowanceAmount: Decimal;
        Perc: Decimal;
        Generate_13th_Month_AllowanceCaptionLbl: Label 'Generate 13th Month Allowance';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        No_CaptionLbl: Label 'No.';
        NamesCaptionLbl: Label 'Names';
        Location_DivisionCaptionLbl: Label 'Location/Division';
        AmountCaptionLbl: Label 'Amount';
}
