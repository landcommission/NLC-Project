#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193703 "JV Header"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/JV Header.rdlc';
    ApplicationArea = All;
    Caption = 'JV Header';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        NumberText: array[2] of Text[120];
        CheckReport: Report Check;
}
