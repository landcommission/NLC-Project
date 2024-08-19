#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193443 "HR Employee Qualifications"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employee Qualifications.rdlc';
    ApplicationArea = All;
    Caption = 'HR Employee Qualifications';
    dataset
    {
        dataitem("HR Employee Qualifications"; "HR Employee Qualifications")
        {
            DataItemTableView = where("Employee Status" = const(Active));
            RequestFilterFields = "Employee No.";
            column(ReportForNavId_1; 1) { }
            column(EmployeeNo_HREmployeeQualifications; "HR Employee Qualifications"."Employee No.") { }
            column(LineNo_HREmployeeQualifications; "HR Employee Qualifications"."Line No.") { }
            column(FromDate_HREmployeeQualifications; "HR Employee Qualifications"."From Date") { }
            column(ToDate_HREmployeeQualifications; "HR Employee Qualifications"."To Date") { }
            column(Type_HREmployeeQualifications; "HR Employee Qualifications".Type) { }
            column(Description_HREmployeeQualifications; "HR Employee Qualifications".Description) { }
            column(InstitutionCompany_HREmployeeQualifications; "HR Employee Qualifications"."Institution/Company") { }
            column(Cost_HREmployeeQualifications; "HR Employee Qualifications".Cost) { }
            column(CourseGrade_HREmployeeQualifications; "HR Employee Qualifications"."Course Grade") { }
            column(EmployeeStatus_HREmployeeQualifications; "HR Employee Qualifications"."Employee Status") { }
            column(Comment_HREmployeeQualifications; "HR Employee Qualifications".Comment) { }
            column(ExpirationDate_HREmployeeQualifications; "HR Employee Qualifications"."Expiration Date") { }
            column(QualificationType_HREmployeeQualifications; "HR Employee Qualifications"."Qualification Type") { }
            column(QualificationCode_HREmployeeQualifications; "HR Employee Qualifications"."Qualification Code") { }
            column(QualificationDescription_HREmployeeQualifications; "HR Employee Qualifications"."Qualification Description") { }
            column(CourseofStudy_HREmployeeQualifications; "HR Employee Qualifications"."Course of Study") { }
            column(Score_HREmployeeQualifications; "HR Employee Qualifications".Score) { }
            column(CompInforName; CompInfor.Name) { }
            column(Location_code; CompInfor."Location Code") { }
            column(email; CompInfor."E-Mail") { }
            column(picture; CompInfor.Picture) { }
            column(EmpName; EmpName) { }

            trigger OnAfterGetRecord()
            begin
                EmpName := '';

                HREmp.Reset();
                if HREmp.Get("HR Employee Qualifications"."Employee No.") then
                    EmpName := HREmp."Full Name";
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
        CompInfor.Reset();
        CompInfor.Get();
        CompInfor.CalcFields(CompInfor.Picture);
    end;

    var
        CompInfor: Record "Company Information";
        EmpName: Text;
        HREmp: Record "HR Employees";
}
