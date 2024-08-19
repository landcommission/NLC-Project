#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193513 prEmployeeAdvupdates
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prEmployeeAdvupdates.rdlc';
    ApplicationArea = All;
    Caption = 'prEmployeeAdvupdates';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        EmployeeTrans: Record "CshMgt Approvals";
        strPeriodName: Text[50];
        payperiod: Record Banks;
        PeriodFilter: Text[50];
        SelectedPeriod: Date;
        objPeriod: Record Banks;
        PeriodName: Text[50];
        employeeAdvance: Record "G/L Entry Change log";
        EmployeeTrans2: Record "CshMgt Approvals";
        AdvAmount: Decimal;
        AdvRef: Text[250];
        AdvBal: Decimal;
}
