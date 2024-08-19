#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193622 "Update Employee PAYE"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Employee PAYE.rdlc';
    ApplicationArea = All;
    Caption = 'Update Employee PAYE';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        objPayrollPeriod: Record Banks;
        EmpTrans: Record "CshMgt Approvals";
        EmpTransR: Record "CshMgt Approvals";
        Employee: Record "FA Budget Entry";
        Salary_Step_Notch_TransactionsCaptionLbl: Label 'Salary Step/Notch Transactions';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
