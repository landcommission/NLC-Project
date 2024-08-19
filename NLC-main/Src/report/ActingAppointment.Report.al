#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50029 "Acting Appointment"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Acting Appointment.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Acting Appointment';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = Acting, "If Acted?";
            column(ReportForNavId_1; 1) { }
            column(Acting_HREmployees; "HR Employees".Acting) { }
            column(JobID5_HREmployees; "HR Employees"."Job ID5") { }
            column(JobTitle5_HREmployees; "HR Employees"."Job Title5") { }
            column(Grade5_HREmployees; "HR Employees".Grade5) { }
            column(FromPayroll5_HREmployees; "HR Employees"."From Payroll5") { }
            column(ToPayroll5_HREmployees; "HR Employees"."To Payroll5") { }
            column(ReasonForActing_HREmployees; "HR Employees"."Reason For Acting") { }
            column(ResponsibilityCentre2_HREmployees; "HR Employees"."Responsibility Center") { }
            column(IfActed_HREmployees; "HR Employees"."If Acted?") { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(PhoneNum; ci."Phone No.")
            { }
            column(CompEmail; ci."E-Mail")
            { }
            column(CompAddress; ci.Address)
            { }
            column(E_Mail; "E-Mail")
            { }
            column(Cell_Phone_Number; "Cell Phone Number")
            { }
            column(ID_Number; "ID Number")
            {

            }
            column(CountN; CountN)
            { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                if "HR Employees"."No." <> '' then
                    CountN := CountN + 1;

            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CI.get();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        CountN: Integer;

}
