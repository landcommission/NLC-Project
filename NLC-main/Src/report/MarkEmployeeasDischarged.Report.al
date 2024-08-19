#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193614 "Mark Employee as Discharged"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Mark Employee as Discharged.rdlc';
    ApplicationArea = All;
    Caption = 'Mark Employee as Discharged';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        RCount: Integer;
        DeptName: Text[200];
        DValue: Record "Dimension Value";
        Employee_ListCaptionLbl: Label 'Employee List';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NamesCaptionLbl: Label 'Names';
        DepartmentCaptionLbl: Label 'Department';
}
