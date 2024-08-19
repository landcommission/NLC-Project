#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193660 pv
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/pv.rdlc';
    ApplicationArea = All;
    Caption = 'pv';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        CompanyInfo: Record "Company Information";
        Address: Text;
        Particulars: Text;
        Total: Decimal;
        objLogos: Record "HR Job Responsiblities";
        DimVal: Record "Dimension Value";
        Project: Text;
        CheckReport: Report Check;
        NumberText: array[2] of Text;
}
