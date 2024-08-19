#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50030 "Promotion Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Promotion Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Promotion Report';
    dataset
    {
        dataitem("HR Promo. Recommend Header"; "HR Promo. Recommend Header")
        {
            column(ReportForNavId_1; 1) { }
            column(No_HRPromoRecommendHeader; "HR Promo. Recommend Header".No) { }
            column(EmployeeNo_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Employee No.") { }
            column(EmployeeName_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Employee Name") { }
            column(ShortcutDimensioncode1_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Shortcut Dimension code1") { }
            column(ShortcutDimensioncode2_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Shortcut Dimension code2") { }
            column(DateofRecommendation_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Date of Recommendation") { }
            column(Reason_HRPromoRecommendHeader; "HR Promo. Recommend Header".Reason) { }
            column(Status_HRPromoRecommendHeader; "HR Promo. Recommend Header".Status) { }
            column(NoSeries_HRPromoRecommendHeader; "HR Promo. Recommend Header"."No Series") { }
            column(ResponsibilityCenter_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Responsibility Center") { }
            column(PromotionCriteria_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Promotion Criteria") { }
            column(DevelopmentAreas_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Development Areas") { }
            column(JobTitle_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Job Title") { }
            column(SalaryGrade_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Salary Grade") { }
            column(NewJobID_HRPromoRecommendHeader; "HR Promo. Recommend Header"."New Job ID") { }
            column(NewJobTitle_HRPromoRecommendHeader; "HR Promo. Recommend Header"."New Job Title") { }
            column(NewSalaryGrade_HRPromoRecommendHeader; "HR Promo. Recommend Header"."New Salary Grade") { }
            column(NewSalaryNotch_HRPromoRecommendHeader; "HR Promo. Recommend Header"."New Salary Notch") { }
            column(Promoted_HRPromoRecommendHeader; "HR Promo. Recommend Header".Promoted) { }
            column(SalaryNotch_HRPromoRecommendHeader; "HR Promo. Recommend Header"."Salary Notch") { }
            column(UserID_HRPromoRecommendHeader; "HR Promo. Recommend Header"."User ID") { }
            column(name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(CompanyName; ci.Address)
            {

            }
            column(Companyphone; ci."Phone No.")
            { }
            dataitem("HR Promo. Recommend Lines"; "HR Promo. Recommend Lines")
            {
                DataItemLink = "Document No" = field(no);
                column(Employee_No_; "Employee No.")
                {

                }
                column(Employee_Name; "Employee Name")
                {

                }
                column(New_Job_Title; "New Job Title")
                {

                }
                column(Directorate_Name; "Directorate Name")
                {

                }
                column(Salary_Grade; "Salary Grade")
                {

                }
                column(Reason; Reason)
                { }
                column(PPhone; PPhone)
                {

                }
                column(PMail; PMail)
                {

                }
                column(PWd; PWd)
                {

                }
                column(IDnumber; IDnumber)
                {

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    PWd := '';
                    PPhone := '';
                    PMail := '';
                    EmployeeRec.Reset();
                    EmployeeRec.SetRange("No.", "HR Promo. Recommend Lines"."Employee No.");
                    if EmployeeRec.FindFirst() then begin
                        PMail := EmployeeRec."E-Mail";
                        PPhone := EmployeeRec."Cell Phone Number";
                        PWd := Format(EmployeeRec.Disabled);
                        IDnumber := EmployeeRec."ID Number";

                    end;
                end;
            }

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
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        PromotionLine: Record "HR Promo. Recommend Lines";
        EmployeeRec: Record "HR Employees";
        PMail: Text;
        PPhone: Text;
        IDnumber: Text;
        PWd: Text;
}
