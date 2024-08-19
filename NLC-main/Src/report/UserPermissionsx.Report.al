#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50035 "User Permissionsx"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/User Permissions.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'User Permissions';
    dataset
    {
        dataitem(User; User)
        {
            column(ReportForNavId_1; 1) { }
            column(UserName_User; User."User Name") { }
            column(Picture; CI.Picture) { }
            column(Name; CI.Name) { }
            column(StaffNo; StaffNo) { }
            column(Directorate; Directorate) { }
            column(StaffName; StaffName) { }
            column(Designation; Designation) { }
            column(Grade; Grade) { }
            column(SNO; SNO) { }
            dataitem("Access Control"; "Access Control")
            {
                DataItemLink = "User Security ID" = field("User Security ID");
                RequestFilterFields = "Role ID";
                column(ReportForNavId_3; 3) { }
                column(RoleID_AccessControl; "Access Control"."Role ID") { }
                column(CompanyName_AccessControl; "Access Control"."Company Name") { }
                column(RoleName_AccessControl; "Access Control"."Role Name") { }
            }

            trigger OnAfterGetRecord()
            begin
                if HREMP."No." <> '' then
                    SNO := SNO + 1;


                HREMP.Reset();
                HREMP.SetRange("User ID", User."User Name");
                HREMP.SetRange(Status, HREMP.Status::Active);
                if HREMP.Find('-') then begin
                    StaffNo := HREMP."No.";
                    StaffName := HREMP."Full Name";
                    Directorate := HREMP."Responsibility Center";
                    Designation := HREMP."Job Title";
                    Grade := HREMP.Grade;
                end;
            end;

            trigger OnPreDataItem()
            begin
                CI.Reset();
                CI.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content) { }
        }

        actions { }
    }

    labels { }

    var
        CI: Record "Company Information";
        StaffNo: Code[50];
        StaffName: Text;
        Directorate: Text;
        Designation: Text;
        Grade: Code[10];
        AccessControl: Record "Access Control";
        HREMP: Record "HR Employees";
        SNO: Integer;
}
