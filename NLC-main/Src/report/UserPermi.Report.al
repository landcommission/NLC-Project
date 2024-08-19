#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193576 "User Permi"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/User Permi.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'User Permi';
    dataset
    {
        dataitem("Access Control"; "Access Control")
        {
            column(ReportForNavId_1; 1) { }
            column(UserName_AccessControl; "Access Control"."User Name") { }
            column(RoleName_AccessControl; "Access Control"."Role Name") { }
            column(RoleID_AccessControl; "Access Control"."Role ID") { }
            column(No; No) { }

            trigger OnAfterGetRecord()
            begin
                HREmployees.Reset();
                HREmployees.SetRange(HREmployees."User ID", "Access Control"."User Name");
                if HREmployees.Find('-') then
                    No := HREmployees."No."
                else
                    CurrReport.Skip();
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
        HREmployees: Record "HR Employees";
        No: Code[100];
}
