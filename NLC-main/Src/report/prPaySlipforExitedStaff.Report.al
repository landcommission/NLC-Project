#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193628 "prPaySlip for Exited Staff"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prPaySlip for Exited Staff.rdlc';
    ApplicationArea = All;
    Caption = 'prPaySlip for Exited Staff';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        Addr: array[2, 10] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        intInfo: Integer;
        i: Integer;
        PeriodTrans: Record "Cshmgt PV Audit";
        intRow: Integer;
        Index: Integer;
        objEmp: Record "FA Budget Entry";
        strEmpName: Text[250];
        strPin: Text[30];
        Trans: array[2, 60] of Text[250];
        TransAmt: array[2, 60] of Text[250];
        TransBal: array[2, 60] of Text[250];
        TransBalBF: array[2, 60] of Text[250];
        strGrpText: Text[100];
        strNssfNo: Text[30];
        strNhifNo: Text[30];
        strBank: Text[100];
        strBranch: Text[100];
        strAccountNo: Text[100];
        strMessage: Text[100];
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        SelectedPeriod: Date;
        objPeriod: Record Banks;
        dtDOE: Date;
        strEmpCode: Text[30];
        STATUS: Text[30];
        ControlInfo: Record "Purchase Quote Header";
        dtOfLeaving: Date;
        "Served Notice Period": Boolean;
        dept: Text[30];
        bankStruct: Record "Cashier Link";
        emploadva: Record "G/L Entry Change log";
        strBankno: Text[30];
        strBranchno: Text[30];
        CompanyInfo: Record "Company Information";
        TransCode: Record "Bank Bal. Alert Buffer";
        DimensionValue: Record "Dimension Value";
        GradeStep: Text[50];
        AccountType: Text[50];
        EmptyStringCaptionLbl: Label '.....................................................................................................';
        Employee_CaptionLbl: Label 'Employee:';
        Department_CaptionLbl: Label 'Department:';
        Period_CaptionLbl: Label 'Period:';
        P_I_N_No_CaptionLbl: Label 'P.I.N No:';
        Grade_Step_CaptionLbl: Label 'Grade/Step:';
        SalNotch: Record "Purchase Committments";
        SalGrade: Record "Purchase Quote Line";
        TotalStatutories: Decimal;
}
